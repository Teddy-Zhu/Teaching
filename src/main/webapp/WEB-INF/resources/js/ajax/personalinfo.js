String.prototype.trimEnd = function(trimStr) {
	if (!trimStr) {
		return this;
	}
	var temp = this;
	while (true) {
		if (temp.substr(temp.length - trimStr.length, trimStr.length) != trimStr) {
			break;
		}
		temp = temp.substr(0, temp.length - trimStr.length);
	}
	return temp;
};
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

$(function() {
	console.debug('aaa');
	var dtd = $.Deferred();
	$.when(initUserDepartMent('DepartMent', 1, dtd)).done(function() {
		$("#DepartMent").change(function() {
			initUserDepartMent('Major', $('#DepartMent').val());
		})
		$("#DepartMent").val($("#DepartMent").attr("data-curValue"));
		var dtdin = $.Deferred();
		$.when(initUserDepartMent('Major', $('#DepartMent').val(), dtdin)).done(function() {
			$("#Major").val($("#Major").attr("data-curValue"));
		});
	})

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