<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sales extends CI_Controller {

	public function __construct()	{
		parent::__construct();		
       $this->load->model('user_model');
       $this->load->model('item_model');
       $this->load->model('location_model');
       $this->load->model('sales_model');
	}	

	public function test() {
$number = 123;
$txt = sprintf("%1\$.2f",$number);
echo $txt;
	}



	public function index()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Sales';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

			//Access Control
			if($data['user']['usertype'] == 'Administrator') {
				//Search 
				$search = '';
				if(isset($_GET['search'])) {
					$search = $_GET['search'];
				}	

				//Search Date
				$date = '';
				if(isset($_GET['date'])) {
					$date = $_GET['date'];
				}	

				//Paginated data				            
		   		$config['num_links'] = 5;
				$config['base_url'] = base_url('/sales/index/');
				$config["total_rows"] = $this->sales_model->count_sales($search, $date);
				$config['per_page'] = 20;				
				$this->load->config('pagination'); //LOAD PAGINATION CONFIG

				$this->pagination->initialize($config);
			    if($this->uri->segment(3)){
			       $page = ($this->uri->segment(3)) ;
			  	}	else 	{
			       $page = 1;		               
			    }

			    $data["results"] = $this->sales_model->fetch_sales($config["per_page"], $page, $search, $date);
			    $str_links = $this->pagination->create_links();
			    $data["links"] = explode('&nbsp;',$str_links );

			    //ITEM NUMBERING
			    $data['per_page'] = $config['per_page'];
			    $data['page'] = $page;

			    //GET TOTAL RESULT
			    $data['total_result'] = $config["total_rows"];
			    //END PAGINATION
			
				$this->load->view('sales/list', $data);
				
			} else {
				show_error('Oops! Your account does not have the privilege to view the content. Please Contact the Administrator', 403, 'Access Denied!');				
			}

		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function print_report()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record

			//Access Control
			if($data['user']['usertype'] == 'Administrator') {
				//Search 
			
				//Search Date
				$date = '';
				if(isset($_GET['date'])) {
					$date = $_GET['date'];
				}	

				$data['title'] 		= 'Summary Sales Report -' . $date;


				$config["total_rows"] = $this->sales_model->count_sales('', $date);
			    $data["results"] = $this->sales_model->fetch_sales(0, 0, '', $date);

			    //GET TOTAL RESULT
			    $data['total_result'] = $config["total_rows"];
			    //END PAGINATION
			
				$this->load->view('sales/print', $data);
				
			} else {
				show_error('Oops! Your account does not have the privilege to view the content. Please Contact the Administrator', 403, 'Access Denied!');				
			}

		
		} else {

			$this->session->set_flashdata('error', 'You need to login!');
			redirect('dashboard/login', 'refresh');
		}

	}


	public function create()		{

		$userdata = $this->session->userdata('admin_logged_in'); //it's pretty clear it's a userdata

		if($userdata)	{

			$data['title'] 		= 'Sales Register';
			$data['site_title'] = APP_NAME;
			$data['user'] 		= $this->user_model->userdetails($userdata['username']); //fetches users record
			$data['items'] 		= $this->sales_model->fetch_sale_items(0, $data['user']['username']);
			$data['locations']  = $this->location_model->fetch_locations(0, 0, 0);
		
			//Form Validation for user
			$this->form_validation->set_rules('customer', 'Customer Name', 'trim|required'); 
			$this->form_validation->set_rules('location', 'Location', 'trim|required'); 
			$this->form_validation->set_rules('remarks', 'Remarks', 'trim'); 
			$this->form_validation->set_rules('amt_tendered', 'Amount Tendered', 'trim|required|decimal'); 

			//Validate Usertype
			if($data['user']['usertype'] == 'Administrator') {

				if($this->form_validation->run() == FALSE)	{
					$this->load->view('sales/create', $data);
				} else {	
					
					$sale_id = $this->sales_model->create($userdata['username']);

					//Proceed saving sale				
					if($sale_id) {			

						// Save Log Data ///////////////////				

						$log[] = array(
							'user' 		=> 	$userdata['username'],
							'tag' 		=> 	'sale',
							'tag_id'	=> 	$sale_id,
							'action' 	=> 	'Purchased by ' . $this->input->post('customer')
							);

				
						//Save log loop
						foreach($log as $lg) {
							$this->logs_model->create_log($lg['user'], $lg['tag'], $lg['tag_id'], $lg['action']);				
						}		
						////////////////////////////////////
					
						$this->session->set_flashdata('success', 'Purchase Success!');
						redirect('sales/view/'.$sale_id, 'refresh');
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

			$data['info']		= $this->sales_model->view($id);
			$data['title']		= 'Sale #' . prettyID($data['info']['id']);
			$data['items'] 		= $this->sales_model->fetch_sale_items($id, NULL);

		
			//Validate Usertype
			if($data['user']['usertype'] == 'Administrator') {

				//Check URI Request 
				if($this->uri->segment(4) == 'barcode') {
					$this->load->view('sales/print_barcode', $data);						
				} elseif(!$this->uri->segment(4)) {
					$this->load->view('sales/view', $data);
				} else {
					show_404();
				}		

					
			} else {
				show_error('Oops! Your account does not have the privilege to view the content. Please Contact the Administrator', 403, 'Access Denied!');				
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

				$item = $this->item_model->view($this->input->post('item'));
				$sale_id = $this->encryption->decrypt($this->input->post('id'));

				if($this->sales_model->view_item($item['id'], $sale_id, $user['username'])) {

					$qty  = $this->sales_model->view_item($item['id'], $sale_id, $user['username'])['qty']; //gets the value of the existing quantity
					$action = $this->sales_model->update_item_qty($item['id'], ($qty+1), NULL, $sale_id, $user['username']); // existing qty + 1; update quantity

				} else {
					$action = $this->sales_model->add_item($item['id'], 1, $sale_id, $item['SRP'], $user['username']); //ID of the row	
				}
							

				if($action) {

					$this->session->set_flashdata('success', 'Item Added!');
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

		if($this->item_model->view($item)) {
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
			$this->form_validation->set_rules('disc[]', 'Discounts', 'trim');   
		 
		   if($this->form_validation->run() == FALSE)	{

				$this->session->set_flashdata('error', 'An Error has Occured!');
				redirect($_SERVER['HTTP_REFERER'], 'refresh');

			} else {

				$sale_id = $this->encryption->decrypt($this->input->post('sale_id'));				

				foreach ($this->input->post('id') as $key => $item) {
		                      
		            $qty   = $this->input->post('qty')[$key];        
		            $disc   = $this->input->post('disc')[$key];        

		           	$this->sales_model->update_item_qty($this->encryption->decrypt($item), $qty, $disc, $sale_id, $userdata['username']);
             
		        }		
		        
					$this->session->set_flashdata('success', 'Items Updated!');
					redirect($_SERVER['HTTP_REFERER'], 'refresh');
					
				
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
		      $result = $this->item_model->search($q, NULL);

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








}
