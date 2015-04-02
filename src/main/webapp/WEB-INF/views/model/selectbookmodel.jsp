<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="searchClass row">
	<div class="col-xs-12">
		<label>Code</label><input class="SearchForm form-control" type="text" id="SearchCode" /> <label>Name</label><input class="SearchForm form-control" type="text" id="SearchName" /> <label>SN</label><input class="SearchForm form-control" type="text" id="SearchSN" /> <label>Type</label><select
			class="SearchForm form-control" id="SearchType"><option value="-1">All Type</option></select>
	</div>
	<div class="col-xs-12">
		<label>Press</label><input class="SearchForm form-control" type="text" id="SearchPress" /> <label>Author</label><input class="SearchForm form-control" type="text" id="SearchAuthor" /> <label>Supplier</label><select class="SearchForm form-control" id="SearchSupplier"><option value="-1">All
				Supplier</option></select> <label>Price</label><input class="SearchForm form-control" type="text" id="SearchPrice" />
	</div>
	<div class="col-xs-12">
		<label>Discount</label><input class="SearchForm form-control" type="text" id="SearchDiscount" /> <label>Date</label><input class="SearchForm form-control" type="text" id="SearchDate" ReadOnly />
		<button id="Search" class="btn btn-primary btn-xs" style="height: 30px">Search</button>
	</div>
</div>
<table id="datatable_bookinfo" style="width: 100%; margin-top: 10px;"></table>