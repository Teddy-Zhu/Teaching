function initUserDepartMent(id, type) {
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

$(function() {
	console.debug('aaa');
	initUserDepartMent('DepartMent', 1).done(function() {
		$("#DepartMent").change(function() {
			initUserDepartMent('Major', $('#DepartMent').val());
		})
		$("#DepartMent").val($("#DepartMent").attr("data-curValue"));
		initUserDepartMent('Major', $('#DepartMent').val()).done(function() {
			$("#Major").val($("#Major").attr("data-curValue"));
		});
	})
	$('#picfile').change(function() {
		var filepath = $(this).val();
		if ($.trim(filepath) != "") {
			var extStart = filepath.lastIndexOf(".");
			var ext = filepath.substring(extStart, filepath.length).toUpperCase();
			if (ext != ".BMP" && ext != ".PNG" && ext != ".JPG" && ext != ".JPEG") {
				$(this).val('');
				$.TeachDialog({
					content : "The Picture Format is not correct !",
				})
			} else {
				var url = window.URL.createObjectURL($('#picfile').prop('files')[0]);
				$('#UserPic').attr('src', url);
				$('#picUpload').fadeIn(2000);
			}
		}

	})
	$('#picUpload').click(function() {
		if ($('#UserPic').attr('data-new') == "" && $('#picfile').val() != "") {
			
			$(this).fadeOut(1000);
		}
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

	WinMove();
})