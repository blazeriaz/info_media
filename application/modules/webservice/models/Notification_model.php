<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Notification_model extends CI_Model
	{
		public function __construct()
		{
			// Call the CI_Model constructor
			parent::__construct();
			$this->load->database();
     	}
		
		/**
		 * get total rows from gallery table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function get_notification($user_id){
			$this->db->select('pa.id,n.title,n.message,n.created');
			$this->db->from('push_alert pa');
			$this->db->join('notification n', 'pa.notification_id = n.id');
			$this->db->where('pa.user_id', $user_id);
			$group_by = 'pa.id';
			$order_by = 'pa.id';
			$order_by_ad = 'desc';
			$this->db->group_by($group_by); 
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		
	}
