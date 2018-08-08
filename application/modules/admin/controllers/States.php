<?php defined('BASEPATH') OR exit('No direct script access allowed');

class States extends Admin_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library(array('form_validation','csv_import'));
		$this->load->language(array('flash_message','form_validation'), 'english');
		if(!$this->session->has_userdata('admin_is_logged_in'))
		{
			redirect(SITE_ADMIN_URI);
		}
		$this->load->helper('function_helper');
		$this->load->model('base_model'); 
	}
	public function index($page_num = 1)
	{  
		$search_name_keyword  = isset($_POST['search_name'])?trim($_POST['search_name']):(isset($_SESSION['states_search_name'])?$_SESSION['states_search_name']:'');
		$this->session->set_userdata('states_search_name', $search_name_keyword);
		$keyword_name_session = $this->session->userdata('states_search_name');
		if($keyword_name_session != '')
		{
			$keyword_name = $this->session->userdata('states_search_name');
		}
		else
		{
			isset($_SESSION['states_search_name'])?$this->session->unset_userdata('states_search_name'):'';
			$keyword_name = "";
		}

		$search_country_keyword  = isset($_POST['search_country'])?trim($_POST['search_country']):(isset($_SESSION['states_search_country'])?$_SESSION['states_search_country']:'');
		$this->session->set_userdata('states_search_country', $search_country_keyword);
		$search_country_session = $this->session->userdata('states_search_country');
		if($search_country_session != '')
		{
			$search_country = $this->session->userdata('states_search_country');
		}
		else
		{
			isset($_SESSION['states_search_country'])?$this->session->unset_userdata('states_search_country'):'';
			$search_country = "";
		}

		$this->load->helper('thumb_helper');
		$this->load->helper('html');
		$this->load->library('pagination');
		$config  = $this->config->item('back_pagination');
		$config["base_url"] = base_url().SITE_ADMIN_URI."/states/index";
		$data["per_page"] = $config["per_page"] = $this->config->item('admin_page_per_limit'); 
		$config["uri_segment"] = 4;
		$data['limit_end'] = $limit_end = ($page_num - 1) * $config['per_page'];  
		$limit_start = $config['per_page'];
		$join_tables = $where = array();
		if($keyword_name)
		{
			//$where[] = array( FALSE,"(st.name LIKE '%$keyword_name%' or st.state_code LIKE '%$keyword_name%' or co.name LIKE '%$keyword_name%')");
			$where[] = array( FALSE,"(st.name LIKE '%$keyword_name%')");
			$data['keyword_name'] = $keyword_name;
		}
		else{
			$data['keyword_name'] = "";
		}
		if($search_country)
		{
			$where[] = array( FALSE,"(st.country_id = '".$search_country."')");
			$data['keyword_search_country'] = $search_country;
		}
		else{
			$data['keyword_search_country'] = "";
		}
		
		$fields = 'st.id,st.name as state_name,st.state_code,co.name as country_name,st.status';
		$join_tables[] = array('countries co','co.id=st.country_id','inner');
		$where[] = array( FALSE,"(st.country_id = 101)"); // India
		$data['total_rows'] = $config['total_rows'] = $this->base_model->get_advance_list('states st', $join_tables, $fields, $where, 'num_rows','','','st.id');
		$data['states'] = $this->base_model->get_advance_list('states st', $join_tables, $fields, $where, '', 'st.id', 'desc', 'st.id', $limit_start, $limit_end);
		$this->pagination->initialize($config);
		$data['countries_list'] = $this->base_model->getArrayList('countries');
		$data['main_content'] = 'states/index';
		$data['page_title']  = 'States'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	

	}
	public function reset()
	{
		$this->session->unset_userdata('states_search_name');
		$this->session->unset_userdata('states_search_country');
		redirect(base_url().SITE_ADMIN_URI.'/states/');
	}
	public function validate_select($val, $fieldname){
		if($val==""){
			$this->form_validation->set_message('validate_select', 'Please choose the '.$fieldname.'.');
			return FALSE;
		}			
	}
	public function validate_state_name($name, $fieldname){
		$country_id = $this->input->post('country_id');	
		$list = $this->base_model->getArrayList('states',array('country_id'=>$country_id));
		unset($list['']);
		function formatize($a){
			return strtolower(trim($a));
		}
		$list = array_map('formatize',$list);
		if(in_array(strtolower(trim($name)),$list)){
			$this->form_validation->set_message('validate_state_name', 'This '.$fieldname.' already exists.Please enter unique '.$fieldname.'.');
			return FALSE;
		}
		return TRUE;
	}

	public function validate_state_code($code, $fieldname){
		$country_id = $this->input->post('country_id');	
		$list = $this->base_model->getArrayList('states',array('country_id'=>$country_id),'','id,state_code');
		unset($list['']);		
		$list = array_map('formatize',$list);
		if(in_array(strtolower(trim($code)),$list)){
			$this->form_validation->set_message('validate_state_code', 'This '.$fieldname.' already exists.Please enter unique '.$fieldname.'.');
			return FALSE;
		}
		return TRUE;
	}
	
	public function add()
	{

		$data['css'] = $data['js'] = array();		
		$data['css'][]='assets/themes/css/jquery-ui.min.css';
		$data['js'][]='assets/themes/js/jquery-ui.min.js';

		$this->load->helper('thumb_helper');
		$this->load->helper('html');
		$data['post'] = FALSE;
		if ($this->input->server('REQUEST_METHOD') === 'POST')
		{
	      	$this->form_validation->set_rules('name', 'Name', 'trim|required|callback_alpha_space|max_length[35]|callback_validate_state_name[Name]');
			//$this->form_validation->set_rules('state_code', 'City Code','trim|required|max_length[35]|callback_validate_state_code[State Code]');
			$this->form_validation->set_rules('country_id', 'Country','trim|callback_validate_select[Country]');
			
			if ($this->form_validation->run())
			{   
				$date = date('Y-m-d H:i:s');
				
				$update_array = array (	'name' => $this->input->post('name'),
										'slug' => create_slug($this->input->post('name'),'states'),
										//'state_code' => $this->input->post('state_code'),
										'country_id' => $this->input->post('country_id'),
										'status' => $this->input->post('status')
									  );
				$this->base_model->insert( 'states', $update_array);
				$this->session->set_flashdata('flash_message', $this->lang->line('add_record'));
				redirect(base_url().SITE_ADMIN_URI.'/states');
				
			}
			$data['post'] = TRUE;
		}
		$data['countries_list'] = $this->base_model->getSelectList('countries');
		$data['main_content'] = 'states/add';
		$data['page_title']  = 'Add states'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
		
	function alpha_space($str)
	{
		if (! preg_match("/^([a-zA-Z ])+$/i", $str)) {
			$this->form_validation->set_message('alpha_space', 'The %s field may only contain alpha characters & White spaces');
			return FALSE;
		} else {
			return TRUE;
		}		
	} 
		
	public function edit($id = NULL)
	{
		$this->load->helper('thumb_helper');
		$this->load->helper('html');
		$data['post'] = FALSE;
		 
		$join_tables = $where = array();
		$join_tables[] = array('countries co','co.id=st.country_id','inner');
		$where[] = array( TRUE, 'st.id', $id);
		$fields = 'st.name,st.state_code,st.country_id'; 
		$getValues = $this->base_model->get_advance_list('states st', $join_tables, $fields, $where, 'row_array');
		
		if ($this->input->server('REQUEST_METHOD') === 'POST')
		{
			if(($this->input->post('name') != $getValues['name']) || ($this->input->post('country_id') != $getValues['country_id']) ) {
				$is_unique_name =  '|callback_validate_state_name[Name]' ;
			} else {
				$is_unique_name =  '' ;
			}
			if(($this->input->post('state_code') != $getValues['state_code']) || ($this->input->post('country_id') != $getValues['country_id'])) {
				$is_unique_code =  '|callback_validate_state_code[City Code]' ;
			} else {
				$is_unique_code =  '' ;
			}
	      	$this->form_validation->set_rules('name', 'Name', 'trim|required|callback_alpha_space|max_length[35]'.$is_unique_name);
			//$this->form_validation->set_rules('state_code', 'City Code','trim|required|max_length[35]'.$is_unique_code);
			$this->form_validation->set_rules('country_id', 'Country','trim|callback_validate_select[Country]');

			
			if ($this->form_validation->run())
			{  
				$date = date('Y-m-d H:i:s');
				
				$update_array = array (	'name' => $this->input->post('name'),
										//'state_code' => $this->input->post('state_code'),
										//'country_id' => $this->input->post('country_id'),
										'status' => $this->input->post('status')
									);
				if(($this->input->post('name') != $getValues['name'])){
					$update_array['slug'] = create_slug($this->input->post('name'),'states');
				}
					$this->base_model->update ( 'states', $update_array, array('id'=>$id));
					$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
					redirect(base_url().SITE_ADMIN_URI.'/states/');
			}
				$data['post'] = TRUE;
			}
		
		$join_tables = $where = array();
		$join_tables[] = array('countries co','co.id=st.country_id','inner');
		$fields = 'st.id, st.name as city_name,st.state_code,st.country_id,st.status,co.name as country_name'; 
		$where[] = array( TRUE, 'st.id', $id);
		$data['states'] = $this->base_model->get_advance_list('states st', $join_tables, $fields, $where, 'row_array');
		$data['countries_list'] = $this->base_model->getArrayList('countries');
		$data['main_content'] = 'states/edit';
		$data['page_title']  = 'Edit states'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	function update_status($id,$status,$pageredirect,$pageno)
	{
		$table_name = 'states';
		change_status($table_name,$id,$status,$pageredirect,$pageno);
		$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
		redirect(base_url().SITE_ADMIN_URI.'/states/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	public function delete($id,$pageredirect=null,$pageno) 
	{
		$this->base_model->delete ('states',array('id' => $id));
		$this->session->set_flashdata('flash_message', $this->lang->line('delete_record') );
		redirect(base_url().SITE_ADMIN_URI.'/states/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	function bulkactions($pageredirect=null,$pageno){
		
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		$bulk_type= $this->input->post('more_action_id');
		$bulk_ids= $this->input->post('checkall_box');
		if($bulk_type == 1){
			foreach($bulk_ids as $id) {
				$data = array('status' => '1');
				$this->base_model->update_status($id, $data, 'states');
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_enabled') );
		}
		else if($bulk_type == 2){
			foreach($bulk_ids as $id) {
				$data = array('status' => '0');
				$this->base_model->update_status($id, $data, 'states');
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_disabled') );
		}
		else if($bulk_type == 3)
		{
			foreach($bulk_ids as $id) 
			{
				$this->base_model->delete('states', array('id' => $id));
			
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_deleted') );
		}
		else {
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().SITE_ADMIN_URI.'/states/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		redirect(base_url().SITE_ADMIN_URI.'/states/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	
}
