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

.inlineblock div {
	display: inline-block;
}

.inlineblock div input {
	width: 89%;
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

				<div class="panel panel-default" style="border: 1px solid #CCC;">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForAdd">
							Function Menu <span class="fa fa-chevron-down" style="float: right"></span>
						</h4>
					</div>

					<div id="collapseForAdd" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<div style="margin: 15px; margin-right: 15px">

								<div id="operationpanel">
									<div class="alert alert-danger" role="alert">
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

								<div id="addnewbook" style="display: none; margin-left: 15px; padding-top: 5px">
									<div class="row-fluid">
										<div class="row inlineblock">
											<div class="span3">
												<label>Code</label><input class="newform form-control" id="newCode" type="text" placeholder="Input Book Code" />
											</div>
											<div class="span3">
												<label>Name</label><input id="newName" class="newform form-control" type="text" placeholder="Input Book Name" />
											</div>
											<div class="span3">
												<label>SN</label><input id="newSN" class="newform form-control" type="text" placeholder="Input Book SN Number" />
											</div>
											<div class="span3">
												<label>Type</label><br> <span id="BookTypeSelect"></span>
											</div>
										</div>
										<div class="row inlineblock" style="margin-top: 10px">
											<div class="span3 controls">
												<label>Press</label><input class="newform form-control" id="newPress" type="text" placeholder="Input Book's Press" />
											</div>
											<div class="span3 controls">
												<label>Author</label><input class="newform form-control" id="newAuthor" type="text" placeholder="Input Book's Author" />
											</div>
											<div class="span3 controls">
												<label>Supplier</label><br> <span id="SupplierTypeSelect"></span>
											</div>
											<div class="span3" style="margin-left: 22px">
												<label>Price</label><input class="newform form-control" type="text" id="newPrice" placeholder="Input Book's Price" />
											</div>
										</div>
										<div class="row inlineblock" style="margin-top: 10px">
											<div class="span6">
												<label>DisCount</label><input class="newform form-control" id="newDisCount" type="text" placeholder="Input Book Discount" />
											</div>
											<div class="span3 controls">
												<button class="btn btn-default btn-xs submitAdd">Add</button>
												<button class="btn btn-default btn-xs cancelAdd">Cancel</button>
											</div>
											<div class="span3">
												<strong><label style="color: red;" id="adderrormsg"></label></strong>
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
						<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForBookTable">
							Basic Book Info<span class="fa fa-chevron-down" style="float: right"></span>
						</h4>
					</div>
					<div id="collapseForBookTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
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
		$('button.submitAdd').click(function() {
			//auth form
			var postdata = {};
			$('.newform').each(function() {
				if ($(this).val().trim() == "") {
					$('adderrormsg').html("please input " + $(this).prev().html() + "!");
					return;
				} else {
					postdata[$(this).attr('id')] = $(this).val().trim();
				}
			});
			if ($('#BookTypeSelect').combobox('getValue') == "" || $('#BookTypeSelect').combobox('getValue') == 1) {
				$('adderrormsg').html("please select one book type !");
				return;
			} else {
				postdata.BookType = $('#BookTypeSelect').combobox('getValue');
			}
			if ($('#SupplierTypeSelect').combobox('getValue') == "" || $('#SupplierTypeSelect').combobox('getValue') == 1) {
				$('adderrormsg').html("please select one supplier!");
				return;
			} else {
				postdata.Supplier = $('#SupplierTypeSelect').combobox('getValue');
			}
			$.ajax({
				url : 'Book/AddBook',
				dataType : 'json',
				type : 'post',
				data : postdata,
				success : function(response) {
					if (response) {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Add a new book successfully and do you want to add more ?',
							showCloseButtonName : 'No',
							dialogHidden : function() {
								$('#operationpanel').slideToggle();
								$('#addnewbook').slideToggle();
							},
							bootstrapModalOption : {},
							clickButton : function(sender, modal, index) {
								if (index == 0) {
									$('#BookTypeSelect').combobox('setValue', '')
									$('#SupplierTypeSelect').combobox('setValue', '')
									$('.newform').val('');
								}
							}
						});
					} else {
						$.TeachDialog({
							content : 'Add Book Failed!',
						});
					}
				}
			})
		});
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

		$('#SupplierTypeSelect').combobox({
			url : 'Type/GetSupplierType',
			method : 'post',
			valueField : 'intsupplierid',
			textField : 'strname',
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
			$('#BookTypeSelect').combobox('setValue', '')
			$('#SupplierTypeSelect').combobox('setValue', '')
			$('.newform').val('');
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