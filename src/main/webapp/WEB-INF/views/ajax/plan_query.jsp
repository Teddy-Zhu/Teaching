<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin-right: 3.2%;
	width: 14.8%;
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
			<li><a href="#">Plan Query</a></li>
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
				<c:if test="${queryplan eq true}">
					<div class="panel panel-default" style="border: 1px solid #CCC;">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForsupplierTable">
								Plan Info<span class="fa fa-chevron-down" style="float: right"></span>
							</h4>
						</div>
						<div id="collapseForsupplierTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body" style="overflow-x: hidden; width: 100%">
								<div class="searchClass row">
									<div class="col-xs-12">
										<label>Code</label><input class="SearchForm form-control" type="text" id="SearchCode" /> <label>Name</label><input class="SearchForm form-control" type="text" id="SearchName" /> <label>SN</label><input class="SearchForm form-control" type="text" id="SearchSN" /> <label>Type</label><select
											class="SearchForm form-control" id="SearchType"><option value="-1">All Type</option></select>
									</div>
									<div class="col-xs-12">
										<label>Press</label><input class="SearchForm form-control" type="text" id="SearchPress" /> <label>Author</label><input class="SearchForm form-control" type="text" id="SearchAuthor" /> <label>Supplier</label><select class="SearchForm form-control" id="SearchSupplier"><option
												value="-1">All Supplier</option></select> <label>Price</label><input class="SearchForm form-control" type="text" id="SearchPrice" />
									</div>
									<div class="col-xs-12">
										<label>Discount</label><input class="SearchForm form-control" type="text" id="SearchDiscount" />
										<button id="Search" class="btn btn-default btn-xs pull-right">Search</button>
									</div>
								</div>
								<table id="datatable_supplierinfo" style="width: 100%">
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
	<c:if test="${queryplan eq true}">
	$(function() {
		$.getScript("resources/js/ajax/plan_query.js");
	})
	</c:if>
</script>