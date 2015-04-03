var setting = {
	data : {
		key : {
			name : "strmenuname"
		},
		simpleData : {
			enable : true,
			idKey : "intmenuid",
			pIdKey : "intparentmenuid",
			rootPId : 0
		},
		view : {
			showLine : true,
			showIcon : true
		}
	},
	callback : {
		onClick : treeClick
	}
};
var treeObj, curTreeNode;
function LoadMenuTree() {
	$.ajax({
		url : 'Menu/MenuTree',
		dataType : 'json',
		type : 'post',
	}).success(function(data) {
		nodes = $.fn.zTree.init($("#ul_tree"), setting, data);
		treeObj = $.fn.zTree.getZTreeObj("ul_tree");
		treeObj.expandAll(true);
		curTreeNode = null;
	})
}
function treeClick(event, treeId, treeNode, clickFlag) {
	curTreeNode = treeNode;
	$('#menuname').val(treeNode.strmenuname);
	$('#menuicon').val(treeNode.strmenuiconclass);
}
$(function() {
	console.log('aSD')
	LoadMenuTree();
	$('#refresh').click(function() {
		LoadMenuTree();
	})
	$('#Update').click(function() {
		if (curTreeNode == null) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please select a menu to edit!',
			});
			return;
		}
		if (curTreeNode.intmenuid == 1) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Can not edit the Root Menu!',
			});
			return;
		}
		var menuname = $('#menuname').val();
		var icon = $('#menuicon').val();
		$.ajax({
			url : "Menu/Update",
			type : 'post',
			dataType : 'json',
			data : {
				menu : curTreeNode.intmenuid,
				menuname : menuname,
				menuicon : icon
			},
			success : function(response) {
				if (response) {
					curTreeNode.strmenuname = menuname;
					curTreeNode.strmenuiconclass = icon;
					curTreeNode.iconSkin = icon + " iconskin";
					treeObj.updateNode(curTreeNode);
					if (curTreeNode.intparentmenuid == 1 && curTreeNode.intmenuid != 2) {
						$("[href='" + curTreeNode.strmenuvalue + "'] span").html(menuname);
					} else {
						var html = $("[href='" + curTreeNode.strmenuvalue + "']").html();
						$("[href='" + curTreeNode.strmenuvalue + "']").html(html.replace(/<\/i>(.*)/, '<\/i>' + menuname))

					}
					$("[href='" + curTreeNode.strmenuvalue + "'] i").attr('class', icon);
					var menus = [];
					$("[class='ajax-link'][href!='#']").each(function(e) {
						var menu = {};
						menu.data = $(this).attr('href');
						menu.value = $.trim($(this).html().replace(/<i(.*)<\/i>/, ""));
						menus.push(menu);
					})
					$('#searchMenu').autocomplete().setOptions({
						lookup : menus
					});
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update Menu successfully!',
					});
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update Menu failed!',
					});
				}
			},
			async : true
		})

	})
})