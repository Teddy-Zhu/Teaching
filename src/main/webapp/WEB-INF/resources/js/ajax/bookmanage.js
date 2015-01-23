var htmltmp = $('#newformRange').html();
function unix2human(unixtime) {
	var dateObj = new Date(unixtime);
	var UnixTimeToDate = dateObj.getFullYear() + '-' + (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' ' + p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':' + p(dateObj.getSeconds());
	return UnixTimeToDate;
}
function p(s) {
	return s < 10 ? '0' + s : s;
}
function setVal(id, obj) {
	$('#editCode' + id).val(obj.strbookcoding);
	$('#editName' + id).val(obj.strbookname);
	$('#editSN' + id).val(obj.strbooksn);
	$('#editPress' + id).val(obj.strpress);
	$('#editAuthor' + id).val(obj.strauthor);
	$('#editPrice' + id).val(obj.strprice);
	$('#editDisCount' + id).val(obj.intpricediscount);

	$('#editBookTypeSelect' + id).combobox('select', obj.bookType.intbooktypeid);
	$('#editSupplierTypeSelect' + id).combobox('select', obj.supplier.intsupplierid);
}

function initBookType(id, widhtId) {

	$('#' + id).combobox({
		url : 'Type/GetBookType',
		method : 'post',
		valueField : 'intbooktypeid',
		textField : 'strbooktypename',
		panelHeight : 'auto',
		width : $(document).width() * widhtId,
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) == 0;
		}
	});
}
function initSupplierType(id, widhtId) {

	$('#' + id).combobox({
		url : 'Type/GetSupplierType',
		method : 'post',
		valueField : 'intsupplierid',
		textField : 'strname',
		panelHeight : 'auto',
		width : $(document).width() * widhtId,
		filter : function(q, row) {
			var opts = $(this).combobox('options');
			return row[opts.textField].indexOf(q) == 0;
		}
	});
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
				for (var i = 0; i < rows.length; i++) {
					var id = rows[i].intbookid;
					$('#bookEditTable').append('<li role="presentation"><a href="#editpanel' + id + '" role="tab" data-toggle="tab">' + rows[i].strbookname + '</a></li>')
					$('#editbookcontainer .tab-content').append('<div role="tabpanel" class="tab-pane fade" id="editpanel' + id + '"></div>');
					$('#editpanel' + id).html(
							htmltmp.replace('newCode', 'editCode' + id).replace('newName', 'editName' + id).replace('newSN', 'editSN' + id).replace('newBookTypeSelect', 'editBookTypeSelect' + id)
									.replace('newPress', 'editPress' + id).replace('newAuthor', 'editAuthor' + id).replace('newPrice', 'editPrice' + id).replace('newDisCount', 'editDisCount' + id)
									.replace('newSupplierTypeSelect', 'editSupplierTypeSelect' + id).replace(new RegExp('newform', "gm"), 'editform'));
					initBookType('editBookTypeSelect' + id, 0.1475);
					initSupplierType('editSupplierTypeSelect' + id, 0.1475);
					setVal(id, rows[i]);
				}
				$('#operationpanel').slideToggle();
				$('#editbookcontainer').slideToggle();

				$('#bookEditTable a:first').tab('show')

			})
	// $('#BookTypeSelect').combobox('getValue')
	// $('#BookTypeSelect').combobox('getText')
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
		if ($('#newBookTypeSelect').combobox('getValue') == "" || $('#newBookTypeSelect').combobox('getValue') == -1) {
			$('#adderrormsg').html("please select one book type !");
			return;
		} else {
			postdata.BookType = $('#newBookTypeSelect').combobox('getValue');
		}
		if ($('#newSupplierTypeSelect').combobox('getValue') == "" || $('#newSupplierTypeSelect').combobox('getValue') == -1) {
			$('#adderrormsg').html("please select one supplier!");
			return;
		} else {
			postdata.Supplier = $('#newSupplierTypeSelect').combobox('getValue');
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
						},
						clickButton : function(sender, modal, index) {
							if (index == 0 || index == 1) {
								if (index == 0) {
									$('#newBookTypeSelect').combobox('setValue', '')
									$('#newSupplierTypeSelect').combobox('setValue', '')
									$('.newform').val('');
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

	initBookType('newBookTypeSelect', 0.159375);
	initSupplierType('newSupplierTypeSelect', 0.159375);

	$('button.cancelAdd').click(function() {
		$('#operationpanel').slideDown();
		$('#addnewbook').slideUp();
		$('#editbookcontainer').slideUp();
	})
	$('button.addbook').click(function() {
		$('#newBookTypeSelect').combobox('setValue', '')
		$('#newSupplierTypeSelect').combobox('setValue', '')
		$('.newform').val('');
		$('#adderrormsg').html("");
		$('#operationpanel').slideUp();
		$('#addnewbook').slideDown();
		$('#editbookcontainer').slideUp();
	});

	$('button.cancelEdit').click(function() {
		$('#bookEditTable').html("");
		$('#editbookcontainer .tab-content').html("");
		$('#operationpanel').slideDown();
		$('#addnewbook').slideUp();
		$('#editbookcontainer').slideUp();
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
			check = true;
			for ( var i in idarray) {
				if ($('#editBookTypeSelect' + idarray[i]).combobox('getValue') == "" || $('#editBookTypeSelect' + idarray[i]).combobox('getValue') == -1) {
					$('#editerrormsg').html("please select one book type !");
					check = false;
					break;
				} else {
					postdata['BookType' + idarray[i]] = $('#editBookTypeSelect' + idarray[i]).combobox('getValue');
				}
				if ($('#editSupplierTypeSelect' + idarray[i]).combobox('getValue') == "" || $('#editSupplierTypeSelect' + idarray[i]).combobox('getValue') == -1) {
					$('#editerrormsg').html("please select one supplier!");
					check = false;
					break;
				} else {
					postdata['Supplier' + idarray[i]] = $('#editSupplierTypeSelect' + idarray[i]).combobox('getValue');
				}
			}
			postdata.bookId = idarray;
			$.ajax({
				url : 'Book/EditBook',
				type : 'post',
				dataType : 'json',
				data : postdata,
				success : function() {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Edit book successfully!',
						CloseButtonAddFunc : function() {
							$('#operationpanel').slideToggle();
							$('#editbookcontainer').slideToggle();
							$('#datatable_bookinfo').datagrid('reload');
						},
					});
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
				if (response) {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Remove books successfully!',
					})
					$('#datatable_bookinfo').datagrid('reload');
				} else {
					$.TeachDialog({
						content : 'Remove books failedly!',
					})
				}
			},
			async : true
		})
	})
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
		} ] ]
	}); 
	// Add Drag-n-Drop
	WinMove();
});