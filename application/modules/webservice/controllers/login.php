<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller
{
	  	function __construct()
  		{
    		parent::__construct();
			$this->load->library('form_validation');
			$this->load->helper('app_function_helper'); 
			$this->load->model('login_model');
		}
		
		public function index() 
		{     
			echo "index";
		}
		
		/**
		* Login
		*
		* @param       POST
		* @return      JSON
		*/
		public function login() 
		{    
			$result = array(); 
			if($this->input->server('REQUEST_METHOD') === 'POST')
			{
				if (!$this->input->post()){
					$error = array(			
									"un" => "Please enter the username",
									"pwd" => "Please enter the password",
									"v" => "Please enter the login type",
									"fcmt" => "Please enter the fcmt",
								);
					$result = array( 'st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $error);
					echo $response = json_encode($result);
					return TRUE;
				}
		  		$this->form_validation->set_rules('un', 'username','trim|required');
				if(empty($this->input->post('v'))){
					$this->form_validation->set_rules('pwd', 'password', 'trim|required'); 	
				}
				$this->form_validation->set_rules('v', 'login type', 'trim|required'); 	
				$this->form_validation->set_rules('fcmt', 'fcmt', 'trim|required');				
				if($this->form_validation->run())
				{					
					$username = $this->input->post('un');
					$password = $this->__encrip_password($this->input->post('pwd'));
					$login_type = $this->input->post('v'); 
					$fcmt = $this->input->post('fcmt'); 
					$response = $this->login_model->get_user_by_auth($username, $password, $login_type);	
					//echo $this->db->last_query();
					//pr($response);die;
					if(!empty($response))
					{
						if($response['is_active']!=0){
							$user_details = $response;			
							$time = date('Y-m-d H:i:s'); 
							$token = generate_token($response['id']);							
							$this->login_model->update_user_webservice($response['id'], $time, $token);
							
							/*$responseData = array();
							$responseData['id'] = $user_details['id'];
							$responseData['tn'] = $token;
							$responseData['n'] = $user_details['first_name'] . " ". $user_details['last_name'];
							$responseData['un'] = $user_details['username'];
							$responseData['mail'] = $user_details['email_id'];
							$result = array( 'st'=> 1, 'msg'=>'Successfully Logged in', 'data'=> $responseData);*/
							
							$result['st'] = 1;
							$result['msg'] = 'Registration done successfully. Verification email is sent to your registered Email ID. Please verify your account to login.';
							$result['id'] = $user_details['id'];
							$result['tn'] = $token;
							$result['n'] = $user_details['first_name'] . " ". $user_details['last_name'];
							$result['un'] = $user_details['username'];
							$result['mail'] = $user_details['email_id'];
						}else{
							$result = array('st'=> 0, 'msg'=> 'Your account has not activated' ); 
						}
					}else{
						$result = array('st'=> 0, 'msg'=> 'Invalid Login Credentials' ); 
					}
				}else{
					$result = array( 'st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}else{
				$result = array( 'st'=> 0 , 'msg'=> 'method does not post' ) ;  
			} 
			echo $response = json_encode($result);
			return TRUE;
		}
		
		/**
		* Register
		*
		* @param       POST
		* @return      JSON
		*/
		public function register()
		{
			if ($this->input->server('REQUEST_METHOD') === 'POST')
			{
				$this->form_validation->set_rules('un', 'username','trim|required|is_unique[users.username]');
				$this->form_validation->set_rules('pwd', 'password', 'trim|required'); 
				$this->form_validation->set_rules('ct', 'mobile', 'trim|required|is_unique[users.phone_no]'); 	
				$this->form_validation->set_rules('mail', 'email', 'trim|required|valid_email|is_unique[users.email_id]');	
				$this->form_validation->set_rules('addr', 'city', 'trim|required');	
				$this->form_validation->set_rules('stat', 'state', 'trim|required');	
				$this->form_validation->set_rules('t', 'type', 'trim|required');	 	
				$this->form_validation->set_rules('fcmt', 'fcmt', 'trim|required');		
				
				if ($this->form_validation->run())
				{
					$username = $this->input->post('un');
					$password = $this->input->post('pwd');
					$mobile = $this->input->post('ct');
					$email = $this->input->post('mail');
					$city = $this->input->post('addr');
					$state = $this->input->post('stat');
					$type = $this->input->post('t');
					$fcmt = $this->input->post('fcmt');
					if($type==1){
						$exist_username = $this->login_model->get_user_by_username($username);
						$exist_email = $this->login_model->get_user_by_email($email);
						$exist_mobile = $this->login_model->get_user_by_mobile($mobile);
						if(!empty($exist_email) && !empty($exist_mobile) && !empty($exist_username))
						{
							$result = array( 'st'=> 0 , 'msg'=> 'This email address, username & mobile no already exists. Please enter unique email address, username & mobile number.' ) ;  
						}
						elseif(!empty($exist_email))
						{
							$result = array( 'st'=> 0 , 'msg'=> 'This email address already exists. Please enter unique email address.' ) ;  
						}
						elseif(!empty($exist_username))
						{
							$result = array( 'st'=> 0 , 'msg'=> 'This username already exists. Please enter unique username.' ) ;  
						}
						elseif(!empty($exist_mobile))
						{
							$result = array( 'st'=> 0 , 'msg'=> 'This mobile number already exists. Please enter unique mobile number.' ) ;  
						}
						else
						{						
							$user_id = $this->login_model->set_user();
							$user_datas = $this->login_model->get_user($user_id);
							if(!empty($user_id) && !empty($user_datas))
							{
								$time = date('Y-m-d H:i:s'); 
								$token = generate_token($user_datas['id']);
								$this->login_model->update_user_webservice($user_datas['id'], $time, $token);	
								/*$responseData = array();
								$responseData['id'] = $user_datas['id'];
								$responseData['tn'] = $token;
								$responseData['n'] = $user_datas['first_name'] . " ". $user_datas['last_name'];
								$responseData['un'] = $user_datas['username'];
								$responseData['mail'] = $user_datas['email_id'];							
								$result = array( 'st'=> 1 , 'msg'=> 'Registration done successfully. Verification email is sent to your registered Email ID. Please verify your account to login.', 'data'=> $responseData) ;*/
								$result['st'] = 1;
								$result['msg'] = 'Registration done successfully. Verification email is sent to your registered Email ID. Please verify your account to login.';
								$result['id'] = $user_datas['id'];
								$result['tn'] = $token;
								$result['n'] = $user_datas['first_name'] . " ". $user_datas['last_name'];
								$result['un'] = $user_datas['username'];
								$result['mail'] = $user_datas['email_id'];
							}else{
								$result = array( 'st'=> 0 , 'msg'=> 'Registration not successfully.') ;
							}										
						}
					}
					/*if($type==2){
						$update = $this->login_model->update_user();
						if($update)
						{
							$result = array( 'success'=> 1, 'message'=>'Profile Updated Successfully','current_date' => date('Y-m-d'));  
						}
						else
						{
							$result = array( 'success'=> 0, 'message'=>'Error while updating profile','current_date' => date('Y-m-d'));  
						}
					}*/
				
				}
				else
				{
					$result = array( 'st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}
			else
			{
				$result = array( 'st'=> 0 , 'msg'=> 'method does not post' ) ;  
			}
			echo $response = json_encode($result);
			return TRUE;
		}
		
		
		/**
		* Change Password
		*
		* @param       POST
		* @return      JSON
		*/
		public function change_password()
		{
			if ($this->input->server('REQUEST_METHOD') === 'POST')
			{							
				$token =$this->input->get_request_header('authorization', TRUE);
				if($token){
					$exist_token = $this->login_model->get_user_by_token($token);
					if(!$exist_token){
						$result = array( 'st'=> 0 , 'msg'=> 'authorization not matched' ) ;  
						echo $response = json_encode($result);
						return TRUE;
					}
				}else{
					$result = array( 'st'=> 0 , 'msg'=> 'authorization required' ) ;  
					echo $response = json_encode($result);
					return TRUE;
				}
				$this->form_validation->set_rules('opwd', 'old password','trim|required');
				$this->form_validation->set_rules('pwd', 'password', 'trim|required'); 		
				if ($this->form_validation->run())
				{					
					$new_pass = $this->input->post('pwd');
					$current_pass = $this->input->post('opwd');					
					$user_id = $this->input->post('id');
					
					/*if($new_pass != $current_pass)
					{
						$user_info = $this->login_model->get_user_by_token($token);
						$user_password = $this->login_model->check_user_old_password($user_info['id'], $current_pass); 
						if(!empty($user_password)){
							$this->login_model->update_password($user_info['id'], $new_pass);
							$result = array('success'=> 1 , 'message'=> 'Your account password has been changed successfully. Please login to continue','current_date' => date('Y-m-d'));
						}
						else{
							$result = array('success'=> 0 , 'message'=> "Your current password is wrong",'current_date' => date('Y-m-d'));
						}
					}
					else
					{
						$result = array('success'=> 0 , 'message'=> "Your current password and new password should not be same",'current_date' => date('Y-m-d'));
					}*/
					
					$response = $this->check_user_token($user_id, $token, 'users' ); 
					switch(trim($response))
					{
						case 'SUCCESS' :
							$user_datas = $this->login_model->check_user_token($user_id);
							if($user_datas['is_active'] == 0)		
							{
								$result = array('st'=> 2, 'msg'=> 'Your account not yet activated. Please active via you entered email address or contact admin for account activation','current_date' => date('Y-m-d'));
							}
							else
							{
								if($new_pass != $current_pass)
								{
									$user_password = $this->login_model->check_user_old_password($user_id, $current_pass); 
									if(!empty($user_password)){
										$this->login_model->update_password($user_id, $new_pass);
										$result = array('st'=> 1 , 'msg'=> 'Your account password has been changed successfully. Please login to continue');
									}
									else{
										$result = array('st'=> 0 , 'msg'=> "Your current password is wrong");
									}
								}
								else
								{
									$result = array('st'=> 0 , 'msg'=> "Your current password and new password should not be same");
								}
								
							}
						  	break;
						
						case 'INVALID_USER_ID' :
							$result = array('st'=> 2, 'msg'=> 'Invalid user');
							break;
						case 'TOKEN_EXPIRED' :
							$result = array('st'=> 2,'msg'=>'Token Expired');
							break;
						case 'TOKEN_ERROR' :
							$result = array('st'=> 2,'msg'=>'Sorry! Your current session has been expired. Please login to continue');
							break;
						default : 
							break;  
					}

					
				}
				else
				{
					$result = array( 'st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}
			else
			{
				$result = array( 'st'=> 0 , 'msg'=> 'method does not post' ) ;  
			}
			echo $response = json_encode($result);
			return TRUE;
		}
		
		function __encrip_password($password) {
			return md5($password);
		}	
		
		function check_user_token($user_id, $token, $table_name){
			$this->load->model('base_model');
			/*** Check token ***/
			$cond = array();
			$cond[] = array( TRUE, 'id',$user_id);
			//$cond[] = array( TRUE, 'app_token',$token);
			$user = $this->base_model->get_records($table_name, 'id,email_id,app_expire_time,password,app_token', $cond, 'row_array');
			if(!empty($user)){
				if( $token == $user['app_token']){  
					if ($user['app_expire_time'] >= date('Y-m-d h:i:s')) { 
						$result = 'SUCCESS';
						$this->base_model->update($table_name, array('app_expire_time'=>date('Y-m-d h:i:s', strtotime("+1 days") )) , array('id'=> $user['id']));
					}
					$result = 'SUCCESS';
				}else
					$result = 'TOKEN_ERROR';
			}else {
				$result = 'INVALID_USER_ID';
			}
			return $result; 
		}
	  
}
