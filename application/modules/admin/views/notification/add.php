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
							<div class="title"><?php echo 'Add'  ?></div>
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
                		<?php $attributes = array('class' => 'form-horizontal','id' => 'add');				
						echo form_open_multipart('', $attributes); ?>
							
							<div class="form-group">
                            	<?php echo form_label('Title <span class="required">*</span>','title',array('class'=>'col-sm-2 control-label')); ?>
                                <div class="col-sm-6">
									<?php echo form_input('title',set_value('title'),'placeholder= "Title" class="form-control" id="title"'); 
                   					if(form_error('title')) echo form_label(form_error('title'), 'title', array("id"=>"title-error" , "class"=>"error")); ?>
                                </div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Message ','message',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-6">
									<?php echo form_textarea('message',set_value('message'),'placeholder= "Message" class="form-control" id=""'); 
									if(form_error('message')) echo form_label(form_error('message'), 'message', array("id"=>"message-error" , "class"=>"error")); ?>
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
