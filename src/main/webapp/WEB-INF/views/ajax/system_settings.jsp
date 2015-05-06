<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/plugins/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">
<style>
.inlineblock {
	margin-top: 10px;
	margin-bottom: 15px;
}

.input-group.bootstrap-touchspin {
	width: 40%;
}

.panel-title {
	cursor: pointer
}

.form-control {
	height: 34px;
}

.div-mtop {
	margin-top: 1%;
}

.col-xs-3.div-mtop {
	height: 30px;
}

.inlineblock div label {
	text-align: center;
	margin-top: 1.5%;
}

.inlineblock div input {
	width: 40%;
}

.alert {
	margin-bottom: 0px;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">系统设置</a></li>
			<li><a href="#">全局设置</a></li>
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
					<i class="fa fa-clipboard"></i> <span>全局设置面板</span>
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
						全局设置 <small>请谨慎修改</small>
					</h1>
				</div>
				<div class="inlineblock col-xs-12" id="inlineblock">
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">前台标题:</label><input id="GlobalTitle" class="settingForm form-control" type="text" value="${GlobalTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">后台标题:</label><input id="BackGroundTitle" class="settingForm form-control" type="text" value="${BackGroundTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">登陆页头部标题:</label><input id="LoginPageTitle" class="settingForm form-control" type="text" value="${LoginPageTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">登陆页小标题:</label><input id="LoginPageSTitle" class="settingForm form-control" type="text" value="${LoginPageSTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">弹出框动画速度:</label> <select id="DialogClassSpeed" class="settingForm form-control" style="width: 40%" data-value="${DialogClassSpeed}"><option value="animated-slow">慢速</option>
							<option value="animated">正常</option>
							<option value="animated-fast">快速</option></select>
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">弹出框动态效果:</label>
						<div class="input-group col-xs-7">
							<select id="DialogClassAnimation" class="settingForm form-control" data-value="${DialogClassAnimation}" style="width: 50%"></select>
							<button id="diglogClassTest" class="btn btn-info form-control" style="width: 18.33333333%" type="button">测试</button>
						</div>
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">开启计划提交功能:</label><input id="planSubmitToggle" class="settingForm" type="checkbox" data-open="${AllowPlanSubmit}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>

				</div>
				<div class="col-xs-7 col-xs-offset-1 div-mtop">
					<button id="savechange" data-toggle="button" type="button" class="btn btn-primary">保存设置</button>
					<button id="reset" data-toggle="button" type="button" class="btn btn-default pull-right">重置</button>
				</div>
				<div class="col-xs-4" style="height: 50px;"></div>
				<div class="panel-footer row">
					<h5>更新全局设置.</h5>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		<c:if test="${systemsetting eq true}">
		LoadJsFile([ "resources/plugins/bootstrap-switch/bootstrap-switch.min.js" ]).done(function() {
			$.getScript("resources/js/ajax/min/systemsettings.js");
		})
		</c:if>
	})
</script>