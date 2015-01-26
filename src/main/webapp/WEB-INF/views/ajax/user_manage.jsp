<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.panel-header, .panel-body {
	border-width: 0px;
}

.datagrid, .combo-p {
	border: solid 1px #D4D4D4;
}

.datagrid * {
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
}

.inlineblock div {
	display: inline-block;
}

.inlineblock div label {
	display: inline-block;
	top: 5px;
}

.inlineblock div input {
	width: 70%;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index.html">Dashboard</a></li>
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

								<div id="operationpanel" class="col-xs-12">
									<div class="alert alert-danger" role="alert">
										<strong>Warning!</strong> <br>[1]Before delelte or edit, you should select <br>[2]If you want clear selected row ,you can refresh the grid.<br>[3]Or you have no power and you can browser users below.
									</div>
									<div class="col-xs-5  col-xs-offset-4">

										<button class="btn btn-default btn-xs adduser">
											<i class="fa fa-file-o"></i> Add A New User
										</button>
										<button class="btn btn-default btn-xs adduser">
											<i class="fa fa-file-o"></i> Copy Users
										</button>
										<button class="btn btn-default btn-xs edituser">
											<i class="fa fa-file-text"></i> Edit A User
										</button>
										<button class="btn btn-default btn-xs removeuser">
											<i class="fa fa-trash-o"></i> Remove A User
										</button>
									</div>

									<div id="addnewuser" class="col-xs-12" style="display: none; padding-top: 5px">
										<div id="newformRange">
											<div class="col-xs-12 inlineblock" style="margin-top: 10px">
												<div class="col-xs-4">
													<label class="col-xs-3">Code</label><input class="newform form-control col-xs-9" id="newCode" type="text" placeholder="Input Book Code" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-3">Name</label><input id="newName" class="newform form-control col-xs-9" type="text" placeholder="Input Book Name" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-3">SN</label><input id="newSN" class="newform form-control col-xs-9" type="text" placeholder="Input Book SN Number" />
												</div>
											</div>
											<div class="col-xs-12 inlineblock" style="margin-top: 10px">
												<div class="col-xs-4">
													<label class="col-xs-3">Price</label><input class="newform form-control col-xs-9" type="text" id="newPrice" placeholder="Input Book's Price" />
												</div>
												<div class="col-xs-4 controls">
													<label class="col-xs-3">Press</label><input class="newform form-control col-xs-9" id="newPress" type="text" placeholder="Input Book's Press" />
												</div>
												<div class="col-xs-4 controls">
													<label class="col-xs-3">Author</label><input class="newform form-control col-xs-9" id="newAuthor" type="text" placeholder="Input Book's Author" />
												</div>

											</div>
											<div class="col-xs-12 inlineblock" style="margin-top: 10px">
												<div class="col-xs-4">
													<label class="col-xs-3">Type</label><span id="newBookTypeSelect"></span>
												</div>
												<div class="col-xs-4 controls">
													<label class="col-xs-3">Supplier</label><span id="newSupplierTypeSelect"></span>
												</div>

												<div class="col-xs-4">
													<label class="col-xs-3">DisCount</label><input class="newform form-control col-xs-9" id="newDisCount" type="text" placeholder="Input Book Discount" />
												</div>

											</div>
										</div>
										<div class="col-xs-12 inlineblock" style="margin-top: 10px">
											<div class="col-xs-5 controls col-xs-offset-5">
												<button class="btn btn-default btn-xs submitAdd" style="width: 100px">Add</button>
												<button class="btn btn-default btn-xs cancelAdd" style="width: 100px">Cancel</button>
											</div>
											<div class="col-xs-6">
												<strong><label style="color: red;" id="adderrormsg"></label></strong>
											</div>
										</div>
									</div>

									<div id="editusercontainer" class="col-xs-12" style="display: none">

										<div class="col-xs-12" style="overflow-x: hidden;">
											<div class="col-xs-12">
												<ul class="nav nav-tabs" role="tablist" id="bookEditTable">
												</ul>
												<div class="tab-content"></div>
											</div>
											<div class="col-xs-12 col-xs-offset-5" style="margin-top: 10px">
												<button class="btn btn-default btn-xs submitEdit">Submit To Modify</button>
												<button class="btn btn-default btn-xs cancelEdit">Cancel</button>
												<strong><label style="color: red;" id="editerrormsg"></label></strong>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default" style="border: 1px solid #CCC;">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForUserTable">
								Basic User Info<span class="fa fa-chevron-down" style="float: right"></span>
							</h4>
						</div>
						<div id="collapseForUserTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<table id="datatable_userinfo">
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$.getScript("resources/js/ajax/bookmanage.js");
	})
</script>