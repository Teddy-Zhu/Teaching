<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN" style="min-width: 1000px; overflow: hidden;">
<head>
<meta charset="utf-8">
<title>Teaching ManageMent System</title>
<meta name="description" content="description">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<link rel="alternate icon" type="image/png" href="resources/img/favicon.png">
<link href="resources/plugins/bootstrap/bootstrap.css" rel="stylesheet">
<link href="resources/plugins/nprogress/nprogress.css" rel="stylesheet">
<link href="resources/css/self.css" rel="stylesheet">
<link href="resources/plugins/easyui/themes/bootstrap/easyui.css" rel="stylesheet">
<link href="resources/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="resources/css/style_v2.css" rel="stylesheet">
<link href="resources/plugins/font-awesome/css/font-awesome.css" rel="stylesheet">
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
	<div id="animation" data-open="${openAnimation}"></div>
	<header id="headernavbar" class="navbar<c:if test="${openAnimation eq 1}"> am-animation-slide-top</c:if>">
		<div class="container-fluid expanded-panel">
			<div class="row">
				<div id="logo" class="col-xs-12 col-sm-2">
					<a href="/AdminMenu">JC ManageMent</a>
				</div>
				<div id="top-panel" class="col-xs-12 col-sm-10">
					<div class="row">
						<div class="col-xs-8 col-sm-4">
							<div id="search">
								<input type="text" placeholder="search" /> <i class="fa fa-search"></i>
							</div>
						</div>
						<div class="col-xs-4 col-sm-8 top-panel-right">
							<ul class="nav navbar-nav pull-right panel-menu">
								<li class="hidden-xs"><a class="ajax-link" href="ajax/calendar.html"> <i class="fa fa-calendar"></i> <span class="badge">7</span>
								</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle account" data-toggle="dropdown"> <span class="avatar"> <img src="${user.strpic}<c:if test="${empty user}">resources/img/userpic/avatar.jpg</c:if>" class="img-circle" alt="avatar" />
									</span> <i class="fa fa-angle-down pull-right"></i>
										<div class="user-mini pull-right">
											<span class="welcome">Welcome,</span> <span>${user.username}</span>
										</div>
								</a>
									<ul class="dropdown-menu">
										<li><a href="javascript:LoadAjaxContent('ajax/personinfo_manage')"> <i class="fa fa-user"></i> <span>Profile</span>
										</a></li>
										<li><a href="javascript:LoadAjaxContent('ajax/personal_setting')"> <i class="fa fa-cog"></i> <span>Settings</span>
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
			<div id="sidebar-left" class="col-xs-2 col-sm-2<c:if test="${openAnimation eq 1}"> am-animation-slide-left</c:if>">
				<ul class="nav main-menu">
					<li><a href="dashboard" class="ajax-link"> <i class="fa fa-dashboard"></i> <span class="hidden-xs">Dashboard</span>
					</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-book"></i> <span class="hidden-xs">Books</span>
					</a>
						<ul class="dropdown-menu">
							<c:if test="${managebook eq true}">
								<li><a class="ajax-link" href="book_manage"><i class="fa fa-clipboard"></i> Book Manage</a></li>
							</c:if>
							<c:if test="${managesupplier eq true}">
								<li><a class="ajax-link" href="supplier_manage"><i class="fa fa-pied-piper"></i> Supplier Manage</a></li>
							</c:if>
						</ul></li>
					<c:if test="${planui eq true}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-book"></i> <span class="hidden-xs">Plans</span>
						</a>
							<ul class="dropdown-menu">
								<c:if test="${submitplan eq true}">
									<li><a class="ajax-link" href="plan_submit"><i class="fa fa-paper-plane-o"></i> Plan Submit</a></li>
								</c:if>
								<c:if test="${queryplan eq true}">
									<li><a class="ajax-link" href="plan_query"><i class="fa fa-file-archive-o"></i> Plan Query</a></li>
								</c:if>
								<c:if test="${manageplan eq true}">
									<li><a class="ajax-link" href="plan_manage"><i class="fa fa-paper-plane"></i> Plan Manage</a></li>
								</c:if>
								<c:if test="${manageplan eq true}">
									<li><a class="ajax-link" href="ajax/plan_manage"><i class="fa fa-paper-plane"></i> Plan Manage</a></li>
								</c:if>
							</ul></li>
					</c:if>
					<c:if test="${manageuser eq true}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-suitcase"></i> <span class="hidden-xs">User Manage</span>
						</a>
							<ul class="dropdown-menu">
								<li><a class="ajax-link" href="userinfo_manage"><i class="fa fa-book"></i> User Manage</a></li>
							</ul></li>
					</c:if>
					<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-user"></i> <span class="hidden-xs">Person Setting</span>
					</a>
						<ul class="dropdown-menu">
							<li><a class="ajax-link" href="personinfo_manage"><i class="fa fa-clipboard"></i> Info Manage</a></li>
							<li><a class="ajax-link" href="personal_setting"><i class="fa fa-clipboard"></i> Setting Manage</a></li>
						</ul></li>
					<c:if test="${setting eq true}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"> <i class="fa fa-cog"></i> <span class="hidden-xs">System Settings</span>
						</a>
							<ul class="dropdown-menu">
								<c:if test="${manageuserdepart eq true}">
									<li><a class="ajax-link" href="department_manage"><i class="fa fa-clipboard"></i> Depart Manage</a></li>
								</c:if>
								<c:if test="${manageusertype eq true or managebooktype eq true}">
									<li><a class="ajax-link" href="type_manage"><i class="fa fa-clipboard"></i> Type Manage</a></li>
								</c:if>
								<c:if test="${accesscontrol eq true}">
									<li><a class="ajax-link" href="access_manage"><i class="fa fa-clipboard"></i> Access Manage</a></li>
								</c:if>
							</ul></li>
					</c:if>
					<li class="dropdown"><a href="javascript:logout();" class="dropdown-toggle"> <i class="fa fa-sign-out"></i> <span class="hidden-xs">Log Out</span>
					</a></li>
				</ul>
			</div>
			<!--Start Content-->
			<div id="content" class="col-xs-12 col-sm-10" style="overflow: auto;">
				<div id="about">
					<div class="about-inner"></div>
				</div>
				<div id="preloader" class="preloader">
					<img src="resources/img/devoops_getdata.gif" class="devoops-getdata" alt="preloader" />
				</div>
				<div id="ajax-content" class="<c:if test="${openAnimation eq 1}">am-animation-slide-right</c:if>"></div>
			</div>
			<!--End Content-->
		</div>
	</div>
	<!--End Container-->
	<script src="resources/plugins/jquery/jquery.min.js"></script>
	<script src="resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="resources/plugins/easyui/jquery.easyui.min.js"></script>
	<script src="resources/plugins/nprogress/nprogress.js"></script>
	<script src="resources/js/TeachDialog.js"></script>
	<script src="resources/js/devoops.js"></script>
</body>
</html>
