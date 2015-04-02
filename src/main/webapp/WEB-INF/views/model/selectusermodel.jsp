<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="searchClass row">
	<div class="col-xs-12">
		<label>Id</label><input class="DialogSearchForm form-control" type="text" id="SearchUserId" /><label>UserName</label><input class="DialogSearchForm form-control" type="text" id="SearchUserName" /> <label>RealName</label><input class="DialogSearchForm form-control" type="text" id="SearchRealName" />
		<label>UserType</label><select class="DialogSearchForm form-control" id="SearchUserType"><option value="-1">All UserType</option></select>
	</div>
	<div class="col-xs-12">
		<label>Id Card</label><input class="DialogSearchForm form-control" id="SearchIdCard" /><label>DepartMent</label><select class="DialogSearchForm form-control" id="SearchDepartMent"><option value="-1">All Department</option></select> <label>Major</label><select class="DialogSearchForm form-control"
			id="SearchMajor"><option value="-1">All Department</option></select> <label>Phone</label><input class="DialogSearchForm form-control" id="SearchPhone" type="text" />
	</div>
	<div class="col-xs-12">
		<label>CreateTime</label><input class="DialogSearchForm form-control" type="text" id="SearchTime" ReadOnly /><label>Email</label><input class="DialogSearchForm form-control" type="text" id="SearchEmail" />
		<button id="DialogSearch" class="btn btn-primary btn-xs" style="height: 30px">Search</button>
	</div>
</div>
<table id="datatable_userinfo" style="width: 100%"></table>