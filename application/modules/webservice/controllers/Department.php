<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Department extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->helper('app_function_helper'); 
		$this->load->model('department_model');
		$this->load->model('login_model');
	}
	
	public function index()
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
			
			if (/*$this->form_validation->run()*/ true)
			{					
				$user_by_token = $this->login_model->get_user_by_token($token);
				
				if($user_by_token)
				{
					$user_id = $user_by_token['id'];
					$response = $this->check_user_token($user_id, $token, 'users' ); 
					switch(trim($response))
					{
						case 'SUCCESS' :
							$user_datas = $this->login_model->check_user_token($user_id);
							if($user_datas['is_active'] == 0)		
							{
								$result = array('ST'=> 2, 'MSG'=> 'Your account not yet activated. Please active via you entered email address or contact admin for account activation');
							}
							else
							{		
								$data = array();
								$departments = $this->department_model->get_department();
								
								foreach($departments as $k=>$department)
								{
									$data[$k]['ID'] = $department['id'];
									$data[$k]['N'] = $department['name'];						
									$data[$k]['S'] = $department['subscription'];						
								}
								if(!empty($data))
								{
									$result = array( 'ST'=> 1 , 'MSG'=> 'success', 'data' => $data); 
								}
								else
								{
									$result = array( 'ST'=> 0 , 'MSG'=> 'No records found');
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
