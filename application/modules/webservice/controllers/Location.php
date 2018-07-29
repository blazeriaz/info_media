<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Location extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->helper('app_function_helper'); 
		$this->load->model('location_model');
	}
	
	public function countries()
	{
		$result = array(); 
		if ($this->input->server('REQUEST_METHOD') === 'POST')
		{ 
			if(/*$this->form_validation->run()*/ true)
			{
				$data = array();
				$countries = $this->location_model->get_countries();

				foreach($countries as $k=>$country)
				{
					$data[$k]['id'] = $country['id'];
					$data[$k]['name'] = $country['name'];						
				}
				if(!empty($data))
				{
					$result = array( 'st'=> 1 , 'msg'=> 'success', 'data' => $data); 
				}
				else
				{
					$result = array( 'st'=> 0 , 'msg'=> 'No records found');
				} 
			}
			else
			{
				$result = array('st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
			}
		}
		else
		{
			$result = array( 'st'=> 0 , 'msg'=> 'method does not post' ) ;  
		} 
		echo $response = json_encode($result);
		return TRUE;
	}
	
	public function states()
	{
		$result = array(); 
		if ($this->input->server('REQUEST_METHOD') === 'POST')
	{ 
			if (!$this->input->post()){
				$error = array(			
								"country_id" => "Please enter the country",
							);
				$result = array( 'st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $error);
				echo $response = json_encode($result);
				return TRUE;
			}
			$this->form_validation->set_rules('country_id', 'country', 'trim|required'); 
			if($this->form_validation->run())
			{
				$data = array();
				$country_id = $this->input->post('country_id');
				$states = $this->location_model->get_states($country_id);

				foreach($states as $k=>$state)
				{
					$data[$k]['id'] = $state['id'];
					$data[$k]['name'] = $state['name'];						
				}
				if(!empty($data))
				{
					$result = array( 'st'=> 1 , 'msg'=> 'success', 'data' => $data); 
				}
				else
				{
					$result = array( 'st'=> 0 , 'msg'=> 'No records found');
				} 
			}
			else
			{
				$result = array('st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
			}
		}
		else
		{
			$result = array( 'st'=> 0 , 'msg'=> 'method does not post' ) ;  
		} 
		echo $response = json_encode($result);
		return TRUE;
	}
			
	public function cities()
	{
		$result = array(); 
		if ($this->input->server('REQUEST_METHOD') === 'POST')
		{ 
			if (!$this->input->post()){
				$error = array(			
								"state_id" => "Please enter the state",
							);
				$result = array( 'st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $error);
				echo $response = json_encode($result);
				return TRUE;
			}
			$this->form_validation->set_rules('state_id', 'state', 'trim|required'); 
			if($this->form_validation->run())
			{
				$data = array();
				$state_id = $this->input->post('state_id');
				$cities = $this->location_model->get_cities($state_id);

				foreach($cities as $k=>$city)
				{
					$data[$k]['id'] = $city['id'];
					$data[$k]['name'] = $city['name'];						
				}
				if(!empty($data))
				{
					$result = array( 'st'=> 1 , 'msg'=> 'success', 'data' => $data); 
				}
				else
				{
					$result = array( 'st'=> 0 , 'msg'=> 'No records found');
				} 
			}
			else
			{
				$result = array('st'=> 0 , 'msg'=> 'validation error' , 'errors'=> $this->form_validation->error_array());
			}
		}
		else
		{
			$result = array( 'st'=> 0 , 'msg'=> 'method does not post' ) ;  
		} 
		echo $response = json_encode($result);
		return TRUE;
	}
			
}
