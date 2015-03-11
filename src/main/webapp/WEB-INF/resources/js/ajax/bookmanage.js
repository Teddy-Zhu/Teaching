var htmltmp = $('#newformRange').html();
function setVal(id, obj) {
	$('#editCode' + id).val(obj.strbookcoding);
	$('#editName' + id).val(obj.strbookname);
	$('#editSN' + id).val(obj.strbooksn);
	$('#editPress' + id).val(obj.strpress);
	$('#editAuthor' + id).val(obj.strauthor);
	$('#editPrice' + id).val(obj.strprice);
	$('#editDisCount' + id).val(obj.intpricediscount);

	var dtdtype = $.Deferred();
	$.when(initBookType('editBookType' + id, dtdtype)).done(function() {
		$('#editBookType' + id).val(obj.bookType.intbooktypeid);
	})
	var dtd = $.Deferred();
	$.when(initSupplierType('editSupplierType' + id, dtd)).done(function() {
		$('#editSupplierType' + id).val(obj.supplier.intsupplierid);
	})
}

function initBookType(id, dtd, addition) {
	$.ajax({
		url : 'Type/GetBookType',
		dataType : 'json',
		type : 'post',
		success : function(data) {
			$('#' + id).empty();
			if (addition != undefined) {
				$('#' + id).append('<option value="-1">All Type</option>');
			}
			for (var i = 0; len = data.length, i < len; i++) {
				$('#' + id).append('<option value="' + data[i].intbooktypeid + '">' + data[i].strbooktypename + '</option>');
			}
			if (dtd != undefined) {
				dtd.resolve();
			}
		},
		async : true
	})
	if (dtd != undefined) {
		return dtd.promise();
	}
}

function initSupplierType(id, dtd, addition) {
	$.ajax({
		url : 'Type/GetSupplierType',
		dataType : 'json',
		type : 'post',
		success : function(data) {
			$('#' + id).empty();
			if (addition != undefined) {
				$('#' + id).append('<option value="-1">All Supplier</option>');
			}
			for (var i = 0; len = data.length, i < len; i++) {
				$('#' + id).append('<option value="' + data[i].intsupplierid + '">' + data[i].strname + '</option>');
			}
			if (dtd != undefined) {
				dtd.resolve();
			}
		}
	})
	if (dtd != undefined) {
		return dtd.promise();
	}
}

function getSearchParams(params) {
	var searchParams = new Object();
	if (params != undefined) {
		searchParams = params;
	}
	$('.SearchForm').each(function() {
		var param = $(this).val().trim();
		if (param == undefined)
			param = '';
		searchParams[$(this).attr('id')] = param;
	});
	return searchParams;
}

