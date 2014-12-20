var hander = {
	action : {
		FormSetTimer : function(domId) {
			$('#' + domId).parent().removeClass('has-success');
			$('#' + domId).parent().removeClass('has-error');
			$('#' + domId).parent().addClass('has-error');
			$('#' + domId).parent().addClass('zx-anima-shake');
			if (domId == "PassWord" || domId == "RePassWord" || domId == "loginPassWord") {
				$('#' + domId).next().tooltip({
					title : 'Incorrect!',
					placement : "right",
					html : true
				});
				$('#' + domId).next().tooltip('show');
			} else {
				$('#' + domId).tooltip({
					title : 'Incorrect!',
					placement : "right",
				});
				$('#' + domId).tooltip('show');
			}
			setTimeout(returntimeer(domId), 1000);
		},
		SetSucccess : function(domId) {
			$('#' + domId).parent().removeClass('has-success');
			$('#' + domId).parent().removeClass('has-error');
			$('#' + domId).parent().addClass('has-success');
		}
	}
}
function delShakeClass(domId) {
	$('#' + domId).parent().removeClass('zx-anima-shake');
}
function returntimeer(domId) {
	return function() {
		delShakeClass(domId);
	};
}
var i = true;
var t = false;
$(function() {
	$('#loginButton').click(function() {
		$(this).button('loading');
		// var userTypeId = $("#UserType label.active input").val();

		var userName = $('#loginUserName').val();
		var mark = true;
		if (userName == "" || userName.trim() == "") {
			hander.action.FormSetTimer('loginUserName');
			mark = false;
		} else {
			hander.action.SetSucccess('loginUserName');
		}
		var passWord = $('#loginPassWord').val();
		if (passWord == "" || passWord.trim() == "") {
			hander.action.FormSetTimer('loginPassWord');
			mark = false;
		} else {
			hander.action.SetSucccess('loginPassWord');
		}

		if (!mark) {
			$(this).button('reset');
			return;
		}

		$.ajax({
			url : 'User/AuthLogin',
			type : 'post',
			data : {
				UserName : userName,
				PassWord : passWord,
			},
			dataType : 'json',
			complete : function(data) {
			},
			success : function(data) {
				if (data != null) {
					if (data) {
						$.TeachDialog({
							title : 'Congratulations',
							content : 'Login Successfully! Welcome to Use the System!',
							dialogHidden : function() {
								window.location.href = 'AdminMenu';
							}
						});
						return;
					}
				}
				$.TeachDialog({
					title : 'Faild',
					content : 'Failed to Login!Please ensure your password correct!'
				});

			},
			error : function(data) {
				console.debug(data.status);
			},
			async : true
		});
		$(this).button('reset');
	});

	$('.glyphicon.glyphicon-chevron-down').click(function() {
		if (i == true) {
			i = false;
			var optiondefault = '<label class="btn btn-default disabled"><span class="glyphicon glyphicon-stats"></span><input type="radio" name="UserType" value=0>UserType</label>';
			$.ajax({
				url : 'User/GetUserType',
				type : 'post',
				dataType : 'json',
				complete : function(data) {
				},
				success : function(data) {
					if (data != null) {
						$('#UserType').empty();
						$('#UserType').append(optiondefault);
						for ( var i in data) {
							var option = '<label class="btn btn-primary"><input type="radio" name="UserType" value=' + data[i].intidentityid + '>' + data[i].strname + '</label>';
							$('#UserType').append(option);
						}
					} else {
						$.TeachDialog({
							title : 'Faild',
							content : 'Failed to achieve usertype!'
						});
					}
				},
				error : function(data) {
					console.debug(data.status);
				},
				async : true
			});
			$('#loginModal').slideToggle();
			$('#registerModal').slideToggle();
		} else {
			i = true;
			$('#registerModal').slideToggle();
			$('#loginModal').slideToggle();
		}
	});

	$('.passwordc.input-group-addon.glyphicon').click(function() {
		var str = 'text';
		if (t)
			str = "password";
		$(this).prev().attr('type', str);
		if (t) {
			$(this).removeClass('glyphicon-eye-open');
			$(this).addClass('glyphicon-eye-close');
		} else {
			$(this).removeClass('glyphicon-eye-close');
			$(this).addClass('glyphicon-eye-open');
		}
		if (t)
			t = false;
		else
			t = true;
	});
	$('#registerButton').click(function() {
		$(this).button('loading');
		var userTypeId = $("#UserType label.active input").val();
		if (userTypeId == undefined) {
			$("#UserType").addClass('has-error');
			$("#UserType").addClass('zx-anima-shake');
			setTimeout(function() {
				$("#UserType").removeClass('zx-anima-shake');
			}, 1000);
			$("#UserType").tooltip({
				title : 'Please select a type at least!',
				placement : "right"
			});
			$(this).button('reset');
			return;
		}

		var userName = $('#UserName').val();
		var mark = true;
		if (userName == "" || userName.trim() == "") {
			hander.action.FormSetTimer('UserName');
			mark = false;
		} else {
			hander.action.SetSucccess('UserName');
		}
		var passsWord = $('#PassWord').val();
		if (passsWord == "" || passsWord.trim() == "") {
			hander.action.FormSetTimer('PassWord');
			mark = false;
		} else {
			hander.action.SetSucccess('PassWord');
		}
		var rePassword = $('#RePassWord').val();
		if (rePassword == "" || rePassword.trim() == "" || rePassword != passsWord) {
			hander.action.FormSetTimer('RePassWord');
			mark = false;
		} else {
			hander.action.SetSucccess('RePassWord');
		}
		var phone = $('#Phone').val();
		if (phone == "" || phone.trim() == "") {
			hander.action.FormSetTimer('Phone');
			mark = false;
		} else {
			hander.action.SetSucccess('Phone');
		}

		var email = $('#Email').val();
		if (email == "" || email.trim() == "") {
			hander.action.FormSetTimer('Email');
			mark = false;
		} else {
			hander.action.SetSucccess('Email');
		}

		var realName = $('#RealName').val();
		if (realName == "" || realName.trim() == "") {
			hander.action.FormSetTimer('RealName');
			mark = false;
		} else {
			hander.action.SetSucccess('RealName');
		}
		if (!mark) {
			$(this).button('reset');
			return;
		}
		if (mark) {
			$.ajax({
				url : 'User/AuthRegister',
				type : 'post',
				data : {
					UserName : userName,
					PassWord : passsWord,
					RealName : realName,
					Phone : phone,
					Email : email
				},
				dataType : 'json',
				complete : function(data) {
					$(this).button('reset');
				},
				success : function(data) {
					if (data != null) {
						if (data) {
							$.TeachDialog({
								title : 'Congratulations',
								content : 'Register Successfully! Welcome to Use the System!',
								dialogHidden : function() {
									window.location.href = '/teaching';
								}
							});
						} else
							$.TeachDialog({
								title : 'Faild',
								content : 'Failed to register!'
							});
					} else {
						$.TeachDialog({
							title : 'Faild',
							content : 'Failed to register!'
						});
					}
				},
				error : function(data) {

					console.debug(data.status);
				},
				async : true
			});
		} else {
			$(this).button('reset');
		}
	})
	$('#UserName').blur(function() {

		var userName = $('#UserName').val();
		if (userName == "" || userName.trim() == "") {
			return;
		}
		$.ajax({
			url : 'User/AuthUserName',
			type : 'post',
			data : {
				UserName : userName
			},
			dataType : 'json',
			complete : function(data) {
			},
			success : function(data) {
				if (data != null) {
					if (data) {
						hander.action.SetSucccess('UserName');
					} else {
						hander.action.FormSetTimer('UserName');
					}
				} else {
					hander.action.FormSetTimer('UserName');
				}
			},
			error : function(data) {
				console.debug(data.status);
			},
			async : true
		});
	})

})
