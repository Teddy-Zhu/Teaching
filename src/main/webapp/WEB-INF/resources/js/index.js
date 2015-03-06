function unix2human(unixtime) {
	var dateObj = new Date(unixtime);
	var UnixTimeToDate = dateObj.getFullYear() + '-' + (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' ' + p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':' + p(dateObj.getSeconds());
	return UnixTimeToDate;
}
function p(s) {
	return s < 10 ? '0' + s : s;
}

var error = '<div class="alert alert-danger" role="alert" style="display:none;line-height: 0px;width: 80%;height: 1px;">{errormsg}</div>'
var hander = {
	action : {
		FormSetTimer : function(domId) {
			var Opdom = $('#' + domId).parent();
			Opdom.removeClass('has-success');
			Opdom.removeClass('has-error');
			Opdom.addClass('has-error');
			Opdom.addClass('am-animation-shake');
			Opdom.parent().next().html(error.replace(/{errormsg}/g, "Parameter Error!"));
			setTimeout(returntimeer(domId), 1000);
		},
		SetSucccess : function(domId) {
			var Opdom = $('#' + domId).parent();
			Opdom.removeClass('has-success');
			Opdom.removeClass('has-error');
			Opdom.addClass('has-success');
		}
	}
}
function delShakeClass(domId) {
	if (domId == "UserType") {
		$('#' + domId).removeClass('am-animation-shake');
	} else {
		$('#' + domId).parent().removeClass('am-animation-shake');
	}
}
function returntimeer(domId) {
	return function() {
		delShakeClass(domId);
	};
}
function account() {
	new PNotify({
		title : 'Message',
		text : '测试账号!<br>Admin==>Admin;a<br>BookManager==>Troevil;123456<br>Teacher==>TestUser;TestUser<br>Student==>AAAA;AAAAAAAA.<br>点击版本号查看版本细节!',
		type : 'success',
		animation : 'slide'
	});
}

function backgroundToggle(flag) {
	if (!flag) {
		$('body').css('cssText', 'background-color:#353535 ! important');
	} else {
		$('body').css('cssText', 'background-image:url(https://unsplash.it/' + $(this).width() + '/' + $(this).height() + '?random) ; background-repeat: no-repeat; background-attachment: fixed; background-position: center 0; background-size: cover;');
	}
}
$(function() {
	$.getScript("resources/plugins/pnotify/pnotify.custom.min.js", function() {
		account();
	});

	NProgress.configure({
		ease : 'ease',
		speed : 1000
	});

	$(document).ajaxStart(function() {
		NProgress.start();
	});
	$(document).ajaxStop(function() {
		NProgress.done();
	});
	$('a.UserAccount').click(function() {
		account();
	})
	$('#toggleBackGround').bootstrapSwitch("size", "mini");

	$('#toggleBackGround').bootstrapSwitch('onSwitchChange', function(e, data) {
		backgroundToggle(data);
	});
	$('a.version').click(
			function() {
				$.TeachDialog({
					title : 'Versions',
					content : '<strong>版本号说明:第一位:Web版本号,第二位:功能版本号,第三位:BugFix版本号!</strong><div id="versioninfo" style="margin-top:10px;"></div>',
					largeSize : true
				});
				$.ajax({
					url : 'action/GetVersions',
					type : 'post',
					dataType : 'json',
					data : {
						page : 1,
						rows : 5
					},
					success : function(data) {
						for (var i = 0; i < data.length; i++) {
							$('#versioninfo').append(
									'<div class="panel panel-default" style="margin-top:3px;margin-bottom:0px;"><div class="panel-heading">版本号:' + data[i].strversion + '.' + data[i].strfunversion + '.' + data[i].strbuildversion + '<div style="float:right">' + unix2human(data[i].dateupdatetime)
											+ '</div></div><div class="panel-body">' + data[i].strupdatecomment + '</div></div>');
						}
					},
					error : function(data) {
					},
					async : true
				});
			})
	$('#loginButton').click(function() {
		$(this).button('loading');
		$('.preloader').fadeToggle("slow");
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
			$('.preloader').fadeToggle("slow");
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
				if (data) {
					$.TeachDialog({
						title : 'Congratulations',
						content : 'Login Successfully! Welcome to Use the System!',
						dialogHidden : function() {
							window.location.href = 'AdminMenu';
						}
					});
					return;
				} else {
					$.TeachDialog({
						title : 'Faild',
						content : 'Failed to Login!Please ensure your password correct!'
					});
				}
			},
			error : function(data) {
				console.debug(data.status);
				if (data.status == 3388) {
					$.TeachDialog({
						title : 'Sorry!',
						content : 'Login failed because the user is blocked.',
						bootstrapModalOption : {},
						dialogHidden : function() {
							$('.preloader').fadeToggle("slow");
						}
					});
				} else {
					$.TeachDialog({
						title : 'Sorry!Service is down!',
						content : 'Login failed because the service issue.',
						bootstrapModalOption : {},
						dialogHidden : function() {
							$('.preloader').fadeToggle("slow");
						}

					});
				}
			},
			async : true
		});
		$(this).button('reset');
	});

	$('#DepartMent').change(function() {
		selectchange();
	})
	$('.glyphicon.glyphicon-chevron-down').click(function() {
		if ($('#loginModal')[0].style.display == "block") {
			$.ajax({
				url : 'Type/GetUserType',
				type : 'post',
				dataType : 'json',
				complete : function(data) {
				},
				success : function(data) {
					if (data != null) {
						$('#UserType').empty();
						for (var i = 0; len = data.length, i < len; i++) {
							var option = '<option value="' + data[i].intidentityid + '">' + data[i].strname + '</option>';
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
			$.ajax({
				url : 'Type/GetDepartMent',
				type : 'post',
				dataType : 'json',
				data : {
					id : 1
				},
				complete : function(data) {
				},
				success : function(data) {
					if (data != null) {
						$('#DepartMent').empty();
						for (var i = 0; len = data.length, i < len; i++) {
							$('#DepartMent').append('<option value="' + data[i].intid + '">' + data[i].strname + '</option>');
						}
						selectchange();
					} else {
						$.TeachDialog({
							title : 'Faild',
							content : 'Failed to achieve department!'
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
			$('#registerModal').removeClass("am-animation-slide-top");
			$('#registerModal').addClass("am-animation-slide-top");
		} else {
			$('#registerModal').slideToggle();
			$('#loginModal').slideToggle();
			$('#loginModal').removeClass("am-animation-slide-top");
			$('#loginModal').addClass("am-animation-slide-top");
		}
	});

	$('.passwordc.input-group-addon.glyphicon').click(function() {
		var ret = $(this).hasClass('glyphicon-eye-open');
		var str = 'text';
		if (ret)
			str = "password";
		$(this).prev().attr('type', str);
		if (ret) {
			$(this).removeClass('glyphicon-eye-open');
			$(this).addClass('glyphicon-eye-close');
		} else {
			$(this).removeClass('glyphicon-eye-close');
			$(this).addClass('glyphicon-eye-open');
		}
	});
	$('#registerButton').click(function() {
		$('.alert.alert-danger').slideDown();
		$('.alert.alert-danger').remove();
		$('.preloader').fadeToggle("slow");
		$(this).button('loading');
		var userTypeId = $("#UserType").val();
		if (userTypeId == undefined || userTypeId == "") {
			hander.action.FormSetTimer('UserType');
			mark = false;
		} else {
			hander.action.SetSucccess('UserType');
		}

		var userName = $('#UserName').val().trim();
		var mark = true;
		if (userName == "") {
			hander.action.FormSetTimer('UserName');
			mark = false;
		} else {
			hander.action.SetSucccess('UserName');
		}
		var passsWord = $('#PassWord').val().trim();
		if (passsWord == "") {
			hander.action.FormSetTimer('PassWord');
			mark = false;
		} else {
			hander.action.SetSucccess('PassWord');
		}
		var rePassword = $('#RePassWord').val().trim();
		if (rePassword == "" || rePassword != passsWord) {
			hander.action.FormSetTimer('RePassWord');
			mark = false;
		} else {
			hander.action.SetSucccess('RePassWord');
		}
		var departid = $('#DepartMent').val();
		if (departid == undefined || departid == "") {
			hander.action.FormSetTimer('DepartMent');
			mark = false;
		} else {
			hander.action.SetSucccess('DepartMent');
		}
		var majorid = $('#Majors').val();
		if (majorid == undefined || majorid == "") {
			hander.action.FormSetTimer('Majors');
			mark = false;
		} else {
			hander.action.SetSucccess('Majors');
		}
		var phone = $('#Phone').val().trim();
		if (phone == "") {
			hander.action.FormSetTimer('Phone');
			mark = false;
		} else {
			hander.action.SetSucccess('Phone');
		}

		var email = $('#Email').val().trim();
		if (email == "") {
			hander.action.FormSetTimer('Email');
			mark = false;
		} else {
			hander.action.SetSucccess('Email');
		}

		var realName = $('#RealName').val().trim();
		if (realName == "") {
			hander.action.FormSetTimer('RealName');
			mark = false;
		} else {
			hander.action.SetSucccess('RealName');
		}
		var idcard = $('#StudentId').val().trim();
		if (idcard == "") {
			hander.action.FormSetTimer('StudentId');
			mark = false;
		} else {
			hander.action.SetSucccess('StudentId');
		}
		if (!mark) {
			$('.alert.alert-danger').slideDown();
			$(this).button('reset');
			$('.preloader').fadeToggle("slow");
			return;
		}

		if (mark) {
			$.ajax({
				url : 'User/AuthRegister',
				type : 'post',
				data : {
					UserName : userName,
					UserType : userTypeId,
					PassWord : passsWord,
					RealName : realName,
					IdCard : idcard,
					Phone : phone,
					Email : email,
					DepartId : departid,
					MajorId : majorid
				},
				dataType : 'json',
				success : function(data) {
					if (data != null) {
						if (data) {
							$.TeachDialog({
								title : 'Congratulations',
								content : 'Register Successfully! Welcome to Use the System!',
								dialogHidden : function() {
									window.location.href = '/';
								}
							});
						} else {
							$.TeachDialog({
								title : 'Faild',
								content : 'Failed to register!'
							});
							$(this).button('reset');
							$('.preloader').fadeToggle("slow");
						}
					} else {
						$.TeachDialog({
							title : 'Faild',
							content : 'Failed to register!'
						});
						$(this).button('reset');
						$('.preloader').fadeToggle("slow");
					}
				},
				error : function(data) {
					$.TeachDialog({
						title : 'Sorry!Service is down!',
						content : 'Login failed because the service issue.',
						bootstrapModalOption : {}
					});
					console.debug(data.status);
				},
				async : true
			});
		} else {
			$(this).button('reset');
			$('.preloader').fadeToggle("slow");
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

function selectchange() {
	$.ajax({
		url : 'Type/GetDepartMent',
		type : 'post',
		dataType : 'json',
		data : {
			id : $('#DepartMent').val()
		},
		complete : function(data) {
		},
		success : function(data) {
			if (data != null) {
				$('#Majors').empty();
				for (var i = 0; len = data.length, i < len; i++) {
					$('#Majors').append('<option value="' + data[i].intid + '">' + data[i].strname + '</option>');
				}
			} else {
				$.TeachDialog({
					title : 'Faild',
					content : 'Failed to achieve Majors!'
				});
			}

		},
		error : function(data) {
			console.debug(data.status);
		},
		async : true
	});
}