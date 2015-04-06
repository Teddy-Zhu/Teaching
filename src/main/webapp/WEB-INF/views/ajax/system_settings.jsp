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
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">System Settings</a></li>
			<li><a href="#">System Setting</a></li>
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
					<i class="fa fa-clipboard"></i> <span>Global Settings</span>
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
						Global Settings <small>detail for setting</small>
					</h1>
				</div>
				<div class="inlineblock col-xs-12" id="inlineblock">
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">Global Title:</label><input id="GlobalTitle" class="settingForm form-control" type="text" value="${GlobalTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">BackGround Title:</label><input id="BackGroundTitle" class="settingForm form-control" type="text" value="${BackGroundTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">Login Page Title:</label><input id="LoginPageTitle" class="settingForm form-control" type="text" value="${LoginPageTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">Login Page Second Title:</label><input id="LoginPageSTitle" class="settingForm form-control" type="text" value="${LoginPageSTitle}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">Dialog Animation Speed:</label> <select id="DialogClassSpeed" class="settingForm form-control" style="width: 40%" data-value="${DialogClassSpeed}"><option value="animated-slow">Slow</option>
							<option value="animated">Normal</option>
							<option value="animated-fast">Fast</option></select>
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">Dialog Show Animation:</label>
						<div class="input-group col-xs-7">
							<select id="DialogClassAnimation" class="settingForm form-control" data-value="${DialogClassAnimation}" style="width: 50%"></select>
							<button id="diglogClassTest" class="btn btn-info form-control" style="width: 18.33333333%" type="button">Test</button>
						</div>
					</div>
					<div class="col-xs-3 div-mtop"></div>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">Enable Plan Submit:</label><input id="planSubmitToggle" class="settingForm" type="checkbox" data-open="${AllowPlanSubmit}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>

				</div>
				<div class="col-xs-7 col-xs-offset-1 div-mtop">
					<button id="savechange" data-toggle="button" type="button" class="btn btn-primary">Save Settings</button>
					<button id="reset" data-toggle="button" type="button" class="btn btn-default pull-right">Reset</button>
				</div>
				<div class="col-xs-4" style="height: 50px;"></div>
				<div class="panel-footer row">
					<h5>Change your personal settings.</h5>
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