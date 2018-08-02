<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Course_video extends Admin_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library(array('form_validation','email_template'));
		$this->load->language(array('flash_message','form_validation'), 'english');
		$this->load->helper('profile_helper');
		if(!$this->session->has_userdata('admin_is_logged_in'))
		{
			redirect(SITE_ADMIN_URI);
		}
		
		$this->load->helper('function_helper');
		$this->load->helper('html');
		$this->load->helper('thumb_helper');
		$this->load->model('base_model'); 		
	}
	public function index($page_num = 1)
	{  		
		$table_name = 'course_video';
		$controller = 'course_video';
		$search_name_keyword  = isset($_POST['search_name'])?trim($_POST['search_name']):(isset($_SESSION[$controller.'_search_name'])?$_SESSION[$controller.'_search_name']:'');
		$this->session->set_userdata($controller.'_search_name', $search_name_keyword); 		
		$keyword_name_session = $this->session->userdata($controller.'_search_name');
		if($keyword_name_session != ''){
			$keyword_name = $this->session->userdata($controller.'_search_name');
		}else{
			isset($_SESSION[$controller.'_search_name'])?$this->session->unset_userdata($controller.'_search_name'):'';
			$keyword_name = "";
		}
		
		$sorting_order_post  = isset($_POST['sorting_order'])?trim($_POST['sorting_order']):(isset($_SESSION[$controller.'_sorting_order'])?$_SESSION[$controller.'_sorting_order']:'');
		$this->session->set_userdata($controller.'_sorting_order', $sorting_order_post);
		$sorting_order_sess = $this->session->userdata($controller.'_sorting_order');
		if($sorting_order_sess){
			$sorting_order = $this->session->userdata($controller.'_sorting_order');
		}else{
			isset($_SESSION[$controller.'_sorting_order'])?$this->session->unset_userdata($controller.'_sorting_order'):'';
			$sorting_order = "";
		}
				
		$this->load->library('pagination');
		$config = $this->config->item('back_pagination');
		$config["base_url"] = base_url().SITE_ADMIN_URI."/".$controller."/index";
		$data["per_page"] = $config["per_page"] = $this->config->item('admin_page_per_limit');
		$config["uri_segment"] = 4;
		$data['limit_end'] = $limit_end = ($page_num - 1) * $config['per_page'];  
		$limit_start = $config['per_page'];
		$join_tables = $where = array(); 
		
		if($keyword_name){
			$where[] = array( FALSE,"($table_name.name LIKE '%$keyword_name%' or courses.name LIKE '%$keyword_name%')");
			$data['keyword_name'] = $keyword_name;
		}else{
			$data['keyword_name'] = "";
		}
		
		$data['sorting_order']=$sorting_order;
		
		if($data['keyword_name']&&$data['sorting_order']){
			$sorting_field = $table_name.'.name';
		}else{
			$sorting_field = $table_name.'.id';
		}
		
		if($data['sorting_order']){
			$sorting_field = $table_name.'.name';
		}
		
		$data['sorting_field'] = $sorting_field;
		
		if(empty($sorting_order)){
			$sorting_order = 'desc';
		}

		$fields = $table_name.'.*,courses.name as course';
		$join_tables[] = array('courses','courses.id='.$table_name.'.course_id','inner');
		$data['total_rows'] = $config['total_rows'] = $this->base_model->get_advance_list($table_name, $join_tables, $fields, $where, 'num_rows','','',$table_name.'.id');
		$data['results'] = $this->base_model->get_advance_list($table_name, $join_tables, $fields, $where, '', $sorting_field, $sorting_order, $table_name.'.id', $limit_start, $limit_end);
		
		$this->pagination->initialize($config);
		$data['main_content'] = $controller.'/index';
		$data['page_title']  = 'Course Video'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	
	public function reset(){
		$controller = 'course_video';
		$this->session->unset_userdata($controller.'_sorting_order');
		$this->session->unset_userdata($controller.'_search_name');
		
		redirect(base_url().SITE_ADMIN_URI.'/'.$controller);
	}
	
	public function validate_select($val, $fieldname){
		if($val==""){
			$this->form_validation->set_message('validate_select', 'Please choose the '.$fieldname.'.');
			return FALSE;
		}			
	}
	
	function name_check($name){
		if(!preg_match('/^[a-z0-9 .\-]+$/i', $name)){
			$this->form_validation->set_message('name_check', 'Allowed Only Alphabhet (a-z A-z),Numbers(0-9),space,dot(.),dash(-)');					
			return FALSE;
		}
		return true;
	}
	
	public function add(){
		$data['post'] = FALSE;
		$table_name = 'course_video';
		$controller = 'course_video';
		if ($this->input->server('REQUEST_METHOD') === 'POST'){
			$data = $this->input->post();	
			//$this->form_validation->set_rules('name', 'Name','trim|required|max_length[32]|callback_name_check'); 
			$this->form_validation->set_rules('name', 'Name','trim|required'); 
			$this->form_validation->set_rules('course', 'Course','trim|required|numeric');
			$this->form_validation->set_rules('video_url', 'Video Url','trim|required');
			$this->form_validation->set_rules('image_url', 'Image Url','trim|required');
			$this->form_validation->set_rules('subscription', 'Subscription','trim|required|numeric');
			if ($this->form_validation->run() == True){	
				$post_data = array();
				$post_data['created'] = date('Y-m-d h:i:s');
				$post_data['modified'] = date('Y-m-d h:i:s');
				$post_data['name'] = $data['name'];
				$post_data['course_id'] = $data['course'];
				$post_data['subscription'] = $data['subscription'];
				$post_data['video_url'] = $data['video_url'];
				$post_data['image_url'] = $data['image_url'];
				$post_data['status'] = $data['status'];
				
				$last_user_id = $this->base_model->insert($table_name, $post_data);
				if($last_user_id > 0){
					$this->session->set_flashdata('flash_message', $this->lang->line('New '.$controller.' added successfully'));
					redirect(base_url().SITE_ADMIN_URI.'/'.$controller);
				}else{
				
				}	
			}
			$data['post'] = TRUE;
		}
		
		$join_tables = $where = array(); 
		$where[] = array( TRUE, 'status', 1);
		$fields = 'id,name,subscription,modified,created,status';
		$courses = $this->base_model->get_advance_list('courses', '', $fields, $where, '', 'name', 'desc', 'id');
		$data['courses'] = array();
		$data['courses'][''] = "Select Course";
		foreach($courses as $course){
			$data['courses'][$course['id']] = $course['name'];
		}
		
		$data['main_content'] = $controller.'/add';
		$data['page_title']  = $controller; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	
	public function edit($id = NULL){
		$table_name = 'course_video';
		$controller = 'course_video';
		$data['post'] = FALSE;
		$join_tables = $where = array(); 
		$where[] = array( TRUE, 'id', $id);
		$fields = '*'; 
		$getValues = $this->base_model->get_advance_list($table_name, $join_tables, $fields, $where, 'row_array');	
		if(empty($getValues)){
			$this->session->set_flashdata('flash_message', $this->lang->line('invalid_action'));
			redirect(base_url().SITE_ADMIN_URI.'/'.$controller);
		}
		if ($this->input->server('REQUEST_METHOD') === 'POST'){
			$data = $this->input->post();
			//$this->form_validation->set_rules('name', 'Name','trim|required|max_length[32]|callback_name_check'); 
			$this->form_validation->set_rules('name', 'Name','trim|required'); 
			$this->form_validation->set_rules('course', 'Course','trim|required|numeric');
			$this->form_validation->set_rules('video_url', 'Video Url','trim|required');
			$this->form_validation->set_rules('image_url', 'Image Url','trim|required');
			$this->form_validation->set_rules('subscription', 'Subscription','trim|required|numeric');
			if ($this->form_validation->run() == True){
				$where = "id=".$id;
				$post_data = array();
				$post_data['modified'] = date('Y-m-d h:i:s');
				$post_data['name'] = $data['name'];
				$post_data['course_id'] = $data['course'];
				$post_data['subscription'] = $data['subscription'];
				$post_data['video_url'] = $data['video_url'];
				$post_data['image_url'] = $data['image_url'];
				$post_data['status'] = $data['status'];
				$update = $this->base_model->update($table_name,$post_data,$where);
				
				$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
				redirect(base_url().SITE_ADMIN_URI.'/'.$controller);
			}
		}
		
		$join_tables = $where = array(); 
		$where[] = array( TRUE, 'status', 1);
		$fields = 'id,name,subscription,modified,created,status';
		$courses = $this->base_model->get_advance_list('courses', '', $fields, $where, '', 'name', 'desc', 'id');
		$data['courses'] = array();
		$data['courses'][''] = "Select Course";
		foreach($courses as $course){
			$data['courses'][$course['id']] = $course['name'];
		}
		
		$data['id'] = $id;
		$data['results'] = $getValues;
		$data['main_content'] = $controller.'/edit';
		$data['page_title']  = $controller; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
			
	function update_status($id,$status,$pageredirect,$pageno){
			
		$table_name = 'course_video';
		$controller = 'course_video';
		if($status == 0){
			$status = 1;
		}else{
			$status = 0;
		}
		$data = array('status' => $status);
		$this->base_model->update_status($id, $data,$table_name);
		$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
		redirect(base_url().SITE_ADMIN_URI.'/'.$controller.'/'.$pageredirect.'/'.$pageno);
	}
	
	public function delete($id,$pageredirect=null,$pageno){
		$table_name = 'course_video';
		$controller = 'course_video';
		delete_record($table_name,$id,$status,$pageredirect,$pageno);
		$this->session->set_flashdata('flash_message', $this->lang->line('delete_record') );
		redirect(base_url().SITE_ADMIN_URI.'/'.$controller.'/'.$pageredirect.'/'.$pageno);
	}
	
	function bulkactions($pageredirect=null,$pageno){
		$table_name = 'course_video';
		$controller = 'course_video';
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		$bulk_type= $this->input->post('more_action_id');
		$bulk_ids= $this->input->post('checkall_box');
		if($bulk_type == 1)
		{
			foreach($bulk_ids as $id)
			{
				$data = array('status' => '1');
				$this->base_model->update_status($id, $data,$table_name);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_enabled') );
		}
		else if($bulk_type == 2)
		{
			foreach($bulk_ids as $id) 
			{
				$data = array('status' => '0');
				$this->base_model->update_status($id, $data,$table_name);
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_disabled') );
		}
		else if($bulk_type == 3)
		{
			foreach($bulk_ids as $id) 
			{
				$this->base_model->delete($table_name, array('id' => $id));
			
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_deleted') );
		}
		else 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().SITE_ADMIN_URI.'/'.$controller.'/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		redirect(base_url().SITE_ADMIN_URI.'/'.$controller.'/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
}
