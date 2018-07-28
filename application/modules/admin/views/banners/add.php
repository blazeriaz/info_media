 <!-- Main Content -->
<div class="container-fluid">
    <div class="side-body">
		<div class="page-title"></div>
			<div class="row">
				<div class="col-xs-12">
					<div class="card custom-card">
						<div class="card-header">
							<div class="card-title">
								<div class="title"><?php echo 'Add Banner';?></div>
							</div>
							<div class="back pull-right">
								<a href="<?php echo SITE_URL().SITE_ADMIN_URI;?>/banners" title="Back">Back</a>
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
                    		<?php  $attributes = array('class' => 'form-horizontal','id' => 'map_banners_form');				
							echo form_open_multipart('', $attributes); ?>
                            <div class="form-group">
                            	<?php echo form_label('Name <span class="required">*</span>','name',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('name',set_value('name'),'placeholder= "Name" class="form-control" id="name"'); 
                   					if(form_error('name')) echo form_label(form_error('name'), 'name', array("id"=>"name-error" , "class"=>"error")); ?>
                                </div>
							</div>
							<div class="form-group">
                            	<?php echo form_label('Page Title <span class="required">*</span>','page_id',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									$js = 'id="page_id" class="form-control"';
									echo form_dropdown('page_id', $page_list, isset($_POST['page_id'])?$_POST['page_id']:'',$js); 
                   					if(form_error('page_id')) echo form_label(form_error('page_id'), 'page_id', array("id"=>"page_id-error" , "class"=>"error")); ?>
                                </div>
							</div>
							<div class="form-group">
                            	<?php echo form_label('Description 1','description_1',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php  $set_description = isset($_POST['content_one']) ? $_POST['content_one']:'';
									 echo form_textarea('content_one',$set_description,'placeholder= "Description 1" class="form-control content_one" id="description_1"'); 
                   					if(form_error('content_one')) echo form_label(form_error('content_one'), 'content_one', array("id"=>"description_1-error" , "class"=>"error")); ?>
                                </div>
							</div>
							<div class="form-group">
                            	<?php echo form_label('Description 2','description_2',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php  $set_description = isset($_POST['content_two']) ? $_POST['content_two']:'';
									 echo form_textarea('content_two',$set_description,'placeholder= "Description 2" class="form-control content_two" id="description_2"'); 
                   					if(form_error('content_two')) echo form_label(form_error('content_two'), 'content_two', array("id"=>"description_2-error" , "class"=>"error")); ?>
                                </div>
							</div>
							<div class="form-group">
                            	<?php echo form_label('Image <span class="required">*</span>','banner_image',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									echo form_upload(array('id' => 'banner_image', 'name' => 'banner_image', 'class' => 'banner-image-upload' , 'accept' => "image/*")); ?><small style="display:block">Allowed Types: gif,jpg,jpeg,png | 1800*700 px</small> 
									<?php
                   					if(form_error('banner_image')) echo form_label(form_error('banner_image'), 'banner_image', array("id"=>"banner-image-error" , "class"=>"error")); ?>									
                   					<?php if(isset($upload_error['error'])) { echo  form_label($upload_error['error'],'upload-error',array('class'=>'error'));  } ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Url','url',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php echo form_input('url',set_value('url'),'placeholder= "http://" class="form-control" id="url"'); 
                   					if(form_error('url')) echo form_label(form_error('url'), 'url', array("id"=>"url-error" , "class"=>"error")); ?>
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


