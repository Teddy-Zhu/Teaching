var setting = {
	data : {
		key : {
			name : "strname",
			url : ""
		},
		simpleData : {
			enable : true,
			idKey : "intid",
			pIdKey : "intparentid",
			rootPId : 0
		},
		view : {
			showLine : true,
			showIcon : true
		}
	},
	callback : {
		onClick : treeonClick
	}
};
var nodes;
var curtreeNode;
function treeonClick(event, treeId, treeNode, clickFlag) {
	curtreeNode = treeNode;
	if (curtreeNode.intparentid == 0) {
		// set edit
		$('#parent_edit_sel').empty();
		$('#parent_edit_sel').append('<option value="0">' + curtreeNode.strname + '</option>')
		$('#parent_edit_sel').attr('disabled', true);
		$('#parent_edit_name').attr('disabled', true);
		$('#parent_insert_sel').val(curtreeNode.intid);
	} else if (curtreeNode.intparentid == 1) {
		// set edit
		$('#parent_edit_sel').attr('disabled', true);
		$('#parent_edit_name').attr('disabled', false);
		$('#parent_edit_sel').empty();
		$('#parent_edit_sel').append('<option value="1">System</option>');
		$('#parent_insert_sel').val(curtreeNode.intid);
	} else {
		// set edit
		$('#parent_edit_sel').attr('disabled', false);
		$('#parent_edit_name').attr('disabled', false);
		var dtd = $.Deferred();
		$.when(initUserDepartMent('parent_edit_sel', 1, dtd)).done(function() {
			$('#parent_edit_sel').val(curtreeNode.intparentid);
		});
	}
	$('#parent_edit_name').val(curtreeNode.strname)
}
function loadDepartMent() {
	$.ajax({
		url : "DepartMent/GetAllDepartMent",
		type : 'post',
		dataType : 'json',
		success : function(response) {
			nodes = $.fn.zTree.init($("#ul_tree"), setting, response);
			var treeObj = $.fn.zTree.getZTreeObj("ul_tree");
			treeObj.expandAll(true);
			curtreeNode = null;
			$('#parent_edit_sel').removeData('department1', undefined);
		},
		async : true,
	});
}
$(function() {
	initial();
	$('.fa.fa-refresh').click(function() {
		initial();
	});

	$('#insert').click(function() {
		var parentid = $('#parent_insert_sel').val();
		var name = $('#parent_insert_name').val().trim();
		if (parentid == undefined || parentid == 0 || parentid == "" || name == undefined || name == "") {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please input correct value!',
			});
			return;
		}
		$.ajax({
			url : "DepartMent/Insert",
			type : 'post',
			dataType : 'json',
			data : {
				parentId : parentid,
				name : name
			},
			async : true,
		}).success(function() {
			initial();
			$.TeachDialog({
				content : 'Insert successfully!',
			});
		}).fail(function() {
			$.TeachDialog({
				content : 'Update DepartMent Failed!',
			});
		});
	});
	$('#edit').click(function() {
		if (curtreeNode == null) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please select a node first.',
			});
			return;
		}
		if (curtreeNode.intparentid == 0)
			return;
		var parentid = $('#parent_edit_sel').val();
		var name = $('#parent_edit_name').val().trim();
		if (parentid == undefined || parentid == 0 || parentid == "" || name == undefined || name == "") {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please input correct value!',
			});
			return;
		}

		$.ajax({
			url : "DepartMent/Update",
			type : 'post',
			dataType : 'json',
			data : {
				id : curtreeNode.intid,
				oldParentId : curtreeNode.intparentid,
				newParentId : parentid,
				name : name
			},
			async : true,
		}).success(function() {
			initial();
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Update successfully!',
			});
		}).fail(function() {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Update DepartMent Failed!',
			});
		});
	});
	$('#delete').click(function() {
		if (curtreeNode == null) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please select a node first.',
			});
			return;
		}
		$.TeachDialog({
			title : 'Warnning Message!',
			content : 'Are you sure delete this node :' + curtreeNode.strname + ' ?',
			showCloseButtonName : 'No',
			otherButtons : [ 'Yes' ],
			clickButton : function(sender, modal, index) {
				if (index == 0) {
					$.ajax({
						url : "DepartMent/Delete",
						type : 'post',
						dataType : 'json',
						data : {
							id : curtreeNode.intid,
						},
						async : true,
					}).success(function(response) {
						if (response) {
							initial();
							$.TeachDialog({
								title : 'Operation Message!',
								content : 'Delete successfully!',
							});
						} else {
							$.TeachDialog({
								title : 'Operation Message!',
								content : 'Delete DepartMent Failed!',
							});
						}
					}).fail(function() {
						$.TeachDialog({
							title : 'Operation Message!',
							content : 'Delete DepartMent Failed!',
						});
					});
				}
				modal.modal('hide');
			}
		});

	});

})

function initial() {
	var dtd = $.Deferred();
	$.when(initUserDepartMent('parent_insert_sel', 1, dtd)).done(function() {
		$('#parent_insert_sel').prepend('<option value="1">System</option>');
	});
	loadDepartMent();
	$('#parent_edit_sel').attr('disabled', true);
	$('#parent_edit_name').attr('disabled', true);
	$('#parent_edit_name').val("")
}

function initUserDepartMent(id, type, dtd) {
	var fillDom = function(domData) {
		$('#' + id).empty();
		for (var i = 0; len = domData.length, i < len; i++) {
			$('#' + id).append('<option value="' + domData[i].intid + '">' + domData[i].strname + '</option>');
		}
		if (dtd != undefined) {
			dtd.resolve();
		}
	}
	if ($('#' + id).data('department' + type) != undefined) {
		fillDom($('#' + id).data('department' + type));
	} else {
		$.ajax({
			url : 'Type/GetDepartMent',
			type : 'post',
			dataType : 'json',
			data : {
				id : type,
			},
			success : function(data) {
				$('#' + id).data('department' + type, data);
				fillDom(data);
			},
			async : true
		})
	}
	if (dtd != undefined) {
		return dtd.promise();
	}
}