<?php
defined('BASEPATH') OR exit('No direct script access allowed');


/**
* 
*/
class SessNotif 
{
	protected $CI;
	
	function __construct()
	{
		$this->CI =& get_instance();
	}

	function setNotif($notif) {
		
	}

	function test() {
		return base_url();
	}
}