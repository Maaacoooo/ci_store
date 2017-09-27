<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Requests extends CI_Controller {

	public function __construct()	{
		parent::__construct();		
       $this->load->model('item_model');
       $this->load->model('request_model');
       $this->load->model('user_model');
       $this->load->model('item_model');
	}	

	public function index()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Requests';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

			//Search 
			$search = NULL;
			if(isset($_GET['search'])) {
				$search = $_GET['search'];
			}
			//item view for !Administrator account
			$brand = NULL;
			if($data['user']['usertype'] != 'Administrator') {
				$brand = $data['user']['brand'];
			}

			//Status
			$status = NULL;	

			//Paginated data				            
	   		$config['num_links'] = 5;
			$config['base_url'] = base_url('/requests/index/');
			$config["total_rows"] = $this->request_model->count_requests($search, $brand, $status);
			$config['per_page'] = 20;				
			$this->load->config('pagination'); //LOAD PAGINATION CONFIG

			$this->pagination->initialize($config);
		    if($this->uri->segment(3)){
		       $page = ($this->uri->segment(3)) ;
		  	}	else 	{
		       $page = 1;		               
		    }

		    $data["results"] = $this->request_model->fetch_requests($config["per_page"], $page, $search, $brand, $status);
		    $str_links = $this->pagination->create_links();
		    $data["links"] = explode('&nbsp;',$str_links );

		    //ITEM NUMBERING
		    $data['per_page'] = $config['per_page'];
		    $data['page'] = $page;

		    //GET TOTAL RESULT
		    $data['total_result'] = $config["total_rows"];
		    //END PAGINATION		
		
			$this->load->view('requests/list', $data);

		
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
			$this->form_validation->set_rules('brand', 'Supplier', 'trim|required');    
			$this->form_validation->set_rules('remarks', 'Remarks', 'trim');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {
				$req_id = $this->request_model->create($userdata['username'], $this->input->post('brand')); //get export ID

				if($req_id) {					

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'request',
							'tag_id'	=> 	$req_id,
							'action' 	=> 	'Created Request'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
						
					$this->session->set_flashdata('success', 'Request Created!');
					redirect('requests/view/'.$req_id, 'refresh');
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

			$data['info']		= $this->request_model->view($id);

			
			//Validate if record exist
			 //IF NO ID OR NO RESULT, REDIRECT
				if(!$id || !$data['info']) {
					redirect('requests', 'refresh');
			}	

		
			//Validate Usertype
			if($data['user']['username'] == $data['info']['username']) {

				$data['items'] = $this->request_model->fetch_request_items($id);

				//Form Validation
				$this->form_validation->set_rules('id', 'ID', 'trim|required'); 
				$this->form_validation->set_rules('remarks', 'Remarks', 'trim');   

				if($this->form_validation->run() == FALSE)	{

					if ($data['info']['status'] == 1) {
						//Updatable
						$data['title']  = 'Verify Request #'.prettyID($data['info']['id']);						
						$this->load->view('requests/update', $data);						
					} else {
						//View
						$data['title'] = 'Request #'.prettyID($data['info']['id']);						
						$this->load->view('requests/view', $data);					
					}

				} else {	

					$key_id = $this->encryption->decrypt($this->input->post('id')); //ID of the row

					if($this->request_model->update($key_id)) {		

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'request',
							'tag_id'	=> 	$key_id,
							'action' 	=> 	'Updated Request Information'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
						
					
						$this->session->set_flashdata('success', 'Succes! Request Details Updated!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					} else {
						//failure
						$this->session->set_flashdata('error', 'Oops! Error occured!');
						redirect($_SERVER['HTTP_REFERER'], 'refresh');
					}			
					
				}	
			} elseif($data['user']['usertype'] == 'Administrator' || $data['user']['brand'] == $data['info']['brand']) {
				//View
				$data['items'] = $this->request_model->fetch_request_items($id);							
				$data['title'] = 'Request #'.prettyID($data['info']['id']);						
				$this->load->view('requests/view', $data);	

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

				$req_id = $this->encryption->decrypt($this->input->post('id'));				

				if($this->request_model->update_status($req_id, 2)) {

					$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'request',
							'tag_id'	=> 	$req_id,
							'action' 	=> 	'Verified Request'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////

					$this->session->set_flashdata('success', 'Request Verified!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}

	public function export()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('id', 'ID', 'trim|required'); 
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$req_id = $this->encryption->decrypt($this->input->post('id'));				

				if($this->request_model->update_status($req_id, 3)) {

					$export_id = $this->request_model->export($req_id, $user['username']);

					////////////////////////////

					$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'request',
							'tag_id'	=> 	$req_id,
							'action' 	=> 	'Request Accepted by' . $user['name']
							);

					$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'export',
							'tag_id'	=> 	$export_id,
							'action' 	=> 	'Export Queue created thru Request #'. prettyID($req_id)
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////


					$this->session->set_flashdata('success', 'Request Accepted!');
					redirect('exports/view/'.$export_id, 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}

	public function cancel()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('id', 'ID', 'trim|required'); 
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$req_id = $this->encryption->decrypt($this->input->post('id'));				

				if($this->request_model->update_status($req_id, 4)) {

					$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'request',
							'tag_id'	=> 	$req_id,
							'action' 	=> 	'Canceled Request'
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////

					$this->session->set_flashdata('success', 'Request Canceled!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
				}
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function autocomplete_items($req_id)		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record
		$brand = $this->request_model->view($req_id)['brand'];

		if($userdata)	{

			if (isset($_GET['term'])){
		      $q = strtolower($_GET['term']);
		      $result = $this->item_model->search($q, $brand);

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
				$req_id = $this->encryption->decrypt($this->input->post('id'));

				if($this->request_model->view_item($item, $req_id)) {

					$qty  = $this->request_model->view_item($item, $req_id)['qty']; //gets the value of the existing quantity
					$action = $this->request_model->update_item_qty($item, ($qty+1), $req_id, $user['username']); // existing qty + 1; update quantity

				} else {
					$action = $this->request_model->add_item($item, 1, $req_id); //ID of the row	
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

		$req_id = $this->encryption->decrypt($this->input->post('id'));
		$brand = $this->request_model->view($req_id)['brand'];

		if($this->item_model->view($item) && $this->item_model->view($item)['brand'] == $brand) {
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

				$req_id = $this->encryption->decrypt($this->input->post('exp_id'));				

				foreach ($this->input->post('id') as $key => $item) {
		                      
		            $qty   = $this->input->post('qty')[$key];        

		           	$this->request_model->update_item_qty($this->encryption->decrypt($item), $qty, $req_id);
             
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
