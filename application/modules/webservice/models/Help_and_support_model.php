<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Help_and_support_model extends CI_Model
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
		public function get_help_and_support($user_id){
			$this->db->select('*');
			$this->db->from('help_support');
			$this->db->where('user_id', $user_id);
			$this->db->where('status', '1');
			$order_by = 'id';
			$order_by_ad = 'desc';
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		
		public function set_help_and_support($post_data)
		{
		 	$date = date('Y-m-d H:i:s');				
			$data = array(
						    'created' => $date,
							'modified' => $date,
							'title' => $post_data['t'],
							'support_query' => $post_data['sq'],
							'user_id' => $post_data['user_id'],
							'status' => 1
						);
			$this->db->insert('help_support',$data);			
			$insert_id = $this->db->insert_id(); 
			return $insert_id;
		}
		
	}
