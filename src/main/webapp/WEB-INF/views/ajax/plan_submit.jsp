<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/plugins/bootstarp-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet">
<style>
.datagrid, .combo-p {
	border: solid 1px #D4D4D4;
}

.datagrid * {
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
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
	margin-right: 7%;
	width: 14%;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">计划</a></li>
			<li><a href="#">计划提交</a></li>
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
					<i class="fa fa-clipboard"></i> <span>计划提交面板</span>
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
						提交计划 <small>请仔细填写</small>
					</h1>
				</div>
				<c:choose>
					<c:when test="${AllowPlanSubmit eq '1'}">
						<div class="inlineblock">

							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">课程名:</label><input id="CourseName" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Course Name" />
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">课程类型</label><select id="CourseType" class="planinfo form-control col-xs-7 input-lg-self"></select>
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">班级:</label><input id="ClassId" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Class Id" />
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">学生数:</label><input id="StudentCount" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Student Book Count" />
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">教师数:</label><input id="TeacherCount" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Teacher Book Count" />
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">书籍:</label>
								<div class="input-group col-xs-7">
									<select id="BookId" class="planinfo form-control" style="width: 71% !important"></select>
									<button id="bookselect" class="btn btn-info form-control" style="width: 26%" type="button">选择</button>
								</div>
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">计划时间:</label> <label class="col-xs-1" style="margin-left: -3.5%;">开始</label><input id="FromYear" class="planinfo form-control input-lg-self col-xs-1" style="width: 20% !important; margin-left: 6%;" type="text" placeholder="From Year" /><label class="col-xs-1"
									style="margin-left: -3.5%;">结束</label><input id="ToYear" style="width: 20% !important; margin-left: 1%;" class="planinfo form-control input-lg-self col-xs-1" type="text" placeholder="ToYear" />
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5"> 学期:</label><select id="Term" class="planinfo form-control col-xs-7 input-lg-self"><option value="0">上半学年</option>
									<option value="1">下半学年</option></select>
							</div>
							<div class="col-xs-6"></div>
							<div class="col-xs-5 col-xs-offset-1">
								<label class="col-xs-5">备注:</label>
								<textarea id="Mark" class="planinfo form-control col-xs-7">none</textarea>
							</div>
							<div class="col-xs-6"></div>
						</div>
						<div class="col-xs-12" style="height: 30px;"></div>
						<div class="col-xs-5 col-xs-offset-1">
							<button id="submitform" data-toggle="button" type="button" class="btn btn-primary">提交计划</button>
							<button id="reset" data-toggle="button" type="button" class="btn btn-default pull-right">重置</button>
						</div>
						<div class="col-xs-6" style="height: 50px;"></div>
					</c:when>
					<c:otherwise>
						<div class="jumbotron">
							<h1 style="margin-bottom: 1.5%">
								<span class="label label-info">警告!</span>
							</h1>
							<p>这个功能被临时关闭了!</p>
							<p>请联系管理员打开它，或者等待开启</p>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="panel-footer row" style="margin-top: 10px;">
					<h5>在你确认提交后管理员会进行审核，如果有任何问题，请联系管理员.</h5>
				</div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	<c:if test="${submitplan eq true and AllowPlanSubmit eq '1'}">
	$(function() {
		$.getScript("resources/plugins/bootstarp-datepicker/js/bootstrap-datepicker.min.js", function() {
			$.getScript("resources/js/ajax/min/plan_submit.js");
		})
	})
	</c:if>
</script>