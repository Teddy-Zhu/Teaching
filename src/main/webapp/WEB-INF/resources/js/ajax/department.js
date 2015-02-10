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
			rootPId : 1
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
	console.log(treeNode);
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
		},
		async : true,
	});
}
$(function() {
	loadDepartMent();
	$('.fa.fa-refresh').click(function() {
		loadDepartMent();
	});

	$('#edit').click(function() {
		if (curtreeNode == null) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please select a node first.',
			});
			return;
		}
		var parentid = $('#parent_edit_sel').val().trim();
		var name = $('#parent_edit_name').val().trim();
		if (parentid == undefined || parentid == 0 || parentid == "" || name == undefined || name == "") {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please input correct value!',
			});
			return;
		}
		$.ajax({
			url : "DepartMent/UpdateDepartMent",
			type : 'post',
			dataType : 'json',
			data : {
				id : curtreeNode.intid,
				oldparentid : curtreeNode.intparentid,
				newparentid : parentid,
				name : name
			},
			async : true,
		}).success(function() {
			loadDepartMent();
		}).fail(function(){
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Update DepartMent Failed!',
			});
		});
	})
})