 <!-- Main Content -->
<div class="container-fluid">
    <div class="side-body">
	<div class="page-title"></div>
		<div class="row">
			<div class="col-xs-12">
				<div class="card custom-card">
					<div class="card-header">
						<div class="card-title">
							<div class="title"><?php echo 'Edit User'  ?></div>
						</div>
						<div class="back pull-right">
							<a href="<?php echo SITE_URL().SITE_ADMIN_URI;?>/users" title="Back">Back</a>
						</div>
                    </div>
                    <div class="card-body">
                    	<?php if(isset($upload_error)&&$upload_error){ ?>
						<div class="alert alert-danger" role="alert">
							 <strong>Warning!</strong> <?php echo $upload_error; ?>
						</div>
						<?php } ?>
                		<!-- Flash Message -->
						<?php if($this->session->flashdata('flash_failure_message')){ ?>
						<div class="alert alert-danger" role="alert">
							<strong>Warning!</strong> <?php echo $this->session->flashdata('flash_failure_message'); ?>
							<?php $this->session->unmark_flash('flash_failure_message'); ?>
						</div> 
						<?php } if($this->session->flashdata('flash_success_message')){ ?>
						<div class="alert alert-success" role="alert">
							<strong>Done!</strong> <?php echo $this->session->flashdata('flash_success_message'); ?>
							<?php $this->session->unmark_flash('flash_success_message'); ?>
						</div> 
						<?php } ?>
                		<?php $attributes = array('class' => 'form-horizontal','id' => 'edit_new_user');				
						
						echo form_open_multipart(base_url().SITE_ADMIN_URI.'/users/edit/'.$id, $attributes); 
						?>
						
						
							
							<div class="form-group">
                            	<?php echo form_label('First Name <span class="required">*</span>','first_name',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php
									if($this->input->post('first_name')){ $f_name = $this->input->post('first_name'); }else if($users['first_name']){ $f_name = $users['first_name']; }else{ $f_name =''; }
									echo form_input('first_name', $f_name,'placeholder= "First Name" class="form-control alphaOnly" id="first_name"'); 
                   					if(form_error('first_name')) echo form_label(form_error('first_name'), 'first_name', array("id"=>"first_name-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Last Name <span class="required">*</span>','last_name',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									if($this->input->post('last_name')){ $l_name = $this->input->post('last_name'); }else if($users['last_name']){ $l_name = $users['last_name']; }else{ $l_name =''; }
									echo form_input('last_name',$l_name,'placeholder= "Last Name" class="form-control alphaOnly" id="last_name"');
									if(form_error('last_name')) echo form_label(form_error('last_name'), 'last_name', array("id"=>"last_name-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php 
								if($this->input->post('email_id')){ $email_id = $this->input->post('email_id'); }else if($users['email_id']){ $email_id = $users['email_id']; }else{ $email_id =''; }
								echo form_label('Email ID <span class="required">*</span>','email_id',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('email_id',$email_id,'placeholder= "example@gmail.com" class="form-control" id="email_id"'); 
                   					if(form_error('email_id')) echo form_label(form_error('email_id'), 'email_id', array("id"=>"email_id-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Skype ID <span class="required">*</span>','skype_id',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php
									if($this->input->post('skype_id')){ $skype_id = $this->input->post('skype_id'); }else if($users['skype_id']){ $skype_id = $users['skype_id']; }else{ $email_id =''; }
									echo form_input('skype_id',$skype_id,'placeholder= "skype id" class="form-control" id="skype_id"'); 
                   					if(form_error('skype_id')) echo form_label(form_error('skype_id'), 'skype_id', array("id"=>"skype_id-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Contact Number <span class="required">*</span>','phone_no',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php
									if($this->input->post('phone_no')){ $phone_no = $this->input->post('phone_no'); }else if($users['phone_no']){ $phone_no = $users['phone_no']; }else{ $phone_no =''; }
									echo form_input('phone_no',$phone_no,'placeholder= "Contact Number" class="form-control phoneOnly" id="phone_no"'); 
                   					if(form_error('phone_no')) echo form_label(form_error('phone_no'), 'phone_no', array("id"=>"phone_no-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
														
							<div class="form-group">
								<?php echo form_label('How do you know <span class="required">*</span>','know_about_us',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									if($this->input->post('know_about_us')){ $know_about_us = $this->input->post('know_about_us'); }else if($users['know_about_us']){ $know_about_us = $users['know_about_us']; }else{ $know_about_us =''; }
									$js = 'id="know_about_us" class="form-control"';
									echo form_dropdown('know_about_us', $options, $know_about_us, $js);
									if(form_error('know_about_us')) echo form_label(form_error('know_about_us'), 'know_about_us',array("id"=>"know_about_us-error" , "class"=>"error")); ?>
								</div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Address','address',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php
									if($this->input->post('address')){ $address = $this->input->post('address'); }else if($users['address']){ $address = $users['address']; }else{ $address =''; }
									echo form_textarea('address',$address,'class="form-control" id="address"'); 
                   					if(form_error('address')) echo form_label(form_error('address'), 'address', array("id"=>"address-error" , "class"=>"error")); ?>
                                </div>
							</div>
							<div class="form-group">
    		                    <?php echo form_label('Have you taken Step 1 exam before ?','',array('class'=>'col-sm-2 control-label')); ?>
    		                    <div class="col-sm-4 topspace">                        	
									<?php 
									if($this->input->post('took_step_one_exam')){ $took_step_one_exam = $this->input->post('took_step_one_exam'); }else if($users['took_step_one_exam']){ $took_step_one_exam = $users['took_step_one_exam']; }else{ $took_step_one_exam =''; }
									if($this->input->post('step_one_exam_date')){ $step_one_exam_date = $this->input->post('step_one_exam_date'); }else if($users['step_one_exam_date']){ $step_one_exam_date = $users['step_one_exam_date']; }else{ $step_one_exam_date =''; }
									
									if($took_step_one_exam == 1 || set_value('took_step_one_exam')){
										 echo form_radio('took_step_one_exam', '1',true,'class="align_radio" id="took_step_one_exam_yes"'); 
										 echo form_label('Yes','yes',array('class'=>'align_label')); 
										 echo form_input('step_one_exam_date',date('d-m-Y',strtotime($step_one_exam_date)),'placeholder= "Exam Date" class="form-control " id="step_one_exam_date" readonly'); 
										if(form_error('step_one_exam_date')) echo form_label(form_error('step_one_exam_date'), 'step_one_exam_date', array("id"=>"step_one_exam_date-error" , "class"=>"error")); 
										 echo form_radio('took_step_one_exam', '0','','class="align_radio" id="took_step_one_exam_no"');
										 echo form_label('No','no',array('class'=>'align_label')); 	
										
									}else{
										 echo form_radio('took_step_one_exam', '1','','class="align_radio" id="took_step_one_exam_yes"'); 
										 echo form_label('Yes','yes',array('class'=>'align_label')); 
										 echo form_input('step_one_exam_date',set_value('step_one_exam_date'),'placeholder= "Exam Date" class="form-control disable_text_box" id="step_one_exam_date" readonly'); 
										if(form_error('step_one_exam_date')) echo form_label(form_error('step_one_exam_date'), 'step_one_exam_date', array("id"=>"step_one_exam_date-error" , "class"=>"error")); 
										 echo form_radio('took_step_one_exam', '0',True,'class="align_radio" id="took_step_one_exam_no"');
										 echo form_label('No','no',array('class'=>'align_label')); 
									}
									 ?>
		                        </div>
    	                	</div>
							
							<div class="form-group">
    		                    <?php echo form_label('Have you taken Step 2 CK exam before ?','',array('class'=>'col-sm-2 control-label')); ?>
    		                    <div class="col-sm-4 topspace">    
										
									<?php
									if($this->input->post('took_step_two_exam')){ $took_step_two_exam = $this->input->post('took_step_two_exam'); }else if($users['took_step_two_exam']){ $took_step_two_exam = $users['took_step_two_exam']; }else{ $took_step_two_exam =''; }
									if($this->input->post('step_two_exam_date')){ $step_two_exam_date = $this->input->post('step_two_exam_date'); }else if($users['step_two_exam_date']){ $step_two_exam_date = $users['step_two_exam_date']; }else{ $step_two_exam_date =''; }
									
									if($took_step_two_exam == 1 || set_value('took_step_two_exam')){
									echo form_radio('took_step_two_exam', '1',true,'class="align_radio" id="took_step_two_exam_yes"'); 
									echo form_label('Yes','yes',array('class'=>'align_label'));
									echo form_input('step_two_exam_date',date('d-m-Y',strtotime($step_two_exam_date)),'placeholder= "Exam Date" class="form-control " id="step_two_exam_date" readonly'); 
                   					if(form_error('step_two_exam_date')) echo form_label(form_error('step_two_exam_date'), 'step_two_exam_date', array("id"=>"step_two_exam_date-error" , "class"=>"error"));
									echo form_radio('took_step_two_exam', '0','','class="align_radio" id="took_step_two_exam_no"'); 
									echo form_label('No','no',array('class'=>'align_label'));
									}else{
									
									echo form_radio('took_step_two_exam', '1','','class="align_radio" id="took_step_two_exam_yes"'); 
									echo form_label('Yes','yes',array('class'=>'align_label'));
									echo form_input('step_two_exam_date',set_value('step_two_exam_date'),'placeholder= "Exam Date" class="form-control disable_text_box" id="step_two_exam_date" readonly'); 
                   					if(form_error('step_two_exam_date')) echo form_label(form_error('step_two_exam_date'), 'step_two_exam_date', array("id"=>"step_two_exam_date-error" , "class"=>"error"));
									echo form_radio('took_step_two_exam', '0',TRUE,'class="align_radio" id="took_step_two_exam_no"'); 
									echo form_label('No','no',array('class'=>'align_label'));
									}
									?>
		                        </div>
    	                	</div>
							
							
							<div class="form-group">
                            	<?php echo form_label('Upcoming Exam Date <span class="required">*</span>','exam_date',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php
									if($this->input->post('exam_date')){ $exam_date = $this->input->post('exam_date'); }else if($users['exam_date']){ $exam_date = $users['exam_date']; }else{ $exam_date =''; }
									
									echo form_input('exam_date',date('d-m-Y',strtotime($exam_date)),'placeholder= "Upcoming Exam Date" class="form-control" id="exam_date"'); 
                   					if(form_error('exam_date')) echo form_label(form_error('exam_date'), 'exam_date', array("id"=>"exam_date-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Exam Center','exam_center',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									if($this->input->post('exam_center')){ $exam_center = $this->input->post('exam_center'); }else if($users['exam_center']){ $exam_center = $users['exam_center']; }else{ $exam_center =''; }
									echo form_input('exam_center',$exam_center,'placeholder= "Exam Center" class="form-control" id="exam_center"'); 
                   					if(form_error('exam_center')) echo form_label(form_error('exam_center'), 'exam_center', array("id"=>"exam_center-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Country <span class="required">*</span>','country',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									if($this->input->post('country')){ $country = $this->input->post('country'); }else if($users['country']){ $country = $users['country']; }else{ $country =''; }
									$js = 'id="country" class="form-control"';
									echo form_dropdown('country', $countries, $country, $js);
									if(form_error('country')) echo form_label(form_error('country'), 'country',array("id"=>"country-error" , "class"=>"error")); ?>
								</div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Cities <span class="required">*</span>','country',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4" id="append-city">
									<?php
									if($this->input->post('city')){ $city = $this->input->post('city'); }else if($users['city']){ $city = $users['city']; }else{ $city =''; }
									if(set_value('city') != ''){ 
									$js = 'id="city" class="form-control"';
									}else{
									$js = 'id="city" class="form-control"';	
									}
									echo form_dropdown('city', $cities,$city , $js);
									if(form_error('city')) echo form_label(form_error('city'), 'city',array("id"=>"city-error" , "class"=>"error")); ?>
								</div>
							</div>
							
							
							
			 				<div class="form-group">
                            	<?php echo form_label('Status <span class="required">*</span>','',array('class'=>'col-sm-2 control-label')); ?>
                            	<div class="col-sm-4 topspace">
									<?php if($this->input->post('status') && $this->input->post('status') == 0){ ?>
										<?php echo form_radio('status', '1','','class="align_radio" id="active"'); ?> 
										<?php echo form_label('Active','active',array('class'=>'align_label')); ?>
										<?php echo form_radio('status', '0',TRUE,'class="align_radio" id="inactive"'); ?> 
										<?php echo form_label('Inactive','inactive',array('class'=>'align_label')); ?>
									<?php }else{?>
										<?php echo form_radio('status', '1',TRUE,'class="align_radio" id="active"'); ?> 
										<?php echo form_label('Active','active',array('class'=>'align_label')); ?>
										<?php echo form_radio('status', '0','','class="align_radio" id="inactive"'); ?> 
										<?php echo form_label('Inactive','inactive',array('class'=>'align_label')); ?>
									<?php } ?>
                            	</div>
                            </div>
                            
                           
                            
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default" title="Save">Save</button>
                                </div>
                            </div>
						<?php echo form_close();  ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
jQuery(window).load(function(){
	var div = ".error:first";
	if($(div).length!==0){
		$('html, body').animate({
			scrollTop: $(div).offset().top - 300
		}, 1000);
	}
	if($("#country").val()){
		$('#city').prop("disabled", false);
	}
});
</script>
