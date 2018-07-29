<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Location_Model extends CI_Model
	{
		public function __construct()
		{
			// Call the CI_Model constructor
			parent::__construct();
			$this->load->database();
     	}
		
		/**
		 * get total rows from countries table
		 *
		 * @param       NULL
		 * @return      Array
		 */
		public function get_countries(){
			$this->db->select('id, name');
			$this->db->from('countries');
			$this->db->where('status', '1');
			$order_by = 'name';
			$order_by_ad = 'asc';
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		/**
		 * get total rows from states table
		 *
		 * @param       ID
		 * @return      Array
		 */
		public function get_states($id){
			$this->db->select('id, name');
			$this->db->from('states');
			$this->db->where('country_id', $id);
			$this->db->where('status', '1');
			$order_by = 'name';
			$order_by_ad = 'asc';
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		/**
		 * get total rows from cities table
		 *
		 * @param       ID
		 * @return      Array
		 */
		public function get_cities($id){
			$this->db->select('id, name');
			$this->db->from('cities');
			$this->db->where('state_id', $id);
			$this->db->where('status', '1');
			$order_by = 'name';
			$order_by_ad = 'asc';
			$this->db->order_by($order_by, $order_by_ad);	
			$query = $this->db->get();			
			return $query->result_array();	
		}
		
	}
