<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

$route['default_controller'] = 'welcome';
$route['404_override'] = 'page_not_found/';
$route['translate_uri_dashes'] = TRUE;

// Admin

$route[SITE_ADMIN_URI] = 'admin/index';
$route[SITE_ADMIN_URI.'/logout'] = 'admin/logout';
$route[SITE_ADMIN_URI.'/forgotpassword'] = 'admin/forgot_password';
$route[SITE_ADMIN_URI.'/resetpassword/(:any)'] = 'admin/reset_password/$1';
$route[SITE_ADMIN_URI.'/changepassword'] = 'admin/change_password';
$route[SITE_ADMIN_URI.'/dashboard'] = 'admin/dashboard';
$route[SITE_ADMIN_URI.'/email_templates'] = 'admin/email_templates/index';
$route[SITE_ADMIN_URI.'/email_templates/(:num)'] = 'admin/email_templates/index/$1';
$route[SITE_ADMIN_URI.'/email_templates/edit/(:num)'] = 'admin/email_templates/edit/$1';

// Front End

// Web Services

$route['webservice/login'] = 'webservice/login/login';
$route['webservice/register'] = 'webservice/login/register';
$route['webservice/change-password'] = 'webservice/login/change_password';
$route['webservice/forgot-password'] = 'webservice/login/forgot_password';
$route['webservice/verify_reset_password'] = 'webservice/login/verify_reset_password';
$route['webservice/action_reset_password'] = 'webservice/login/action_reset_password';

$route['webservice/department'] = 'webservice/department/index';
$route['webservice/courses'] = 'webservice/courses/index';
$route['webservice/course_video'] = 'webservice/course_video/index';
$route['webservice/course-video/add-view-count'] = 'webservice/course_video/add_view_count';

$route['webservice/gallery'] = 'webservice/gallery/index';
$route['webservice/profile'] = 'webservice/profile/index';
$route['webservice/update_fcmt'] = 'webservice/profile/update_fcmt';
$route['webservice/profile-update'] = 'webservice/login/profile_update';

$route['webservice/new_help_support_query'] = 'webservice/help_and_support/new_help_support_query';
$route['webservice/help_and_support'] = 'webservice/help_and_support/index';

$route['webservice/notification'] = 'webservice/notification/index';

$route['webservice/device_token'] = 'webservice/login/device_token';
$route['webservice/dashboard'] = 'webservice/dashboard';
