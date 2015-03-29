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
		SetFailed : function(domId) {
			var Opdom = $('#' + domId).parent();
			Opdom.removeClass('has-success');
			Opdom.removeClass('has-error');
			Opdom.addClass('has-error');
			Opdom.addClass('am-animation-shake');
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
	$('#' + domId).parent().removeClass('am-animation-shake');
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
			hander.action.SetFailed('loginUserName');
			mark = false;
		} else {
			hander.action.SetSucccess('loginUserName');
		}
		var passWord = $('#loginPassWord').val();
		if (passWord == "" || passWord.trim() == "") {
			hander.action.SetFailed('loginPassWord');
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
			var fillUserDom = function(domData) {
				$('#UserType').empty();
				for (var i = 0, len = domData.length; i < len; i++) {
					var option = '<option value="' + domData[i].intidentityid + '">' + domData[i].strname + '</option>';
					$('#UserType').append(option);
				}
			}
			if ($('#registerModal').data('usertype') != undefined) {
				fillUserDom($('#registerModal').data('usertype'));
			} else {
				$.ajax({
					url : 'Type/GetUserType',
					type : 'post',
					dataType : 'json',
					complete : function(data) {
					},
					success : function(data) {
						if (data != null) {
							$('#registerModal').data('usertype', data);
							fillUserDom(data)
						} else {
							$.TeachDialog({
								title : 'Faild',
								content : 'Failed to achieve usertype!'
							});
						}
					},
					async : true
				});
			}
			var fillDepartDom = function(domData) {
				$('#DepartMent').empty();
				for (var i = 0, len = domData.length; i < len; i++) {
					$('#DepartMent').append('<option value="' + domData[i].intid + '">' + domData[i].strname + '</option>');
				}
				selectchange();
			}
			if ($('#registerModal').data('department1') == undefined) {
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
							$('#registerModal').data('department1', data);
							fillDepartDom(data);
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
			} else {
				fillDepartDom($('#registerModal').data('department1'));
			}

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
		var postdata = new Object();
		var flag = true;
		$('.RegisterForm').each(function() {
			var param = $(this).val()
			var id = $(this).attr('id');
			if (param == null && param == undefined) {
				hander.action.SetFailed(id);
				flag = false;
			} else {
				param = param.trim();
				if (param != "") {
					postdata[id] = param;
					hander.action.SetSucccess(id);
				} else {
					flag = false;
					hander.action.SetFailed(id);
				}
			}
			if (id == 'RePassWord') {
				if (param != $('#Password').val()) {
					flag = false;
					hander.action.SetFailed(id);
				}
			}
		});
		if (!flag) {
			$('.alert.alert-danger').slideDown();
			$(this).button('reset');
			$('.preloader').fadeToggle("slow");
			return;
		}
		$.ajax({
			url : 'User/AuthRegister',
			type : 'post',
			data : postdata,
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

	})

	$('#resetButton').click(function() {
		$('#loginPassWord').val('');
		$('#loginUserName').val('');
	})

	$('#loginPassWord').keypress(function(e) {
		if (e.which == 13) {
			$('#loginButton').trigger('click');
		}
	})
	$('#UserName').blur(function() {
		authUserRepeat();
	})

})
function authUserRepeat() {
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
					hander.action.SetFailed('UserName');
				}
			} else {
				hander.action.SetFailed('UserName');
			}
		},
		error : function(data) {
			console.debug(data.status);
		},
		async : true
	});
}
function selectchange() {
	var fillDom = function(domData) {
		$('#Majors').empty();
		for (var i = 0, len = domData.length; i < len; i++) {
			$('#Majors').append('<option value="' + domData[i].intid + '">' + domData[i].strname + '</option>');
		}
	}
	if ($('#registerModal').data('department' + $('#DepartMent').val()) == undefined) {
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
					if (data != null) {
						$('#registerModal').data('department' + $('#DepartMent').val(), data);
						fillDom(data);
					}
				} else {
					$.TeachDialog({
						title : 'Faild',
						content : 'Failed to achieve Majors!'
					});
				}

			},
			async : true
		});
	} else {
		fillDom($('#registerModal').data('department' + $('#DepartMent').val()));
	}

}