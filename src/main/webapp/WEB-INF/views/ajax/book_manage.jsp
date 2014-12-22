<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<
<style>
.panel-header, .panel-body {
	border-width: 0px;
}

.datagrid, .combo-p {
	border: solid 1px #D4D4D4;
}

.datagrid * {
	-webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
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
				<div class="easyui-panel" title="Function Menu">
					<div style="margin: 15px;">
						<button class="btn btn-default btn-xs">
							<i class="fa fa-file-o"></i> Add A New Book
						</button>
					</div>
				</div>
				<div id="book_panel" class="easyui-panel" title="Basic Book Info">
					<table id="datatable_bookinfo">
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="http://www.jeasyui.com/easyui/datagrid-filter.js"></script>
<script type="text/javascript">
	function unix2human(unixtime) {
		var dateObj = new Date(unixtime);
		var UnixTimeToDate = dateObj.getFullYear() + '-' + (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' ' + p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':'
				+ p(dateObj.getSeconds());
		return UnixTimeToDate;
	}
	function p(s) {
		return s < 10 ? '0' + s : s;
	}
	var dg;
	$(function() {
		$(".easyui-panel").panel({
			collapsible : true
		});
		cellwidth = ($(".box-content.table-responsive").width() - 55) / 11;

		$('#datatable_bookinfo').datagrid({
			width : 'auto',
			height : 500,
			striped : true,
			singleSelect : true,
			remoteSort : false,
			collapsible : true,
			url : 'Book/GetBooks',
			loadMsg : 'Please waiting for loading date.....',
			pagination : true,
			rownumbers : true,
			columns : [ [ {
				field : 'strbookcoding',
				title : 'Code',
				align : 'center',
				sortable : true,
				width : cellwidth,
			}, {
				field : 'strbookname',
				title : 'Name',
				align : 'center',
				width : cellwidth,
				sortable : true
			}, {
				field : 'strbooksn',
				title : 'SN',
				align : 'center',
				width : cellwidth,
				sortable : true
			}, {
				field : 'bookType',
				title : 'Type',
				align : 'center',
				width : cellwidth,
				sortable : true,
				formatter : function(value) {
					return value.strbooktypename;
				}
			}, {
				field : 'strpress',
				title : 'Press',
				align : 'center',
				width : cellwidth,
				sortable : true
			}, {
				field : 'strauthor',
				title : 'Author',
				align : 'center',
				width : cellwidth,
				sortable : true
			}, {
				field : 'supplier',
				title : 'Supplier',
				align : 'center',
				width : cellwidth,
				sortable : true,
				formatter : function(value) {
					return value.strname;
				}
			}, {
				field : 'strprice',
				title : 'Price',
				align : 'center',
				width : cellwidth,
				sortable : true
			}, {
				field : 'intpricediscount',
				title : 'DisCount',
				align : 'center',
				width : cellwidth,
				sortable : true
			}, {
				field : 'dateaddtime',
				title : 'Add Time',
				align : 'center',
				width : cellwidth + 35,
				sortable : true,
				formatter : function(value) {
					return unix2human(value);
				}
			} ] ]
		});
		// Add Drag-n-Drop feature
		WinMove();
	});
</script>
