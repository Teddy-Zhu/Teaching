<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.inlineblock {
	margin-top: 10px;
	margin-bottom: 15px;
}

.panel-title {
	cursor: pointer
}

.inlineblock div {
	display: inline-block;
	height: 40px;
}

.inlineblock div label {
	display: inline-block;
	margin-top: 1%;
}

.inlineblock div select {
	width: 57% !important;
}

.inlineblock div img {
	height: 100px;
	width: 100px;
}

.inlineblock div input {
	width: 57% !important;
}

.imgh {
	height: 106px !important;
}

.input-lg-self {
	height: 30px;
}

.userpic {
	cursor: pointer;
	border-width: thick;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">个人设置</a></li>
			<li><a href="#">个人信息管理</a></li>
		</ol>
		<div id="social" class="pull-right">
			<a href="#"><i class="fa fa-google-plus"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-youtube"></i></a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name">
					<i class="fa fa-clipboard"></i> <span>个人信息面板</span>
				</div>
				<div class="box-icons">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="expand-link"> <i class="fa fa-expand"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
				<div class="no-move"></div>
			</div>
			<div class="box-content table-responsive" style="padding-top: 15px">
				<div class="page-header">
					<h1>
						个人信息 <small>编辑详细</small>
					</h1>
				</div>
				<div class="inlineblock" id="inlineblock">
					<div class="col-xs-5 col-xs-offset-1 imgh">
						<label class="col-xs-5 " style="margin-top: 11%">头像:</label><img id="UserPic" name="UserPic" src="${user.strpic}" alt="${user.username}" data-origin="${user.strpic}" data-new="" class="img-circle img-thumbnail"> <input onchange="picChange();" type="file" id="picfile" name="picfile"
							style="display: none;" accept=".jpg,.png" />
						<button id="picUpload" class="img-circle fa fa-upload btn btn-md" style="display: none; border-radius: 50%; width: 50px; height: 50px"></button>
						<button id="picReset" class="img-circle fa fa-trash btn btn-md" style="display: none; border-radius: 50%; width: 50px; height: 50px"></button>
					</div>
					<div class="col-xs-6 imgh"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">用户名:</label><input id="UserName" class="perinfo form-control col-xs-7 input-lg-self" type="text" value="${user.username}" disabled />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">密码:</label><input id="OldPassword" class="perinfo form-control col-xs-7 input-lg-self" type="password" placeholder="Input Password" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">新密码:</label><input id="Password" class="perinfo form-control col-xs-7 input-lg-self" type="password" placeholder="Input New Password" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">重复新密码:</label><input id="RePassword" class="perinfo form-control col-xs-7 input-lg-self" type="password" placeholder="Input New Password Again" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">用户组:</label><select class="form-control col-xs-7 input-lg-self" disabled><option value="0">${user.userType.strname}</option></select>
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">系部:</label><select id="DepartMent" data-curValue="${user.intuserdepartment}" class="perinfo form-control col-xs-7 input-lg-self"></select>
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">专业:</label><select id="Major" data-curValue="${user.intusermajor}" class="perinfo form-control col-xs-7 input-lg-self"></select>
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">姓名:</label><input id="RealName" class="perinfo form-control col-xs-7 input-lg-self" type="text" value="${user.strname}" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">学生号:</label><input id="Number" class="perinfo form-control col-xs-7 input-lg-self" type="text" value="${user.strstunum}" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">手机:</label><input id="Phone" class="perinfo form-control col-xs-7 input-lg-self" type="text" value="${user.strphone}" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">邮箱:</label><input id="Email" class="perinfo form-control col-xs-7 input-lg-self" type="text" value="${user.strmail}" />
					</div>
					<div class="col-xs-6"></div>

				</div>
				<div class="col-xs-5 col-xs-offset-1">
					<button id="savechange" data-toggle="button" type="button" class="btn btn-primary">保存信息</button>
					<button id="reset" data-toggle="button" type="button" class="btn btn-default pull-right">重置</button>
				</div>
				<div class="col-xs-6" style="height: 50px;"></div>
				<div class="panel-footer row" style="margin-top: 10px;">
					<h5>如果你忘记了你的密码，请联系管理.</h5>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		LoadJS("resources/plugins/jqueryajaxupload/jquery.iframe-transport.min.js").done(function() {
				$.getScript("resources/js/ajax/min/personalinfo.js");
		});
	})
</script>