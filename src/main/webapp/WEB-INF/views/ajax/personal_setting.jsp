<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
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
			<li><a href="#">个人</a></li>
			<li><a href="#">个人管理</a></li>
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
					<i class="fa fa-clipboard"></i> <span>用户个人设置</span>
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
						个人设置面板 <small>设置详细信息</small>
					</h1>
				</div>
				<div class="inlineblock col-xs-12" id="inlineblock">
					<c:if test="${querybook eq true}">
						<div class="col-xs-7 col-xs-offset-1 div-mtop">
							<label class="col-xs-5">书籍分页大小:</label><input id="BookGridSize" class="settingForm form-control col-xs-7" value="${bookgridsize}" />
						</div>
						<div class="col-xs-3 div-mtop"></div>
					</c:if>
					<c:if test="${queryuser eq true}">
						<div class="col-xs-7 col-xs-offset-1 div-mtop">
							<label class="col-xs-5">用户分页大小:</label><input id="UserGridSize" class="settingForm form-control col-xs-7" value="${usergridsize}" />
						</div>
						<div class="col-xs-3 div-mtop"></div>
					</c:if>
					<c:if test="${querysupplier eq true}">
						<div class="col-xs-7 col-xs-offset-1 div-mtop">
							<label class="col-xs-5">供应商分页大小:</label><input id="SupplierGridSize" class="settingForm form-control col-xs-7" value="${suppliergridsize}" />
						</div>
						<div class="col-xs-3 div-mtop"></div>
					</c:if>
					<c:if test="${queryplan eq true}">
						<div class="col-xs-7 col-xs-offset-1 div-mtop">
							<label class="col-xs-5">计划分页大小:</label><input id="PlanGridSize" class="settingForm form-control col-xs-7" value="${plangridsize}" />
						</div>
						<div class="col-xs-3 div-mtop"></div>
					</c:if>
					<div class="col-xs-7 col-xs-offset-1 div-mtop">
						<label class="col-xs-5">页面动画:</label><input id="AnimationToggle" class="settingForm" type="checkbox" data-open="${openAnimation}" />
					</div>
					<div class="col-xs-3 div-mtop"></div>
				</div>
				<div class="col-xs-7 col-xs-offset-1 div-mtop">
					<button id="savechange" data-toggle="button" type="button" class="btn btn-primary">保存设置</button>
					<button id="reset" data-toggle="button" type="button" class="btn btn-default pull-right">重置</button>
				</div>
				<div class="col-xs-4" style="height: 50px;"></div>
				<div class="panel-footer row">
					<h5>更新你的个人设置.</h5>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		LoadJsFile([ "resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js", "resources/plugins/bootstrap-switch/bootstrap-switch.min.js" ]).done(function() {
			$.getScript("resources/js/ajax/min/personalsetting.js");
		})
	})
</script>