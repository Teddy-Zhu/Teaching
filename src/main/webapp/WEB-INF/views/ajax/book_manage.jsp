<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.panel-header, .panel-body {
	border-width: 0px;
}

.datagrid, .combo-p {
	border: solid 1px #D4D4D4;
}

.panel-title {
	cursor: pointer
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

.inlineblock div input {
	width: 70%;
}

.inlineblock div select {
	width: 70%;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index.html">Dashboard</a></li>
			<li><a href="#">Books Manage</a></li>
			<li><a href="#">Book Query</a></li>
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
					<i class="fa fa-clipboard"></i> <span>Books Information</span>
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

				<div class="panel panel-default" style="border: 1px solid #CCC; height: auto;">
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
										<strong>Warning!</strong> <br>[1]Before delete or edit, you should select one at least.<br>[2]If you want clear selected row quickly,you can refresh the grid.<br>[3]Or you have no power and you can browser books below.
									</div>
									<div class="col-xs-10  col-xs-offset-3">
										<c:if test="${addbook eq true}">
											<button class="btn btn-default btn-xs addbook">
												<i class="fa fa-file-o"></i> Add A New Book
											</button>
										</c:if>
										<c:if test="${editbook eq true}">
											<button class="btn btn-default btn-xs editbook">
												<i class="fa fa-file-text"></i> Edit A Book
											</button>
										</c:if>
										<c:if test="${rmbook eq true}">
											<button class="btn btn-default btn-xs removebook">
												<i class="fa fa-trash-o"></i> Remove A Book
											</button>
										</c:if>
									</div>
								</div>
								<c:if test="${addbook eq true}">
									<div id="addnewbook" class="col-xs-12" style="display: none; padding-top: 5px">
										<div id="newformRange">
											<div class="col-xs-12 inlineblock">
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
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-3">Price</label><input class="newform form-control col-xs-9" type="text" id="newPrice" placeholder="Input Book's Price" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-3">Press</label><input class="newform form-control col-xs-9" id="newPress" type="text" placeholder="Input Book's Press" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-3">Author</label><input class="newform form-control col-xs-9" id="newAuthor" type="text" placeholder="Input Book's Author" />
												</div>

											</div>
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-3">Type</label><select class="newform form-control" id="newBookType"></select>
												</div>
												<div class="col-xs-4">
													<label class="col-xs-3">Supplier</label><select class="newform form-control" id="newSupplierType"></select>
												</div>

												<div class="col-xs-4">
													<label class="col-xs-3">DisCount</label><input class="newform form-control col-xs-9" id="newDisCount" type="text" placeholder="Input Book Discount" />
												</div>

											</div>
										</div>
										<div class="col-xs-12 inlineblock">
											<div class="col-xs-5 controls col-xs-offset-5">
												<button class="btn btn-default btn-xs submitAdd" style="width: 100px">Add</button>
												<button class="btn btn-default btn-xs cancelAdd" style="width: 100px">Cancel</button>
											</div>
											<div class="col-xs-6">
												<strong><label style="color: red;" id="adderrormsg"></label></strong>
											</div>
										</div>
									</div>
								</c:if>

								<c:if test="${editbook eq true}">
									<div id="editbookcontainer" class="col-xs-12" style="display: none; overflow-x: hidden;">
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
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<div class="panel panel-default" style="border: 1px solid #CCC;">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForBookTable">
							Basic Book Info<span class="fa fa-chevron-down" style="float: right"></span>
						</h4>
					</div>
					<div id="collapseForBookTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
							<table id="datatable_bookinfo">
							</table>
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