$(function() {
	console.debug('aaa');
	$('button.editbook').click(
			function() {
				var rows = $('#datatable_bookinfo').datagrid('getSelections');
				if (rows.length == 0) {
					$.TeachDialog({
						content : 'You should select a row at least !',
						bootstrapModalOption : {},
					});
					return;
				}
				$('#bookEditTable').html("");
				$('#editbookcontainer .tab-content').html("");
				$('#editerrormsg').html("");
				for (var i = 0; i < rows.length; i++) {
					var id = rows[i].intbookid;
					$('#bookEditTable').append('<li role="presentation"><a href="#editpanel' + id + '" role="tab" data-toggle="tab">' + rows[i].strbookname + '</a></li>')
					$('#editbookcontainer .tab-content').append('<div role="tabpanel" class="tab-pane fade" id="editpanel' + id + '"></div>');
					$('#editpanel' + id).html(
							htmltmp.replace('newCode', 'editCode' + id).replace('newName', 'editName' + id).replace('newSN', 'editSN' + id).replace('newBookType', 'editBookType' + id).replace('newPress', 'editPress' + id).replace('newAuthor', 'editAuthor' + id).replace('newPrice', 'editPrice' + id)
									.replace('newDisCount', 'editDisCount' + id).replace('newSupplierType', 'editSupplierType' + id).replace(new RegExp('newform', "gm"), 'editform'));
					setVal(id, rows[i]);
				}
				$('#bookEditTable a:first').tab('show')
				$('#editbookcontainer').slideDown();
				$('#operationpanel').slideUp();

			})
	$('button.submitAdd').click(function() {
		// auth form
		var postdata = {};
		var check = true;
		$('.newform').each(function() {
			if ($(this).val().trim() == "") {
				$('#adderrormsg').html("please input " + $(this).prev().html() + "!");
				check = false;
				return false;
			} else {
				postdata[$(this).attr('id')] = $(this).val().trim();
			}
		});
		if (!check) {
			return;
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
						otherButtons : [ 'Yes', 'Yes & Keep Val' ],
						bootstrapModalOption : {},
						CloseButtonAddFunc : function() {
							$('#operationpanel').slideToggle();
							$('#addnewbook').slideToggle();
							$('#datatable_bookinfo').datagrid('reload');
						},
						clickButton : function(sender, modal, index) {
							if (index == 0 || index == 1) {
								if (index == 0) {
									$('.newform').val('');
									$('#newBookType').get(0).selectedIndex = 0;
									$('#newSupplierType').get(0).selectedIndex = 0;
								}
							}
							$('#datatable_bookinfo').datagrid('reload');
							modal.modal('hide');
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

	$('button.cancelAdd').click(function() {
		$('.newform').val('');
		$('#operationpanel').slideDown();
		$('#addnewbook').slideUp();
	})

	$('button.addbook').click(function() {
		$('.newform').val('');
		initBookType('newBookType');
		initSupplierType('newSupplierType');
		$('#adderrormsg').html("");
		$('#operationpanel').slideUp();
		$('#addnewbook').slideDown();

	});

	$('button.cancelEdit').click(function() {
		$('#operationpanel').slideDown();
		$('#editbookcontainer').slideUp();
		$('#bookEditTable').html("");
		$('#editbookcontainer .tab-content').html("");
	})

	$('button.submitEdit').click(function() {
		var idarray = new Array();
		$('[id^=editCode]').each(function() {
			var l = $(this).attr('id');
			idarray.push(l.substring(8, l.length));
		})
		var postdata = {};
		if (idarray.length != 0) {
			var check = true;
			$('.editform').each(function() {
				if ($(this).val().trim() == "") {
					$('#editerrormsg').html("please input " + $(this).prev().html() + "!");
					check = false;
					return false;
				} else {
					postdata[$(this).attr('id')] = $(this).val().trim();
				}
			});
			if (!check) {
				return;
			}
			postdata.bookId = idarray;
			$.ajax({
				url : 'Book/EditBook',
				type : 'post',
				dataType : 'json',
				data : postdata,
				success : function(data) {
					if (data) {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Edit book successfully!',
							CloseButtonAddFunc : function() {
								$('#operationpanel').slideToggle();
								$('#editbookcontainer').slideToggle();
								$('#datatable_bookinfo').datagrid('reload');
							},
						});
					} else {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Edit book failed!',
							CloseButtonAddFunc : function() {
								$('#operationpanel').slideToggle();
								$('#editbookcontainer').slideToggle();
								$('#datatable_bookinfo').datagrid('reload');
							},
						});
					}
				}
			})
		}
	})

	$('button.removebook').click(function() {
		var rows = $('#datatable_bookinfo').datagrid('getSelections');
		if (rows.length == 0) {
			$.TeachDialog({
				content : 'You should select a row at least !',
				bootstrapModalOption : {},
			});
			return;
		}
		var bookIdArray = new Array();
		for (var i = 0; i < rows.length; i++) {
			bookIdArray.push(parseInt(rows[i].intbookid));
		}
		$.ajax({
			url : 'Book/RemoveBook',
			type : 'post',
			dataType : 'json',
			data : {
				bookId : bookIdArray
			},
			success : function(response) {
				if (response === true) {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Remove books successfully!',
					})
					$('#datatable_bookinfo').datagrid('reload');
				} else {
					if (!isNaN(response)) {
						var bookname = "";
						for (var i = 0; i < rows.length; i++) {
							if (parseInt(rows[i].intbookid) == parseInt(response)) {
								bookname = rows[i].strbookname;
								break;
							}
						}
						$.TeachDialog({
							content : 'Remove books failed! Book:' + bookname + " exist in use.",
						})
					} else {
						$.TeachDialog({
							content : 'Remove books failed!',
						})
					}
				}
			},
			async : true
		})
	})

	$('#SearchDate').datepicker({
		format : "yyyy-mm-dd",
		todayBtn : "linked",
		autoclose : true,
		todayHighlight : true,
		clearBtn : true
	});

	initBookType('SearchType', undefined, "type");
	initSupplierType('SearchSupplier', undefined, "type")
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
		fitColumns : true,
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
		} ] ],
		onBeforeLoad : function(param) {
			param = getSearchParams(param);
		},
	});

	$('#Search').click(function() {
		$('#datatable_bookinfo').datagrid('reload');
	})
	// Add Drag-n-Drop
	WinMove();
});