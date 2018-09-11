 <!-- Main Content -->
 <link rel="stylesheet" type="text/css" href="<?php echo SITE_URL().'/assets/themes/css/select2.min.css' ?>">
 <?php $controller = 'notification';?>
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
								<?php echo form_label('Message <span class="required">*</span>','message',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-6">
									<?php echo form_textarea('message',set_value('message'),'placeholder= "Message" class="form-control" id=""'); 
									if(form_error('message')) echo form_label(form_error('message'), 'message', array("id"=>"message-error" , "class"=>"error")); ?>
								 </div>
							</div>
							
							<div class="form-group">
								<?php echo form_label('Send Alert <span class="required">*</span>','send_alert',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-6">
									<?php
									$js = 'id="send_alert" class="form-control select2"';
									$send_alert_list = array(1=>'All Users',2=>'Selected Users');
									echo form_dropdown('send_alert', $send_alert_list,  isset($_POST['send_alert'])?$_POST['send_alert']:'', $js);
									if(form_error('send_alert')) echo form_label(form_error('send_alert'), 'send_alert',array("id"=>"send_alert-error" , "class"=>"error"));
									?>
								</div>
							</div>
							
							<div class="form-group select_users">
								<?php echo form_label('Select Users <span class="required">*</span>','users',array('class'=>'col-sm-2 control-label')); ?>
								<div class="col-sm-6">
									<?php
									$js = 'id="users" class="form-control select2" multiple';
									echo form_dropdown('users[]', $users_list,  isset($_POST['users'])?$_POST['users']:'', $js);
									if(form_error('users[]')) echo form_label(form_error('users[]'), 'users',array("id"=>"users-error" , "class"=>"error"));
									?>
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
<script type='text/javascript' src='<?php echo SITE_URL().'/assets/themes/js/select2.full.min.js' ?>'></script>
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
	$('#send_alert').on('change',function(){
		if($(this).val()==1){
			$(".select_users").css("display","none");
		}
		if($(this).val()==2){
			$(".select_users").css("display","block");
		}
	});
	if($(".select2").length){
		$(".select2").select2({		
			placeholder: 'Select an option'
		});
	}
	<?php
		if(isset($_POST['send_alert'])){
			if($_POST['send_alert']==1){
			?>
				$(".select_users").css("display","none");
			<?php
			}
			if($_POST['send_alert']==2){
			?>
				$(".select_users").css("display","block");
			<?php
			}
		}else{
		?>
			$(".select_users").css("display","none");
		<?php
		}
	?>
});
</script>
