<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

$pagination = array(
				'per_page' => 10,
				'use_page_numbers' => 'TRUE', 
				'full_tag_open' => '<ul class="pagination normal">',
				'full_tag_close' => '</ul>',
				'num_tag_open' => '<li class="paginate_button">',
				'num_tag_close' => '</li>',
				'cur_tag_open' => '<li class="paginate_button active"><a>',
				'cur_tag_close' => '</a></li>',
				'prev_tag_open' => '<li id="DataTables_Table_0_prev" class="paginate_button prev">',
				'prev_tag_close' => '</li>',
				'next_tag_open' => '<li id="DataTables_Table_0_next" class="paginate_button next">',
				'last_tag_close' => '</li>',
				'last_tag_open' => '<li id="DataTables_Table_0_next" class="paginate_button next last">',
				'last_tag_close' => '</li>',
				'first_tag_open' => '<li id="DataTables_Table_0_next" class="paginate_button prev first">',
				'first_tag_close' => '</li>',				
				'prev_link'=> 'Previous',
				'next_link' => 'Next',
				'first_link'=> 'First',
				'last_link'=> 'Last'
		);

$config['back_pagination'] = $pagination;
$config['front_pagination'] = $pagination;
							
$config['admin_page_per_limit'] = 10;
$config['front_page_per_limit'] = 10;

$config['site_name'] = SITE_NAME;
$config['logo'] = "assets/images/w_logo.png";
$config['logo_mail'] = "assets/site/images/logo-mail.png";
$config['order_logo_mail'] = "assets/site/images/logo-mail-1.png";

$config['noreply_email'] = "noreply@infomedia.com";
$config['email_date_format'] = 'd-m-Y h:i A';
$config['admin_date_format'] = 'd-m-Y';
$config['front_date_format'] = 'm-d-Y';

$cis=& get_instance();
$config['bulkactions'] = array(''=>'Select Action','1'=>'Active','2'=>'Inactive','3'=>'Delete');
if($cis->uri->segment(3)=="active") {
	unset($config['bulkactions'][1]);
} else if ($cis->uri->segment(3)=="inactive") {
	unset($config['bulkactions'][2]);
}else if ($cis->uri->segment(3)=="delete") {
	unset($config['bulkactions'][3]);
}

$config['admin_resetpassword_url']	= $this->config['base_url'].SITE_ADMIN_URI.'/resetpassword/';
$config['site_resetpassword_url']	= $this->config['base_url'].'reset_password?ref=';
$config['site_user_activate_url']	= $this->config['base_url'].'home/useractive/';
$config['download_materials']	= $this->config['base_url'].'appdata/attachments/';

$config['subscription'] = array('1'=>'Subscribed','2'=>'Not Subscribed');

//General
$config['cur_symbol'] = "$";
$config['dollar_symbol'] = "<i class='fa fa-dollar'></i>"; // modified
$config['doc_icon'] = 'appdata/general/doc-icon.png';

//Paths
$config['ad_img'] = FCPATH.'appdata/ads/';
$config['banner_img'] = FCPATH.'appdata/banners/';
$config['blog_img'] = FCPATH.'appdata/blogs/';
$config['course_img'] = FCPATH.'appdata/courses/';
$config['cs_handbook_path'] = 'appdata/settings/';
$config['profile_image'] = 'appdata/profile_image/';
$config['settings_img'] = 'appdata/settings/';


/** Meta Data **/
$config['meta_keywords'] = 'USMLE step 2 cs, First Aid Usmle step 2 cs, Step 2 cs patient note, Ecfmg step 2 cs, step 2 cs video tips';
$config['meta_description'] = 'Want to know more about USMLE Step 2 CS then Target Usmle will be the right choice to move your carrier forward in United States Medical Licensing Exam.';


/** Uploaded File Path **/
$config["file_path"]	= array("tmp_csv_path" => "appdata/tmp/");

$config['payment_status'] = array('1'=>'Online','2'=>'Offline');

$config['notification_type'] = array('timeslot_booking' => 1,'timeslot_request_with_date' => 2, 'timeslot_request_without_date' => 3);

$config['know_about_us'] = array(''=>'- - How you know us *- -','1'=>'Facebook','2'=>'You tube','3'=>'Google Ads','4'=>'Forum','6'=>'LinkedIn','7'=>'Google Search','8'=>'Email','9'=>'Friends','10'=>'Skype','5'=>'Other');

$config['paypal_live_url'] = "https://www.paypal.com/cgi-bin/webscr";
$config['paypal_sandbox_url'] = "https://www.sandbox.paypal.com/cgi-bin/webscr";
									
								















