 <!-- Main Content -->
  <?php $controller = 'gallery';?>
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
						
							<?php //print_r($results);?>
							
							<div class="form-group">
                            	<?php echo form_label('Title <span class="required">*</span>','title',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php
									if($this->input->post('title')){ $title = $this->input->post('title'); }else if($results['title']){ $title = $results['title']; }else{ $title =''; }
									echo form_input('title', $title,'placeholder= "Title" class="form-control" id="title"'); 
                   					if(form_error('title')) echo form_label(form_error('title'), 'title', array("id"=>"title-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Image Url <span class="required">*</span>','image',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-6">
									<?php 
									if($this->input->post('image')){ $image = $this->input->post('image'); }else if($results['image']){ $image = $results['image']; }else{ $image =''; }
									echo form_input('image',$image,'placeholder= "Image Url" class="form-control" id="image"'); 
                   					if(form_error('image')) echo form_label(form_error('image'), 'image', array("id"=>"image-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Description ','description',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-6">
									<?php 
									if($this->input->post('description')){ $description = $this->input->post('description'); }else if($results['description']){ $description = $results['description']; }else{ $description =''; }
									echo form_textarea('description',$description,'placeholder= "Description" class="form-control" id=""'); 
									if(form_error('description')) echo form_label(form_error('description'), 'description', array("id"=>"description-error" , "class"=>"error")); ?>
								 </div>
							</div>
							
							<div class="form-group">
                            	<?php echo form_label('Date & Time <span class="required">*</span>','datetime',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-6">
									<?php 
									if($this->input->post('datetime')){ $datetime = $this->input->post('datetime'); }else if($results['datetime']){ $datetime = $results['datetime']; }else{ $datetime =''; }
									echo form_input('datetime',$datetime,'placeholder= "Date & Time" class="form-control datetime" id="datetime"'); 
                   					if(form_error('datetime')) echo form_label(form_error('datetime'), 'datetime', array("id"=>"datetime-error" , "class"=>"error" , "autocomplete"=>"off")); ?>
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
	if($("#datetime").length!=0){
		$("#datetime").datetimepicker({
			minDate:0,
			format:'d-m-Y H:i',
			scrollinput:false,
			scrollMonth:false,
			scrollTime:false,
			step:1,
			onSelectDate:function(){
				
			},	
			onChangeDateTime:function(dp,$input){
				
			},
			onShow:function(ct,inp){
				
			}
		});
	}
});
</script>
