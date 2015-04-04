function initUserDepartMent(id, type) {
	if (type == undefined) {
		return dtd.reject();
	}
	var dtd = $.Deferred();
	$.ajax({
		url : 'Type/GetDepartMent',
		type : 'post',
		dataType : 'json',
		data : {
			id : type,
		},
		success : function(data) {
			$('#' + id).empty();
			for (var i = 0; len = data.length, i < len; i++) {
				$('#' + id).append('<option value="' + data[i].intid + '">' + data[i].strname + '</option>');
			}
			dtd.resolve();
		},
		async : true
	})
	return dtd.promise();

}
function picChange() {
	var filepath = $('#picfile').val();
	if ($.trim(filepath) != "") {
		var extStart = filepath.lastIndexOf(".");
		var ext = filepath.substring(extStart, filepath.length).toUpperCase();
		if (ext != ".BMP" && ext != ".PNG" && ext != ".JPG" && ext != ".JPEG") {
			$('#picfile').val('');
			$.TeachDialog({
				content : "The Picture Format is not correct !",
			})
		} else {
			var url = window.URL.createObjectURL($('#picfile').prop('files')[0]);
			$('#UserPic').attr('src', url);
			$('#UserPic').css("border-color", "orange");
			$('#picUpload').fadeIn(2000);
		}
	}
}
$(function() {
	console.log('asd');
	initUserDepartMent('DepartMent', 1).done(function() {
		$("#DepartMent").change(function() {
			initUserDepartMent('Major', $('#DepartMent').val());
		})
		$("#DepartMent").val($("#DepartMent").attr("data-curValue"));
		initUserDepartMent('Major', $('#DepartMent').val()).done(function() {
			$("#Major").val($("#Major").attr("data-curValue"));
		});
	})

	$('#UserPic').hover(function() {
		$(this).addClass('userpic');
	}, function() {
		$(this).removeClass('userpic');
	})
	$('#picUpload').on('click', function() {
		if ($('#UserPic').attr('data-new') == "" && $('#picfile').val() != "") {
			$.ajax('User/UploadUserPic', {
				files : $('#picfile'),
				type : 'post',
				iframe : true,
				processData : false,
				dataType : 'text',
			}).done(function(data) {
				console.log(data);
				if (data != "") {
					$('#UserPic').attr('data-new', data)
					$.TeachDialog({
						content : "Upload Avatar Success!",
					})
					$('#UserPic').css("border-color", "cadetblue")
					$('#picUpload').fadeOut().delay(2000).fadeOut();
					$('#picReset').fadeIn(2000);
				} else {
					$.TeachDialog({
						content : "Upload Avatar Failed!",
					})
					$(this).fadeOut().delay(2000).fadeOut();
				}
			});
		}
	})

	$('#picReset').click(function() {
		$('#UserPic').attr('data-new', '');
		$('#picfile').val('');
		$('#UserPic').attr('src', $('#UserPic').attr('data-origin'));
		$('#UserPic').css("border-color", "");
		$(this).fadeOut(1000);
	})
	$('#UserPic').click(function() {
		$('#picfile').trigger('click')
	});

	$('#savechange').click(function() {
		$('.alert.alert-danger').slideUp();
		$('.alert.alert-danger').remove();
		var postdata = {};
		var error = '<div class="alert alert-danger" role="alert" style="display:none;line-height: 0px;width: 80%;height: 1px;">{errormsg}</div>'
		var check = true;
		$('.perinfo').each(function() {
			var curId = $(this).attr('id');
			var curval = $(this).val();
			if (curval == null || curval == undefined) {
				$(this).parent().next().html(error.replace(/{errormsg}/g, "The Parameter Error!Please don't touch the widget"));
				check = false;
				return true;
			} else {
				postdata[curId] = curval.trim();
			}
			switch (curId) {
			case "Password": {
				break;
			}
			case "RePassword": {
				if (postdata[curId] != postdata["Password"]) {
					$(this).parent().next().html(error.replace(/{errormsg}/g, "New Pasword Should be no differences!"));
					check = false;
				}
				break;
			}
			default: {
				if (postdata[curId] == "") {
					$(this).parent().next().html(error.replace(/{errormsg}/g, 'The ' + $(this).prev().html().trimEnd(':') + ' can not be empty!'));
					check = false;
				}
				break;
			}
			}
		});
		if (!check) {
			$('.alert.alert-danger').slideDown();
			return;
		}
		postdata["picfile"] = $('#UserPic').attr('data-new');
		$.ajax({
			url : 'User/UpdateUser',
			data : postdata,
			type : 'post',
			dataType : 'json',
			success : function(response) {
				if (response) {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update Successfully!',
					});
					LoadAjaxContent("ajax/personinfo_manage");
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update Failed',
					});
				}
			}
		});
	})

	$("#reset").click(function() {
		LoadAjaxContent("ajax/personinfo_manage");
	})

})