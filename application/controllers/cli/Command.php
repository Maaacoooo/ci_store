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

		$this->load->library('magictable');
		$log_data = $this->logs_model->fetch_user_logs(NULL, NULL);


		foreach ($log_data as $lg) {
		        	$logs[] = (explode(';', (implode(';', $lg))));
		        }
	   $header = array('ID', 'USERNAME', 'TAG', 'TAG_ID', 'ACTION', 'IP ADDRESS', 'DATE | TIME');
       echo $this->magictable->maketable($header, $logs);

	

	}

	public function test2() {

		$this->load->library('magictable');		

		$logs = array(
			array('bbbb', 'cool', 'awesomeee', 'akjsdaksdkashdjkashdjkhasjkdhd', 'WOOPP'),
			array('bbbb', 'cool', 'awesomeee', 'akjsdaksdkashdjkashdjkhasjkdhd', 'WOOPP')
		);
       echo $this->magictable->maketable(NULL, $logs);
       
       echo "\n\nRendered in " . $this->benchmark->elapsed_time('code_start', 'code_end') . 's';
	

	}


}