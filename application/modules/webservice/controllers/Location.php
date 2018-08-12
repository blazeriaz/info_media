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
					$result = array( 'ST'=> 1 , 'MSG'=> 'success', 'DATA' => $data); 
				}
				else
				{
					$result = array( 'ST'=> 0 , 'MSG'=> 'No records found');
				} 
			}
			else
			{
				$error = $this->form_validation->error_array();
				$MSG = implode("<br>",$error);
				$result = array( 'ST'=> 0 , 'MSG'=> $MSG);
			}
		}
		else
		{
			$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
		} 
		echo $response = json_encode($result);
		return TRUE;
	}
	
	public function states()
	{
		$result = array(); 
		if ($this->input->server('REQUEST_METHOD') === 'POST')
	{ 
			/*if (!$this->input->post()){
				$error = array(			
								"country_id" => "Please enter the country",
							);
				$MSG = implode("<br>",$error);
				$result = array( 'ST'=> 0 , 'MSG'=> $MSG);
				echo $response = json_encode($result);
				return TRUE;
			}
			$this->form_validation->set_rules('country_id', 'country', 'trim|required'); */
			if(/*$this->form_validation->run()*/ true)
			{
				$data = array();
				//$country_id = $this->input->post('country_id');
				$country_id = 101;
				$states = $this->location_model->get_states($country_id);

				foreach($states as $k=>$state)
				{
					$data[$k]['id'] = $state['id'];
					$data[$k]['name'] = $state['name'];						
				}
				if(!empty($data))
				{
					$result = array( 'ST'=> 1 , 'MSG'=> 'success', 'DATA' => $data); 
				}
				else
				{
					$result = array( 'ST'=> 0 , 'MSG'=> 'No records found');
				} 
			}
			else
			{
				$error = $this->form_validation->error_array();
				$MSG = implode("<br>",$error);
				$result = array( 'ST'=> 0 , 'MSG'=> $MSG);
			}
		}
		else
		{
			$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
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
								"stat" => "Please enter the state",
							);
				$MSG = implode("<br>",$error);
				$result = array( 'ST'=> 0 , 'MSG'=> $MSG);
				echo $response = json_encode($result);
				return TRUE;
			}
			$this->form_validation->set_rules('stat', 'state', 'trim|required'); 
			if($this->form_validation->run())
			{
				$data = array();
				$state_id = $this->input->post('stat');
				$cities = $this->location_model->get_cities($state_id);

				foreach($cities as $k=>$city)
				{
					$data[$k]['id'] = $city['id'];
					$data[$k]['name'] = $city['name'];						
				}
				if(!empty($data))
				{
					$result = array( 'ST'=> 1 , 'MSG'=> 'success', 'DATA' => $data); 
				}
				else
				{
					$result = array( 'ST'=> 0 , 'MSG'=> 'No records found');
				} 
			}
			else
			{
				$error = $this->form_validation->error_array();
				$MSG = implode("<br>",$error);
				$result = array( 'ST'=> 0 , 'MSG'=> $MSG);
			}
		}
		else
		{
			$result = array( 'ST'=> 0 , 'MSG'=> 'method does not post' ) ;  
		} 
		echo $response = json_encode($result);
		return TRUE;
	}
			
}
