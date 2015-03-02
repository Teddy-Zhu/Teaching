<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<!--        <meta name="viewport" content="width=device-width, initial-scale=1">-->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Teaching ManageMent System</title>
<link rel="alternate icon" type="image/png" href="resources/img/favicon.png">
<link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/self.css" />
<link rel="stylesheet" href="resources/plugins/pnotify/pnotify.custom.min.css" />
<link href="resources/plugins/nprogress/nprogress.css" rel="stylesheet">

</head>
<style>
span.passwordc {
	width: initial;
	top: 0px;
}

.input-group.col-md-7.col-sm-offset-2 {
	margin-top: 10px;
}

.input-span {
	width: 100px;
	text-align: left;
	width: 100px;
}

.alert {
	margin-bottom: 0px;
}

.row div .input-group {
	margin-bottom: 12px;
	width: 100%;
}

.row div .input-group input {
	width: 100% !important;
}

.row div .input-group select {
	width: 100% !important;
}

.ui-pnotify {
	width: 23% !important;
}
</style>
<body>
	<div class="container">
		<div class="col-md-12" style="height: 170px;">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h1 class="text-center" style="color: white; margin-top: 40px;">
					<strong>Teaching ManageMent System</strong>
				</h1>
				<h5 class="text-center" style="color: white; margin-top: 25px;">It's a System For Teaching</h5>
			</div>
			<div class="col-md-3"></div>
			<div class="col-md-12" style="text-align: center">
				<div class="preloader" style="display: none;">
					<img src="resources/img/devoops_getdata.gif" class="devoops-getdata" alt="preloader" />
				</div>
			</div>
		</div>

		<div id="loginModal" class="col-md-12 am-animation-slide-top" style="display: block">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading text-center">Login Your Account and Continue!</div>
						<div class="panel-body text-center">
							<a href="javascript:void(0);" class="glyphicon glyphicon-chevron-down" style="color: #000000; text-decoration: none; font-size: 40px; float: right;"></a>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon input-span"><span class="glyphicon glyphicon-user">User</span></span> <input id="loginUserName" type="text" class="form-control" value="Admin" placeholder="Username">
							</div>

							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock">Password</span></span> <input id="loginPassWord" type="password" value="a" class="form-control" placeholder="Password"><span class="passwordc input-group-addon glyphicon glyphicon-eye-close"></span>
							</div>

							<div class="input-group col-md-7 col-sm-offset-2">
								<button id="loginButton" data-toggle="button" type="button" class="btn btn-primary" style="float: left">Login</button>
								<div class="input-group col-md-9"></div>
								<button id="resetButton" type="button" data-toggle="button" class="btn btn-default" style="float: right">Reset</button>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div id="registerModal" class="col-md-12 am-animation-slide-top" style="display: none;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading text-center">Register Your Account and Continue!</div>
						<div class="panel-body text-center">
							<a href="javascript:void(0);" class="glyphicon glyphicon-chevron-down" style="color: #000000; text-decoration: none; font-size: 40px; float: right;"></a>
							<div class="row" style="margin-bottom: 10px;">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-stats">UserType</span></span><select id="UserType" class="form-control"></select>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-user"> User</span></span> <input id="UserName" type="text" class="form-control" placeholder="Username">
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock">Password</span></span> <input id="PassWord" type="password" class="form-control" placeholder="Password"><span class="passwordc input-group-addon glyphicon glyphicon-eye-close"></span>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock"> Re-Pass</span></span> <input id="RePassWord" type="password" class="form-control" placeholder="Re-Password"><span class="passwordc input-group-addon glyphicon glyphicon-eye-close"></span>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">Depart</span></span> <select id="DepartMent" class="form-control"></select>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">Majors</span></span><select id="Majors" class="form-control"></select>
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">RealName</span></span> <input id="RealName" type="text" class="form-control" placeholder="Your Name">
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">Number</span></span> <input id="StudentId" type="text" class="form-control" placeholder="Your Student Id">
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-envelope"> Email</span></span> <input id="Email" type="text" class="form-control" placeholder="Email">
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock"> Phone</span></span> <input id="Phone" type="text" class="form-control" placeholder="Your Phone Number">
									</div>
								</div>
								<div class="col-md-4"></div>
							</div>
							<div class="row">
								<div class="col-md-6 col-md-offset-1">
									<div class="input-group">
										<button id="registerButton" data-toggle="button" type="button" class="btn btn-primary" style="float: left">Register</button>
										<button id="resetRegButton" type="button" data-toggle="button" class="btn btn-default" style="float: right">Reset</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="col-md-12">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<h5 class="text-center" style="color: white; margin-top: 10px;">Designed By ZhuXi Powered By Bootstrap And Others OpenCode.</h5>
				<h5 class="text-center" style="color: white; margin-top: 10px;">
					<strong>Copy Right©2014-${year} JinChengOpenSource Inc.</strong> <br> <br> <a href="#" class="label label-default UserAccount">Avaiable UserAccount For Test</a><br> <br> <a href="#" class="label label-default version" style="margin-top: 10px"><strong>Current
							Version :${version}</strong></a>
				</h5>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<script type="text/javascript" src="resources/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="resources/plugins/bootstrap/bootstrap.min.js"></script>
	<script src="resources/plugins/nprogress/nprogress.js"></script>
	<script type="text/javascript" src="resources/js/TeachDialog.js"></script>
	<script type="text/javascript" src="resources/js/index.js"></script>
</body>
</html>