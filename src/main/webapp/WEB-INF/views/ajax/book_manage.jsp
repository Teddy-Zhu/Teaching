<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

				<div class="panel panel-default" style="border: 1px solid #CCC; border-bottom: 0px; height: 300px">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title" data-toggle="collapse" data-target="#collapseOne">
							Function Menu <span class="fa fa-chevron-down" style="float: right"></span>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<div style="margin: 10px; margin-right: 30px">
								<div id="operationpanel">
									<div class="alert alert-warning" role="alert">
										<strong>Warning!</strong> <br>[1]Before delelte or edit, you should select <br>[2]If you want clear selected row ,you can refresh the grid.<br>[3]
									</div>
									<button class="btn btn-default btn-xs addbook">
										<i class="fa fa-file-o"></i> Add A New Book
									</button>
									<button class="btn btn-default btn-xs editbook">
										<i class="fa fa-file-text"></i> Edit A Book
									</button>
									<button class="btn btn-default btn-xs removebook">
										<i class="fa fa-trash-o"></i> Remove A Book
									</button>
								</div>
								<div id="addnewbook" class="container-fluid" style="display: none;">
									<div class="row-fluid">
										<div class="span12">

											<div class="col-md-4">
												<label class="control-label" contenteditable="true">Code</label>
												<div class="controls">
													<input id="newCode" type="text" class="form-control" placeholder="Input Book Code" />
												</div>
												<label class="control-label" contenteditable="true">Name</label>

												<div class="controls">
													<input id="newName" type="text" class="form-control" placeholder="Input Book Name" />
												</div>
												<label class="control-label" contenteditable="true">SN</label>

												<div class="controls">
													<input id="newSN" type="text" class="form-control" placeholder="Input Book SN Number" />
												</div>
												<label class="control-label" contenteditable="true">Type</label> <input id="BookTypeSelect" />
											</div>
											<div class="col-md-4"></div>

											<div class="control-group">
												<div class="controls">
													<button class="btn" contenteditable="true" type="button">Add</button>
													<button class="btn btn-default btn-xs cancelAdd">Cancel</button>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default" style="border: 1px solid #CCC;">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title" data-toggle="collapse" data-target="#collapseTwo">
							Basic Book Info<span class="fa fa-chevron-down" style="float: right"></span>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
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
	function unix2human(unixtime) {
		var dateObj = new Date(unixtime);
		var UnixTimeToDate = dateObj.getFullYear() + '-' + (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' ' + p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':'
				+ p(dateObj.getSeconds());
		return UnixTimeToDate;
	}
	function p(s) {
		return s < 10 ? '0' + s : s;
	}
	$(function() {
		//$('#BookTypeSelect').combobox('getValue')
		//$('#BookTypeSelect').combobox('getText')
		$('#BookTypeSelect').combobox({
			url : 'Type/GetBookType',
			method : 'post',
			valueField : 'intbooktypeid',
			textField : 'strbooktypename',
			filter : function(q, row) {
				var opts = $(this).combobox('options');
				return row[opts.textField].indexOf(q) == 0;
			}
		});
		$('button.cancelAdd').click(function() {
			$('#operationpanel').slideToggle();
			$('#addnewbook').slideToggle();
		})
		$('button.addbook').click(function() {
			$('#operationpanel').slideToggle();
			$('#addnewbook').slideToggle();
		});
		cellwidth = ($(".box-content.table-responsive").width() - 55) / 11;
		$('#datatable_bookinfo').datagrid({
			striped : true,
			remoteSort : false,
			collapsible : true,
			fit : false,
			url : 'Book/GetBooks',
			loadMsg : 'Please waiting for loading date.....',
			pagination : true,
			rownumbers : true,
			columns : [ [ {
				field : 'intbootid',
				title : 'id',
				align : 'center',
				hidden : true
			}, {
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
		}); // Add Drag-n-Drop
		WinMove();
	});
</script>
