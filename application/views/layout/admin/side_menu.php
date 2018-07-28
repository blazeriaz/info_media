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
				<li class="panel panel-default dropdown <?php if($this->uri->segment(2)=='countries' || $this->uri->segment(2)=='cities')  echo 'active'; ?>">
					<?php echo anchor('#dropdown-table','<span class="icon fa fa-sitemap"></span><span class="title" title="Masters">Masters</span>', array('data-toggle'=>'collapse','data-parent'=>'#panel-parent') ); ?>
					<div id="dropdown-table" class="panel-collapse collapse <?php if($this->uri->segment(2)=='countries' || $this->uri->segment(2)=='cities')  echo 'in'; ?>">
						<div class="panel-body">
							<ul class="nav navbar-nav">
								<li class="<?php if($this->uri->segment(2)=='countries' ) echo 'subactive';?>" ><?php echo anchor(base_url().SITE_ADMIN_URI.'/countries', '<span title="Countries">Countries</span>'); ?></li>
							</ul>
							<ul class="nav navbar-nav">
								<li class="<?php if($this->uri->segment(2)=='cities' ) echo 'subactive';?>" ><?php echo anchor(base_url().SITE_ADMIN_URI.'/cities', '<span title="Cities">Cities</span>'); ?></li>
							</ul>
						</div>
					</div>
				</li>
				<!--<li class="<?php if($this->uri->segment(2)=='advertisements')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/advertisements','<span class="icon fa fa-newspaper-o"></span><span class="title" title="Advertisements">Advertisements</span>'); ?>
				</li>
				<li class="<?php if($this->uri->segment(2)=='banners')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/banners','<span class="icon fa fa-picture-o"></span><span class="title" title="Banners">Banners</span>'); ?>
				</li>
				<li class="panel panel-default dropdown <?php if($this->uri->segment(2)=='cms' || $this->uri->segment(2)=='pages')  echo 'active'; ?>">
					<?php echo anchor('#dropdown-cms','<span class="icon fa fa-file-text"></span><span class="title" title="CMS">CMS</span>', array('data-toggle'=>'collapse','data-parent'=>'#panel-parent') ); ?>
					<div id="dropdown-cms" class="panel-collapse collapse <?php if($this->uri->segment(2)=='cms' || $this->uri->segment(2)=='pages')  echo 'in'; ?>">
						<div class="panel-body">							 
							<ul class="nav navbar-nav">
								<li class="<?php if($this->uri->segment(2)=='pages' && $this->uri->segment(3)!='import' ) echo 'subactive';?>" ><?php echo anchor(base_url().SITE_ADMIN_URI.'/pages', '<span title="Manage CMS Pages">Manage CMS Pages</span>'); ?></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="<?php if($this->uri->segment(2)=='contact_us')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/contact_us','<span class="icon fa fa-mail-reply-all"></span><span class="title" title="Contact Us">Contact Us</span>'); ?>
				</li>				
				<li class="<?php if($this->uri->segment(2)=='youtube_videos')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/youtube_videos','<span class="icon fa fa-youtube-play"></span><span class="title" title="Youtube Videos">Youtube Videos</span>'); ?>
				</li>-->
				<li class="<?php if($this->uri->segment(2)=='email_templates')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/email_templates','<span class="icon fa fa-mail-reply-all"></span><span class="title" title="Email Templates">Email Templates</span>'); ?>
				</li>

				<li class="<?php if($this->uri->segment(2)=='users')  echo 'active'; ?>">
					<?php echo anchor(base_url().SITE_ADMIN_URI.'/users','<span class="icon fa fa-user"></span><span class="title" title="Users">Users</span>'); ?>
				</li>
			</ul>
		</div>
	</nav>
</div>
