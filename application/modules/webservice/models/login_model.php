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
		
		function get_user_by_auth($user_name, $password)
		{ 
			$this->db->select('*');
			$wher = "(email='$user_name' OR unique_login_name='$user_name')";
			$this->db->where($wher);
			$this->db->where('password', $password);
			//$this->db->where_in('user_type', array('1','2','3'));
			$this->db->where('user_type', 3);
			//$this->db->where('status', 1);
			$query = $this->db->get('admin_users');
			if($query->num_rows == 1){
				return $query->row_array();
			}
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
		public function update_user_webservice($id, $time, $token)
		{	
			//$this->db->set('login_count', 'login_count+1', FALSE);
			$this->db->set('last_login_time', $time);
			$this->db->set('app_token', $token);
			$this->db->where('id',$id);			
			return $this->db->update('admin_users');
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
			$this->db->from('admin_users');
			$this->db->where('id', $id);			
			$query = $this->db->get();				
			return $query->row_array();			
		}
		
	}
