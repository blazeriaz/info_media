<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller
{
	  	function __construct()
  		{
    		parent::__construct();
			//$this->load->library(array('form_validation'));
			$this->load->library('form_validation');
			$this->load->helper('app_function_helper');
			//$this->load->language(array('flash_message','form_validation'), 'english');			
			if(!empty($this->input->is_ajax_request())){    
			  //exit;    
			}
			//continue;
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
		public function app_login() 
		{     
			$this->load->model('login_model');
			//$this->load->helper('thumb_helper');
			$result = array(); 
			if($this->input->server('REQUEST_METHOD') === 'POST')
			{
				if (!$this->input->post() /*|| count($_POST) == 0*/){
					$error = array(			
													"email_id" => "Please enter the email id",
													"password" => "Please enter the password",
													"device_type" => "Please enter the device type",
													"device_id" => "Please enter the device id"
											);
					$result = array( 'success'=> 0 , 'message'=> 'validation error' ,'current_date' => date('Y-m-d'), 'errors'=> $error);
					echo $response = json_encode($result);
					return TRUE;
				}
		  		$this->form_validation->set_rules('email_id', 'email id','trim|required');
				$this->form_validation->set_rules('password', 'password', 'trim|required'); 
				$this->form_validation->set_rules('device_type', 'device type', 'trim|required'); 
				$this->form_validation->set_rules('device_id', 'device id', 'trim|required'); 		
				//$this->form_validation->set_rules('device_token', 'device register id', 'trim|required');				
				if($this->form_validation->run())
				{					
					$email = $this->input->post('email_id');
					$password = $this->__encrip_password($this->input->post('password'));
					$device_id = $this->input->post('device_id');  
					$device_type = $this->input->post('device_type'); 
					$device_token = $this->input->post('device_token'); 
					$response = $this->login_model->get_user_by_auth($email, $password);				
					//pr($response);die;
					if(!empty($response))
					{
						if($response['status']!=0){
							$user_mobile_exist_query = $this->login_model->check_user_mobile_exist($response['id']);
							$user_mobile_exist = $user_mobile_exist_query->row_array();	
							if(empty($user_mobile_exist))
							{
								$device_id = $this->login_model->set_user_device( $response['id'] , $device_id, $device_type, $device_token);
							}else{
								$device_id = $this->login_model->update_user_device( $response['id'] , $device_id, $device_type, $device_token);
							}
							$time = date('Y-m-d H:i:s'); 
							$token = generate_token($response['id']);
							//$user_details = $this->login_model->get_user($response['id']);
							$user_details = $response;

							//pr($user_details);						
							
							$responseData['user_id'] = $user_details['id'];
							$responseData['user_name'] = $user_details['firstname'] . " ". $user_details['lastname'];
							$responseData['user_email'] = $user_details['email'];
							$responseData['oauth_token'] = $token;
							$responseData['last_login'] = $user_details['last_login_time'];
							
							$this->login_model->update_user_webservice($response['id'], $time, $token);
							$result = array( 'success'=> 1, 'message'=>'Successfully Logged in','current_date' => date('Y-m-d'), 'data'=> $responseData);
						}else{
							$result = array('success'=> 0, 'message'=> 'Your account has not activated','current_date' => date('Y-m-d') ); 
						}
					}else{
						$result = array('success'=> 0, 'message'=> 'Invalid Login Credentials','current_date' => date('Y-m-d') ); 
					}
				}else{
					$result = array( 'success'=> 0 , 'message'=> 'validation error' ,'current_date' => date('Y-m-d'), 'errors'=> $this->form_validation->error_array());
				}
			}else{
				$result = array( 'success'=> 0 , 'message'=> 'method does not post','current_date' => date('Y-m-d') ) ;  
			} 
			echo $response = json_encode($result);
			return TRUE;
		}
		
		function __encrip_password($password) {
			return md5($password);
		}	
		
		public function device_token()
         {
            $this->load->model('login_model');
            $result = array();
            if ($this->input->server('REQUEST_METHOD') === 'POST'){ 
                $this->form_validation->set_rules('oauth_token', 'oauth token', 'trim|required'); 
                $this->form_validation->set_rules('user_id', 'user id','trim|required');
                $this->form_validation->set_rules('device_type', 'device type', 'trim|required');
                $this->form_validation->set_rules('device_id', 'device id', 'trim|required');
                //$this->form_validation->set_rules('device_token', 'device token', 'trim|required');
                
                if ($this->form_validation->run()){
                    $user_id = $this->input->post('user_id'); 
                    $device_token = $this->input->post('device_token');
					$oauth_token = $this->input->post('oauth_token');
					$response = $this->check_user_token($user_id, $oauth_token, 'admin_users' );
                    switch(trim($response))
                    {
                        case 'SUCCESS' :
							
                            /*$user_datas = $this->login_model->check_user_token($user_id);
                            if($user_datas['status'] == 0)
                            {
                                $result = array('success'=> 2, 'message'=> 'Inactive user','current_date' => date('Y-m-d'));
                            }
                            else
                            {
                                $update = $this->login_model->update_device_token($user_id,$device_token);
                                if($update){
                                        $result = array('success'=> 1 , 'message'=> 'Device token has been updated successfully','current_date' => date('Y-m-d'));
                                }
                            }*/
							
							$update = $this->login_model->update_device_token($user_id,$device_token);
							if($update){
									$result = array('success'=> 1 , 'message'=> 'Device token has been updated successfully','current_date' => date('Y-m-d'));
							}
							
                            break;

                        case 'INVALID_USER_ID' :
                            $result = array('success'=> 2 , 'message'=> 'Invalid user','current_date' => date('Y-m-d'));
                            break;
                        case 'TOKEN_EXPIRED' :
                            $result = array('success'=> 2,'message'=>'Token Expired','current_date' => date('Y-m-d'));
                            break;
                        case 'TOKEN_ERROR' :
                            $result = array('success'=> 2,'message'=>'Your session has been expired','current_date' => date('Y-m-d'));
                            break;
                        default : 
                            break;  
                    }	
                } else {
                    $result = array('success'=> 0 , 'message'=> 'validation error' ,'current_date' => date('Y-m-d'), 'errors'=> $this->form_validation->error_array());  //Invalid Params";
                }
            } else {
                    $result = array( 'success'=> 0 , 'message'=> 'method does not post','current_date' => date('Y-m-d') ) ;  //Not Post";
            } 
            echo $response = json_encode($result);
            return TRUE;
         }
		
		function check_user_token($user_id, $token, $table_name, $check_old_password = false){
			$this->load->model('base_model');
			/*** Check token ***/
			$cond = array();
			$cond[] = array( TRUE, 'id',$user_id);
			$user = $this->base_model->get_records($table_name, 'id,email,app_expire_time,password,app_token', $cond, 'row_array');
			if(!empty($user)){
				if( $token == $user['app_token']){  
					if ($user['app_expire_time'] >= date('Y-m-d h:i:s')) { 
						//if($check_old_password && (md5($check_old_password) != $user['password']))	{	 
							//return 'OLD_PASSWORD_ERROR';
						//}
						$result = 'SUCCESS';
						$this->base_model->update($table_name, array('app_expire_time'=>date('Y-m-d h:i:s', strtotime("+1 days") )) , array('id'=> $user['id']));
					}
					//else //$result = 'TOKEN_EXPIRED';
					$result = 'SUCCESS';
				}else
					$result = 'TOKEN_ERROR';
			}else {
				$result = 'INVALID_USER_ID';
			}
			return $result; 
		}
	  
}
