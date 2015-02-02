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
	$('#editUserName' + id).val(obj.strbookcoding);
	$('#editPassword' + id).val("[%keep%]");
	$('#editRealName' + id).val(obj.strpress);
	$('#editType' + id).val(obj.strauthor);
	$('#editNumber' + id).val(obj.strprice);
	$('#editEmail' + id).val(obj.intpricediscount);
	$('#editPhone' + id).val(obj.bookType.intbooktypeid);
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
		},
		async : true
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
					$('#bookEditTable').append('<li role="presentation"><a href="#editpanel' + id + '" role="tab" data-toggle="tab">' + rows[i].strbookname + '</a></li>')
					$('#editusercontainer .tab-content').append('<div role="tabpanel" class="tab-pane fade" id="editpanel' + id + '"></div>');
					$('#editpanel' + id).html(
							htmltmp.replace('newUserName', 'editUserName' + id).replace('newPassword', 'editPassword' + id).replace('newRealName', 'editRealName' + id).replace('newType',
									'editType' + id).replace('newNumber', 'editNumber' + id).replace('newEmail', 'editEmail' + id).replace('newPhone', 'editPhone' + id).replace('newDepartMent',
									'editDepartMent' + id).replace('newMajor', 'editMajor' + id).replace(new RegExp('newform', "gm"), 'editform'));
					$.ajax({
						url : 'Type/GetParentDepartMent',
						dataType : 'json',
						type : 'post',
						data : {
							id : rows[i].userDepartMent.intid
						},
						async : true
					}).success(function(data) {
						
					})
					setVal(id, rows[i]);
				}
				for (var i = 0; i < rows.length; i++) {
					var id = rows[i].intid;
				}

				initBookType('editBookType' + id);
				initSupplierType('editSupplierType' + id);
				setVal(id, rows[i]);
				$('#operationpanel').slideUp();
				$('#editusercontainer').slideDown();

				$('#bookEditTable a:first').tab('show')
			});
	// Add Drag-n-Drop
	WinMove();
});