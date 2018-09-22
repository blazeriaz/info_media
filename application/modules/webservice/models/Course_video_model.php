<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Course_video_model extends CI_Model
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
		public function get_course_video($course_id){
			$this->db->select('*');
			$this->db->from('course_video');
			$this->db->where('course_id', $course_id);
			$this->db->where('status', '1');
			$order_by = 'name';
			$order_by_ad = 'asc';
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		
		/**
		 * get total rows from department table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function add_course_video_count($course_video_id){
			$this->db->set('view_count', 'view_count+1', FALSE);
			$this->db->where('id',$course_video_id);			
			return $this->db->update('course_video');
		}
		
	}
