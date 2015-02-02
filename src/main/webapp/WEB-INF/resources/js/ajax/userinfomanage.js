var htmltmp = $('#newformRange').html();
function unix2human(unixtime) {
	var dateObj = new Date(unixtime);
	var UnixTimeToDate = dateObj.getFullYear() + '-' + (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' ' + p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':' + p(dateObj.getSeconds());
	return UnixTimeToDate;
}
function p(s) {
	return s < 10 ? '0' + s : s;
}

function initUserType(id) {
	$.ajax({
		url : 'Type/GetUserTypeAll',
		dataType : 'json',
		type : 'post',
		success : function(data) {
			$('#' + id).empty();
			for ( var i in data) {
				$('#' + id).append('<option value="' + data[i].intidentityid + '">' + data[i].strname + '</option>');
			}
		}
	})
}
function initUserDepartMent(id, type, dtd) {
	$.ajax({
		url : 'Type/GetDepartMent',
		type : 'post',
		dataType : 'json',
		data : {
			id : type,
		},
		success : function(data) {
			$('#' + id).empty();
			for ( var i in data) {
				$('#' + id).append('<option value="' + data[i].intid + '">' + data[i].strname + '</option>');
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

$('#newDepartMent').change(function() {
	initUserDepartMent('newMajor', $(this).val());
})

$(function() {
	console.debug('aaa');
	// initial tablegrid
	cellwidth = ($(".box-content.table-responsive").width() - 55) / 9;
	$('#datatable_userinfo').datagrid({
		striped : true,
		remoteSort : false,
		collapsible : true,
		fit : false,
		url : 'User/GetAllUser',
		loadMsg : 'Please waiting for loading date.....',
		pagination : true,
		rownumbers : true,
		fitColumns : true,
		columns : [ [ {
			field : 'username',
			title : 'UserName',
			align : 'center',
			sortable : true,
			width : cellwidth,
		}, {
			field : 'strname',
			title : 'UserNick',
			align : 'center',
			width : cellwidth,
			sortable : true
		}, {
			field : 'userType',
			title : 'UserType',
			align : 'center',
			width : cellwidth,
			sortable : true,
			formatter : function(value) {
				return value.strname;
			}
		}, {
			field : 'userDepartMent',
			title : 'Group',
			align : 'center',
			width : cellwidth,
			sortable : true,
			formatter : function(value) {
				return value.strname;
			}
		}, {
			field : 'strstunum',
			title : 'Id Card',
			align : 'center',
			width : cellwidth,
			sortable : true
		}, {
			field : 'strphone',
			title : 'Phone',
			align : 'center',
			width : cellwidth,
			sortable : true
		}, {
			field : 'strmail',
			title : 'Email',
			align : 'center',
			width : cellwidth,
			sortable : true,
		}, {
			field : 'dateregtime',
			title : 'CreateTime',
			align : 'center',
			width : cellwidth,
			sortable : true,
			formatter : function(value) {
				return unix2human(value);
			}
		} ] ]
	});

	$('button.adduser').click(function() {
		initUserType('newType');
		var dtd = $.Deferred();
		$.when(initUserDepartMent('newDepartMent', 1, dtd)).done(function() {
			initUserDepartMent('newMajor', $('#newDepartMent').val());
		})
		$('.newform').val('');
		$('#adderrormsg').html("");
		$('#operationpanel').slideUp();
		$('#addnewuser').slideDown();
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
			url : 'User/AuthRegisterAdmin',
			dataType : 'json',
			type : 'post',
			data : postdata,
			success : function(response) {
				if (response) {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Add a new User successfully and do you want to add more ?',
						showCloseButtonName : 'No',
						otherButtons : [ 'Yes', 'Yes & Keep Val' ],
						bootstrapModalOption : {},
						CloseButtonAddFunc : function() {
							$('#operationpanel').slideToggle();
							$('#addnewuser').slideToggle();
						},
						clickButton : function(sender, modal, index) {
							if (index == 0 || index == 1) {
								if (index == 0) {
									$('.newform').val('');
									$('#newType').get(0).selectedIndex = 0;
									$('#newDepartMent').get(0).selectedIndex = 0;
									initUserDepartMent('newMajor', $('#newDepartMent').val());
								}
							}
							$('#datatable_userinfo').datagrid('reload');
							modal.modal('hide');
						}
					});
				} else {
					$.TeachDialog({
						content : 'Add User Failed!',
					});
				}
			}
		});
	});

	$('button.edituser').click(function() {

		$('#operationpanel').slideUp();
		$('#editusercontainer').slideDown();
	});
	// Add Drag-n-Drop
	WinMove();
});