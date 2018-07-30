<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Courses_model extends CI_Model
	{
		public function __construct()
		{
			// Call the CI_Model constructor
			parent::__construct();
			$this->load->database();
     	}
		
		/**
		 * get total rows from department table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function get_courses($department_id){
			$this->db->select('*');
			$this->db->from('courses');
			$this->db->where('dept_id', $department_id);
			$this->db->where('status', '1');
			$order_by = 'name';
			$order_by_ad = 'asc';
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		
	}
