<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Teaching ManageMent System</title>
<meta name="description" content="description">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="resources/plugins/bootstrap/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/plugins/easyui/themes/bootstrap/easyui.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="resources/plugins/easyui/themes/color.css">
<link href="resources/plugins/font-awesome-4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="resources/css/style_v2.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
				<script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
				<script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
		<![endif]-->
</head>
<body>
	<!--Start Header-->
	<div id="screensaver">
		<canvas id="canvas"></canvas>
		<i class="fa fa-lock" id="screen_unlock"></i>
	</div>
	<div id="modalbox">
		<div class="devoops-modal">
			<div class="devoops-modal-header">
				<div class="modal-header-name">
					<span>Basic table</span>
				</div>
				<div class="box-icons">
					<a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="devoops-modal-inner"></div>
			<div class="devoops-modal-bottom"></div>
		</div>
	</div>
	<header class="navbar">
		<div class="container-fluid expanded-panel">
			<div class="row">
				<div id="logo" class="col-xs-12 col-sm-2">
					<a href="/">ManageMent</a>
				</div>
				<div id="top-panel" class="col-xs-12 col-sm-10">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<div id="search">
								<input type="text" placeholder="search" /> <i class="fa fa-search"></i>
							</div>
						</div>
						<div class="col-xs-4 col-sm-8 top-panel-right">
							<!-- <a href="#" class="about">SwitchTheme</a> <a href="index_v1.html" class="style1"></a> -->
							<ul class="nav navbar-nav pull-right panel-menu">
								<li class="hidden-xs"><a class="ajax-link" href="ajax/calendar.html"> <i class="fa fa-calendar"></i> <span class="badge">7</span>
								</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle account" data-toggle="dropdown">
										<div class="avatar">
											<img src="resources/img/avatar.jpg" class="img-circle" alt="avatar" />
										</div> <i class="fa fa-angle-down pull-right"></i>
										<div class="user-mini pull-right">
											<span class="welcome">Welcome,</span> <span>${loginUser}</span>
										</div>
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"> <i class="fa fa-user"></i> <span>Profile</span>
										</a></li>
										<li><a href="ajax/page_messages.html" class="ajax-link"> <i class="fa fa-envelope"></i> <span>Messages</span>
										</a></li>
										<li><a href="ajax/gallery_simple.html" class="ajax-link"> <i class="fa fa-picture-o"></i> <span>Albums</span>
										</a></li>
										<li><a href="ajax/calendar.html" class="ajax-link"> <i class="fa fa-tasks"></i> <span>Tasks</span>
										</a></li>
										<li><a href="#"> <i class="fa fa-cog"></i> <span>Settings</span>
										</a></li>
										<li><a href="javascript:logout();"> <i class="fa fa-power-off"></i> <span>Logout</span>
										</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--End Header-->
	<!--Start Container-->
	<div id="main" class="container-fluid">
		<div class="row">
			<div id="sidebar-left" class="col-xs-2 col-sm-2">
				<ul class="nav main-menu">
					<li><a href="ajax/dashboard.html" class="ajax-link"> <i class="fa fa-dashboard"></i> <span class="hidden-xs">Dashboard</span>
					</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-book"></i> <span class="hidden-xs">Books Manage</span>
					</a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link" href="ajax/book_manage"><i class="fa fa-clipboard"></i> Book Manage</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-suitcase"></i> <span class="hidden-xs">System Function</span>
					</a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link" href="ajax/xxx"><i class="fa fa-book"></i> Type Manage</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-folder"></i> <span class="hidden-xs">Person Detail</span>
					</a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link" href="ajax/xx"><i class="fa fa-clipboard"></i> Info Manage</a></li>
						</ul></li>


					<li class="dropdown"><a href="javascript:logout();" class="dropdown-toggle"> <i class="fa fa-sign-out"></i> <span class="hidden-xs">Log Out</span>
					</a></li>
				</ul>
			</div>
			<!--Start Content-->
			<div id="content" class="col-xs-12 col-sm-10">
				<div id="about">
					<div class="about-inner"></div>
				</div>
				<div class="preloader">
					<img src="resources/img/devoops_getdata.gif" class="devoops-getdata" alt="preloader" />
				</div>
				<div id="ajax-content"></div>
			</div>
			<!--End Content-->
		</div>
	</div>
	<!--End Container-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!--<script src="http://code.jquery.com/jquery.js"></script>-->
	<script src="resources/plugins/jquery/jquery.min.js"></script>
	<script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="resources/plugins/easyui/jquery.easyui.min.js"></script>
	<script src="resources/js/TeachDialog.js"></script>
	<script src="resources/js/devoops.js"></script>
</body>
</html>
