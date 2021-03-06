<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Exports extends CI_Controller {

	public function __construct()	{
		parent::__construct();		
       $this->load->model('item_model');
       $this->load->model('export_model');
       $this->load->model('user_model');
	}	

	public function index()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Exports';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

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

			//Status
			$status = '';	

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/exports/index/');
			$config["total_rows"] = $this->export_model->count_exports($search, $brand, $status);
			$config['per_page'] = 20;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->export_model->fetch_exports($config["per_page"], $page, $search, $brand, $status);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			$this->load->view('exports/list', $data);

		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}

	public function pending()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Pending Exports';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

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

			//Status
			$status = 1;	

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/exports/pending/');
			$config["total_rows"] = $this->export_model->count_exports($search, $brand, $status);
			$config['per_page'] = 20;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->export_model->fetch_exports($config["per_page"], $page, $search, $brand, $status);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			$this->load->view('exports/list', $data);

		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function in_transit()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'In-Transit Exports';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

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

			//Status
			$status = 2;	

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/exports/in_transit/');
			$config["total_rows"] = $this->export_model->count_exports($search, $brand, $status);
			$config['per_page'] = 20;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->export_model->fetch_exports($config["per_page"], $page, $search, $brand, $status);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			$this->load->view('exports/list', $data);

		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}

	public function received()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Received Exports';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

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

			//Status
			$status = 3;	

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/exports/received/');
			$config["total_rows"] = $this->export_model->count_exports($search, $brand, $status);
			$config['per_page'] = 20;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->export_model->fetch_exports($config["per_page"], $page, $search, $brand, $status);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			$this->load->view('exports/list', $data);

		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}

	public function create()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('courier', 'Courier', 'trim');   
			$this->form_validation->set_rules('track', 'Tracking No.', 'trim');   
			$this->form_validation->set_rules('remarks', 'Remarks', 'trim');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {
				$export_id = $this->export_model->create($userdata['username'], $user['brand']); //get export ID

				if($export_id) {					
					$this->session->set_flashdata('success', 'Export ready for verification');
					redirect('exports/view/'.$export_id, 'refresh');
				} else {
					$this->session->set_flashdata('error', 'An Error has Occured! Check items and inputs.');
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

			$data['info']		= $this->export_model->view($id);

			
			//Validate if record exist
			 //IF NO ID OR NO RESULT, REDIRECT
				if(!$id || !$data['info']) {
					redirect('exports', 'refresh');
			}	

		
			//Validate Usertype
			if($data['user']['username'] == $data['info']['username']) {

				$data['items'] = $this->export_model->fetch_export_items($id, $data['user']['username']);

				//Form Validation
				$this->form_validation->set_rules('id', 'ID', 'trim|required'); 
				$this->form_validation->set_rules('courier', 'Courier', 'trim');   
				$this->form_validation->set_rules('track', 'Tracking No.', 'trim');   
				$this->form_validation->set_rules('remarks', 'Remarks', 'trim');   

				if($this->form_validation->run() == FALSE)	{

					if ($data['info']['status'] == 1) {
						//Updatable
						$data['title'] = 'Verify Export #'.prettyID($data['info']['id']);						
						$this->load->view('exports/update', $data);						
					} else {
						//View
						$data['title'] = 'Export #'.prettyID($data['info']['id']);						
						$this->load->view('exports/view', $data);					
					}

				} else {	

					$key_id = $this->encryption->decrypt($this->input->post('id')); //ID of the row

					if($this->export_model->update($key_id)) {		

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'export',
							'tag_id'	=> 	$key_id,
							'action' 	=> 	'Updated Export Information'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
						
					
						$this->session->set_flashdata('success', 'Succes! Export Details Updated!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					} else {
						//failure
						$this->session->set_flashdata('error', 'Oops! Error occured!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					}			
					
				}	
			} elseif($data['user']['usertype'] == 'Administrator') {
				//View
				$data['items'] = $this->export_model->fetch_export_items($id, $data['info']['username']);				
				$data['title'] = 'Export #'.prettyID($data['info']['id']);						
				$this->load->view('exports/view', $data);	

			} else {
				show_error('Oops! Your account does not have the privilege to view the content. Please Contact the Administrator', 403, 'Access Denied!');				
			}		

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function verify()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('id', 'ID', 'trim|required'); 
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$export_id = $this->encryption->decrypt($this->input->post('id'));				

				if($this->export_model->verify($export_id)) {

					$this->session->set_flashdata('success', 'Export Verified!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function autocomplete_items()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{

			if (isset($_GET['term'])){
		      $q = strtolower($_GET['term']);
		      $result = $this->item_model->search($q, $user['brand']);

		      foreach($result as $row) {
		      	$new_row['label']=htmlentities(stripslashes($row['name'] . '(' . $row['unit'].')'));
	            $new_row['value']=htmlentities(stripslashes($row['id']));
	            $row_set[] = $new_row; //build an array
	          }
	          echo json_encode($row_set); //format the array into json data     
		    }				


		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function add_item()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('item', 'Item', 'trim|required|callback_check_item');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$item = $this->item_model->view($this->input->post('item'))['id'];
				$export_id = $this->encryption->decrypt($this->input->post('id'));

				if($this->export_model->view_item($item, $export_id, $user['username'])) {

					$qty  = $this->export_model->view_item($item, $export_id, $user['username'])['qty']; //gets the value of the existing quantity
					$action = $this->export_model->update_item_qty($item, ($qty+1), $export_id, $user['username']); // existing qty + 1; update quantity

				} else {
					$action = $this->export_model->add_item($item, 1, '', $user['username']); //ID of the row	
				}
							

				if($action) {

					$this->session->set_flashdata('success', 'Item Added to Cart!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	/**
	 * Checks if ITEM Exist
	 * @param  [type] $item [description]
	 * @return [type]       [description]
	 */
	function check_item($item) {

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($this->item_model->view($item) && $this->item_model->view($item)['brand'] == $user['brand']) {
			return TRUE;
		} else {
			$this->form_validation->set_message('check_item', 'No Item Record Found!');		
			return FALSE;
		}
	}


	public function update_items() {

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('id[]', 'ID', 'trim|required');     
			$this->form_validation->set_rules('qty[]', 'Quantity', 'trim|required');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$export_id = $this->encryption->decrypt($this->input->post('exp_id'));				

				foreach ($this->input->post('id') as $key => $item) {
		                      
		            $qty   = $this->input->post('qty')[$key];        

		           	$this->export_model->update_item_qty($this->encryption->decrypt($item), $qty, $export_id, $userdata['username']);
             
		        }		
		        
					$this->session->set_flashdata('success', 'Items Updated!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
					
				
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}
		
	}



}
