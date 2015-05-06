<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="searchClass row">
	<div class="col-xs-12">
		<label>Id</label><input class="DialogSearchForm form-control" type="text" id="SearchUserId" /><label>用户</label><input class="DialogSearchForm form-control" type="text" id="SearchUserName" /> <label>姓名</label><input class="DialogSearchForm form-control" type="text" id="SearchRealName" />
		<label>用户类型</label><select class="DialogSearchForm form-control" id="SearchUserType"><option value="-1">全部</option></select>
	</div>
	<div class="col-xs-12">
		<label>学号</label><input class="DialogSearchForm form-control" id="SearchIdCard" /><label>系部</label><select class="DialogSearchForm form-control" id="SearchDepartMent"><option value="-1">全部</option></select> <label>专业</label><select class="DialogSearchForm form-control"
			id="SearchMajor"><option value="-1">全部</option></select> <label>手机</label><input class="DialogSearchForm form-control" id="SearchPhone" type="text" />
	</div>
	<div class="col-xs-12">
		<label>创建时间</label><input class="DialogSearchForm form-control" type="text" id="SearchTime" ReadOnly /><label>邮箱</label><input class="DialogSearchForm form-control" type="text" id="SearchEmail" />
		<button id="DialogSearch" class="btn btn-primary btn-xs" style="height: 30px">搜索</button>
	</div>
</div>
<table id="datatable_userinfo" style="width: 100%"></table>