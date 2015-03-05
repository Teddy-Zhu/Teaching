var htmltmp = $('#newformRange').html();

function setVal(id, obj) {
	$('#editCode' + id).val(obj.intcoding);
	$('#editName' + id).val(obj.strname);
	$('#editAddress' + id).val(obj.straddress);
	$('#editCompanyPhone' + id).val(obj.strcompanyphone);
	$('#editHandlePerson' + id).val(obj.strhandlepersonname);
	$('#editHandlePhone' + id).val(obj.strhandlephone);
	$('#editContactPerson' + id).val(obj.strcontactpersonname);
	$('#editContactPhone' + id).val(obj.strcontactpersonphone);
}
$(function() {
	console.debug('aaa');
	// initial tablegrid
	var cellwidth = ($(".box-content.table-responsive").width() - 55) / 10;
	$('#datatable_supplierinfo').datagrid({
		striped : true,
		remoteSort : false,
		collapsible : true,
		fit : false,
		url : 'Supplier/GetAllSuppliers',
		loadMsg : 'Please waiting for loading date.....',
		pagination : true,
		rownumbers : true,
		fitColumns : true,
		columns : [ [ {
			field : 'intcoding',
			title : 'Code',
			align : 'center',
			sortable : true,
			width : cellwidth,
		}, {
			field : 'strname',
			title : 'Name',
			align : 'center',
			width : cellwidth,
			sortable : true
		}, {
			field : 'straddress',
			title : 'Address',
			align : 'center',
			width : cellwidth,
			sortable : true,
		}, {
			field : 'strcompanyphone',
			title : 'Company Phone',
			align : 'center',
			width : cellwidth,
			sortable : true,
		}, {
			field : 'strhandlepersonname',
			title : 'Handle Person',
			align : 'center',
			width : cellwidth,
			sortable : true,
		}, {
			field : 'strhandlephone',
			title : 'Handle Phone',
			align : 'center',
			width : cellwidth,
			sortable : true
		}, {
			field : 'strcontactpersonname',
			title : 'Contact Person',
			align : 'center',
			width : cellwidth,
			sortable : true
		}, {
			field : 'strcontactpersonphone',
			title : 'Contact Phone',
			align : 'center',
			width : cellwidth,
			sortable : true,
		}, ] ]
	});

	$('button.addsupplier').click(function() {
		$('.newform').val('');
		$('#adderrormsg').html("");
		$('#operationpanel').slideUp();
		$('#addnewsupplier').slideDown();
	});

	$('button.submitAdd').click(function() {
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
			url : 'Supplier/AddNewSupplier',
			dataType : 'json',
			type : 'post',
			data : postdata,
			success : function(response) {
				if (response) {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Add a new Supplier successfully and do you want to add more ?',
						showCloseButtonName : 'No',
						otherButtons : [ 'Yes', 'Yes & Keep Val' ],
						CloseButtonAddFunc : function() {
							$('#operationpanel').slideToggle();
							$('#addnewsupplier').slideToggle();
							$('#datatable_supplierinfo').datagrid('reload');
						},
						clickButton : function(sender, modal, index) {
							if (index == 0 || index == 1) {
								if (index == 0) {
									$('.newform').val('');
								}
							}
							$('#datatable_supplierinfo').datagrid('reload');
							modal.modal('hide');
						}
					});
				} else {
					$.TeachDialog({
						content : 'Add Supplier Failed!',
					});
				}
			}
		});
	});

	$('button.cancelAdd').click(function() {
		$('#addnewsupplier').slideUp();
		$('#operationpanel').slideDown();
	});

	$('button.editsupplier').click(
			function() {
				var rows = $('#datatable_supplierinfo').datagrid('getSelections');
				if (rows.length == 0) {
					$.TeachDialog({
						content : 'You should select one row at least !',
						bootstrapModalOption : {},
					});
					return;
				}
				$('#supplierEditTable').html("");
				$('#editsuppliercontainer .tab-content').html("");
				$('#editerrormsg').html("");
				for (var i = 0; i < rows.length; i++) {
					var id = rows[i].intsupplierid;
					$('#supplierEditTable').append('<li role="presentation"><a href="#editpanel' + id + '" role="tab" data-toggle="tab">' + rows[i].strname + '</a></li>')
					$('#editsuppliercontainer .tab-content').append('<div role="tabpanel" class="tab-pane fade" id="editpanel' + id + '"></div>');
					$('#editpanel' + id).html(
							htmltmp.replace('newCode', 'editCode' + id).replace('newName', 'editName' + id).replace('newAddress', 'editAddress' + id).replace('newCompanyPhone',
									'editCompanyPhone' + id).replace('newHandlePerson', 'editHandlePerson' + id).replace('newHandlePhone', 'editHandlePhone' + id).replace('newContactPerson',
									'editContactPerson' + id).replace('newContactPhone', 'editContactPhone' + id).replace(new RegExp('newform', "gm"), 'editform'));
					setVal(id, rows[i]);
				}
				$('#supplierEditTable a:first').tab('show')
				$('#editsuppliercontainer').slideDown();
				$('#operationpanel').slideUp();
			});
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
			postdata.supplierId = idarray;
			$.ajax({
				url : 'Supplier/UpdateSuppliers',
				type : 'post',
				dataType : 'json',
				data : postdata,
				success : function(data) {
					if (data) {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Edit Suppliers Info successfully!',
							CloseButtonAddFunc : function() {
								$('#operationpanel').slideDown();
								$('#editsuppliercontainer').slideUp();
								$('#datatable_supplierinfo').datagrid('reload');
							},
						});
					} else {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Edit Suppliers Info failed!',
							CloseButtonAddFunc : function() {
								$('#operationpanel').slideDown();
								$('#editsuppliercontainer').slideUp();
								$('#datatable_supplierinfo').datagrid('reload');
							},
						});
					}
				}
			})
		}
	});
	$('button.cancelEdit').click(function() {
		$('#operationpanel').slideDown();
		$('#editsuppliercontainer').slideUp();
	});
	$('button.removesupplier').click(function() {
		var rows = $('#datatable_supplierinfo').datagrid('getSelections');
		if (rows.length == 0) {
			$.TeachDialog({
				content : 'You should select one row at least !',
				bootstrapModalOption : {},
			});
			return;
		}
		var supplierIdArray = new Array();
		var namesArray = new Array();
		for (var i = 0; i < rows.length; i++) {
			supplierIdArray.push(parseInt(rows[i].intsupplierid));
			namesArray.push(rows[i].strname);
		}
		$.ajax({
			url : 'Supplier/RemoveSupplier',
			type : 'post',
			dataType : 'json',
			data : {
				supplierId : supplierIdArray
			},
			success : function(response) {
				if (response === true) {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Remove suppliers successfully!',
					});
					$('#datatable_supplierinfo').datagrid('reload');
				} else {
					if (!isNaN(response)) {
						var suppliername = "";
						for (var i = 0; i < rows.length; i++) {
							if (parseInt(rows[i].intsupplierid) == parseInt(response)) {
								suppliername = rows[i].strname;
								break;
							}
						}
						$.TeachDialog({
							content : 'Remove suppliers failed! Supplier:' + suppliername + ' in use.',
						});
					} else {
						$.TeachDialog({
							content : 'Remove suppliers failed!',
						});
					}
				}
			},
			async : true
		})
		
	});
})