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
	margin-right: 3.2%;
	width: 14.9%;
}

.SearchForm {
	display: inline-block;
	width: 15%;
	margin-right: 10px;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index.html">Dashboard</a></li>
			<li><a href="#">Plans</a></li>
			<li><a href="#">Plan Submit</a></li>
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
					<i class="fa fa-clipboard"></i> <span>User Personal Information</span>
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
						Plan Submit Panel <small>please fill the form carefully</small>
					</h1>
				</div>
				<div class="inlineblock">
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Course Name:</label><input id="CourseName" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Course Name" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Course Type</label><select id="CourseType" class="planinfo form-control col-xs-7 input-lg-self"></select>
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Class Id:</label><input id="ClassId" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Class Id" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Student Count:</label><input id="StudentCount" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Student Book Count" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Teacher Count:</label><input id="TeacherCount" class="planinfo form-control col-xs-7 input-lg-self" type="text" placeholder="Input Teacher Book Count" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Book:</label>
						<div class="input-group col-md-7">
							<select id="BookId" class="planinfo form-control" style="width: 71% !important"></select> <span class="input-group-btn">
								<button id="bookselect" class="btn btn-default form-control" style="width: 93%" type="button">Select</button>
							</span>
						</div>
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Plan Time:</label> <label class="col-xs-1" style="margin-left: -3.5%;">From</label><input id="FromYear" class="planinfo form-control input-lg-self col-xs-1" style="width: 20% !important; margin-left: 6%;" type="text" placeholder="From Year" /><label class="col-xs-1"
							style="margin-left: -3.5%;">To</label><input id="ToYear" style="width: 20% !important; margin-left: 1%;" class="planinfo form-control input-lg-self col-xs-1" type="text" placeholder="ToYear" />
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5"> Term:</label><select id="Term" class="planinfo form-control col-xs-7 input-lg-self"><option value="0">上半学年</option>
							<option value="1">下半学年</option></select>
					</div>
					<div class="col-xs-6"></div>
					<div class="col-xs-5 col-xs-offset-1">
						<label class="col-xs-5">Mark:</label>
						<textarea id="Mark" class="planinfo form-control col-xs-7">none</textarea>
					</div>
					<div class="col-xs-6"></div>

				</div>
				<div class="col-xs-12" style="height: 30px;"></div>
				<div class="col-xs-5 col-xs-offset-1">
					<button id="submitform" data-toggle="button" type="button" class="btn btn-primary">Submit Plan</button>
					<button id="reset" data-toggle="button" type="button" class="btn btn-default pull-right">Reset</button>
				</div>
				<div class="col-xs-6" style="height: 50px;"></div>
				<div class="panel-footer row" style="margin-top: 10px;">
					<h5>After you submit the form,admin will aduit it.Any Questions ,please contact administrator.</h5>
				</div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	<c:if test="${submitplan eq true}">
	$(function() {
		$.getScript("resources/plugins/bootstarp-datepicker/js/bootstrap-datepicker.min.js", function() {
			$.getScript("resources/js/ajax/plan_submit.js");
		})
	})
	</c:if>
</script>