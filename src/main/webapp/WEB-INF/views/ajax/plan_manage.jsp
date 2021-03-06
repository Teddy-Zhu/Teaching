<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/plugins/bootstarp-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet">
<link href="resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet">
<style>
.datagrid, .combo-p {
	border: solid 1px #D4D4D4;
}

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
	top: 5px;
}

.inlineblock div select {
	width: 57% !important;
}

.inlineblock div input {
	width: 57% !important;
}

.inlineblock div textarea {
	width: 57% !important;
}

.input-lg-self {
	height: 30px;
}

.searchClass {
	margin-left: 1%;
	margin-top: 1%;
}

.searchClass label {
	width: 8%;
}

#Search {
	float: right;
	margin-right: 8.3%;
	width: 13.9%;
}

.bootstrap-touchspin {
	margin-bottom: 3%;
}

.bootstrap-touchspin input {
	height: 34px;
}

.modal-body div label {
	margin-top: 1.5%;
}

.DialogSearchForm {
	display: inline-block;
	width: 14%;
	margin-right: 10px;
	height: 30px;
}

#DialogSearch {
	float: right;
	margin-right: 7.5%;
	width: 14%;
}
</style>
<!--[if gte IE 8]>
//fix font awesome icon for ie
<style>
.l-btn-icon {
font-size:inherit;
}
</style>
<![endif]-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">计划</a></li>
			<li><a href="#">计划管理</a></li>
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
					<i class="fa fa-clipboard"></i> <span>计划管理面板</span>
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
				<c:if test="${manageplan eq true}">
					<div class="panel panel-default" style="border: 1px solid #CCC;">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForsupplierTable">
								计划信息<span class="fa fa-chevron-down" style="float: right"></span>
							</h4>
						</div>
						<div id="collapseForsupplierTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body" style="overflow-x: hidden; overflow-y: hidden; width: 100%">
								<div class="searchClass row">
									<div class="col-xs-12">
										<label>课程名</label><input class="SearchForm form-control" type="text" id="CourseName" /> <label>课程类型</label><select class="SearchForm form-control" id="CourseType">
											<option value="-1">所有类型</option>
										</select> <label>班级</label><input class="SearchForm form-control" type="text" id="ClassId" /> <label>书名</label><input class="SearchForm form-control" type="text" id="BookName" />
									</div>
									<div class="col-xs-12">
										<label>计划状态</label><select class="SearchForm form-control" id="PlanStatus">
											<option value="-1">所有状态</option>
										</select> <label>开始学年</label><input class="SearchForm form-control" type="text" id="FromYear" /> <label>结束学年</label><input class="SearchForm form-control" type="text" id="ToYear" /> <label>学期</label><select class="SearchForm form-control" id="Term">
											<option value="-1">全部</option>
											<option value="0">上半学年</option>
											<option value="1">下半学年</option>
										</select>
									</div>
									<div class="col-xs-12">
										<label>学生数</label><input class="SearchForm form-control" type="text" id="StuCount" /> <label>教师数</label><input class="SearchForm form-control" type="text" id="TeaCount" /> <label>申请日期</label><input class="SearchForm form-control" type="text" id="SearchDate" ReadOnly />
										<label>申请人</label>

										<div class="input-group" style="display: inline-flex; margin-left: -0.3%; width: 15.4%;">
											<select id="UserId" class="SearchForm form-control" style="width: 56% !important; margin-right: 0px;"></select>
											<button id="userselect" class="btn btn-info form-control" style="width: 34%" type="button">选择</button>
										</div>
									</div>
									<div class="col-xs-12">
										<div id="notification" class="alert alert-success col-xs-9" role="alert" style="color: black; line-height: 0px; height: 30px; margin-bottom: 0px;">未选择计划</div>
										<button id="Search" class="btn btn-primary btn-xs" style="height: 30px;">搜索</button>
									</div>
								</div>
								<table id="datatable_perplaninfo" data-size="${plangridsize}" style="width: 100%">
								</table>
							</div>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	<c:if test="${manageplan eq true}">
	$(function() {
		LoadJsFile([ "resources/plugins/bootstarp-datepicker/js/bootstrap-datepicker.min.js", "resources/plugins/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js" ]).done(function() {
			$.getScript("resources/js/ajax/min/plan_manage.js");
		})
	})
	</c:if>
</script>