<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Banners extends Admin_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library(array('form_validation'));
		$this->load->language(array('flash_message','form_validation'), 'english');
		if(!$this->session->has_userdata('admin_is_logged_in'))
		{
			redirect(SITE_ADMIN_URI);
		}
		//getSearchDetails($this->router->fetch_class());
		$this->load->helper('function_helper');
		$this->load->model('base_model');

	}
	public function index($page_num = 1)
	{  
		$search_name_keyword  =  isset($_POST['search_name'])?trim($_POST['search_name']):(isset($_SESSION['banner_search_name'])?$_SESSION['banner_search_name']:'');
		$this->session->set_userdata('banner_search_name', $search_name_keyword); 		
		$keyword_name_session = $this->session->userdata('banner_search_name');
		if($keyword_name_session != '')
		{
			$keyword_name = $this->session->userdata('banner_search_name');
		}
		else
		{
			isset($_SESSION['banner_search_name'])?$this->session->unset_userdata('banner_search_name'):'';
			$keyword_name = "";
		}
		$this->load->helper('thumb_helper');
		$this->load->helper('html');
		$this->load->library('pagination');
		$config  = $this->config->item('back_pagination');
		
		$config["base_url"] = base_url().SITE_ADMIN_URI."/banners/index";
		$data["per_page"] = $config["per_page"] = $this->config->item('admin_page_per_limit'); 
		$config["uri_segment"] = 4;
		$data['limit_end'] = $limit_end = ($page_num - 1) * $config['per_page'];  
		$limit_start = $config['per_page'];
		$where = array();  
		$join_tables[] = array('site_references as bp','bn.site_reference_id = bp.id');
		if($keyword_name)
		{
			$where[] = array( TRUE, 'bn.name LIKE ', '%'.$keyword_name.'%' );
			$data['keyword_name'] = $keyword_name;
		}
		else{
			$data['keyword_name'] = "";
		}
		$fields = 'bn.id, bn.name, bn.file_name as image,bn.directory_path, url, bn.content_one as description,bn.content_two as description1, bn.status, bn.created, bp.page_name as page_name';
		$data['total_rows'] = $config['total_rows'] = $this->base_model->get_advance_list('banner_management bn', $join_tables, $fields, $where, 'num_rows','','','id');
		$data['banners'] = $this->base_model->get_advance_list('banner_management bn', $join_tables, $fields, $where, '', 'id', 'desc', 'id', $limit_start, $limit_end);
		$this->pagination->initialize($config);
		$data['main_content'] = 'banners/index';
		$data['page_title']  = 'Banners'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	

	}
	public function reset()
	{
		$this->session->unset_userdata('banner_search_name');
		redirect(base_url().SITE_ADMIN_URI.'/banners/');
	}
	public function validate_select($val, $fieldname){
		if($val==""){
			$this->form_validation->set_message('validate_select', 'Please choose the '.$fieldname.'.');
			return FALSE;
		}			
	}
	public function add()
	{
		$this->load->helper('thumb_helper');
		 $this->load->helper('html');
		$data['post'] = FALSE;
		if ($this->input->server('REQUEST_METHOD') === 'POST')
		{ 
			$this->form_validation->set_rules('name', 'Name','trim|required|is_unique[banner_management.name]');
			//$this->form_validation->set_rules('url', 'Url','trim|callback_valid_url[url]');
			//$this->form_validation->set_rules('content_one', 'Description 1','trim|required');
			//$this->form_validation->set_rules('content_two', 'Description 2','trim|required');
			$this->form_validation->set_rules('page_id', 'Page Title','trim|callback_validate_select[Page Title]');
			if ($_FILES['banner_image']['size'] == "0") {
                $this->form_validation->set_rules('banner_image', 'Image', 'callback_validate_select[Image]');
            }
			
			if ($this->form_validation->run())
			{
				$config['upload_path'] = $this->config->item('banner_img');
                $config['allowed_types'] = "gif|jpg|jpeg|png"; 
                $config['min_width'] = "1800"; 
                $config['min_height'] = "700";   
				$config['max_width'] = "1800";
				$config['max_height'] = "700";
                 
                $this->load->library('upload', $config);
                $image_up = $this->upload->do_upload('banner_image');
				
				if (!$image_up)
        		{
				    $upload = array('error' => $this->upload->display_errors());
				   	$data['upload_error'] = $upload;
				   
				}
				else
				{
					$image_data = array('upload_data' => $this->upload->data());
					$update_array = array (	
											'name' => $this->input->post('name'),
											'content_one' => $this->input->post('content_one'),
											'content_two' => $this->input->post('content_two'),
											'url' => $this->input->post('url')?$this->input->post('url'):'',
											'directory_path' => $config['upload_path'],
											'file_name' => $image_data['upload_data']['file_name'],
											'site_reference_id' => $this->input->post('page_id'),
											'status' => $this->input->post('status'),
											'sort_order' => '',
											'created' => date('Y-m-d H:i:s')
										);
					$this->base_model->insert( 'banner_management', $update_array);
					$this->session->set_flashdata('flash_message', $this->lang->line('add_record'));
					redirect(base_url().SITE_ADMIN_URI.'/banners/');
				}
			}
			$data['post'] = TRUE;
		}
		
		$data['page_list'] = $this->base_model->getSelectList('site_references','','','id,page_name');
		$data['main_content'] = 'banners/add';
		$data['page_title']  = 'Banners'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	public function edit($id = NULL)
	{
		$this->load->helper('thumb_helper');
		$this->load->helper('html');
		$data['post'] = FALSE;
		$join_tables = $where = array(); 
		$where[] = array( TRUE, 'id', $id);
		$fields = 'name'; 
		$getValues = $this->base_model->get_advance_list('banner_management', $join_tables, $fields, $where, 'row_array');
		if ($this->input->server('REQUEST_METHOD') === 'POST')
		{ 	
					
			$this->form_validation->set_rules('name', 'name','trim|required');	
			if($this->input->post('name') != $getValues['name']) {
			$is_unique =  '|is_unique[banner_management.name]' ;
			} else {
				$is_unique =  '' ;
			}
			$this->form_validation->set_rules('name', 'Name', 'trim|required'.$is_unique);
			//$this->form_validation->set_rules('url', 'Url','trim|callback_valid_url[url]');
			//$this->form_validation->set_rules('content_one', 'Description 1','trim|required');
			//$this->form_validation->set_rules('content_two', 'Description 2','trim|required');
			$this->form_validation->set_rules('page_id', 'Page Title','trim|callback_validate_select[Page Title]');
			
			if ($this->form_validation->run())
			{  
				$date = date('Y-m-d H:i:s');
				if ($_FILES['banner_image']['name'] != "") {
					$config['upload_path'] = $this->config->item('banner_img');
		            $config['allowed_types'] = "gif|jpg|jpeg|png";
					 $config['min_width'] = "1800"; 
					$config['min_height'] = "700";   
					$config['max_width'] = "1800";
					$config['max_height'] = "700"; 
		            $this->load->library('upload', $config);
		            $image_up = $this->upload->do_upload('banner_image');
		            if (!$image_up)
		    		{
						$upload = array('error' => $this->upload->display_errors());
					   	$data['upload_error'] = $upload;
					}
					else
					{
						$image_data = array('upload_data' => $this->upload->data());
						$update_array = array (	
												'name' => $this->input->post('name'),
												'content_one' => $this->input->post('content_one'),
												'content_two' => $this->input->post('content_two'),
												'directory_path' => $config['upload_path'],
												'url' => $this->input->post('url')?$this->input->post('url'):'',
												'file_name' => $image_data['upload_data']['file_name'],
												'site_reference_id' => $this->input->post('page_id'),
												'status' => $this->input->post('status'),
												'sort_order' => '',
											  );
						$this->base_model->update ( 'banner_management', $update_array, array('id'=>$id));
						$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
						redirect(base_url().SITE_ADMIN_URI.'/banners/');
					}
				}else{
					if($this->input->post('banner_image_hidden')){
					$update_array = array (	
											'name' => $this->input->post('name'),
											'content_one' => $this->input->post('content_one'),
											'content_two' => $this->input->post('content_two'),
											'url' => $this->input->post('url')?$this->input->post('url'):'',
											'file_name' => $this->input->post('banner_image_hidden'),
											'site_reference_id' => $this->input->post('page_id'),
											'status' => $this->input->post('status'),
											'sort_order' => '',
										  );
						$this->base_model->update ( 'banner_management', $update_array, array('id'=>$id));
						$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
						redirect(base_url().SITE_ADMIN_URI.'/banners/');
					}else{
						$update_array = array (	
											'name' => $this->input->post('name'),
											'content_one' => $this->input->post('content_one'),
											'content_two' => $this->input->post('content_two'),
											'url' => $this->input->post('url')?$this->input->post('url'):'',
											'site_reference_id' => $this->input->post('page_id'),
											'status' => $this->input->post('status'),
											'sort_order' => '',
										  );
						
						$this->base_model->update ( 'banner_management', $update_array, array('id'=>$id));
						$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
						redirect(base_url().SITE_ADMIN_URI.'/banners/');
					}
				}
				
			}
			$data['post'] = TRUE;
		}
		$join_tables = $where = array();  
		$fields = 'id, name, content_one,content_two, site_reference_id as pages_id,file_name as image,directory_path, url, sort_order,status'; 
		$where[] = array( TRUE, 'id', $id);
		$data['page_list'] = $this->base_model->getSelectList('site_references','','','id,page_name');
		$data['banners'] = $this->base_model->get_advance_list('banner_management', $join_tables, $fields, $where, 'row_array');
		$data['main_content'] = 'banners/edit';
		$data['page_title']  = 'Banners'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	function update_status($id,$status,$pageredirect,$pageno)
	{
		$table_name = 'banner_management';
		change_status($table_name,$id,$status,$pageredirect,$pageno);
		$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
		redirect(base_url().SITE_ADMIN_URI.'/banners/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	public function delete($id,$pageredirect=null,$pageno) 
	{
		$getImg = $this->base_model->getCommonListFields('banner_management',array('image'),array('id' => $id));
		if ($getImg[0]->image) {
            @unlink($this->config->item('banner_img') . $getImg[0]->image);
        }
		$this->base_model->delete ('banner_management',array('id' => $id));
		$this->session->set_flashdata('flash_message', $this->lang->line('delete_record') );
		redirect(base_url().SITE_ADMIN_URI.'/banners/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	function bulkactions($pageredirect=null,$pageno){
		
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		$bulk_type= $this->input->post('more_action_id');
		$bulk_ids= $this->input->post('checkall_box');
		if($bulk_type == 1){
			foreach($bulk_ids as $id) {
				$data = array('status' => '1');
				$this->base_model->update_status($id, $data, 'banner_management');
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_enabled') );
		}
		else if($bulk_type == 2){
			foreach($bulk_ids as $id) {
				$data = array('status' => '0');
				$this->base_model->update_status($id, $data, 'banner_management');
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_disabled') );
		}
		else if($bulk_type == 3)
		{
			foreach($bulk_ids as $id) 
			{
				$getImg = $this->base_model->getCommonListFields('banner_management',array('image'),array('id' => $id));
				if ($getImg[0]->image) {
				    @unlink($this->config->item('banner_img') . $getImg[0]->image);
				}
				$this->base_model->delete('banner_management', array('id' => $id));
				
			
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_deleted') );
		}
		else {
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().SITE_ADMIN_URI.'/banners/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		redirect(base_url().SITE_ADMIN_URI.'/banners/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	function valid_url($url, $field_name){	
	if($url){
		if (filter_var($url, FILTER_VALIDATE_URL) === FALSE) {
		    $this->form_validation->set_message('valid_url', 'Enter valid '.$field_name);
		    return FALSE;
		}else{
			return TRUE;
		}
	}else{
		return TRUE;
	}
	}
}
