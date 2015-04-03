var usersetting = {
	data : {
		key : {
			name : "strname",
			url : ""
		},
		simpleData : {
			enable : true,
			idKey : "intidentityid",
			rootPId : -1
		},
		view : {
			showLine : true,
			showIcon : true
		}
	},
	callback : {
		onClick : treeOnclick
	}
};
var curUserTreeNode = null, userTreeObj;
function userTreeonClick(event, treeId, treeNode, clickFlag) {
	curUserTreeNode = treeNode;
	console.log(curUserTreeNode)
	$('#user_editname').val(curUserTreeNode.strname);
	if (curUserTreeNode.intallowreg == 1) {
		$('#regcheck').iCheck('check');
	} else {
		$('#regcheck').iCheck('uncheck');
	}

}
function treeOnclick() {

}

function loadUserType() {
	$.ajax({
		url : "Type/GetUserTypeAllForType",
		type : 'post',
		dataType : 'json',
		success : function(response) {
			nodes = $.fn.zTree.init($("#ul_tree_usertype"), usersetting, response);
			userTreeObj = $.fn.zTree.getZTreeObj("ul_tree_usertype");
			userTreeObj.expandAll(true);
			curUserTreeNode = null;
		},
		async : true,
	});
}
$(function() {
	// initial icheck
	$('#regcheck').iCheck({
		checkboxClass : 'icheckbox_square-blue',
	})
	$('#insertcheck').iCheck({
		checkboxClass : 'icheckbox_square-blue',
	})
	$('.icheckbox_square-blue').css('margin-top', '5px');

	if ($("#ul_tree_usertype").length > 0) {
		loadUserType();
	}
	$('.usertype').click(function() {
		loadUserType();
	})
	$('#user_edit').click(function() {
		var name = $('#user_editname').val().trim();

		if (curUserTreeNode == null) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please select a type to edit!',
			});
			return;
		}
		if (name == "" || name == undefined) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please Input a name!',
			});
			return;
		}
		var allregcheck = $('#regcheck').parent().hasClass('checked') == true ? 1 : 0;
		$.ajax({
			url : "TypeOperate/UpdateUserType",
			type : 'post',
			dataType : 'json',
			data : {
				id : curUserTreeNode.intidentityid,
				allowreg : allregcheck,
				name : name
			},
			success : function(response) {
				if (response) {
					curUserTreeNode.strname = name;
					curUserTreeNode.intallowreg = allregcheck;
					userTreeObj.updateNode(curUserTreeNode);
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update UserType successfully!',
					});
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update UserType failed!',
					});
				}
			},
			async : true
		})
	});

	$('#user_insert').click(function() {
		var name = $('#user_insertname').val().trim();

		if (name == "" || name == undefined) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please Input a name!',
			});
			return;
		}
		$.ajax({
			url : "TypeOperate/InsertUserType",
			type : 'post',
			dataType : 'json',
			data : {
				allowreg : $('#insertcheck').parent().hasClass('checked') == true ? 1 : 0,
				name : name
			},
			success : function(response) {
				if (!isNaN(response)) {
					var nodes = userTreeObj.getNodes();
					userTreeObj.addNodes(null, {
						intidentityid : parseInt(response),
						strname : name
					});
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Insert UserType successfully!',
					});
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Insert UserType failed!',
					});
				}
			},
			async : true
		})
	});

	$('#user_delete').click(function() {
		if (curUserTreeNode == null) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please select a type to edit!',
			});
			return;
		}
		$.ajax({
			url : "TypeOperate/DeleteUserType",
			type : 'post',
			dataType : 'json',
			data : {
				id : curUserTreeNode.intidentityid,
			},
			success : function(response) {
				if (response) {
					treeObj.removeNode(curUserTreeNode);
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Delete UserType successfully!',
					});
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Delete UserType failed!',
					});
				}
			},
			async : true
		})
	});
	$("[data-toggle='tooltip']").tooltip();
	$("[data-toggle='tooltip']").click(function() {
		LoadAjaxContent('ajax/access_manage');
	});
})
