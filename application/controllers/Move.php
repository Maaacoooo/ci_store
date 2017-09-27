<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Move extends CI_Controller {

	public function __construct()	{
		parent::__construct();		
       $this->load->model('item_model');
       $this->load->model('location_model');
       $this->load->model('move_model');
       $this->load->model('import_model');
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


	public function create()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record

		if($userdata)	{
			
			//FORM VALIDATION
			$this->form_validation->set_rules('id', 'ID', 'trim|required');   
			$this->form_validation->set_rules('destination', 'Destination', 'trim|required');   
			$this->form_validation->set_rules('remarks', 'Remarks', 'trim');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$id = $this->encryption->decrypt($this->input->post('id'));
				$location_from = $this->location_model->view($id)['title']; //fetch the location title

				if($this->input->post('destination')) {
					$location_to = $this->input->post('destination');
				} else {
					$location_to = NULL;
				}

				$move_id = $this->move_model->create($userdata['username'], $location_from, $location_to, $id); //get export ID

				if($move_id) {				

					$items = $this->move_model->fetch_move_items(NULL, NULL, $move_id); //fetch all items in the Move Items

					if($this->input->post('destination')) {
						foreach ($items as $i) {
							$this->import_model->add_inventory($i['item_id'], $i['qty'], 'move', $move_id, $location_to); // add to actual inventory to destination
							$this->import_model->add_inventory($i['item_id'], (($i['qty'])*-1), 'move', $move_id, $location_from); // remove item from actual inventory from
						}
					} else {
						foreach ($items as $i) {
							$this->import_model->add_inventory($i['item_id'], (($i['qty'])*-1), 'move', $move_id, $location_from); // remove item from actual inventory from
						}
					}

					$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'location',
							'tag_id'	=> 	$id,
							'action' 	=> 	'Moved items to ' . $location_to . ' - MOVE #'.prettyID($move_id)
					);

				
					//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
					////////////////////////////////////
					
					$this->session->set_flashdata('success', 'Items Moved!');
					redirect('move/view/'.$move_id, 'refresh');
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
					redirect('move', 'refresh');
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



	public function autocomplete_items($id)		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata
		$user = $this->user_model->userdetails($userdata['username']); //fetches users record
		$location = $this->location_model->view($id);

		if($userdata)	{

			if (isset($_GET['term'])){
		      $q = strtolower($_GET['term']);
		      $result = $this->move_model->autocomplete_items($q, $location['title']);

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
				$this->session->set_flashdata('loc_item', '1');				

				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$item = $this->item_model->view($this->input->post('item'))['id'];
				$location_id = $this->encryption->decrypt($this->input->post('id'));

				if($this->move_model->view_item($item, $location_id, $user['username'])) {

					$qty  = $this->move_model->view_item($item, $location_id, $user['username'])['qty']; //gets the value of the existing quantity
					$action = $this->move_model->update_item_qty($item, ($qty+1), $location_id, $user['username']); // existing qty + 1; update quantity

				} else {
					$action = $this->move_model->add_item($item, 1, $location_id, $user['username']); //ID of the row	
				}
							

				if($action) {

					$this->session->set_flashdata('success', 'Item Added to Cart!');
					$this->session->set_flashdata('loc_item', '1');					
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
		$id = $this->encryption->decrypt($this->input->post('id'));
		$location = $this->location_model->view($id);

		if($this->item_model->view($item) && $this->move_model->check_item($item, $location['title'])) {
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
				$this->session->set_flashdata('loc_item', '1');				
				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$loc_id = $this->encryption->decrypt($this->input->post('loc_id'));				

				foreach ($this->input->post('id') as $key => $item) {
		                      
		            $qty   = $this->input->post('qty')[$key];        

		           	$this->move_model->update_item_qty($this->encryption->decrypt($item), $qty, $loc_id, 0, $userdata['username']);
             
		        }		
					$this->session->set_flashdata('loc_item', '1');				
					$this->session->set_flashdata('success', 'Items Updated!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
					
				
			}

		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}
		
	}



}
