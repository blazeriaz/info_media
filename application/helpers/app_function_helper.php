<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if ( !function_exists('generate_token')) {
	function generate_token($user_id) {
		if($user_id) return md5(uniqid($user_id, true));
		else return md5(uniqid(rand(), true)); 
	}
}


