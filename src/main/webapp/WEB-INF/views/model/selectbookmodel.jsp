<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="searchClass row">
	<div class="col-xs-12">
		<label>编号</label><input class="SearchForm form-control" type="text" id="SearchCode" /> <label>名称</label><input class="SearchForm form-control" type="text" id="SearchName" /> <label>SN号</label><input class="SearchForm form-control" type="text" id="SearchSN" /> <label>类型</label><select
			class="SearchForm form-control" id="SearchType"><option value="-1">所有</option></select>
	</div>
	<div class="col-xs-12">
		<label>出版社</label><input class="SearchForm form-control" type="text" id="SearchPress" /> <label>作者</label><input class="SearchForm form-control" type="text" id="SearchAuthor" /> <label>供应商</label><select class="SearchForm form-control" id="SearchSupplier"><option value="-1">全部
			</option></select> <label>单价</label><input class="SearchForm form-control" type="text" id="SearchPrice" />
	</div>
	<div class="col-xs-12">
		<label>折扣</label><input class="SearchForm form-control" type="text" id="SearchDiscount" /> <label>录入时间</label><input class="SearchForm form-control" type="text" id="SearchDate" ReadOnly />
		<button id="Search" class="btn btn-primary btn-xs" style="height: 30px">搜索</button>
	</div>
</div>
<table id="datatable_bookinfo" style="width: 100%; margin-top: 10px;"></table>