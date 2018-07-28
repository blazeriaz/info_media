 <!-- Main Content -->
<div class="container-fluid">
    <div class="side-body">
		<div class="page-title"></div>
			<div class="row">
				<div class="col-xs-12">
					<div class="card custom-card">
						<div class="card-header">
							<div class="card-title">
								<div class="title"><?php echo $page_title?></div>
							</div>
							<div class="back pull-right">
								<a href="<?php echo SITE_URL().SITE_ADMIN_URI;?>/advertisements" title="Back">Back</a>
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
                    		<?php  $attributes = array('class' => 'form-horizontal','id' => 'map_advertisements_form_id');				
							echo form_open_multipart('', $attributes); ?>
							<div class="form-group">
								<?php echo form_label('Ad Page Name <span class="required">*</span>','page_id_classes',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									$js = 'id="page_id_classes" class="form-control"';
									$set_advertisment = isset($_POST['page_id']) ? $_POST['page_id'] : (isset($advertisements['page_id']) ? $advertisements['page_id'] : '');
									echo form_dropdown('page_id', $page_id, $set_advertisment, $js);
									if(form_error('page_id')) echo form_label(form_error('page_id'), 'page_id',array("id"=>"page-id-error" , "class"=>"error")); ?>
								</div>
							</div>
							<div class="form-group">
								<?php echo form_label('Ad Positions <span class="required">*</span>','position_id_classes',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-4">
									<?php
									$js = 'id="position_id_classes" class="form-control"';
									$set_position = isset($_POST['position_id']) ? $_POST['position_id'] : (isset($advertisements['position_id']) ? $advertisements['position_id'] : '');
									echo form_dropdown('position_id', $position_id, $set_position, $js);
									if(form_error('position_id')) echo form_label(form_error('position_id'), 'position_id',array("id"=>"position-id-error" , "class"=>"error")); ?>
								</div>
							</div>
                            <div class="form-group">
                            	<?php echo form_label('Name <span class="required">*</span>','name',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									$set_name = isset($_POST['name']) ? $_POST['name'] : (isset($advertisements['name']) ? $advertisements['name'] : '');
									echo form_input('name', $set_name, 'placeholder= "Name" class="form-control" id="name"'); 
                   					if(form_error('name')) echo form_label(form_error('name'), 'name', array("id"=>"name-error" , "class"=>"error")); ?>
                                </div>
							</div>
							<input type="hidden" value="<?php echo $advertisements['image']; ?>" name="ad_image_hidden"/>
							<div class="form-group">
                            	<?php echo form_label('Image <span class="required">*</span>','ad_image',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									echo form_upload(array('id' => 'ad_image', 'name' => 'ad_image', 'class' => 'ad-image-upload')); ?>
									<small style="display:block">Allowed Types: gif,jpg,jpeg,png 
										<span id='ad_img_size'>
											<?php 
												$page_id = isset($_POST['page_id']) ? $_POST['page_id'] : (isset($advertisements['page_id']) ? $advertisements['page_id'] : '');
												if($page_id == 1){
													echo "| Prefered Dimensions: 1200 * 150";
												}else if($page_id == 2){
													echo "| Prefered Dimensions: 330 * 275";
												}
											?>
										</span>
									</small>
									<?php
                   					if(form_error('ad_image')) echo form_label(form_error('ad_image'), 'ad_image', array("id"=>"ad-image-error" , "class"=>"error")); ?>
                   					<?php if(isset($upload_error['error'])) { echo  form_label($upload_error['error'],'upload-error',array('class'=>'error'));  } ?>
                                	<?php 
									
                                    if($advertisements['image'] != ''){
										$img_src = thumb($this->config->item('ad_img') .$advertisements['image'] ,'300', '30', 'thumb_ad_img',$maintain_ratio = TRUE);
		                                $img_prp = array('style'=>'clear: left;float: left;margin-top: 10px;', 'src' => base_url() . 'appdata/ads/thumb_ad_img/'.$img_src, 'alt' => $advertisements['image'], 'title' => $advertisements['image']);
                                     	echo img($img_prp);
                                     }else{
                                     	$no_img = array('style'=>'clear: left;float: left;margin-top: 10px;', 'src' => base_url() . 'appdata/thumb/student_avatar/100x100/no-image.png', 'alt' => "No Image", 'title' => "No Image");
                                        echo img($no_img);
                                     }
								    ?>
								  
                                </div>
							</div>
							 
							<div class="form-group">
                            	<?php echo form_label('Url <span class="required">*</span>','url',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									$set_url = isset($_POST['url']) ? $_POST['url'] : (isset($advertisements['url']) ? $advertisements['url'] : '');
									echo form_input('url',$set_url,'placeholder= "http://" class="form-control" id="url"'); 
                   					if(form_error('url')) echo form_label(form_error('url'), 'image', array("id"=>"url-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group display_none">
                            	<?php echo form_label('Expiry Date <span class="required">*</span>','expiry-date',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-4">
									<?php 
									$set_expiry_date = isset($_POST['expiry_date']) ? $_POST['expiry_date'] : (isset($advertisements['expiry_date']) ? $advertisements['expiry_date'] : '');
									echo form_input('expiry_date',$set_expiry_date,'placeholder= "Expiry Date" class="form-control" id="expiry-date"'); 
                   					if(form_error('expiry_date')) echo form_label(form_error('expiry_date'), 'expiry_date', array("id"=>"expiry-date-error" , "class"=>"error")); ?>
                                </div>
							</div>
							<div class="form-group">
                            	<?php echo form_label('Offer <span class="required">*</span>','',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-10 topspace">
		                            <?php if($advertisements['is_offer'] ==1){?>
										<?php echo form_radio('offer', '1',TRUE,'class="align_radio" id="yes"'); ?> 
										<?php echo form_label('Yes','yes',array('class'=>'align_label')); ?>
										<?php echo form_radio('offer', '0','','class="align_radio" id="no"'); ?> 
										<?php echo form_label('No','no',array('class'=>'align_label')); ?>
									<?php }else{?>
									<?php echo form_radio('offer', '1','','class="align_radio" id="yes"'); ?> 
										<?php echo form_label('Yes','yes',array('class'=>'align_label')); ?>
										<?php echo form_radio('offer', '0',TRUE,'class="align_radio" id="no"'); ?> 
										<?php echo form_label('No','no',array('class'=>'align_label')); ?>
									<?php } ?>
                                 </div>
                            </div>
			 				<div class="form-group">
                            	<?php echo form_label('Status <span class="required">*</span>','',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-10 topspace">
		                            <?php if($advertisements['status'] ==1){?>
										<?php echo form_radio('status', '1',TRUE,'class="align_radio" id="active"'); ?> 
										<?php echo form_label('Active','active',array('class'=>'align_label')); ?>
										<?php echo form_radio('status', '0','','class="align_radio" id="inactive"'); ?> 
										<?php echo form_label('Inactive','inactive',array('class'=>'align_label')); ?>
									<?php }else{?>
									<?php echo form_radio('status', '1','','class="align_radio" id="active"'); ?> 
										<?php echo form_label('Active','active',array('class'=>'align_label')); ?>
										<?php echo form_radio('status', '0',TRUE,'class="align_radio" id="inactive"'); ?> 
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


