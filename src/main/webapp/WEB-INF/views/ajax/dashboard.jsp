<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.boxshadow {
	-webkit-box-shadow: -3px 5px 5px rgba(45, 38, 38, 0.5);
	-moz-box-shadow: -3px 5px 5px rgba(45, 38, 38, 0.5);
	box-shadow: -3px 5px 5px rgba(45, 38, 38, 0.5);
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">Home</a></li>
			<li><a href="#">Dashboard</a></li>
		</ol>
		<div id="social" class="pull-right">
			<a href="#"><i class="fa fa-google-plus"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-youtube"></i></a>
		</div>
	</div>
</div>
<!--End Breadcrumb-->
<!--Start Dashboard 1-->
<div id="dashboard-header" class="row">
	<div class="col-xs-12 col-sm-4 col-md-5">
		<h3>Hello, ${user.username}!</h3>
	</div>
	<div class="clearfix visible-xs"></div>
	<div class="col-xs-12 col-sm-8 col-md-7 pull-right"></div>
</div>
<!--End Dashboard 1-->
<!--Start Dashboard 2-->
<div class="row-fluid">
	<div id="dashboard_links" class="col-xs-12 col-sm-2 pull-right">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#" class="tab-link" id="overview">Overview</a></li>
			<li><a href="#" class="tab-link" id="others">Others</a></li>
			<!-- 				<li><a href="#" class="tab-link" id="graph">Statistics</a></li>
			<li><a href="#" class="tab-link" id="servers">Servers</a></li>
			<li><a href="#" class="tab-link" id="planning">Planning</a></li>
			<li><a href="#" class="tab-link" id="netmap">Network map</a></li>
			<li><a href="#" class="tab-link" id="stock">Yahoo finance</a></li> -->
		</ul>
	</div>
	<div id="dashboard_tabs" class="col-xs-12 col-sm-10 boxshadow">
		<!--Start Dashboard Tab 1-->
		<div id="dashboard-overview" class="row" style="visibility: visible; position: relative;">
			<div id="ow-marketplace" class="col-sm-12 col-md-6">
				<h4 class="page-header">Psersonal Information</h4>
			</div>
			<table class="table table-striped table-bordered table-hover table-heading no-border-bottom">
				<thead>
					<tr>
						<th>Name</th>
						<th>Value</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>UserName</td>
						<td>${user.username}</td>
					</tr>
					<tr class="active">
						<td>User Group</td>
						<td>${user.userDepartMent.strname}-->${user.userMajor.strname}</td>
					</tr>
					<tr>
						<td>User Email</td>
						<td>${user.strmail}</td>
					</tr>
					<tr class="active">
						<td>User Phone</td>
						<td>${user.strphone}</td>
					</tr>
					<tr>
						<td>User Register Time</td>
						<td><fmt:formatDate value="${user.dateregtime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--End Dashboard Tab 1-->
		<!--Start Dashboard Tab 2-->
		<div id="dashboard-others" class="row" style="height: 500px; display: none;"></div>
		<!--End Dashboard Tab 2-->
		<!--Start Dashboard Tab 3-->
		<div id="dashboard-graph" class="row" style="display: none;"></div>
		<!--End Dashboard Tab 3-->
		<!--Start Dashboard Tab 4-->
		<div id="dashboard-servers" class="row" style="display: none;"></div>
		<!--End Dashboard Tab 4-->
		<!--Start Dashboard Tab 5-->
		<div id="dashboard-planning" class="row" style="display: none;"></div>
		<!--End Dashboard Tab 5-->
		<!--Start Dashboard Tab 6-->
		<div id="dashboard-netmap" class="row" style="display: none;"></div>
		<!--End Dashboard Tab 6-->
		<!--Start Dashboard Tab 7-->
		<div id="dashboard-stock" class="row" style="display: none;"></div>
		<!--End Dashboard Tab 7-->
	</div>
	<div class="clearfix"></div>
</div>
<!--End Dashboard 2 -->
<div style="height: 40px;"></div>
<script type="text/javascript">
	$(function() {
		// Make all JS-activity for dashboard
		DashboardTabChecker();
		// Make beauty hover in table
		$("#ticker-table").beautyHover();
	});
</script>
