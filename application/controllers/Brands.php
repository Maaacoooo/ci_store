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

			$data['title'] 		= 'Item Brands';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

			$data['search']	= $this->input->get('search', TRUE);

			//Paginated data - Candidate Names				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/brands/index/');
			$config["total_rows"] = $this->brand_model->count_brands($data['search'], 0);
			$config['per_page'] = 20;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->brand_model->fetch_brands($config["per_page"], $page, $data['search'], 0);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			//Form Validation for user
			$this->form_validation->set_rules('title', 'Item Brand Title', 'trim|required'); 
			$this->form_validation->set_rules('web', 'Web Address', 'trim'); 
			
			//Validate Usertype
			if($data['user']['usertype'] == 'Administrator') {

				if($this->form_validation->run() == FALSE)	{
					$this->load->view('brand/list', $data);
				} else {	
					
					$brand_id = $this->brand_model->create_brand();

					//Proceed saving user				
					if($brand_id) {			

						// Save Log Data ///////////////////				

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'brand',
							'tag_id'	=> 	$brand_id,
							'action' 	=> 	'Brand Registration'
							);

				
						//Save Logs/////////////////////////
						$this->logs_model->save_logs($log);		
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

			$data['info']		= $this->brand_model->view($id);
			$data['logs']		= $this->logs_model->fetch_logs('brand', $id, 50);
			$data['title'] 		= $data['info']['title'];
	
			//Paginated data			            
		   	$config['num_links'] = 5;
			$config['base_url'] = base_url('/brands/view/'.$id.'/items/');
			$config["total_rows"] = $this->brand_model->count_inventory($data['info']['title']);
			$config['per_page'] = 50;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG
			$this->pagination->initialize($config);

			$page = 1;	//default page

			if($this->uri->segment(4) == 'items') {
			    if($this->uri->segment(5)){
			       $page = ($this->uri->segment(5)) ;
			  	}
			}

			$data["results"] = $this->brand_model->fetch_inventory($config["per_page"], $page, $data['info']['title']);
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
					redirect('brands', 'refresh');
			}	

			//Form Validation for user
			$this->form_validation->set_rules('id', 'ID', 'trim|required'); 
			$this->form_validation->set_rules('title', 'Company / Brand', 'trim|required'); 
			$this->form_validation->set_rules('web', 'Web Address', 'trim'); 
		
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

				
						//Save Logs/////////////////////////
						$this->logs_model->save_logs($log);		
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
			$this->form_validation->set_rules('id', 'ID', 'trim|required|callback_check_brand');   
		 
		   if($this->form_validation->run() == FALSE)	{

				//Notifications //////////////////////////////
				$notification['warning'][] = "Oops! There are items branded with the brand you wanted to delete. You can only delete a brand with no items"; //set message
				$this->sessnotif->setNotif($notification); //set notification

				//redirect
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

				
					//Save Logs/////////////////////////
					$this->logs_model->save_logs($log);		
					////////////////////////////////////
					
					//Notifications //////////////////////////////
					$notification['success'] = "Item Brand Deleted!"; //set message
					$this->sessnotif->setNotif($notification); //set notification

					//redirect
					redirect('brands', 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}



	/**
	 * Checks a Brand of there are existing items branded with it
	 * @param  [type] $brn [description]
	 * @return [type]      [description]
	 */
	function check_brand($brn) {
		$brand_id = $this->encryption->decrypt($brn);

		$brand = $this->brand_model->view($brand_id);

		if($this->brand_model->count_inventory($brand['title'])) {

			//Notifications //////////////////////////////
			$notification['warning'][] = "Oops! There are items branded with the brand you wanted to delete. You can only delete a brand with no items"; //set message

			$this->sessnotif->setNotif($notification); //set notification

			//return
			return FALSE; 
		} else {
			return TRUE;
		}

	}





}
