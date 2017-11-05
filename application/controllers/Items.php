<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Items extends CI_Controller {

	public function __construct()	{
		parent::__construct();		
       $this->load->model('user_model');
       $this->load->model('item_model');
       $this->load->model('brand_model');
       $this->load->model('inventory_model');
	}	

	public function index()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Item List';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

			//Fetch Data
			$data['brands']		= $this->item_model->fetch_brand();
			$data['units']		= $this->item_model->fetch_unit();
			$data['category']		= $this->item_model->fetch_category();

			//Search 
			$search = '';
			if(isset($_GET['search'])) {
				$search = $_GET['search'];
			}

			//item view for !Administrator account
			$brand = '';
			if($data['user']['usertype'] != 'Administrator') {
				$brand = $data['user']['brand'];
			}

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/items/index/');
			$config["total_rows"] = $this->item_model->count_items($search, $brand, 1);
			$config['per_page'] = 50;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->item_model->fetch_items($config["per_page"], $page, $search, $brand, 1);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			//Form Validation for user
			$this->form_validation->set_rules('name', 'Item Name', 'trim|required'); 
			$this->form_validation->set_rules('serial', 'Serial No', 'trim|is_unique[items.serial]'); 
			$this->form_validation->set_rules('category', 'Category', 'trim|required');  
			$this->form_validation->set_rules('unit', 'Unit', 'trim|required'); 			
			$this->form_validation->set_rules('desc', 'Description', 'trim'); 
			$this->form_validation->set_rules('srp', 'SRP', 'trim|decimal'); 
			$this->form_validation->set_rules('dp', 'DP', 'trim|decimal'); 

			if($data['user']['usertype'] == 'Administrator') {
				$this->form_validation->set_rules('brand', 'Brand', 'trim|required'); 				
			}
			

			if($this->form_validation->run() == FALSE)	{
					$this->load->view('items/list', $data);
				} else {	
					
					if($brand) {
						$act = $this->item_model->create($brand);
					} else {
						$act = $this->item_model->create($this->input->post('brand'), 1);
					}

					//Proceed saving user				
					if($act) {			

						$item_id = $act; //fetch last insert case Row ID
						// Save Log Data ///////////////////				

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'item',
							'tag_id'	=> 	$item_id,
							'action' 	=> 	'Product Registration'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
					
						$this->session->set_flashdata('success', 'Product Registered!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					} else {
						//failure
						$this->session->set_flashdata('error', 'Error occured!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					}		
			}
		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function inventory()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Item Inventory';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

			//Fetch Data
			$data['brands']		= $this->item_model->fetch_brand();
			$data['units']		= $this->item_model->fetch_unit();
			$data['category']		= $this->item_model->fetch_category();

			//Search 
			$search = '';
			if(isset($_GET['search'])) {
				$search = $_GET['search'];
			}

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/items/inventory/');
			$config["total_rows"] = $this->inventory_model->count_items($search);
			$config['per_page'] = 50;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->inventory_model->fetch_items($config["per_page"], $page, $search);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
			
			if($data['user']['usertype'] == 'Administrator') {
				$this->load->view('items/inventory', $data);
			} else {
				show_error('Oops! You do not have the privilege to view the content! Please contact the System Administrator', 403);
			}
				
		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}		
		

	}


	public function suggest()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Suggested New Items';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

			//Fetch Data
			$data['brands']		= $this->item_model->fetch_brand();
			$data['units']		= $this->item_model->fetch_unit();
			$data['category']		= $this->item_model->fetch_category();

			//Search 
			$search = '';
			if(isset($_GET['search'])) {
				$search = $_GET['search'];
			}

			//item view for !Administrator account
			$brand = '';
			if($data['user']['usertype'] != 'Administrator') {
				$brand = $data['user']['brand'];
			}

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/items/suggest/');
			$config["total_rows"] = $this->item_model->count_items($search, $brand, 0);
			$config['per_page'] = 50;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->item_model->fetch_items($config["per_page"], $page, $search, $brand, 0);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			//Form Validation for user
			$this->form_validation->set_rules('name', 'Item Name', 'trim|required'); 
			$this->form_validation->set_rules('serial', 'Serial No', 'trim|is_unique[items.serial]'); 
			$this->form_validation->set_rules('category', 'Category', 'trim|required');  
			$this->form_validation->set_rules('unit', 'Unit', 'trim|required'); 			
			$this->form_validation->set_rules('desc', 'Description', 'trim'); 
			$this->form_validation->set_rules('srp', 'SRP', 'trim|decimal'); 
			$this->form_validation->set_rules('dp', 'DP', 'trim|decimal'); 

			if($data['user']['usertype'] == 'Administrator') {
				$this->form_validation->set_rules('brand', 'Brand', 'trim|required'); 				
			}
			

			if($this->form_validation->run() == FALSE)	{

				if ($data['user']['usertype']=='Administrator') {					
					$this->load->view('items/suggest_approve', $data);
				} else {
					$this->load->view('items/suggest_list', $data);					
				}

				} else {	
					
					if($brand) {
						$act = $this->item_model->create($brand, 0);
					} else {
						$act = $this->item_model->create($this->input->post('brand'), 1);
					}

					//Proceed saving user				
					if($act) {			

						$item_id = $act; //fetch last insert case Row ID
						// Save Log Data ///////////////////				

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'item',
							'tag_id'	=> 	$item_id,
							'action' 	=> 	'Product Suggestion'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
					
						$this->session->set_flashdata('success', 'Product Registered!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					} else {
						//failure
						$this->session->set_flashdata('error', 'Error occured!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					}		
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
			$data['brands']		= $this->item_model->fetch_brand();
			$data['units']		= $this->item_model->fetch_unit();
			$data['category']		= $this->item_model->fetch_category();			
			$data['inventory']		= $this->item_model->fetch_item_inventory($id);			

			$data['info']		= $this->item_model->view($id);
			$data['title'] 		= $data['info']['name'];
			

			//item view for !Administrator account
			$brand = '';
			if($data['user']['usertype'] != 'Administrator') {
				$brand = $data['user']['brand'];
			}


			//Validate if record exist
			 //IF NO ID OR NO RESULT, REDIRECT
				if(!$id || !$data['info'] || $data['info']['is_deleted']) {
					redirect('items', 'refresh');
			}	

			//Form Validation
			$this->form_validation->set_rules('id', 'ID', 'trim|required'); 
			$this->form_validation->set_rules('name', 'Item Name', 'trim|required'); 
			$this->form_validation->set_rules('serial', 'Serial No', 'trim|callback_check_serial'); 
			$this->form_validation->set_rules('category', 'Category', 'trim|required'); 
			$this->form_validation->set_rules('unit', 'Unit', 'trim|required'); 
			$this->form_validation->set_rules('srp', 'SRP', 'trim|decimal'); 
			$this->form_validation->set_rules('dp', 'DP', 'trim|decimal'); 
			$this->form_validation->set_rules('desc', 'Description', 'trim'); 
			
			if($data['user']['usertype'] == 'Administrator') {
				$this->form_validation->set_rules('brand', 'Brand', 'trim|required'); 				
			}
		
			//Validate Usertype
			if($data['user']['usertype'] == 'Administrator' || $data['user']['brand'] == $data['info']['brand']) {
				if($this->form_validation->run() == FALSE)	{
					//Check URI Request 
					if($this->uri->segment(4) == 'barcode') {
						$this->load->view('items/print_barcode', $data);						
					} elseif($this->uri->segment(4) == 'batch') {
						//Batch View
						$batch_id 			= $this->uri->segment(5);
						$data['batch']		= $this->inventory_model->view_item($batch_id, NULL);
						$data['logs']		= $this->logs_model->fetch_logs('inventory', $batch_id, 50);
						$this->load->view('items/batch_view', $data);

					} elseif(!$this->uri->segment(4)) {
						//Item View
						//Admin
						if ($data['user']['usertype'] == 'Administrator') {
							$data['logs']		= $this->logs_model->fetch_logs('item', $id, 50);
							$this->load->view('items/view', $data);
						} else {
							$data['exports'] = $this->item_model->fetch_exports($id);
							$this->load->view('items/supplier_view', $data);
						}
						
					} else {
						show_404();
					}
				} else {	

					//Proceed saving candidate				
					$key_id = $this->encryption->decrypt($this->input->post('id')); //ID of the row

					if($brand) {
						$act = $this->item_model->update($key_id, $brand);
					} else {
						$act = $this->item_model->update($key_id, $this->input->post('brand'));
					}	

					if($act) {		

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'item',
							'tag_id'	=> 	$key_id,
							'action' 	=> 	'Updated Item Information'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
						
					
						$this->session->set_flashdata('success', 'Succes! Item Updated!');
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


	public function accept_suggest()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{
			
				//FORM VALIDATION
				$this->form_validation->set_rules('item_id[]', 'ID', 'trim|required'); 
			 
			   if($this->form_validation->run() == FALSE)	{

					$this->session->set_flashdata('error', 'An Error has Occured!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');

				} else {
					
					foreach ($this->input->post('item_id') as $key => $value) {
						$this->item_model->approve_suggest($value);

						//save logs
						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'item',
							'tag_id'	=> 	$value,
							'action' 	=> 	'Suggested Item Approved'
						);
					}

					//Save log loop
					foreach($log as $lg) {
						$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
					}	
					$this->session->set_flashdata('success', 'Items Accepted');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
				}
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

		

	}


	/**
	 * Checks the Serial of the Item. Returns True if Serial Exist from another Record
	 * @param  [type] $item [description]
	 * @return [type]       [description]
	 */
	function check_serial($serial) {


		if($serial) {
			$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
			$item = $this->encryption->decrypt($this->input->post('id')); 

			if($this->item_model->check_serial($item, $serial)) {
				$this->form_validation->set_message('check_serial', 'Serial is Registered from another Item!');		
				return FALSE;
			} else {
				return TRUE;
			}
		} else {
			return TRUE;
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

				if($this->item_model->delete($key_id)) {

					$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'item',
							'tag_id'	=> 	$key_id,
							'action' 	=> 	'Deleted Item'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
					$this->session->set_flashdata('success', 'Item Deleted!');
					redirect('items', 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}



	public function print_total_inventory()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['site_title'] = APP_NAME;
			$data['user'] = $this->user_model->userdetails($userdata['username']); //fetches users record

			//Page Data 
			$data['items']		= $this->inventory_model->fetch_items(NULL, NULL, NULL, NULL);
			$data['total_items'] = $this->inventory_model->count_items(NULL, NULL);
			$data['title'] 		= 'Total Inventory Report';

		
			//Validate Usertype
			if($data['user']['usertype'] == 'Administrator') {
				
				$this->load->view('items/print_total_inventory', $data);
				
			} else {
				show_error('Oops! Your account does not have the privilege to view the content. Please Contact the Administrator', 403, 'Access Denied!');				
			}		

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}



	public function rebatch()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('id', 'ID', 'trim|required');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$key_id = $this->encryption->decrypt($this->input->post('id')); //ID of the row				
				$batch 	= $this->inventory_model->view_item($key_id, NULL); 
				$qty 	= $this->input->post('qty'); 
				$srp 	= $this->input->post('srp'); 
				$dp 	= $this->input->post('dp'); 

				//Subract inventory from current batch
				$this->inventory_model->add_inventory($batch['item_id'], ($qty*-1), $batch['location'], $batch['srp'], $batch['dp']);
				//Add inventory to new batch
				$new_batch = $this->inventory_model->add_inventory($batch['item_id'], ($qty), $batch['location'], $srp, $dp);
				

				$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'inventory',
							'tag_id'	=> 	$key_id,
							'action' 	=> 	'Rebatched ' . $qty . ' items to Batch ' . $new_batch
							);

				$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'inventory',
							'tag_id'	=> 	$new_batch,
							'action' 	=> 	'Rebatched ' . $qty . ' items from Batch ' . $key_id
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
					$this->session->set_flashdata('success', 'Successfully Rebatched!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
				
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}





}
