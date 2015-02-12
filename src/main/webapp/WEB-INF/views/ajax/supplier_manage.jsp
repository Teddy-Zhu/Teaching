<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.panel-header, .panel-body {
	border-width: 0px;
}

.panel-title {
	cursor: pointer
}

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
}

.inlineblock div {
	display: inline-block;
}

.inlineblock div label {
	display: inline-block;
	top: 5px;
}

.inlineblock div select {
	width: 48%;
}

.inlineblock div input {
	width: 48%;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index.html">Dashboard</a></li>
			<li><a href="#">Books Manage</a></li>
			<li><a href="#">Supplier Query</a></li>
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
					<i class="fa fa-clipboard"></i> <span>Supplier Information</span>
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
										<strong>Warning,Hold your action!</strong> <br>[1]Before delete or edit, you should select <br>[2]If you want clear selected row quickly,you can refresh the grid.<br>[3]Or you have no power and you can browser suppliers below.
									</div>
									<div class="col-xs-10  col-xs-offset-3">
										<c:if test="${addsupplier eq true}">
											<button class="btn btn-default btn-xs addsupplier">
												<i class="fa fa-file-o"></i> Add A New Supplier
											</button>
										</c:if>
										<c:if test="${editsupplier eq true}">
											<button class="btn btn-default btn-xs editsupplier">
												<i class="fa fa-file-text"></i> Edit A Supplier
											</button>
										</c:if>
										<c:if test="${rmsupplier eq true}">
											<button class="btn btn-danger btn-xs removesupplier">
												<i class="fa fa-trash-o"></i> Remove A Supplier
											</button>
										</c:if>
									</div>
								</div>
								<c:if test="${addsupplier eq true}">
									<div id="addnewsupplier" class="col-xs-12" style="display: none; padding-top: 5px">
										<div id="newformRange">
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-6">Code</label><input class="newform form-control col-xs-6" id="newCode" type="text" placeholder="Input Code" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">Name</label><input class="newform form-control col-xs-6" id="newName" type="text" placeholder="Input Name" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">Address</label><input class="newform form-control col-xs-6" id="newAddress" type="text" placeholder="Input Address" />
												</div>
											</div>
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4 controls">
													<label class="col-xs-6">Company Phone</label><input class="newform form-control col-xs-6" id="newCompanyPhone" placeholder="Input Company Phone" />
												</div>
												<div class="col-xs-4 controls">
													<label class="col-xs-6">Handle Person</label><input class="newform form-control col-xs-6" id="newHandlePerson" type="text" placeholder="Input Handle Person" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">Handle Phone</label><input class="newform form-control col-xs-6" id="newHandlePhone" type="text" placeholder="Input Handle Phone" />
												</div>
											</div>
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-6">Contact Person</label><input class="newform form-control col-xs-6" id="newContactPerson" type="text" placeholder="Input Contact Person" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">Contact Phone</label><input class="newform form-control col-xs-6" id="newContactPhone" placeholder="Input Contact Phone" />
												</div>
												<div class="col-xs-4">
													<strong><label style="color: red;" id="adderrormsg"></label></strong>
												</div>
											</div>
										</div>
										<div class="col-xs-12 inlineblock">
											<div class="col-xs-6 controls col-xs-offset-4">
												<button class="btn btn-default btn-xs submitAdd" style="width: 100px">Add</button>
												<button class="btn btn-default btn-xs cancelAdd" style="width: 100px">Cancel</button>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${editsupplier eq true}">
									<div id="editsuppliercontainer" class="col-xs-12" style="display: none; overflow-x: hidden;">
										<div class="col-xs-12">
											<ul class="nav nav-tabs" role="tablist" id="supplierEditTable">
											</ul>
											<div class="tab-content"></div>
										</div>
										<div class="col-xs-12 col-xs-offset-5" style="margin-top: 10px">
											<button class="btn btn-default btn-xs submitEdit">Submit To Modify</button>
											<button class="btn btn-default btn-xs cancelEdit">Cancel</button>
											<strong><label style="color: red;" id="editerrormsg"></label></strong>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<c:if test="${getallsupplier eq true}">
					<div class="panel panel-default" style="border: 1px solid #CCC;">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForsupplierTable">
								Basic supplier Info<span class="fa fa-chevron-down" style="float: right"></span>
							</h4>
						</div>
						<div id="collapseForsupplierTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body">
								<table id="datatable_supplierinfo">
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
	<c:if test="${getallsupplier eq true}">
	$(function() {
		$.getScript("resources/js/ajax/supplier.js");
	})
	</c:if>
</script>