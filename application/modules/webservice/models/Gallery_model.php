<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Gallery_model extends CI_Model
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
		public function get_gallery(){
			$this->db->select('*');
			$this->db->from('gallery');
			$this->db->where('status', '1');
			$order_by = 'title';
			$order_by_ad = 'asc';
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		
	}
