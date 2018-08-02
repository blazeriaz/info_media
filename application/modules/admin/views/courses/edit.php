 <!-- Main Content -->
  <?php $controller = 'courses';?>
<div class="container-fluid">
    <div class="side-body">
	<div class="page-title"></div>
		<div class="row">
			<div class="col-xs-12">
				<div class="card custom-card">
					<div class="card-header">
						<div class="card-title">
							<div class="title"><?php echo 'Edit'  ?></div>
						</div>
						<div class="back pull-right">
							<a href="<?php echo SITE_URL().SITE_ADMIN_URI.'/'.$controller;?>" title="Back">Back</a>
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
                		<?php $attributes = array('class' => 'form-horizontal','id' => 'edit');				
						
						echo form_open_multipart(base_url().SITE_ADMIN_URI.'/'.$controller.'/edit/'.$id, $attributes); 
						?>
						
						
							
							<div class="form-group">
                            	<?php echo form_label('Name <span class="required">*</span>','name',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php
									if($this->input->post('name')){ $f_name = $this->input->post('name'); }else if($results['name']){ $f_name = $results['name']; }else{ $f_name =''; }
									echo form_input('name', $f_name,'placeholder= "Name" class="form-control alphaOnly" id="name"'); 
                   					if(form_error('name')) echo form_label(form_error('name'), 'name', array("id"=>"name-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Department <span class="required">*</span>','department',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									if($this->input->post('department')){ $department = $this->input->post('department'); }else if($results['dept_id']){ $department = $results['dept_id']; }else{ $department =''; }
									$attrs = 'id="department" class="form-control"';
									echo form_dropdown('department', $departments, $department, $attrs);
									if(form_error('department')) echo form_label(form_error('department'), 'department',array("id"=>"department-error" , "class"=>"error")); ?>
								</div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Subscription <span class="required">*</span>','subscription',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									if($this->input->post('subscription')){ $subscription = $this->input->post('subscription'); }else if($results['subscription']){ $subscription = $results['subscription']; }else{ $subscription =''; }
									$attrs = 'id="subscription" class="form-control"';
									$subscriptions = array(''=>'Select Subscription','1'=>'Subscribed','2'=>'Not Subscribed');
									echo form_dropdown('subscription', $subscriptions, $subscription, $attrs);
									if(form_error('subscription')) echo form_label(form_error('subscription'), 'subscription',array("id"=>"subscription-error" , "class"=>"error")); ?>
								</div>
							</div>
							
			 				<div class="form-group">
                            	<?php echo form_label('Status <span class="required">*</span>','',array('class'=>'col-sm-2 control-label')); ?>
                            	<div class="col-sm-4 topspace">
									<?php 
									if($this->input->post('status')){ $status = $this->input->post('status'); }else if($results['status']){ $status = $results['status']; }else{ $status =''; }
									?>
									<?php if($status == 0){ ?>
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
