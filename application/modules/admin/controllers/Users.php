<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Users extends Admin_Controller
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
		$search_name_keyword  = isset($_POST['search_name'])?trim($_POST['search_name']):(isset($_SESSION['users_search_name'])?$_SESSION['users_search_name']:'');
		$this->session->set_userdata('users_search_name', $search_name_keyword); 		
		$keyword_name_session = $this->session->userdata('users_search_name');
		if($keyword_name_session != ''){
			$keyword_name = $this->session->userdata('users_search_name');
		}else{
			isset($_SESSION['users_search_name'])?$this->session->unset_userdata('users_search_name'):'';
			$keyword_name = "";
		}
		
		$sorting_order_post  = isset($_POST['sorting_order'])?trim($_POST['sorting_order']):(isset($_SESSION['users_sorting_order'])?$_SESSION['users_sorting_order']:'');
		$this->session->set_userdata('users_sorting_order', $sorting_order_post);
		$sorting_order_sess = $this->session->userdata('users_sorting_order');
		if($sorting_order_sess){
			$sorting_order = $this->session->userdata('users_sorting_order');
		}else{
			isset($_SESSION['users_sorting_order'])?$this->session->unset_userdata('users_sorting_order'):'';
			$sorting_order = "";
		}
				
		$this->load->library('pagination');
		$config = $this->config->item('back_pagination');
		$config["base_url"] = base_url().SITE_ADMIN_URI."/users/index";
		$data["per_page"] = $config["per_page"] = $this->config->item('admin_page_per_limit');
		$config["uri_segment"] = 4;
		$data['limit_end'] = $limit_end = ($page_num - 1) * $config['per_page'];  
		$limit_start = $config['per_page'];
		$join_tables = array();
		$where = array();
		
		if($keyword_name){
			$where[] = array( FALSE,"(first_name LIKE '%$keyword_name%' OR phone_no LIKE '%$keyword_name%' OR last_name LIKE '%$keyword_name%' OR email_id LIKE '%$keyword_name%' OR skype_id LIKE '%$keyword_name%')");
			//$where[] = array( FALSE,"(username LIKE '%$keyword_name%' or email LIKE '%$keyword_name%' or concat (first_name,' ',last_name) LIKE '%$keyword_name%')");
			 
			$data['keyword_name'] = $keyword_name;
		}else{
			$data['keyword_name'] = "";
		}
		
		$data['sorting_order']=$sorting_order;
		
		if($data['keyword_name']&&$data['sorting_order']){
			$sorting_field = 'username';
		}else{
			$sorting_field = 'id';
		}
		
		if($data['sorting_order']){
			$sorting_field = 'username';
		}
		
		$data['sorting_field'] = $sorting_field;
		
		if(empty($sorting_order)){
			$sorting_order = 'desc';
		}

		$fields = 'u.id,u.username,u.first_name,u.last_name,u.email_id,u.phone_no,u.address,u.country,u.state,u.city,u.status,u.created,u.status,u.is_active,countries.name as country_name,states.name as state_name,cities.name as city_name';
		$join_tables[] = array('countries','u.country = countries.id','left');
		$join_tables[] = array('states','u.state = states.id','left');
		$join_tables[] = array('cities','u.city = cities.id','left');
		$data['total_rows'] = $config['total_rows'] = $this->base_model->get_advance_list('users u', $join_tables, $fields, $where, 'num_rows','','','id');
		$data['users'] = $this->base_model->get_advance_list('users u', $join_tables, $fields, $where, '', $sorting_field, $sorting_order, 'id', $limit_start, $limit_end);

		//$data['get_countries'] = $this->base_model->getArrayList('countries','','','id,name');		
		//$data['get_cities'] = $this->base_model->getArrayList('cities','','','id,name');
		
		$this->pagination->initialize($config);
		$data['main_content'] = 'users/index';
		$data['page_title']  = 'Users'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	public function reset(){
		$this->session->unset_userdata('users_sorting_order');
		$this->session->unset_userdata('users_search_name');
		
		redirect(base_url().SITE_ADMIN_URI.'/users/');
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
	public function password_check($str){
	   if (preg_match('#[0-9]#', $str) && preg_match('#[a-zA-Z]#', $str)) {
		 return TRUE;
	   }
	   if (preg_match('#[0-9]#', $str)) {
		 $this->form_validation->set_message('password_check', 'Atleast One Alphabhet Should be present');	
		 return FALSE;
	   }
	   if (preg_match('#[a-zA-Z]#', $str)) {
		 $this->form_validation->set_message('password_check', 'Atleast One Numeric value Should be present');	
		 return FALSE;
	   }
	   if($str){
		   $this->form_validation->set_message('password_check', 'Atleast One Alphabhet and Numeric value Should be present');	
	   }
	   $this->form_validation->set_message('password_check', 'Please enter the password.');	
	   return FALSE;
	}

public function randPass($length, $strength=8) {
    $vowels = 'aeuy';
    $consonants = 'bdghjmnpqrstvz';
    if ($strength >= 1) {
        $consonants .= 'BDGHJLMNPQRSTVWXZ';
    }
    if ($strength >= 2) {
        $vowels .= "AEUY";
    }
    if ($strength >= 4) {
        $consonants .= '23456789';
    }
    if ($strength >= 8) {
        $consonants .= '@#$%';
    }

    $password = '';
    $alt = time() % 2;
    for ($i = 0; $i < $length; $i++) {
        if ($alt == 1) {
            $password .= $consonants[(rand() % strlen($consonants))];
            $alt = 0;
        } else {
            $password .= $vowels[(rand() % strlen($vowels))];
            $alt = 1;
        }
    }
    return $password;
}
	
	public function add(){
		$data['post'] = FALSE;
		
		if ($this->input->server('REQUEST_METHOD') === 'POST'){
			$data = $this->input->post();	
			
			//$this->form_validation->set_rules('username', 'username','trim|required|max_length[16]|callback_name_check'); 
			$this->form_validation->set_rules('username', 'Username','trim|required|is_unique[users.username]');
			$this->form_validation->set_rules('email_id', 'Email Id', 'required|trim|is_unique[users.email_id]|valid_email');
			$this->form_validation->set_rules('phone_no', 'Contact Number','trim|required|numeric|is_unique[users.phone_no]');
			//$this->form_validation->set_rules('password', 'Password','trim|required|min_length[6]|max_length[32]|callback_password_check');
			//$this->form_validation->set_rules('confirm_password', 'confirm password','trim|required|matches[password]|min_length[6]|max_length[32]');
			//$this->form_validation->set_rules('country', 'Country','trim|required');
			$this->form_validation->set_rules('state', 'State','trim|required');
			$this->form_validation->set_rules('city', 'city','trim|required');
			
			if ($this->form_validation->run() == True){
				
				
				$data['created'] = date('Y-m-d h:i:s');
				$data['modified'] = date('Y-m-d h:i:s');
				$data['login_type'] = 0;
				$data['is_email_verified'] = 1;
				$raw_password = $this->randPass(6);

				unset($data['confirm_password']);
				
				if($raw_password){
					$data['password'] = md5($raw_password);
				}
								
				$last_user_id = $this->base_model->insert('users', $data);
				if($last_user_id > 0){
					$user_email = $this->input->post('email_id');
					$user_name = $this->input->post('first_name').' '.$this->input->post('last_name');
					$email_config_data = array('[USERNAME]'=> $user_name, 
											   '[PASSWORD]' => $raw_password,
											   '[USER_EMAIL]' => $user_email,
											   '[LOGO]' => base_url().$this->config->item('logo_mail'),
											   '[SITE_NAME]' => $this->config->item('site_name'),
											   '[SITE_LINK]'=>"<a href='".base_url()."'>Link</a>"
											   );
					$to_email = $user_email;
					$from_email = get_site_settings('emailtemplate.from_email');

					$template = 'User Registration Admin';
					
					$res = $this->email_template->send_mail($to_email,$from_email['value'],$template,$email_config_data);
				
					$this->session->set_flashdata('flash_message', $this->lang->line('New User added successfully'));
					redirect(base_url().SITE_ADMIN_URI.'/users');
				}
				
			}
			
			$data['post'] = TRUE;
		}
		
		$fields = array('id','name');
		$conditions = array('status'=>1);
		$return = array('return' => 'result_array');
		$sort_field = 'name';
		$order_by = 'asc';
		$data['countries'] = $this->base_model->getArrayList('countries','','','id,name');
		
		$conditions = array('status = 1 and country_id = 101');
		$data['states'] = $this->base_model->getArrayList('states',$conditions,'','id,name');	
		
		//$conditions = array('status = 1');
		//$data['cities'] = $this->base_model->getArrayList('cities',$conditions,'','id,name');	
		$data['cities'] = array(''=>'Select');	
		
		if($this->input->post('state')){
			$conditions = array('status = 1 and state_id = '.$this->input->post('state'));
			$data['cities'] = $this->base_model->getArrayList('cities',$conditions,'','id,name');	
		}
		
		$data['css'][]='assets/themes/css/jquery.datetimepicker.css';
		$data['js'][]='assets/themes/js/jquery.datetimepicker.full.js';
		$data['main_content'] = 'users/add';
		$data['page_title']  = 'Users'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	
	public function get_cities($country_id){
		if($country_id){
			$conditions = array('status = 1 and country_id ='.$country_id);
		}else{
		$conditions = array('status = 1');
		}
		$cities = $this->base_model->getArrayList('cities',$conditions,'','id,name');
		
		$js = 'id="city" class="form-control"';
		$city_select_box =  form_dropdown('city', $cities, '', $js);
		 echo json_encode($city_select_box);
	}
	
	
	public function cities($state_id){
		if($state_id){
			$conditions = array('status = 1 and state_id ='.$state_id);
		}else{
			$conditions = array('status = 1');
		}
		$cities = $this->base_model->getArrayList('cities',$conditions,'','id,name');
		unset($cities['']);
		//$js = 'id="city" class="form-control"';
		//$city_select_box =  form_dropdown('city', $cities, '', $js);
		//echo json_encode($city_select_box);
		echo json_encode($cities);
	}
	
	public function edit($id = NULL){
	
		$data['post'] = FALSE;
		$join_tables = $where = array(); 
		$where1[] = array( TRUE, 'id', $id);
		$fields = '*'; 
		$getValues = $this->base_model->get_advance_list('users', $join_tables, $fields, $where1, 'row_array');
		
		if(empty($getValues)){
			$this->session->set_flashdata('flash_message', $this->lang->line('invalid_action'));
			redirect(base_url().SITE_ADMIN_URI.'/users/');
		}
		if ($this->input->server('REQUEST_METHOD') === 'POST'){
			$data = $this->input->post();
			
			if($this->input->post('email_id') != $getValues['email_id']){
				$is_unique_email =  '|is_unique[users.email_id]' ;
			}else{
				$is_unique_email =  '' ;
			}
			
			if($this->input->post('phone_no') != $getValues['phone_no']){
				$is_unique_phone =  '|is_unique[users.phone_no]' ;
			}else{
				$is_unique_phone =  '' ;
			}
			
			//$this->form_validation->set_rules('username', 'Username','trim|required|max_length[16]|callback_name_check'); 
			$this->form_validation->set_rules('username', 'Username','trim|required'); 
			$this->form_validation->set_rules('email_id', 'Email Id', 'required|trim|valid_email'.$is_unique_email);
			$this->form_validation->set_rules('phone_no', 'Phone Number','trim|required|numeric'.$is_unique_phone);
			//$this->form_validation->set_rules('country', 'Country','trim|required');
			$this->form_validation->set_rules('state', 'State','trim|required');
			$this->form_validation->set_rules('city', 'city','trim|required');
			
			if ($this->form_validation->run() == True){
				
				$where = "id=".$id;
				$data['modified'] = date('Y-m-d h:i:s');
				
				$update1 = $this->base_model->update('users',$data,$where);
				
				$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
				redirect(base_url().SITE_ADMIN_URI.'/users/');
			}
		
		}
		
		$data['css'][]='assets/themes/css/jquery.datetimepicker.css';
		$data['js'][]='assets/themes/js/jquery.datetimepicker.full.js';
		$data['countries'] = $this->base_model->getArrayList('countries','','','id,name');
		$data['id'] = $id;
		$data['users'] = $getValues;
		
		
		$conditions = array('status = 1 and country_id = 101');
		$data['states'] = $this->base_model->getArrayList('states',$conditions,'','id,name');	
		
		$data['cities'] = array(''=>'Select');	
		
		if($this->input->post('state')){
			$conditions = array('status = 1 and state_id = '.$this->input->post('state'));
			$data['cities'] = $this->base_model->getArrayList('cities',$conditions,'','id,name');	
		}elseif($getValues['state']){			
			$conditions = array('status = 1 and state_id ='.$getValues['state']);
			$data['cities'] = $this->base_model->getArrayList('cities',$conditions,'','id,name');	
		}
		
		$data['main_content'] = 'users/edit';
		$data['page_title']  = 'users'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	
	public function change_password($id=Null,$pageredirect,$pageno,$fieldsorts='id',$typesorts='desc'){
	
	if(empty($id)){
		redirect(base_url().SITE_ADMIN_URI.'/users/');
	}
	
	if ($this->input->server('REQUEST_METHOD') === 'POST'){
		$this->form_validation->set_rules('password', 'Password','trim|required|min_length[6]|max_length[32]|callback_password_check');
		$this->form_validation->set_rules('confirm_password', 'confirm password','trim|required|matches[password]|min_length[6]|max_length[32]');
		
		if ($this->form_validation->run() == True){
			$data = $this->input->post();
			if($data['password']){
				$data['password'] = md5($data['password']);
			}
			unset($data['confirm_password']);
			$where = "id=".$id;
			$this->base_model->update('users',$data,$where);
			
			$join_tables = $where = array(); 
			$where1[] = array( TRUE, 'id', $id);
			$fields = 'first_name,last_name,email_id'; 
			$getValues = $this->base_model->get_advance_list('users', $join_tables, $fields, $where1, 'row_array');
			
			$email_config_data = array('[USERNAME]'=> $getValues['first_name'], 
										   '[PASSWORD]' => $data['password'],
										   '[USER_EMAIL]' => $getValues['email_id'],
										   '[SITE_NAME]' => $this->config->item('site_name'),
										   '[SITE_LINK]'=>"<a href='".base_url()."'>Link</a>"
										);
			$to_email = $getValues['email_id'];
			$admin_email_settings = get_site_settings('emailtemplate.from_email');
			$from_email = $admin_email_settings['value'];
			
			$template = 'Change Password Admin';
			
			$res = $this->email_template->send_mail($to_email,$from_email,$template,$email_config_data);
			$this->session->set_flashdata('flash_message','Password has been changed Successfully');
			
			
			
			redirect(base_url().SITE_ADMIN_URI.'/users/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
	}
	
	
	
		$data['main_content'] = 'users/change_password';
		$data['page_title']  = 'Change Password'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data); 	
	}
	
	public function approve($id=NULL){
		$join_tables = $where = array();  
		$fields = '*'; 
		$where[] = array( TRUE, 'id', $id);
		$data['users'] = $getValues =  $this->base_model->get_advance_list('users', $join_tables, $fields, $where, 'row_array');
		//print_r($data['users']);
		$data['options'] = $this->config->item('know_about_us');
		$data['css'][]='assets/themes/css/jquery.datetimepicker.css';
		$data['js'][]='assets/themes/js/jquery.datetimepicker.full.js';
		$data['countries'] = $this->base_model->getArrayList('countries','','','id,name');
		$conditions = array('status = 1 and country_id ='.$getValues['country']);
		$data['cities'] = $this->base_model->getArrayList('cities',$conditions,'','id,name');	
		//$data['approve_hidden'] = 1;
		$data['id'] = $id;
		$data['main_content'] = 'users/edit';
		$data['page_title']  = 'users'; 
		$this->load->view(ADMIN_LAYOUT_PATH, $data);
	}
	
	function update_status($id,$status,$pageredirect,$pageno){
			
		$table_name = 'users';
		if($status == 0){
			$status = 1;
		}else{
			$status = 0;
		}
		$data = array('status' => $status);
		$this->base_model->update_status($id, $data,'users');
		$this->session->set_flashdata('flash_message', $this->lang->line('update_record'));
		redirect(base_url().SITE_ADMIN_URI.'/users/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	public function delete($id,$pageredirect=null,$pageno){
		$table_name = 'users';
		delete_record($table_name,$id,$status,$pageredirect,$pageno);
		$this->session->set_flashdata('flash_message', $this->lang->line('delete_record') );
		redirect(base_url().SITE_ADMIN_URI.'/users/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
	function bulkactions($pageredirect=null,$pageno){
		$fieldsorts = $this->input->get('sortingfied');
		$typesorts = $this->input->get('sortype');
		$bulk_type= $this->input->post('more_action_id');
		$bulk_ids= $this->input->post('checkall_box');
		if($bulk_type == 1)
		{
			foreach($bulk_ids as $id)
			{
				$data = array('status' => '1');
				$this->base_model->update_status($id, $data,'users');
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_enabled') );
		}
		else if($bulk_type == 2)
		{
			foreach($bulk_ids as $id) 
			{
				$data = array('status' => '0');
				$this->base_model->update_status($id, $data,'users');
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_disabled') );
		}
		else if($bulk_type == 3)
		{
			foreach($bulk_ids as $id) 
			{
				$this->base_model->delete('users', array('id' => $id));
			
			}
			$this->session->set_flashdata('flash_message', $this->lang->line('bulk_deleted') );
		}
		else 
		{
			$this->session->set_flashdata('flash_message', $this->lang->line('edit_error') );
			redirect(base_url().SITE_ADMIN_URI.'/users/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
		}
		redirect(base_url().SITE_ADMIN_URI.'/users/'.$pageredirect.'/'.$pageno.'/'.$fieldsorts.'/'.$typesorts);
	}
}
