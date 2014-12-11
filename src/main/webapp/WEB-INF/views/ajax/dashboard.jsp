<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--Start Breadcrumb-->
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="/teaching">Home</a></li>
			<li><a href="#">Dashboard</a></li>
		</ol>
		<div id="social" class="pull-right">
			<a href="#"><i class="fa fa-google-plus"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a
				href="#"><i class="fa fa-youtube"></i></a>
		</div>
	</div>
</div>
<!--End Breadcrumb-->
<!--Start Dashboard 1-->
<div id="dashboard-header" class="row">
	<div class="col-xs-12 col-sm-4 col-md-5">
		<h3>Hello, ${loginUser}!</h3>
	</div>
	<div class="clearfix visible-xs"></div>
	<div class="col-xs-12 col-sm-8 col-md-7 pull-right">
		<div class="row">
			<div class="col-xs-4">
				<div class="sparkline-dashboard" id="sparkline-1"></div>
				<div class="sparkline-dashboard-info">
					<i class="fa fa-usd"></i>756.45M <span class="txt-primary">EBITDA</span>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="sparkline-dashboard" id="sparkline-2"></div>
				<div class="sparkline-dashboard-info">
					<i class="fa fa-usd"></i>245.12M <span class="txt-info">OIBDA</span>
				</div>
			</div>
			<div class="col-xs-4">
				<div class="sparkline-dashboard" id="sparkline-3"></div>
				<div class="sparkline-dashboard-info">
					<i class="fa fa-usd"></i>107.83M <span>REVENUE</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!--End Dashboard 1-->
<!--Start Dashboard 2-->
<div class="row-fluid">
	<div id="dashboard_links" class="col-xs-12 col-sm-2 pull-right">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#" class="tab-link" id="overview">Overview</a></li>
			<li><a href="#" class="tab-link" id="clients">Clients</a></li>
			<li><a href="#" class="tab-link" id="graph">Statistics</a></li>
			<li><a href="#" class="tab-link" id="servers">Servers</a></li>
			<li><a href="#" class="tab-link" id="planning">Planning</a></li>
			<li><a href="#" class="tab-link" id="netmap">Network map</a></li>
			<li><a href="#" class="tab-link" id="stock">Yahoo finance</a></li>
		</ul>
	</div>
	<div id="dashboard_tabs" class="col-xs-12 col-sm-10">
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
						<td>${loginUser}</td>
					</tr>
					<tr class="active">
						<td>User Group</td>
						<td>${userGroup}</td>
					</tr>
					<tr>
						<td>User Email</td>
						<td>${userEmail}</td>
					</tr>
					<tr class="active">
						<td>User Phone</td>
						<td>${userPhone}</td>
					</tr>
					<tr>
						<td>User Register Time</td>
						<td>${userRegTime}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--End Dashboard Tab 1-->
		<!--Start Dashboard Tab 2-->
		<div id="dashboard-clients" class="row" style="visibility: hidden; position: absolute;">
			
		</div>
		<!--End Dashboard Tab 2-->
		<!--Start Dashboard Tab 3-->
		<div id="dashboard-graph" class="row" style="width: 100%; visibility: hidden; position: absolute;">
		</div>
		<!--End Dashboard Tab 3-->
		<!--Start Dashboard Tab 4-->
		<div id="dashboard-servers" class="row" style="visibility: hidden; position: absolute;">
			
		</div>
		<!--End Dashboard Tab 4-->
		<!--Start Dashboard Tab 5-->
		<div id="dashboard-planning" class="row" style="visibility: hidden; position: absolute;">
			
		</div>
		<!--End Dashboard Tab 5-->
		<!--Start Dashboard Tab 6-->
		<div id="dashboard-netmap" class="row" style="visibility: hidden; position: absolute;">
		
		</div>
		<!--End Dashboard Tab 6-->
		<!--Start Dashboard Tab 7-->
		<div id="dashboard-stock" class="row" style="visibility: hidden; position: absolute;">
			
		</div>
		<!--End Dashboard Tab 7-->
	</div>
	<div class="clearfix"></div>
</div>
<!--End Dashboard 2 -->
<div style="height: 40px;"></div>
<script type="text/javascript">
	// Array for random data for Sparkline
	var sparkline_arr_1 = SparklineTestData();
	var sparkline_arr_2 = SparklineTestData();
	var sparkline_arr_3 = SparklineTestData();
	$(document).ready(function() {
		// Make all JS-activity for dashboard
		DashboardTabChecker();
		// Load Knob plugin and run callback for draw Knob charts for dashboard(tab-servers)
		LoadKnobScripts(DrawKnobDashboard);
		// Load Sparkline plugin and run callback for draw Sparkline charts for dashboard(top of dashboard + plot in tables)
		LoadSparkLineScript(DrawSparklineDashboard);
		// Load Morris plugin and run callback for draw Morris charts for dashboard
		LoadMorrisScripts(MorrisDashboard);
		// Load Springy plugin and run callback for draw network map for dashboard
		LoadSpringyScripts(SpringyNetmap);
		// Make beauty hover in table
		$("#ticker-table").beautyHover();
		// Run script for stock block
		CreateStockPage();
	});
</script>
