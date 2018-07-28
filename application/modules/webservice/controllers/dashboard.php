<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller
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
		}
		
		public function index() 
		{     
			$this->load->model('dashboard_model');
			$this->load->helper('string');
			$result = array(); 
			if ($this->input->server('REQUEST_METHOD') === 'POST')
			{ 
				$this->form_validation->set_rules('oauth_token', 'oauth token', 'trim|required'); 
				$this->form_validation->set_rules('device_type', 'device type', 'trim|required'); 
				$this->form_validation->set_rules('device_id', 'device id', 'trim|required');
				//$this->form_validation->set_rules('device_token', 'device token', 'trim|required');
				$this->form_validation->set_rules('user_id', 'user id','trim|required');
				if($this->form_validation->run())
				{
					$user_id = $this->input->post('user_id');
					$oauth_token = $this->input->post('oauth_token');
					$response = $this->check_user_token($user_id, $oauth_token, 'admin_users' ); 
					switch(trim($response))
					{
						case 'SUCCESS' :
							$user_datas = $this->dashboard_model->check_user_token($user_id);
							if($user_datas['status'] == 0){
								$result = array('success'=> 2, 'message'=> 'Your account not yet activated. Please active via you entered email address or contact admin for account activation','current_date' => date('Y-m-d'));
							}else{																					
								$responseData = array();
								
								/*********** Response Data START *************/
								
								
								
								/*********** Response Data END *************/
								
								if(!empty($responseData)){
									$result = array( 'success'=> 1, 'message'=>'success', 'current_date' => date('Y-m-d'),'data'=> $responseData);
								}else{
									$result = array( 'success'=> 0, 'message'=>'No records found','current_date' => date('Y-m-d'));
								}								
							}
						  	break;						
						case 'INVALID_USER_ID' :
							$result = array('success'=> 2, 'message'=> 'Invalid user','current_date' => date('Y-m-d'));
							break;
						case 'TOKEN_EXPIRED' :
							$result = array('success'=> 2,'message'=>'Token Expired','current_date' => date('Y-m-d'));
							break;
						case 'TOKEN_ERROR' :
							$result = array('success'=> 2,'message'=>'Sorry! Your current session has been expired. Please login to continue','current_date' => date('Y-m-d'));
							break;
						default : 
							break;  
					}
				}
				else
				{
					$result = array('success'=> 0 , 'message'=> 'validation error' , 'current_date' => date('Y-m-d'),'errors'=> $this->form_validation->error_array());
				}
			}
			else
			{
				$result = array( 'success'=> 0 , 'message'=> 'method does not post','current_date' => date('Y-m-d') ) ;  
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
