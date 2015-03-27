function getSearchParams(params) {
	var searchParams = new Object();
	if (params != undefined) {
		searchParams = params;
	}
	$('.SearchForm').each(function() {
		var param = $(this).val()
		if (param == null && param == undefined) {
			param = ''
		} else {
			param = param.trim();
		}
		searchParams[$(this).attr('id')] = param;
	});
	return searchParams;
}

function getPlanStatus(domId) {
	var dtd = $.Deferred();
	var fillDom = function(domData) {
		for (var i = 0; len = domData.length, i < len; i++) {
			$('#' + domId).append('<option value="' + domData[i].intplanstatusid + '">' + domData[i].strmark + '</option>')
		}
		dtd.resolve();
	}
	if ($('#PlanStatus').data('bookplanstatus') == undefined) {
		$.ajax({
			url : 'Plan/GetBookPlanStatus',
			dataType : 'json',
			type : 'post',
		}).success(function(data) {
			$('#PlanStatus').data('bookplanstatus', data);
			fillDom(data);
		})
	} else {
		fillDom($('#PlanStatus').data('bookplanstatus'));
	}
	return dtd.promise();
}

function toolBarClick(type, oneneed, pendingneed) {
	var rows = $('#datatable_perplaninfo').datagrid('getSelections');

	if (rows.length < 1) {
		$.TeachDialog({
			content : 'You should select one row at least!',
			bootstrapModalOption : {},
		});
		return;
	}
	if (oneneed) {
		if (rows.length > 1) {
			$.TeachDialog({
				content : 'You should select one row at most!',
				bootstrapModalOption : {},
			});
			return;
		}
	}
	var plans = new Array();

	for (var i = 0, len = rows.length; i < len; i++) {
		plans.push(rows[i].intplanid);
		if (pendingneed && rows[i].bookPlanStatus.intplanstatusid != 1) {
			$.TeachDialog({
				content : 'The plan status you selected is not pending!',
				bootstrapModalOption : {},
			});
			return;
		}
	}

	var url = undefined
	switch (type) {
	case 1: {
		if (url == undefined) {
			url = 'PassPlan';
		}
	}
	case 2: {
		if (url == undefined) {
			url = 'RejectPlan';
		}
	}
	case 3: {
		if (url == undefined) {
			url = 'RefusePlan';
		}
		$.ajax({
			url : 'Plan/' + url,
			dataType : 'json',
			type : 'post',
			data : {
				planId : plans
			}
		}).success(function(data) {
			if (data) {
				$.TeachDialog({
					content : 'Change Plan Status Successfully!',
					bootstrapModalOption : {},
				});
			} else {
				$.TeachDialog({
					content : 'Change Plan Status failed!',
					bootstrapModalOption : {},
				});
			}
		})
		break;
	}
	case 4: {
		$.TeachDialog({
			title : 'Change The Plan Status',
			content : '<div class="col-xs-offset-1 row" style="width: 80%;"><label class="col-xs-4">Plan Status:</label><select id="ChangePlanStatus" style="width:50%" type="text" class="col-xs-8 form-control" ></select></div>',
			otherButtons : [ 'Change' ],
			otherButtonStyles : [ 'btn btn-primary' ],
			dialogShow : function() {
				getPlanStatus('ChangePlanStatus');
			},
			clickButton : function(sender, modal, index) {
				if (index == 0) {

				}
			},
		})
		break;
	}
	case 5: {
		$.TeachDialog({
			title : 'The Plan History',
			content : '<div id="historytable" class="table-responsive"><table class="table"><caption>Plan Histroy Changes</caption></table></div>',
			largeSize : true,
			dialogShow : function() {
				$.ajax({
					url : 'Plan/GetPlanHistory',
					dataType : 'json',
					type : 'post',
					data : {
						PlanId : plans[0]
					}
				}).success(function(data) {
					$('#historytable table').append('<thead><tr><th>Id</th><th>Operation Name</th><th>Changes</th><th>Operation Personal</th><th>Operation Time</th></tr></thead><tbody></tbody>');
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
						$('#historytable table tbody').append('<tr><td>' + (i + 1) + '</td><td>' + data[i].operation.stroperationname + '</td><td>' + changeString.trimEnd('<br>') + '</td><td>' + data[i].user.strname + '</td><td>' + unix2human(data[i].datecreatetime) + '</td></tr>');
					}
				});
			},
		})
		break;
	}
	}
}

function queryPlanHistory() {
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

	getPlanStatus('PlanStatus');

	var psval = $('#datatable_perplaninfo').attr('data-size');
	if (psval == undefined || psval == "") {
		psval = 10;
	}
	cellwidth = ($(".box-content.table-responsive").width() - 55) / 11;
	var $mydatagrid = $('#datatable_perplaninfo');
	$mydatagrid.datagrid({
		striped : true,
		remoteSort : false,
		fit : false,
		url : 'Plan/GetAllPlan',
		loadMsg : 'Please waiting for loading date.....',
		pagination : true,
		rownumbers : true,
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
			field : 'user',
			title : 'Applicant',
			align : 'center',
			width : cellwidth,
			formatter : function(value) {
				return value.strname;
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
		} ] ],
		onBeforeLoad : function(param) {
			param = getSearchParams(param);
		},
		toolbar : [ {
			text : "Pass Plan",
			iconCls : 'fa fa-pencil',
			handler : function() {
				toolBarClick(1, false, true);
			}
		}, '-', {
			text : "Reject Plan",
			iconCls : 'fa fa-remove',
			handler : function() {
				toolBarClick(2, false, true);
			}
		}, '-', {
			text : "Refuse Plan",
			iconCls : 'fa fa-recycle',
			handler : function() {
				toolBarClick(3, false, true);
			}
		}, '-', {
			text : "Change Other Status",
			iconCls : 'fa fa-search',
			handler : function() {
				toolBarClick(4, false, false);
			}
		}, '-', {
			text : "Query Plan History",
			iconCls : 'fa fa-search',
			handler : function() {
				toolBarClick(5, true, false);
			}
		}, '-', {
			text : "Export Below Plan To Excel",
			iconCls : 'fa fa-download',
			handler : function() {
				$.DownloadFile({
					url : 'Plan/ExportPerPlan',
					method : 'post',
					data : getSearchParams(),
				});
			}
		}, '-', {
			text : "Export Below Plan Statistics To Excel",
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
})