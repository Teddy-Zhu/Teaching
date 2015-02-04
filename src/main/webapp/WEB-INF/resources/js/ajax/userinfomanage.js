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
	$('#editUserName' + id).val(obj.username);
	$('#editPassword' + id).val("[%keep%]");
	$('#editRealName' + id).val(obj.strname);
	$('#editNumber' + id).val(obj.strstunum);
	$('#editEmail' + id).val(obj.strmail);
	$('#editPhone' + id).val(obj.strphone);
	var dtdtype = $.Deferred();
	$.when(initUserType('editType' + id, dtdtype)).done(function() {
		$('#editType' + id).val(obj.userType.intidentityid);
	})
	var dtd = $.Deferred();
	$.when(initUserDepartMent('editDepartMent' + id, 1, dtd)).done(function() {
		$("#editDepartMent" + id).change(function() {
			initUserDepartMent('editMajor' + id, $('#editDepartMent' + id).val());
		})
		$("#editDepartMent" + id).val(obj.userDepartMent.intid);
		var dtdin = $.Deferred();
		$.when(initUserDepartMent('editMajor' + id, $('#editDepartMent' + id).val(), dtdin)).done(function() {
			$("#editMajor" + id).val(obj.userMajor.intid);
		});
	})
}
function initUserType(id, dtd) {
	$.ajax({
		url : 'Type/GetUserTypeAll',
		dataType : 'json',
		type : 'post',
		success : function(data) {
			$('#' + id).empty();
			for ( var i in data) {
				$('#' + id).append('<option value="' + data[i].intidentityid + '">' + data[i].strname + '</option>');
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
	cellwidth = ($(".box-content.table-responsive").width() - 55) / 10;
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
			title : 'DepartMent',
			align : 'center',
			width : cellwidth,
			sortable : true,
			formatter : function(value) {
				return value.strname;
			}
		}, {
			field : 'userMajor',
			title : 'Major',
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
			width : cellwidth + 5,
			sortable : true,
			formatter : function(value) {
				return unix2human(value);
			}
		} ] ]
	});

	// for add user
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
							$('#datatable_userinfo').datagrid('reload');
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

	$('button.cancelAdd').click(function() {
		$('#addnewuser').slideUp();
		$('#operationpanel').slideDown();
	});
	// end
	// for edit user

	$('button.edituser').click(
			function() {
				var rows = $('#datatable_userinfo').datagrid('getSelections');
				if (rows.length == 0) {
					$.TeachDialog({
						content : 'You should select one row at least !',
						bootstrapModalOption : {},
					});
					return;
				}
				$('#userEditTable').html("");
				$('#editusercontainer .tab-content').html("");

				for (var i = 0; i < rows.length; i++) {
					var id = rows[i].intid;
					$('#userEditTable').append('<li role="presentation"><a href="#editpanel' + id + '" role="tab" data-toggle="tab">' + rows[i].username + '</a></li>')
					$('#editusercontainer .tab-content').append('<div role="tabpanel" class="tab-pane fade" id="editpanel' + id + '"></div>');
					$('#editpanel' + id).html(
							htmltmp.replace('newUserName', 'editUserName' + id).replace('newPassword', 'editPassword' + id).replace('newRealName', 'editRealName' + id).replace('newType',
									'editType' + id).replace('newNumber', 'editNumber' + id).replace('newEmail', 'editEmail' + id).replace('newPhone', 'editPhone' + id).replace('newDepartMent',
									'editDepartMent' + id).replace('newMajor', 'editMajor' + id).replace(new RegExp('newform', "gm"), 'editform'));
					setVal(id, rows[i]);
				}
				$('#editusercontainer').slideDown();
				$('#operationpanel').slideUp();

				$('#userEditTable a:first').tab('show')
			});
	$('button.submitEdit').click(function() {
		var idarray = new Array();
		$('[id^=editUserName]').each(function() {
			var l = $(this).attr('id');
			idarray.push(l.substring(12, l.length));
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
			postdata.userId = idarray;
			$.ajax({
				url : 'User/UpdateUserInfoAdmin',
				type : 'post',
				dataType : 'json',
				data : postdata,
				success : function(data) {
					if (data) {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Edit Users Info successfully!',
							CloseButtonAddFunc : function() {
								$('#operationpanel').slideDown();
								$('#editusercontainer').slideUp();
								$('#datatable_userinfo').datagrid('reload');
							},
						});
					} else {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Edit Users Info failed!',
							CloseButtonAddFunc : function() {
								$('#operationpanel').slideDown();
								$('#editusercontainer').slideUp();
								$('#datatable_userinfo').datagrid('reload');
							},
						});
					}
				}
			})
		}
	});
	$('button.cancelEdit').click(function() {
		$('#operationpanel').slideDown();
		$('#editusercontainer').slideUp();
	});
	// Add Drag-n-Drop
	WinMove();
});