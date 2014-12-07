<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Teaching ManageMent System</title>

<script type="text/javascript" src="resources/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="resources/plugins/bootstrap/bootstrap.min.js"></script>
<link rel="alternate icon" type="image/png" href="resources/img/favicon.png">
<link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/self.css" />
<script type="text/javascript" src="resources/js/TeachDialog.js"></script>
<script type="text/javascript" src="resources/js/index.js"></script>

</head>
<body style="background-color: #353535 ! important;">
	<div class="container">
		<div class="col-md-12" style="height: 200px;">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h1 class="text-center" style="color: white; margin-top: 50px;">
					<strong>Teaching ManageMent System</strong>
				</h1>
				<h5 class="text-center" style="color: white; margin-top: 50px;">It's a System For Teaching</h5>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div id="loginModal" class="col-md-12 zx-anima-slide-top">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading text-center">Login Your Account and Continue!</div>
						<div class="panel-body text-center">
							<a href="javascript:void(0);" class="glyphicon glyphicon-chevron-down" style="color: #000000; text-decoration: none; font-size: 40px; float: right; margin-right: 20px;"></a>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-user">User</span></span> <input id="loginUserName" type="text" class="form-control" placeholder="Username">
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-lock">Password</span></span> <input id="loginPassWord" type="password" class="form-control" placeholder="Password"><span class="input-group-addon glyphicon glyphicon-eye-close"
									style="top: 0px"></span>
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<button id="loginButton" data-toggle="button" type="button" class="btn btn-primary" style="float: left">Login</button>
								<button id="resetButton" type="button" data-toggle="button" class="btn btn-default" style="float: right">Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div id="registerModal" class="col-md-12 zx-anima-slide-top" style="display: none;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading text-center">Register Your Account and Continue!</div>
						<div class="panel-body text-center">

							<a href="javascript:void(0);" class="glyphicon glyphicon-chevron-down" style="color: #000000; text-decoration: none; font-size: 40px; float: right; margin-right: 20px;"></a>

							<div id="UserType" class="col-md-7 col-sm-offset-2 btn-group" style="padding-left: 0px; margin-bottom: 20px" data-toggle="buttons"></div>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-user"> User</span></span> <input id="UserName" type="text" class="form-control" placeholder="Username">
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-lock">Password</span></span> <input id="PassWord" type="password" class="form-control" placeholder="Password"><span class="input-group-addon glyphicon glyphicon-eye-close"
									style="top: 0px"></span>
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-lock"> Re-Pass</span></span> <input id="RePassWord" type="password" class="form-control" placeholder="Re-Password"><span class="input-group-addon glyphicon glyphicon-eye-close"
									style="top: 0px"></span>
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-file">RealName</span></span> <input id="RealName" type="text" class="form-control" placeholder="Your Name">
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-envelope"> Email</span></span> <input id="Email" type="text" class="form-control" placeholder="Email">
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<span class="input-group-addon" style="width: 100px; text-align: left;"><span class="glyphicon glyphicon-lock"> Phone</span></span> <input id="Phone" type="text" class="form-control" placeholder="Your Phone Number">
							</div>
							<br>
							<div class="input-group col-md-7 col-sm-offset-2">
								<button id="registerButton" data-toggle="button" type="button" class="btn btn-primary" style="float: left">Register</button>
								<button id="resetRegButton" type="button" data-toggle="button" class="btn btn-default" style="float: right">Reset</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="col-md-12">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h5 class="text-center" style="color: white; margin-top: 10px;">Designed By ZhuXi Powered By Bootstrap And Others OpenCode.</h5>
				<h5 class="text-center" style="color: white; margin-top: 10px;">
					<strong>Copy Right©2014 JinChengOpenSource Inc.</strong>
				</h5>
			</div>
			<div class="col-md-3"></div>
		</div>


	</div>
</body>
</html>