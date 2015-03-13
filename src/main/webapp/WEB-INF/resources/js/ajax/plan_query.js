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
			content : 'You should select a row!',
			bootstrapModalOption : {},
		});
		return;
	}
	if (type = 1) {
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
					content : '<div class="col-xs-offset-1 row" style="width:80%"><label class="col-xs-4">Student Change:</label><input id="StuChange" type="text" value="0" class="col-xs-8 form-control" /><label class="col-xs-4">Teacher Change:</label><input id="TeaChange" type="text" value="0" class="col-md-5 form-control" /></div>',
					otherButtons : [ 'Select' ],
					dialogShow : function() {
						$("#StuChange,#TeaChange").TouchSpin({
							min : -100,
							max : 100,
							step : 1
						});
					},
					clickButton : function(sender, modal, index) {
						if (index == 0) {
							if (x)
								modal.modal('hide');
						}
					},
				})
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
				alert('delete');
			}
		}, '-', {
			text : "Re-Submit",
			iconCls : 'fa fa-recycle',
			handler : function() {
				alert('delete');
			}
		}, '-', {
			text : "Query History",
			iconCls : 'fa fa-search',
			handler : function() {
				alert('delete');
			}
		} ]
	});

	$('#Search').click(function() {
		$mydatagrid.datagrid('reload');
	})
	// Add Drag-n-Drop
	WinMove();
})