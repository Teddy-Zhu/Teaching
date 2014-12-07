var hander = {
	action : {
		FormSetTimer : function(domId) {
			$('#' + domId).parent().addClass('has-error');
			$('#' + domId).parent().addClass('zx-anima-shake');
			if (domId == "PassWord" || domId == "RePassWord") {
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
					html : true
				});
				$('#' + domId).tooltip('show');
			}
			setTimeout(returntimeer(domId), 1000);
		},
		SetSucccess : function(domId) {
			$('#' + domId).parent().addClass('has-success');
		},
		removeAllClass : function(domId) {
			$('#' + domId).parent().removeClass('has-success');
			$('#' + domId).parent().removeClass('has-error');
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
		$(this).button('loading')
		$.TeachDialog({
			title : 'Congratulations',
			content : 'Register Successfully! Welcome to Use the System!',
			dialogHidden : function() {
				window.location.href = '/teaching';
			}
		});
		setTimeout(function() {
			$('#loginButton').button('reset');
		}, 5000);
	})

	$('.glyphicon.glyphicon-chevron-down').click(function() {
		if (i == true) {
			i = false;
			$('#loginModal').slideToggle();
			$('#registerModal').slideToggle();
		} else {
			i = true;
			$('#registerModal').slideToggle();
			$('#loginModal').slideToggle();
		}
	})

	$('.input-group-addon.glyphicon.glyphicon-eye-close').click(function() {
		var str = 'text';
		if (t)
			str = "password";
		$('#loginPassWord').attr('type', str);
		$('#RePassWord').attr('type', str);
		$('#PassWord').attr('type', str);
		if (t) {
			$(this).removeClass('glyphicon-eye-open');
			$(this).addClass('glyphicon-eye-close')
		} else {
			$(this).removeClass('glyphicon-eye-close');
			$(this).addClass('glyphicon-eye-open')
		}
		if (t)
			t = false;
		else
			t = true;
	})
	$('#registerButton').click(function() {
		$(this).button('loading')
		var userName = $('#UserName').val();
		var mark = true;
		hander.action.removeAllClass('UserName');
		if (userName == "" || userName.trim() == "") {
			hander.action.FormSetTimer('UserName');
			mark = false;
		}
		hander.action.removeAllClass('PassWord');
		var passsWord = $('#PassWord').val();
		if (passsWord == "" || passsWord.trim() == "") {
			hander.action.FormSetTimer('PassWord');
			mark = false;
		}
		hander.action.removeAllClass('RePassWord');
		var rePassword = $('#RePassWord').val();
		if (rePassword == "" || rePassword.trim() == "" || rePassword != passsWord) {
			hander.action.FormSetTimer('RePassWord');
			mark = false;
		}
		hander.action.removeAllClass('Phone');
		var phone = $('#Phone').val();
		if (phone == "" || phone.trim() == "") {
			hander.action.FormSetTimer('Phone');
			mark = false;
		}
		hander.action.removeAllClass('Email');
		var email = $('#Email').val();
		if (email == "" || email.trim() == "") {
			hander.action.FormSetTimer('Email');
			mark = false;
		}
		hander.action.removeAllClass('RealName');
		var realName = $('#RealName').val();
		if (realName == "" || realName.trim() == "") {
			hander.action.FormSetTimer('RealName');
			mark = false;
		}
		if (mark) {
			$.ajax({
				url : 'AuthRegister',
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
							alert('register failed!');
					} else {
						alert('register failed!');
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
		hander.action.removeAllClass('UserName');
		var userName = $('#UserName').val();
		if (userName == "" || userName.trim() == "") {
			return;
		}
		$.ajax({
			url : 'AuthUserName',
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
