<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Brands extends CI_Controller {

	public function __construct()	{
		parent::__construct();		
       $this->load->model('user_model');
       $this->load->model('item_model');
       $this->load->model('brand_model');
	}	



	public function index()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Brands and Companies';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record


			//Paginated data - Candidate Names				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/brands/index/');
			$config["total_rows"] = $this->brand_model->count_brands();
			$config['per_page'] = 20;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->brand_model->fetch_brands($config["per_page"], $page);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			//Form Validation for user
			$this->form_validation->set_rules('title', 'Company / Brand', 'trim|required'); 
			$this->form_validation->set_rules('address', 'Address', 'trim|required'); 
			$this->form_validation->set_rules('email', 'Email Address', 'trim|valid_email'); 
			$this->form_validation->set_rules('contact', 'Contact Number', 'trim'); 
			$this->form_validation->set_rules('web', 'Web Address', 'trim'); 
			$this->form_validation->set_rules('desc', 'Description', 'trim'); 
			
			
			//Validate Usertype
			if($data['user']['usertype'] == 'Administrator') {

				if($this->form_validation->run() == FALSE)	{
					$this->load->view('brand/list', $data);
				} else {	
			
					//Proceed saving user				
					if($this->brand_model->create_brand()) {			

						$brand_id = $this->db->insert_id(); //fetch last insert case Row ID
						// Save Log Data ///////////////////				

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'brand',
							'tag_id'	=> 	$brand_id,
							'action' 	=> 	'Brand Registration'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
					
						$this->session->set_flashdata('success', 'Affiliate Registered!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					} else {
						//failure
						$this->session->set_flashdata('error', 'Error occured!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					}		
				}
			} else {
				show_error('Oops! Your account does not have the privilege to view the content. Please Contact the Administrator', 403, 'Access Denied!');
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}

	public function view($id)		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['site_title'] = APP_NAME;
			$data['user'] = $this->user_model->userdetails($userdata['username']); //fetches users record

			//Page Data 
			$data['brands']		= $this->item_model->fetch_brands();
			$data['usertypes']		= $this->user_model->usertypes();			

			$data['info']		= $this->brand_model->view($id);
			$data['logs']		= $this->logs_model->fetch_logs('brand', $id, 50);
			$data['title'] 		= $data['info']['title'];


			
			//Paginated data - Candidate Names				            
		   	$config['num_links'] = 5;
			$config['base_url'] = base_url('/brands/view/'.$id.'/items/');
			$config["total_rows"] = $this->brand_model->count_brands_item($data['info']['title']);
			$config['per_page'] = 50;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG
			$this->pagination->initialize($config);

			$page = 1;	//default page

			if($this->uri->segment(4) == 'items') {
			    if($this->uri->segment(5)){
			       $page = ($this->uri->segment(5)) ;
			  	}
			}

			$data["results"] = $this->brand_model->fetch_brands_item($config["per_page"], $page, $data['info']['title']);
			$str_links = $this->pagination->create_links();
			$data["links"] = explode('&nbsp;',$str_links );

			//ITEM NUMBERING
			$data['per_page'] = $config['per_page'];
			$data['page'] = $page;

			//GET TOTAL RESULT
			$data['total_result'] = $config["total_rows"];
		 	//END PAGINATION	
			


			//Validate if record exist
			 //IF NO ID OR NO RESULT, REDIRECT
				if(!$id || !$data['info'] || $data['info']['is_deleted']) {
					redirect('users', 'refresh');
			}	

			//Form Validation for user
			$this->form_validation->set_rules('title', 'Company / Brand', 'trim|required'); 
			$this->form_validation->set_rules('address', 'Address', 'trim|required'); 
			$this->form_validation->set_rules('email', 'Email Address', 'trim|valid_email'); 
			$this->form_validation->set_rules('contact', 'Contact Number', 'trim'); 
			$this->form_validation->set_rules('web', 'Web Address', 'trim'); 
			$this->form_validation->set_rules('desc', 'Description', 'trim'); 
		
			//Validate Usertype
			if($data['user']['usertype'] == 'Administrator') {
				if($this->form_validation->run() == FALSE)	{
				$this->load->view('brand/view', $data);
				} else {			

					//Proceed saving candidate				
					$key_id = $this->encryption->decrypt($this->input->post('id')); //ID of the row
					if($this->brand_model->update_brand($key_id)) {		

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'brand',
							'tag_id'	=> 	$key_id,
							'action' 	=> 	'Updated Brand Information'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
						
					
						$this->session->set_flashdata('success', 'Succes! Brand Updated!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					} else {
						//failure
						$this->session->set_flashdata('error', 'Oops! Error occured!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					}			
					
				}	
			} else {
				show_error('Oops! Your account does not have the privilege to view the content. Please Contact the Administrator', 403, 'Access Denied!');				
			}		

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function delete()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('id', 'ID', 'trim|required');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$key_id = $this->encryption->decrypt($this->input->post('id')); //ID of the row				

				if($this->brand_model->delete_brand($key_id)) {

					$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'brand',
							'tag_id'	=> 	$key_id,
							'action' 	=> 	'Deleted Brand'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
					$this->session->set_flashdata('success', 'Brand Deleted!');
					redirect('brands', 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}





}
