<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Notification_Model extends CI_Model{
		
		public function __construct()
        {
                // Call the CI_Model constructor
                parent::__construct();
				$this->load->database();
        }
		
		 /**
		 * get mulitple row from user_devices table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function get_users_list($users_id=array()){
			$this->db->select('u.id as user_id,u.email_id,u.app_token as token,u.fcmt');
			$this->db->from('users u');
            if($users_id){
			     $this->db->where_in('u.id', $users_id);
            }
            $this->db->where('u.app_token !=',"");
            $this->db->where('u.fcmt !=',"");
			$this->db->where('u.is_active',1);
			$this->db->where('u.is_deleted',0);
			$query = $this->db->get();				
			return $query->result_array();	
		}		
		
		/**
		 * get records from push alerts table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function get_push_alerts($user_id){
			$this->db->select('pa.id as alert_id,pa.user_id,pa.notification_id,n.title,n.message');
			$this->db->from('push_alert pa');
			$this->db->join('notification n', 'n.id = pa.notification_id', 'inner');
			$this->db->where('pa.user_id', $user_id);
            $this->db->where('pa.is_read','0');
			$query = $this->db->get();				
			return $query->result_array();	
		}
		
        /**
		 * update viewed alert status into push_alert table
		 *
		 * @param       NULL
		 * @return      Array
		 */
        public function alert_status($user_id)
        {  
            $arr = array('is_read' => '1'); 
            $this->db->where('user_id',$user_id);
            $this->db->where('is_read','0');
            $this->db->update('push_alert',$arr);
        }
		
	}
