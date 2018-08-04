 <!-- Main Content -->
<div class="container-fluid">
    <div class="side-body">
	<div class="page-title"></div>
		<div class="row">
			<div class="col-xs-12">
				<div class="card custom-card">
					<div class="card-header">
						<div class="card-title">
							<div class="title"><?php echo 'Add User'  ?></div>
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
                		<?php $attributes = array('class' => 'form-horizontal','id' => 'add_new_user');				
						echo form_open_multipart('', $attributes); ?>
							
							<div class="form-group">
                            	<?php echo form_label('UserName <span class="required">*</span>','username',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('username',set_value('username'),'placeholder= "UserName" class="form-control" id="username"'); 
                   					if(form_error('username')) echo form_label(form_error('username'), 'username', array("id"=>"username-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Email ID <span class="required">*</span>','email_id',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('email_id',set_value('email_id'),'placeholder= "example@gmail.com" class="form-control" id="email_id"'); 
                   					if(form_error('email_id')) echo form_label(form_error('email_id'), 'email_id', array("id"=>"email_id-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Contact Number <span class="required">*</span>','phone_no',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('phone_no',set_value('phone_no'),'placeholder= "Contact Number" class="form-control phoneOnly" id="phone_no"'); 
                   					if(form_error('phone_no')) echo form_label(form_error('phone_no'), 'phone_no', array("id"=>"phone_no-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group display_none">
                            	<?php echo form_label('Password <span class="required">*</span>','password',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_password('password',set_value('password'),'placeholder= "Password" class="form-control" id="password"'); 
                   					if(form_error('password')) echo form_label(form_error('password'), 'password', array("id"=>"password-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group display_none">
                            	<?php echo form_label('Confirm Password <span class="required">*</span>','confirm_password',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_password('confirm_password',set_value('confirm_password'),'placeholder= "confirm password" class="form-control " id="confirm_password"'); 
                   					if(form_error('confirm_password')) echo form_label(form_error('confirm_password'), 'confirm_password', array("id"=>"confirm_password-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<!--<div class="form-group">
								<?php echo form_label('Country <span class="required">*</span>','country',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									//$js = 'id="country" class="form-control"';
									//echo form_dropdown('country', $countries, set_value('country'), $js);
									//if(form_error('country')) echo form_label(form_error('country'), 'country',array("id"=>"country-error" , "class"=>"error")); ?>
								</div>
							</div>-->
							
							<div class="form-group">
								<?php echo form_label('State <span class="required">*</span>','state',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									$js = 'id="state" class="form-control"';
									echo form_dropdown('state', $states, set_value('state'), $js);
									if(form_error('state')) echo form_label(form_error('state'), 'state',array("id"=>"state-error" , "class"=>"error")); ?>
								</div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Cities <span class="required">*</span>','country',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4" id="append-city">
									<?php
									if(set_value('city') != ''){ 
									$js = 'id="city" class="form-control"';
									}else{
									$js = 'id="city" class="form-control" disabled';	
									}
									$js = 'id="city" class="form-control"';
									echo form_dropdown('city', $cities,set_value('city') , $js);
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
		//$('#city').prop("disabled", false);
	}
	
	var base_url = "<?php echo base_url(); ?>";
	
	$( "#state" ).on('change',function(){
		$("#city").css("display","block");
		$("#city").html("<option value=''>Select</option>");
		var state = $(this).val();
		var url = base_url + "admin/users/cities/"+state;
		$.ajax({
			type: "GET",
			url: url,
			data: "state=" + state,
			success: function (result) {
				if(result != ''){
					var obj = jQuery.parseJSON(result);
					if(obj){
						$("#city").html("<option value=''>Select</option>");
						$.each( obj, function( key, value ) {
							$("#city").append("<option value="+key+">"+value+"</option>");
						});
					} else {
						$("#city").append("<option value='' disabled='disabled'>No Records Found</option>");
					}
					//$("#city").replaceWith(result);
				}				
			}
		});
	});

	
});
</script>
