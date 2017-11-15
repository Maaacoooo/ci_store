<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Command extends CI_Controller {

	public function __construct()	{
		parent::__construct();		
       $this->load->model('user_model');
	}	

	public function show_userlogs($user = NULL) {

		if(is_cli()) {
			$log_data = $this->logs_model->fetch_user_logs($user, NULL);

			foreach ($log_data as $lg) {
			    $logs[] = (explode(';', (implode(";", $lg))));
			}

			//var_dump($logs);
			echo magictable($logs);
		} else {
			show_error("You are unauthorized to access this page!", 401);
		}
	} 


	public function test() {
		echo $this->input->method();
	}


}