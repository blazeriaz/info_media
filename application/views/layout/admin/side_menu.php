<div class="side-menu sidebar-inverse">
	<nav class="navbar navbar-default" role="navigation">
		<div class="side-menu-container">
			<div class="navbar-header">
				<a class="navbar-brand" href="<?php echo base_url().SITE_ADMIN_URI?>">
					<div class="logo">
						<img src="<?php echo base_url().'assets/images/w_logo.png';?>">
					</div>
				</a>
				<button type="button" class="navbar-expand-toggle pull-right visible-xs">
					<i class="fa fa-times icon"></i>
				</button>
			</div>
			<?php 
			$admin_id = $this->session->userdata('admin_is_logged_in');
			$this->load->helper('function_helper');
			?>
			<ul class="nav navbar-nav" id="panel-parent">
				<li class="<?php if($this->uri->segment(2)=='dashboard')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/dashboard','<span class="icon fa fa-tachometer"></span><span class="title" title="Dashboard">Dashboard</span>'); ?>
				</li>
				<li class="panel panel-default dropdown <?php if($this->uri->segment(2)=='countries' || $this->uri->segment(2)=='states' || $this->uri->segment(2)=='cities')  echo 'active'; ?>">
					<?php echo anchor('#dropdown-table','<span class="icon fa fa-sitemap"></span><span class="title" title="Masters">Masters</span>', array('data-toggle'=>'collapse','data-parent'=>'#panel-parent') ); ?>
					<div id="dropdown-table" class="panel-collapse collapse <?php if($this->uri->segment(2)=='countries' || $this->uri->segment(2)=='states' || $this->uri->segment(2)=='cities')  echo 'in'; ?>">
						<div class="panel-body">
							<!--<ul class="nav navbar-nav">
								<li class="<?php if($this->uri->segment(2)=='countries' ) echo 'subactive';?>" ><?php echo anchor(base_url().SITE_ADMIN_URI.'/countries', '<span title="Countries">Countries</span>'); ?></li>
							</ul>-->
							<ul class="nav navbar-nav">
								<li class="<?php if($this->uri->segment(2)=='states' ) echo 'subactive';?>" ><?php echo anchor(base_url().SITE_ADMIN_URI.'/states', '<span title="States">States</span>'); ?></li>
							</ul>
							<ul class="nav navbar-nav">
								<li class="<?php if($this->uri->segment(2)=='cities' ) echo 'subactive';?>" ><?php echo anchor(base_url().SITE_ADMIN_URI.'/cities', '<span title="Cities">Cities</span>'); ?></li>
							</ul>
						</div>
					</div>
				</li>
				
				<li class="<?php if($this->uri->segment(2)=='department')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/department','<span class="icon fa fa-university"></span><span class="title" title="Department">Department</span>'); ?>
				</li>
				
				<li class="<?php if($this->uri->segment(2)=='courses')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/courses','<span class="icon fa fa-newspaper-o"></span><span class="title" title="Courses">Courses</span>'); ?>
				</li>
				
				<li class="<?php if($this->uri->segment(2)=='course_video')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/course_video','<span class="icon fa fa-file-video-o"></span><span class="title" title="Course Video">Course Video</span>'); ?>
				</li>
				
				<li class="<?php if($this->uri->segment(2)=='gallery')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/gallery','<span class="icon fa fa-file-image-o"></span><span class="title" title="Gallery">Gallery</span>'); ?>
				</li>
				
				<!--<li class="<?php if($this->uri->segment(2)=='email_templates')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/email_templates','<span class="icon fa fa-mail-reply-all"></span><span class="title" title="Email Templates">Email Templates</span>'); ?>
				</li>-->

				<li class="<?php if($this->uri->segment(2)=='users')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/users','<span class="icon fa fa-users"></span><span class="title" title="Users">Users</span>'); ?>
				</li>
				
				<li class="<?php if($this->uri->segment(2)=='notification')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/notification','<span class="icon fa fa-bell"></span><span class="title" title="Notification">Notification</span>'); ?>
				</li>
				
			</ul>
		</div>
	</nav>
</div>
