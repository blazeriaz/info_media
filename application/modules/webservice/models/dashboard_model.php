<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Dashboard_Model extends CI_Model
	{
		public function __construct()
		{
			// Call the CI_Model constructor
			parent::__construct();
			$this->load->database();
     	}
		
		
		/**
		 * check user token in users table
		 *
		 * @param       $id
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
		
		/**
		 * check user token in users table
		 *
		 * @param       $id
		 * @return      Array
		 */
		 public function get_all_advertised_jobs($flag, $selected='*', $conditions = array(), $total=TRUE, $page=null)
		 {
			//$this->db->select($selected);
			$this->db->select('j.id, jar.id as reply_id, p.project_number, j.is_reassign,j.is_express,j.project_image_count as job_image_count,s.title as service_title,jar.modified as modified_date,jar.created as created_date,j.job_number as job_number,j.is_revision, j.is_reassign, j.is_fully_complete');
			$this->db->from("job_assign_response jar");
			$this->db->join('jobs j','j.id=jar.job_id','left');
			$this->db->join('projects p','p.id=j.project_id','left');
			$this->db->join('services s','s.id=p.service_id','left');	
			
			if(!empty($conditions)){ 
				foreach($conditions as $key=>$cond){
					if(!$cond['direct'])
						$this->db->$cond['rule']($cond['field'], $cond['value']);
					else
						$this->db->$cond['rule']($cond['value']);
				}
			}
			$this->db->group_by('jar.job_id');			
			$this->db->order_by('jar.modified', 'desc');
			
			if(!$total){
				$limit = 10;
				if($page){
					$page = ($page-1)*$limit;
					$this->db->limit($limit,$page);
				}else{
					$this->db->limit($limit,0);
				}
			}
			
			if($flag == 1){	
				$query = $this->db->get();	 				
				return $query->result_array(); 				
			}else{
				$query = $this->db->get();		
				return $query->num_rows();        
			}
		}
		
		public function get_all_jobs($flag, $selected='*', $conditions = array(), $total=TRUE, $page=null)
		{
			//$this->db->select('*');
			$this->db->select('j.id, p.project_number,j.is_reassign,j.is_express,j.project_image_count as job_image_count,s.title as service_title,j.job_number as job_number, count(jar.id) as reply_count, j.is_revision, j.is_express, j.is_reassign, j.admin_view_status, j.dispatcher_view_status');
			$this->db->from('jobs j');
			//$this->db->join("admin_job_notification n",'j.id=n.job_id','left');		
			$this->db->join("job_assign_response jar",'j.id=jar.job_id AND jar.is_active=1','left');
			$this->db->join('projects p','p.id=j.project_id','left');
			$this->db->join('services s','s.id=p.service_id','left');		
			
			if(!empty($conditions)){ 
				foreach($conditions as $key=>$cond){
					if(!$cond['direct'])
						$this->db->$cond['rule']($cond['field'], $cond['value']);
					else
						$this->db->$cond['rule']($cond['value']);
				}
			}	
			$this->db->order_by('j.id', 'desc');
			$this->db->group_by('j.id');
			
			if(!$total){
				$limit = 10;
				if($page){
					$page = ($page-1)*$limit;
					$this->db->limit($limit,$page);
				}else{
					$this->db->limit($limit,0);
				}
			}
			
			if($flag == 1){	
				$query = $this->db->get();	 				
				return $query->result_array(); 				
			}else{
				$query = $this->db->get();		
				return $query->num_rows();        
			}			
		}
		 
		 
		
	}
