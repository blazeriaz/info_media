<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Login_Model extends CI_Model
	{
		public function __construct()
		{
			// Call the CI_Model constructor
			parent::__construct();
			$this->load->database();
     	}
		
		/**
		 * Check the User Login Authentication
		 *
		 * @param       $email, $password
		 * @return      Array
		 */
		
		function get_user_by_auth($username, $password, $login_type)
		{ 
			$this->db->select('*');
			$where = "(email_id='$username' OR username='$username')";
			$this->db->where($where);
			if(empty($login_type)){
				$this->db->where('password', $password);
			}
			$this->db->where('login_type', $login_type);
			$this->db->where('is_email_verified', 1);
			//$this->db->where('is_active', 1);
			$this->db->where('status', 1);
			$query = $this->db->get('users');
			return $query->row_array();
		}
		
		/**
		 * check user exist in user_devices table
		 *
		 * @param       $user_id
		 * @return      Array
		 */
		public function check_user_mobile_exist($user_id)
		{
			$this->db->select('*');
			$this->db->from('user_devices');		
			$this->db->where('user_id', $user_id);	
			$query = $this->db->get();				
			return $query;	
		}
		
		/**
		 * Add user device details into user_devices table
		 *
		 * @param       $user_id, $imei_number, $type, $token
		 * @return      Array
		 */
		public function set_user_device($user_id, $imei_number, $type, $token)
		{	
			$data = array(
				'imei_number' => $imei_number,
				'type' => $type,
				'token' => $token,
				'user_id' => $user_id
			);
			return $this->db->insert('user_devices', $data);			
		}
		
       /**
		 * update user device details into user_devices table
		 *
		 * @param       $user_id, $imei_number, $type, $token
		 * @return      Array
		 */
		public function update_user_device($user_id, $imei_number, $type, $token)
		{	
			$data = array(
				'imei_number' => $imei_number,
				'type' => $type,
				'token' => $token
			);
            $this->db->where('user_id',$user_id);
			return $this->db->update('user_devices', $data);			
		}
		
		/**
		 * update user login time into users table
		 *
		 * @param       $id, $time, $token
		 * @return      Void
		 */
		public function update_user_webservice($id, $time, $app_token)
		{	
			//$this->db->set('login_count', 'login_count+1', FALSE);
			$this->db->set('last_login_time', $time);
			$this->db->set('app_token', $app_token);
			$this->db->where('id',$id);			
			return $this->db->update('users');
		}
		
		/**
		 * update device_token into user_devices table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function update_device_token($user_id,$device_token){	
			$data = array(
				'token' => $device_token
			);
            $this->db->where('user_id',$user_id);
			return $this->db->update('user_devices', $data);			
		}
		
		/**
		 * get single row from teachers table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function check_user_token($id)
		{
			$this->db->select('*');
			$this->db->from('users');
			$this->db->where('id', $id);			
			$query = $this->db->get();				
			return $query->row_array();			
		}
		
		public function get_user_by_email($mailid)
		{			
			$this->db->select('users.id, users.email_id, users.is_email_verified, users.is_active, users.status');
			$this->db->from('users');
			$this->db->where("users.email_id='".$mailid."' AND users.is_deleted = 0");	
			$selectResponse = $this->db->get();
			return $selectResponse->row_array(); 
		}
		
		public function get_user_by_mobile($mobile)
		{			
			$this->db->select('users.id, users.email_id, users.is_email_verified, users.is_active, users.status');
			$this->db->from('users');
			$this->db->where("users.phone_no='".$mobile."' AND users.is_deleted = 0");	
			$selectResponse = $this->db->get();
			return $selectResponse->row_array(); 
		}
		
		public function get_user_by_username($username)
		{			
			$this->db->select('users.id, users.email_id, users.is_email_verified, users.is_active, users.status');
			$this->db->from('users');
			$this->db->where("users.username='".$username."' AND users.is_deleted = 0");	
			$selectResponse = $this->db->get();
			return $selectResponse->row_array(); 
		}
				
		public function get_user_by_token($token)
		{			
			$this->db->select('*');
			$this->db->from('users');
			$this->db->where("users.app_token='".$token."' AND users.is_deleted = 0");	
			$selectResponse = $this->db->get();
			return $selectResponse->row_array(); 
		}
		
		public function get_user($id)
		{
		 	$this->db->select('*');
		 	$this->db->from('users u');
		 	$this->db->where('u.id',$id);
		 	//$this->db->where('u.is_active',1);
		 	$this->db->where('u.is_deleted',0);
		 	$query = $this->db->get();
		 	$res = $query->row_array();
		 	return $res;
		}
		 
		public function set_user()
		{
		 	$date = date('Y-m-d H:i:s');
				
			$data = array(
						    'created' => $date,
							'modified' => $date,
							'email_id' => $this->input->post('mail'),
						  	'password' => md5($this->input->post('pwd')),
							'last_login_time' => $date,
							'app_token' => '',
							//'app_expire_time' => $date,
							//'forgot_pwd_token' => '',
							//'forgot_pwd_expire_time' => $date,
							'username' => $this->input->post('un'),
							'phone_no' => $this->input->post('ct'),
							//'country' => $this->input->post('country'),
							'state' => $this->input->post('stat'),
							'city' => $this->input->post('addr'),
							'login_type' => $this->input->post('v') ? $this->input->post('v') : 0,
							'fcmt' => $this->input->post('fcmt'),
							'is_email_verified' => 1,
							'is_active' => 1,
							'status' => 1
						);
			$this->db->insert('users',$data);
			
			$insert_id = $this->db->insert_id();
 
			return $insert_id;
		}
		
		public function update_user()
		{
			$data = array(
							'modified' => date('Y-m-d H:i:s'),				
							'name' => $name,
							'profile_image' => $received_image_name,
							'phone_no' => $contact_number,
							'country' => $country,
							'state' => $state,
							'city' => $city,
							'gender' => $gender,
							'unit_type' => $unit_type
						);
			$this->db->where('user_id',$user_id);		
			return $this->db->update('profiles', $data);
		}
		
		public function check_user_old_password($id, $password)
		{
			$this->db->select('*');
			$this->db->from('users');
			$this->db->where('id', $id);			
			$this->db->where('password', md5($password));			
			$query = $this->db->get();				
			return $query->row_array();			
		}
				
		public function update_password($id, $password)
		{
			$data = array(
			'password' => md5($password)
			);
			$this->db->where('id',$id);			
			return $this->db->update('users',$data);		
		}
		
	}
