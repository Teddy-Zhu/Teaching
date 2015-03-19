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

function toolBarClick(type) {
	var rows = $('#datatable_perplaninfo').datagrid('getSelections');
	if (rows.length != 1) {
		$.TeachDialog({
			content : 'You should select one row at most!',
			bootstrapModalOption : {},
		});
		return;
	}
	var planId = rows[0].intplanid;
	switch (type) {
	case 1: {
		if (rows[0].bookPlanStatus.intplanstatusid > 2) {
			$.TeachDialog({
				content : 'The Plan can not be changed because it\'s status is ' + rows[0].bookPlanStatus.strmark + '!',
				bootstrapModalOption : {},
			});
			return;
		}
		$
				.TeachDialog({
					title : 'Change The Plan',
					content : '<div class="col-xs-offset-1 row" style="width: 80%;"><label class="col-xs-4">Student Change:</label><input id="StuChange" type="text" value="0" class="col-xs-8 form-control" /><label class="col-xs-4">Teacher Change:</label><input id="TeaChange" type="text" value="0" class="col-md-5 form-control" /> <label class="col-xs-4">ChangeReason:</label><textarea id="ChangeReason" type="text" style="width:66.3%" class="col-md-5 form-control">none</textarea></div>',
					otherButtons : [ 'Submit' ],
					otherButtonStyles : [ 'btn btn-primary' ],
					dialogShow : function() {
						$("#StuChange,#TeaChange").TouchSpin({
							min : -100,
							max : 100,
							step : 1
						});
					},
					clickButton : function(sender, modal, index) {
						if (index == 0) {
							if (($('#StuChange').val() == '0' && $('#TeaChange').val() == '0') || $('#StuChange').val().trim() == "" || $('#TeaChange').val().trim() == "") {
								$.TeachDialog({
									content : 'Parameters are not correct!',
								})
								return;
							}
							$.ajax({
								url : 'Plan/Change',
								dataType : 'json',
								type : 'post',
								data : {
									StuChange : $('#StuChange').val(),
									TeaChange : $('#TeaChange').val(),
									ChangeReason : $('#ChangeReason').val(),
									PlanId : planId
								}
							}).success(function(data) {
								if (data) {
									$.TeachDialog({
										content : 'Changes Saved!',
									})
									modal.modal('hide');
									$('#datatable_perplaninfo').datagrid('reload');
								} else {
									$.TeachDialog({
										content : 'Changes failed!',
									})
								}
							})
						}
					},
				})
		break;
	}
	case 2: {
		if (rows[0].bookPlanStatus.intplanstatusid > 2) {
			$.TeachDialog({
				content : 'The Plan can not be canceled because it\'s status is ' + rows[0].bookPlanStatus.strmark + '!',
				bootstrapModalOption : {},
			});
			return;
		}
		$.ajax({
			url : 'Plan/Cancel',
			dataType : 'json',
			type : 'post',
			data : {
				PlanId : planId
			}
		}).success(function(data) {
			if (data) {
				$.TeachDialog({
					content : 'The Plan has been canceled!',
					bootstrapModalOption : {},
				});
				$('#datatable_perplaninfo').datagrid('reload');
			}
		})
		break;
	}
	case 3: {
		if (rows[0].bookPlanStatus.intplanstatusid != 2) {
			$.TeachDialog({
				content : 'The Plan can not be re-submitted because it\'s status is ' + rows[0].bookPlanStatus.strmark + '!',
				bootstrapModalOption : {},
			});
			return;
		}
		$.ajax({
			url : 'Plan/ReSubmit',
			dataType : 'json',
			type : 'post',
			data : {
				PlanId : planId
			}
		}).success(function(data) {
			if (data) {
				$.TeachDialog({
					content : 'The Plan has been canceled!',
					bootstrapModalOption : {},
				});
				$('#datatable_perplaninfo').datagrid('reload');
			}
		})
		break;
	}
	case 4: {
		$.TeachDialog({
			title : 'The Plan History',
			content : '<div id="historytable" class="table-responsive"><table class="table"><caption>Plan Histroy Changes</caption></table></div>',
			dialogShow : function() {
				$.ajax({
					url : 'Plan/GetPerPlanHistory',
					dataType : 'json',
					type : 'post',
					data : {
						PlanId : planId
					}
				}).success(function(data) {
					$('#historytable table').append('<thead><tr><th>Id</th><th>Operation Name</th><th>Changes</th><th>Operation Time</th></tr></thead><tbody></tbody>');
					for (var i = 0, len = data.length; i < len; i++) {
						var changeString = '';
						if (data[i].bookPlanChange && data[i].bookPlanChange.intbookchangeid != -1) {
							var stcount = data[i].bookPlanChange.intstudent;
							var teacount = data[i].bookPlanChange.intteacher;
							if (stcount != 0) {
								changeString += (stcount > 0 ? 'Increase' : 'Decrease') + ' Student Number :' + Math.abs(stcount) + '<br>';
							}
							if (teacount != 0) {
								changeString += (teacount > 0 ? 'Increase' : 'Decrease') + ' Teacher Number :' + Math.abs(teacount) + '<br>';
							}
						} else {
							changeString = 'none';
						}
						$('#historytable table tbody').append('<tr><td>' + (i + 1) + '</td><td>' + data[i].operation.stroperationname + '</td><td>' + changeString.trimEnd('<br>') + '</td><td>' + unix2human(data[i].datecreatetime) + '</td></tr>');
					}
				});
			},
		})
		break;
	}
	}
}

