 <!-- Main Content -->
<div class="container-fluid">
    <div class="side-body">
		<div class="page-title"></div>
			<div class="row">
				<div class="col-xs-12">
					<div class="card custom-card">
						<div class="card-header">
							<div class="card-title">
								<div class="title"><?php echo $page_title;  ?></div>
							</div>
							<div class="back pull-right">
								<a href="<?php echo SITE_URL().SITE_ADMIN_URI;?>/cities" title="Back">Back</a>
							</div>
						</div>
                   		<div class="card-body">
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
                    		<?php  $attributes = array('class' => 'form-horizontal','id' => 'cities_form', 'autocomplete'=>'off' );				
							echo form_open_multipart('', $attributes); ?>
							
							<div class="form-group">
								<?php echo form_label('Country <span class="required">*</span>','state_id',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<div class="form-control">India</div>
								</div>
							</div>							
							<div class="form-group">
								<?php echo form_label('State <span class="required">*</span>','state_id',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									$js = 'id="state_id" class="form-control"';
									echo form_dropdown('state_id', $states_list,  isset($_POST['state_id'])?$_POST['state_id']:'', $js);
									if(form_error('state_id')) echo form_label(form_error('state_id'), 'state_id',array("id"=>"state_id-error" , "class"=>"error")); ?>
								</div>
							</div>
                            <div class="form-group">
                            	<?php echo form_label('Name <span class="required">*</span>','name',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('name',set_value('name'),'placeholder= "Name" class="form-control" id="name"'); 
                   					if(form_error('name')) echo form_label(form_error('name'), 'name', array("id"=>"name-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group display_none">
                            	<?php echo form_label('City Code <span class="required">*</span>','city_code',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('city_code',set_value('city_code'),'placeholder= "City Code" class="form-control" id="city_code"'); 
                   					if(form_error('city_code')) echo form_label(form_error('city_code'), 'city_code', array("id"=>"city_code-error" , "class"=>"error")); ?>
                                </div>
							</div>
			 				<div class="form-group">
                            	<?php echo form_label('Status <span class="required">*</span>','',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4 topspace">
									<?php echo form_radio('status', '1',TRUE,'class="align_radio" id="active"'); ?> 
									<?php echo form_label('Active','active',array('class'=>'align_label')); ?>
									<?php echo form_radio('status', '0','','class="align_radio" id="inactive"'); ?> 
									<?php echo form_label('Inactive','inactive',array('class'=>'align_label')); ?>
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


