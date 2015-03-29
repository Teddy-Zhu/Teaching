var htmltmp = $('#newformRange').html();

function setVal(id, obj) {
	$('#editUserName' + id).val(obj.username);
	$('#editPassword' + id).val("[%keep%]");
	$('#editRealName' + id).val(obj.strname);
	$('#editNumber' + id).val(obj.strstunum);
	$('#editEmail' + id).val(obj.strmail);
	$('#editPhone' + id).val(obj.strphone);

	initUserType('editType' + id).done(function() {
		$('#editType' + id).val(obj.userType.intidentityid);
	})

	initUserDepartMent('editDepartMent' + id, 1).done(function() {
		$("#editDepartMent" + id).change(function() {
			initUserDepartMent('editMajor' + id, $('#editDepartMent' + id).val());
		})
		$("#editDepartMent" + id).val(obj.userDepartMent.intid);
		initUserDepartMent('editMajor' + id, $('#editDepartMent' + id).val()).done(function() {
			$("#editMajor" + id).val(obj.userMajor.intid);
		});
	})
}
function initUserType(id, addition) {
	var dtd = $.Deferred();
	var fillDom = function(domData) {
		$('#' + id).empty();
		if (addition != undefined) {
			$('#' + id).append('<option value="-1">All UserType</option>');
		}
		for (var i = 0; len = domData.length, i < len; i++) {
			$('#' + id).append('<option value="' + domData[i].intidentityid + '">' + domData[i].strname + '</option>');
		}
		dtd.resolve();
	}
	if ($('#operationpanel').data('usertype') != undefined) {
		fillDom($('#operationpanel').data('usertype'));
	} else {
		$.ajax({
			url : 'Type/GetUserTypeAll',
			dataType : 'json',
			type : 'post',
			success : function(data) {
				$('#operationpanel').data('usertype', data);
				fillDom(data);
			},
			async : true
		})
	}
	return dtd.promise();
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
function initUserDepartMent(id, type, addition) {
	var typedata = type.toString().replace('-', 'minus');
	var dtd = $.Deferred();
	var filldom = function(domData) {
		$('#' + id).empty();
		if (addition != undefined) {
			$('#' + id).append('<option value="-1">All DepartMent</option>');
		}
		for (var i = 0; len = domData.length, i < len; i++) {
			$('#' + id).append('<option value="' + domData[i].intid + '">' + domData[i].strname + '</option>');
		}
		dtd.resolve();
	}
	if ($('#operationpanel').data('userdepartment' + typedata) != undefined) {
		filldom($('#operationpanel').data('userdepartment' + typedata));
	} else {
		$.ajax({
			url : 'Type/GetDepartMent',
			type : 'post',
			dataType : 'json',
			data : {
				id : type,
			},
			success : function(data) {
				$('#operationpanel').data('userdepartment' + typedata, data);
				filldom(data);
			},
			async : true
		})
	}

	return dtd.promise();
}

$(function() {
	$('#newDepartMent').change(function() {
		initUserDepartMent('newMajor', $(this).val());
	})

	$('#SearchTime').datepicker({
		format : "yyyy-mm-dd",
		todayBtn : "linked",
		autoclose : true,
		todayHighlight : true,
		clearBtn : true
	});
	// initial tablegrid
	var psval = $('#datatable_userinfo').attr('data-size');
	if (psval == undefined || psval == "") {
		psval = 10;
	}
	var cellwidth = ($(".box-content.table-responsive").width() - 55) / 11;
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
		pageSize : psval,
		pageList : [ psval, psval * 2, psval * 3, psval * 4, psval * 5 ],
		columns : [ [ {
			field : 'intid',
			title : 'User ID',
			align : 'center',
			sortable : true,
			width : cellwidth * 0.5,
		}, {
			field : 'username',
			title : 'UserName',
			align : 'center',
			sortable : true,
			width : cellwidth,
		}, {
			field : 'strname',
			title : 'RealName',
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
			width : cellwidth * 1.4,
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
			width : cellwidth * 1.1 + 10,
			sortable : true,
			formatter : function(value) {
				return unix2human(value);
			}
		} ] ],
		onBeforeLoad : function(param) {
			param = getSearchParams(param);
		},
	});

	// init search
	initUserType('SearchUserType', true);
	initUserDepartMent('SearchDepartMent', 1, true).done(function() {
		$('#SearchDepartMent').change(function() {
			initUserDepartMent('SearchMajor', $('#SearchDepartMent').val(), true);
		})
		initUserDepartMent('SearchMajor', $('#SearchDepartMent').val(), true);
	})

	// for add user
	$('button.adduser').click(function() {
		initUserType('newType');
		initUserDepartMent('newDepartMent', 1).done(function() {
			initUserDepartMent('newMajor', $('#newDepartMent').val());
		})
		$('input.newform').val('');
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
				$('#editerrormsg').html("");
				for (var i = 0; i < rows.length; i++) {
					var id = rows[i].intid;
					$('#userEditTable').append('<li role="presentation"><a href="#editpanel' + id + '" role="tab" data-toggle="tab">' + rows[i].username + '</a></li>')
					$('#editusercontainer .tab-content').append('<div role="tabpanel" class="tab-pane fade" id="editpanel' + id + '"></div>');
					$('#editpanel' + id).html(
							htmltmp.replace('newUserName', 'editUserName' + id).replace('newPassword', 'editPassword' + id).replace('newRealName', 'editRealName' + id).replace('newType', 'editType' + id).replace('newNumber', 'editNumber' + id).replace('newEmail', 'editEmail' + id).replace(
									'newPhone', 'editPhone' + id).replace('newDepartMent', 'editDepartMent' + id).replace('newMajor', 'editMajor' + id).replace(new RegExp('newform', "gm"), 'editform'));
					setVal(id, rows[i]);
				}
				$('#userEditTable a:first').tab('show')
				$('#editusercontainer').slideDown();
				$('#operationpanel').slideUp();
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

	// remove user
	$('button.removeuser').click(function() {
		var rows = $('#datatable_userinfo').datagrid('getSelections');
		if (rows.length == 0) {
			$.TeachDialog({
				content : 'You should select one row at least !',
				bootstrapModalOption : {},
			});
			return;
		}
		var userIdArray = new Array();
		var namesArray = new Array();
		for (var i = 0; i < rows.length; i++) {
			userIdArray.push(parseInt(rows[i].intid));
			namesArray.push(rows[i].username);
		}

		var sureDialog = function() {
			var dtd = $.Deferred();
			$.TeachDialog({
				title : 'Warnning Message!',
				content : 'Are you sure remove this users :' + namesArray + ' ?',
				showCloseButtonName : 'No',
				otherButtons : [ 'Yes' ],
				CloseButtonAddFunc : function() {
					dtd.reject();
				},
				clickButton : function(sender, modal, index) {
					if (index == 0) {
						dtd.resolve();
					}
					modal.modal('hide');
				}
			});
			return dtd.promise();
		};
		sureDialog().done(function() {
			$.ajax({
				url : 'User/RemoveUser',
				type : 'post',
				dataType : 'json',
				data : {
					userId : userIdArray
				},
				success : function(response) {
					if (response === true) {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Remove users successfully!',
						})
						$('#datatable_userinfo').datagrid('reload');
					} else {
						if (!isNaN(response)) {
							var username = "";
							for (var i = 0; i < rows.length; i++) {
								if (parseInt(rows[i].intid) == parseInt(response)) {
									username = rows[i].username;
									break;
								}
							}
							$.TeachDialog({
								content : 'Remove users failed! User:' + username + ' in use.',
							})
						} else {
							$.TeachDialog({
								content : 'Remove users failed!',
							})
						}
					}
				},
				async : true
			})
		}).fail(function() {

		})
	})
	$('#Search').click(function(){
		$('#datatable_userinfo').datagrid('reload');
	})
	
});