$(function() {

	// initial date input
	$('#SearchDate').datepicker({
		format : "yyyy-mm-dd",
		todayBtn : "linked",
		autoclose : true,
		todayHighlight : true,
		clearBtn : true
	});

	// initial type
	$.ajax({
		url : 'Plan/GetCourseType',
		dataType : 'json',
		type : 'post',
	}).success(function(data) {
		for (var i = 0; len = data.length, i < len; i++) {
			$('#CourseType').append('<option value="' + data[i].intcoursetypeid + '">' + data[i].strcoursename + '</option>')
		}
	})

	$.ajax({
		url : 'Plan/GetBookPlanStatus',
		dataType : 'json',
		type : 'post',
	}).success(function(data) {
		for (var i = 0; len = data.length, i < len; i++) {
			$('#PlanStatus').append('<option value="' + data[i].intplanstatusid + '">' + data[i].strmark + '</option>')
		}
	})
	var psval = $('#datatable_perplaninfo').attr('data-size');
	if (psval == undefined || psval == "") {
		psval = 10;
	}
	cellwidth = ($(".box-content.table-responsive").width() - 55) / 10;
	var $mydatagrid = $('#datatable_perplaninfo');
	$mydatagrid.datagrid({
		striped : true,
		remoteSort : false,
		fit : false,
		url : 'Plan/GetPerPlan',
		loadMsg : 'Please waiting for loading date.....',
		pagination : true,
		rownumbers : true,
		singleSelect : true,
		fitColumns : true,
		pageSize : psval,
		pageList : [ psval, psval * 2, psval * 3, psval * 4, psval * 5 ],
		columns : [ [ {
			field : 'strcoursename',
			title : 'CourseName',
			align : 'center',
			sortable : true,
			width : cellwidth,
		}, {
			field : 'courseType',
			title : 'CourseType',
			align : 'center',
			width : cellwidth,
			sortable : true,
			formatter : function(value) {
				return value.strcoursename;
			}
		}, {
			field : 'strclass',
			title : 'ClassId',
			align : 'center',
			width : cellwidth,
			sortable : true,
		}, {
			field : 'intstudcount',
			title : 'Student Count',
			align : 'center',
			width : cellwidth * 0.5,
			sortable : true,
		}, {
			field : 'intteaccount',
			title : 'Teacher Count',
			align : 'center',
			width : cellwidth * 0.5,
			sortable : true
		}, {
			field : 'book',
			title : 'BookName',
			align : 'center',
			width : cellwidth * 2,
			sortable : true,
			formatter : function(value) {
				return value.strbookname;
			}
		}, {
			field : 'intfromyear',
			title : 'Time',
			align : 'center',
			width : cellwidth,
			formatter : function(value, row) {
				return value + '-' + row.inttoyear;
			}
		}, {
			field : 'intterm',
			title : 'Term',
			align : 'center',
			width : cellwidth,
			sortable : true,
			formatter : function(value) {
				if (value) {
					return '下半学年';
				} else {
					return '上半学年';
				}
			}
		}, {
			field : 'strmark',
			title : 'Mark',
			align : 'center',
			width : cellwidth,
		}, {
			field : 'datecreatetime',
			title : 'CreateTime',
			align : 'center',
			width : cellwidth + 35,
			sortable : true,
			formatter : function(value) {
				return unix2human(value);
			}
		}, {
			field : 'bookPlanStatus',
			title : 'Status',
			align : 'center',
			width : cellwidth,
			sortable : true,
			formatter : function(value) {
				return value.strmark;
			}
		}

		] ],
		onBeforeLoad : function(param) {
			param = getSearchParams(param);
		},
		toolbar : [ {
			text : "Change",
			iconCls : 'fa fa-pencil',
			handler : function() {
				toolBarClick(1);
			}
		}, '-', {
			text : "Cancel",
			iconCls : 'fa fa-remove',
			handler : function() {
				toolBarClick(2);
			}
		}, '-', {
			text : "Re-Submit",
			iconCls : 'fa fa-recycle',
			handler : function() {
				toolBarClick(3);
			}
		}, '-', {
			text : "Query History Changes",
			iconCls : 'fa fa-search',
			handler : function() {
				toolBarClick(4);
			}
		}, '-', {
			text : "Export Below Plan To Excel",
			iconCls : 'fa fa-download',
			handler : function() {
				$.DownloadFile({
					url : 'Plan/ImportPerPlan',
					method : 'post',
					data : getSearchParams(),
				})
			}
		} ]
	});

	$('#Search').click(function() {
		$mydatagrid.datagrid('reload');
	})
	// Add Drag-n-Drop
	WinMove();
})