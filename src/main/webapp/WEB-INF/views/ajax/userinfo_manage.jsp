<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/plugins/bootstarp-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet">
<style>
.panel-header, .panel-body {
	border-width: 0px;
}

.datagrid, .combo-p {
	border: solid 1px #D4D4D4;
}

.inlineblock {
	margin-top: 10px;
}

.inlineblock div {
	display: inline-block;
}

.inlineblock div label {
	display: inline-block;
	top: 5px;
}

.inlineblock div select {
	width: 65%;
}

.inlineblock div input {
	width: 65%;
}

.searchClass {
	margin-left: 5%;
	margin-top: 1%;
}

.searchClass label {
	width: 9%;
}

#Search {
	float: right;
	margin-right: 3.7%;
	width: 14%;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">User Manage</a></li>
			<li><a href="#">Users Query</a></li>
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
					<i class="fa fa-clipboard"></i> <span>Users Information</span>
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

				<div class="panel panel-default" style="border: 1px solid #CCC;">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForAdd">
							Function Menu <span class="fa fa-chevron-down" style="float: right"></span>
						</h4>
					</div>

					<div id="collapseForAdd" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<div class="container-fluid" style="margin-top: 10px;">

								<div id="operationpanel" class="col-xs-12" style="overflow-x: hidden;">
									<div class="alert alert-danger" role="alert">
										<strong>Warning,Hold your action!</strong> <br>[1]Before delete or edit, you should select <br>[2]If you want clear selected row quickly,you can refresh the grid.<br>[3]Or you have no power and you can browser users below.
									</div>
									<div class="col-xs-12 btn-menu-top-minus">
										<c:if test="${adduser eq true}">
											<button class="btn btn-primary btn-sm adduser">
												<i class="fa fa-file-o"></i> Add A New User
											</button>
										</c:if>
										<c:if test="${edituser eq true}">
											<button class="btn btn-primary btn-sm edituser">
												<i class="fa fa-file-text"></i> Edit A User
											</button>
										</c:if>
										<c:if test="${rmuser eq true}">
											<button class="btn btn-danger btn-sm removeuser">
												<i class="fa fa-trash-o"></i> Remove A User
											</button>
										</c:if>
									</div>
								</div>
								<c:if test="${adduser eq true}">
									<div id="addnewuser" class="col-xs-12" style="display: none; padding-top: 5px">
										<div id="newformRange">
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-4">UserName</label><input class="newform form-control col-xs-8" id="newUserName" type="text" placeholder="Input UserName" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-4">Password</label><input class="newform form-control col-xs-8" id="newPassword" type="text" placeholder="Input New Passsword" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-4">RealName</label><input class="newform form-control col-xs-8" id="newRealName" type="text" placeholder="Input Real Name" />
												</div>
											</div>
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4 controls">
													<label class="col-xs-4">Type</label><select class="newform form-control" id="newType"></select>
												</div>
												<div class="col-xs-4 controls">
													<label class="col-xs-4">Number</label><input class="newform form-control col-xs-8" id="newNumber" type="text" placeholder="Input Student ID" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-4">Email</label><input class="newform form-control col-xs-8" id="newEmail" type="text" placeholder="Input Email" />
												</div>
											</div>
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-4">Phone</label><input class="newform form-control col-xs-8" id="newPhone" type="text" placeholder="Input Phone" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-4">DepartMent</label><select class="newform form-control" id="newDepartMent"></select>
												</div>
												<div class="col-xs-4 controls">
													<label class="col-xs-4">Major</label><select class="newform form-control" id="newMajor"></select>
												</div>
											</div>
										</div>
										<div class="col-xs-12 inlineblock">
											<div class="col-xs-12 btn-menu">
												<button class="btn btn-primary btn-sm submitAdd" style="width: 100px">Add</button>
												<button class="btn btn-default btn-sm cancelAdd" style="width: 100px">Cancel</button>
												<strong><label style="color: red;" id="adderrormsg"></label></strong>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${edituser eq true}">
									<div id="editusercontainer" class="col-xs-12" style="display: none; overflow-x: hidden;">
										<div class="col-xs-12">
											<ul class="nav nav-tabs" role="tablist" id="userEditTable">
											</ul>
											<div class="tab-content"></div>
										</div>
										<div class="col-xs-12 btn-menu-top-plus">
											<button class="btn btn-primary btn-sm submitEdit">Submit To Modify</button>
											<button class="btn btn-default btn-sm cancelEdit">Cancel</button>
											<strong><label style="color: red;" id="editerrormsg"></label></strong>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<c:if test="${queryuser eq true}">
					<div class="panel panel-default" style="border: 1px solid #CCC;">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForUserTable">
								Basic User Info<span class="fa fa-chevron-down" style="float: right"></span>
							</h4>
						</div>
						<div id="collapseForUserTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body" style="overflow-x: hidden;"></div>
							<div class="searchClass row">
								<div class="col-xs-12">
									<label>UserName</label><input class="SearchForm form-control" type="text" id="SearchUserName" /> <label>RealName</label><input class="SearchForm form-control" type="text" id="SearchRealName" /> <label>UserType</label><input class="SearchForm form-control" type="text" id="SearchUserType" />
									<label>Id</label><input class="SearchForm form-control" id="SearchId" />
								</div>
								<div class="col-xs-12">
									<label>DepartMent</label><input class="SearchForm form-control" type="text" id="SearchDepartMent" /> <label>Major</label><input class="SearchForm form-control" type="text" id="SearchMajor" /> <label>Phone</label><input class="SearchForm form-control" id="SearchPhone" type="text" /> <label>Email</label><input
										class="SearchForm form-control" type="text" id="SearchEmail" />
								</div>
								<div class="col-xs-12">
									<label>CreateTime</label><input class="SearchForm form-control" type="text" id="SearchTime" ReadOnly />
									<button id="Search" class="btn btn-primary btn-xs" style="height: 30px">Search</button>
								</div>
							</div>
							<table id="datatable_userinfo" data-size="${usergridsize}" style="width: 100%">
							</table>
						</div>
					</div>
				</c:if>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	<c:if test="${manageuser eq true}">
	$(function() {
		LoadJsFile([ "resources/plugins/bootstarp-datepicker/js/bootstrap-datepicker.min.js" ]).done(function() {
			$.getScript("resources/js/ajax/userinfomanage.js");
		})
	})
	</c:if>
</script>