<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller
{
	  	function __construct()
  		{
    		parent::__construct();
			$this->load->library(array('form_validation','email_template'));
			$this->load->helper('app_function_helper'); 
			$this->load->model('login_model');
			$this->load->model('base_model'); 
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
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $error);
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
						if($response['status']!=0){
							$user_details = $response;			
							$time = date('Y-m-d H:i:s'); 
							$token = generate_token($response['id']);							
							$this->login_model->update_user_webservice($response['id'], $time, $token);							
							$this->login_model->update_fcmt($response['id'],$fcmt);
							
							$result['ST'] = 1;
							$result['MSG'] = 'Successfully Logged In.';
							$result['ID'] = $user_details['id'];
							$result['TN'] = $token;
							//$result['N'] = $user_details['first_name'] . " ". $user_details['last_name'];
							$result['N'] = $user_details['username'];
							//$result['UN'] = $user_details['username'];
							$result['MAIL'] = $user_details['email_id'];
						}else{
							$result = array('ST'=> 0, 'MSG'=> 'Your account has not activated' ); 
						}
					}else{
						$result = array('ST'=> 0, 'MSG'=> 'Invalid Login Credentials' ); 
					}
				}else{
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}else{
				$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
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
				if (!$this->input->post()){
					$error = array(			
									"un" => "Please enter the username",
									"pwd" => "Please enter the password",
									"ct" => "Please enter the mobile",
									"mail" => "Please enter the email",
									"addr" => "Please enter the city",
									"stat" => "Please enter the state",
									"t" => "Please enter the type",
									"fcmt" => "Please enter the fcmt",
								);
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $error);
					echo $response = json_encode($result);
					return TRUE;
				}
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
							$result = array( 'ST'=> 0 , 'MSG'=> 'This email address, username & mobile no already exists. Please enter unique email address, username & mobile number.' ) ;  
						}
						elseif(!empty($exist_email))
						{
							$result = array( 'ST'=> 0 , 'MSG'=> 'This email address already exists. Please enter unique email address.' ) ;  
						}
						elseif(!empty($exist_username))
						{
							$result = array( 'ST'=> 0 , 'MSG'=> 'This username already exists. Please enter unique username.' ) ;  
						}
						elseif(!empty($exist_mobile))
						{
							$result = array( 'ST'=> 0 , 'MSG'=> 'This mobile number already exists. Please enter unique mobile number.' ) ;  
						}
						else
						{						
							$user_id = $this->login_model->set_user();
							$user_datas = $this->login_model->get_user($user_id);
							if(!empty($user_id) && !empty($user_datas))
							{
								$time = date('Y-m-d H:i:s'); 
								//$email_activation_code = date("dmY").random_string('numeric', 5).date("his");
								$token = generate_token($user_datas['id']);
								$this->login_model->update_user_webservice($user_datas['id'], $time, $token);	
								$this->login_model->update_fcmt($user_datas['id'],$fcmt);
								$result['ST'] = 1;
								$result['MSG'] = 'Registration done successfully. Verification email is sent to your registered Email ID. Please verify your account to login.';
								$result['ID'] = $user_datas['id'];
								$result['TN'] = $token;
								//$result['N'] = $user_datas['first_name'] . " ". $user_datas['last_name'];
								$result['N'] = $user_datas['username'];
								//$result['UN'] = $user_datas['username'];
								$result['MAIL'] = $user_datas['email_id'];
								
								$user_email = $user_datas['email_id'];
								$user_name = $user_datas['username'];
								$email_config_data = array('[USERNAME]'=> $user_name, 
														   '[PASSWORD]' => $password,
														   '[USER_EMAIL]' => $user_email,
														   '[SITE_NAME]' => $this->config->item('site_name'),
														   '[LOGO]' => base_url().$this->config->item('logo_mail'),
														   //'[SITE_LINK]'=>"<a href='".base_url()."email_verify/".$email_activation_code."'>".base_url()."email_verify/".$email_activation_code."</a>"
														   );	
								$to_email = $user_email;
								$from_email = get_site_settings('emailtemplate.from_email','value');
								
								$template = 'User Registration';
								
								$res = $this->email_template->send_mail($to_email,$from_email,$template,$email_config_data);
								
							}else{
								$result = array( 'ST'=> 0 , 'MSG'=> 'Registration not successfully.') ;
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
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}
			else
			{
				$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
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
				if($token)
				{
					$exist_token = $this->login_model->get_user_by_token($token);
					if(!$exist_token){
						$result = array( 'ST'=> 0 , 'MSG'=> 'authorization not matched' ) ;  
						echo $response = json_encode($result);
						return TRUE;
					}
				}
				else{
					$result = array( 'ST'=> 0 , 'MSG'=> 'authorization required' ) ;  
					echo $response = json_encode($result);
					return TRUE;
				}
				$this->form_validation->set_rules('opwd', 'old password','trim|required');
				$this->form_validation->set_rules('pwd', 'password', 'trim|required'); 		
				//$this->form_validation->set_rules('id', 'user id', 'trim|required'); 		
				if ($this->form_validation->run())
				{					
					$new_pass = $this->input->post('pwd');
					$current_pass = $this->input->post('opwd');					
					//$user_id = $this->input->post('id');
					
					$user_by_token = $this->login_model->get_user_by_token($token);
					
					if($user_by_token)
					{
						$user_id = $user_by_token['id'];
						$response = $this->check_user_token($user_id, $token, 'users' ); 
						switch(trim($response))
						{
							case 'SUCCESS' :
								$user_datas = $this->login_model->check_user_token($user_id);
								if($user_datas['status'] == 0)		
								{
									$result = array('ST'=> 2, 'MSG'=> 'Your account not yet activated. Please active via you entered email address or contact admin for account activation');
								}
								else
								{
									if($new_pass != $current_pass)
									{
										$user_password = $this->login_model->check_user_old_password($user_id, $current_pass); 
										if(!empty($user_password)){
											$this->login_model->update_password($user_id, $new_pass);
											
											$cond = array();
											$cond[] = array(TRUE, 'id', $user_id ); 
											$maildetails = $this->base_model->get_records('users','id,concat(first_name," ", last_name) as name, username, email_id', $cond, 'row_array');
															   
											if($maildetails){
												$user_email = $maildetails['email_id'];
												$user_name = $maildetails['username'];
																	
												$email_config_data = array('[USERNAME]'=> $user_name, 
															   '[PASSWORD]' => $new_pass,
															   '[USER_EMAIL]' => $user_email,
															   '[SITE_NAME]' => $this->config->item('site_name'),
															   '[SITE_LINK]'=>"<a href='".base_url()."'>Link</a>"
															   );
												$to_email = $user_email;
												$from_email = get_site_settings('emailtemplate.from_email','value');			
												$template = 'Change Password User';							
												$res = $this->email_template->send_mail($to_email,$from_email,$template,$email_config_data);
											}
											
											$result = array('ST'=> 1 , 'MSG'=> 'Your account password has been changed successfully. Please login to continue');
										}
										else{
											$result = array('ST'=> 0 , 'MSG'=> "Your current password is wrong");
										}
									}
									else
									{
										$result = array('ST'=> 0 , 'MSG'=> "Your current password and new password should not be same");
									}
									
								}
								break;
							
							case 'INVALID_USER_ID' :
								$result = array('ST'=> 2, 'MSG'=> 'Invalid user');
								break;
							case 'TOKEN_EXPIRED' :
								$result = array('ST'=> 2,'MSG'=>'Token Expired');
								break;
							case 'TOKEN_ERROR' :
								$result = array('ST'=> 2,'MSG'=>'Sorry! Your current session has been expired. Please login to continue');
								break;
							default : 
								break;  
						}
					}
					else{
						$result = array('ST'=> 2,'MSG'=>'Token Expired');
					}					
				}
				else
				{
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}
			else
			{
				$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
			}
			echo $response = json_encode($result);
			return TRUE;
		}
					
		public function forgot_password()
		{
			if ($this->input->server('REQUEST_METHOD') === 'POST')
			{		
				if (!$this->input->post()){
					$error = array(			
									"mail" => "Please enter the email",
								);
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $error);
					echo $response = json_encode($result);
					return TRUE;
				}
				
				$this->form_validation->set_rules('mail', 'email', 'trim|required|valid_email');
				
				if ($this->form_validation->run())
				{					
					$forgot_email = $this->input->post('mail');
					$response = $this->login_model->get_user_by_email($forgot_email);
					if(!empty($response))
					{
						//$token = generate_token($response['id']); 
						$token = mt_rand(100000, 999999);
						$this->login_model->set_forgot_password($response['id'], $token);
						
						$user_email = $response['email_id'];
						$user_name = $response['username'];
											
						$email_config_data = array('[USERNAME]'=> $user_name, 
									   '[USER_EMAIL]' => $user_email,
									   '[OTP]' => $token,
									   '[SITE_NAME]' => $this->config->item('site_name'),
									   '[SITE_LINK]'=>"<a href='".base_url()."'>Link</a>"
									   );
						$to_email = $user_email;
						$from_email = get_site_settings('emailtemplate.from_email','value');			
						$template = 'Forgot Password User';							
						$res = $this->email_template->send_mail($to_email,$from_email,$template,$email_config_data);
										
						$result = array( 'ST'=> 1 , 'MSG'=> 'Instructions has been sent to your email address for resetting password' );						
					}
					else
					{
						$result = array( 'ST'=> 0 , 'MSG'=> 'Email ID does not exists');
					}					
				}
				else
				{
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}
			else
			{
				$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
			}
			echo $response = json_encode($result);
			return TRUE;
		}
					
		public function verify_reset_password()
		{
			if ($this->input->server('REQUEST_METHOD') === 'POST')
			{		
				if (!$this->input->post()){
					$error = array(			
									"mail" => "Please enter the email",
									"otp" => "Please enter the OTP",
								);
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $error);
					echo $response = json_encode($result);
					return TRUE;
				}
				
				$this->form_validation->set_rules('mail', 'email', 'trim|required|valid_email');
				$this->form_validation->set_rules('otp', 'otp', 'trim|required');
				
				if ($this->form_validation->run())
				{					
					$forgot_email = $this->input->post('mail');
					$otp = $this->input->post('otp');
					$response = $this->login_model->get_user_by_email($forgot_email);
					if(!empty($response))
					{
						if($response['forgot_pwd_token']==$otp){	
							$result = array( 'ST'=> 1 , 'MSG'=> 'OTP verified successfully.' );	
						}else{
							$result = array( 'ST'=> 0 , 'MSG'=> 'OTP mismatched.' );	
						}					
					}
					else
					{
						$result = array( 'ST'=> 0 , 'MSG'=> 'Email ID does not exists');
					}					
				}
				else
				{
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
				}
			}
			else
			{
				$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
			}
			echo $response = json_encode($result);
			return TRUE;
		}		
		
		public function action_reset_password(){
			if ($this->input->server('REQUEST_METHOD') === 'POST'){
				if (!$this->input->post()){
					$error = array(			
									"mail" => "Please enter the email",
									"pwd" => "Please enter the password",
								);
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $error);
					echo $response = json_encode($result);
					return TRUE;
				}
				$reset_email_id = $this->input->post('mail');
				$new_pass = $this->input->post('pwd');				
				$this->form_validation->set_rules('pwd', 'Password','trim|required');
				if ($this->form_validation->run() == True){	
					$count = $this->base_model->getCount('users', array('email_id' => $reset_email_id));				
					if (empty($count)) {
						$result = array( 'ST'=> 0 , 'MSG'=> 'Email not matched' );
					}else {
						$new_member_insert_data = array(
							'password' => md5($new_pass),
						);
						$update = $this->base_model->update('users', $new_member_insert_data, array('email_id' => $reset_email_id));
						$token = "";
						$response = $this->login_model->get_user_by_email($reset_email_id);
						if(!empty($response))
						{
							$this->login_model->set_forgot_password($response['id'], $token);
						}						
						$result = array( 'ST'=> 1 , 'MSG'=> 'Successfully changed reset password' );
					}
					echo json_encode($result);	
					
				}else{
					$result = array( 'ST'=> 0 , 'MSG'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
					echo json_encode($result);		
				}	
			}
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
					if ($user['app_expire_time'] >= date('Y-m-d H:i:s')) { 
						$result = 'SUCCESS';
						$this->base_model->update($table_name, array('app_expire_time'=>date('Y-m-d H:i:s', strtotime("+1 days") )) , array('id'=> $user['id']));
					}else{
						$result = 'TOKEN_EXPIRED';
					}
					//$result = 'SUCCESS';
				}else
					$result = 'TOKEN_ERROR';
			}else {
				$result = 'INVALID_USER_ID';
			}
			return $result; 
		}
	  
}
