<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="panel panel-default" style="margin-top: 15px;">
					<div class="panel-body">
						<b>Data Table</b>
					</div>
					<div class="panel-footer">
						<table id="datatable_bookinfo">
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function unix2human(unixtime) {
		var dateObj = new Date(unixtime);
		var UnixTimeToDate = dateObj.getFullYear() + '-'
				+ (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' '
				+ p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':'
				+ p(dateObj.getSeconds());
		return UnixTimeToDate;
	}
	function p(s) {
		return s < 10 ? '0' + s : s;
	}
	$(function() {

		$('#datatable_bookinfo').datagrid({
			width : 'auto',
			height : 300,
			striped : true,
			singleSelect : true,
			url : 'Book/GetBooks',
			loadMsg : 'Loading date ..... waiting....',
			pagination : true,
			rownumbers : true,
			columns : [ [ {
				field : 'strbookcoding',
				title : 'Code',
				align : 'center',
			}, {
				field : 'strbookname',
				title : 'Name',
				align : 'center',
				formatter : function(value, rowData, rowIndex) {
					return "";
				}
			}, {
				field : 'strbooksn',
				title : 'SN',
				align : 'center',
			}, {
				field : 'bookType.strbooktypename',
				title : 'SN',
				align : 'center',
			}, {
				field : 'strpress',
				title : 'SN',
				align : 'center',
			}, {
				field : 'strauthor',
				title : 'SN',
				align : 'center',
			}, {
				field : 'supplier.strname',
				title : 'SN',
				align : 'center',
			}, {
				field : 'strprice',
				title : 'SN',
				align : 'center',
			}, {
				field : 'intpricediscount',
				title : 'SN',
				align : 'center',
			}, {
				field : 'strbooksn',
				title : 'SN',
				align : 'center',
				formatter : function(value) {
					return unix2human(data[i].dateaddtime);
				}
			} ] ]
		});
		// Add Drag-n-Drop feature
		WinMove();
	});
</script>
