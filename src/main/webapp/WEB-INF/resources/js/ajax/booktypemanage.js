var booksetting = {
	data : {
		key : {
			name : "strbooktypename",
			url : ""
		},
		simpleData : {
			enable : true,
			idKey : "intbooktypeid",
			rootPId : 0
		},
		view : {
			showLine : true,
			showIcon : true
		}
	},
	callback : {
		onClick : bookTreeonClick
	}
};
var booknodes;
var curBookTreeNode = null;
function bookTreeonClick(event, treeId, treeNode, clickFlag) {
	curBookTreeNode = treeNode;
	console.log(curBookTreeNode)
	$('#book_editname').val(curBookTreeNode.strbooktypename);
}
function loadBookType() {
	$.ajax({
		url : "Type/GetBookTypeForType",
		type : 'post',
		dataType : 'json',
		success : function(response) {
			nodes = $.fn.zTree.init($("#ul_tree_booktype"), booksetting, response);
			var treeObj = $.fn.zTree.getZTreeObj("ul_tree_booktype");
			treeObj.expandAll(true);
			curBookTreeNode = null;
		},
		async : true,
	});
}

$(function() {
	// initial icheck
	if ($("#ul_tree_booktype").length > 0) {
		loadBookType();
	}
	$('.booktype').click(function() {
		loadBookType();
	})

	$('#book_edit').click(function() {
		var name = $('#book_editname').val().trim();
		if (curBookTreeNode == null) {
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
		$.ajax({
			url : "TypeOperate/UpdateBookType",
			type : 'post',
			dataType : 'json',
			data : {
				id : curBookTreeNode.intbooktypeid,
				name : name
			},
			success : function(response) {
				if (response) {
					loadBookType();
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update BookType successfully!',
					});
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Update BookType failed!',
					});
				}
			},
			async : true
		})
	});
	$('#book_insert').click(function() {

		var name = $('#book_insertname').val().trim();

		if (name == "" || name == undefined) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please Input a name!',
			});
			return;
		}
		$.ajax({
			url : "TypeOperate/InsertBookType",
			type : 'post',
			dataType : 'json',
			data : {
				name : name
			},
			success : function(response) {
				if (response) {
					loadBookType();
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Insert BookType successfully!',
					});
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Insert BookType failed!',
					});
				}
			},
			async : true
		})
	});

	$('#book_delete').click(function() {
		if (curBookTreeNode == null) {
			$.TeachDialog({
				title : 'Operation Message!',
				content : 'Please select a type to edit!',
			});
			return;
		}
		$.ajax({
			url : "TypeOperate/DeleteBookType",
			type : 'post',
			dataType : 'json',
			data : {
				id : curBookTreeNode.intbooktypeid
			},
			success : function(response) {
				if (response) {
					loadBookType();
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Delete BookType successfully!',
					});
				} else {
					$.TeachDialog({
						title : 'Operation Message!',
						content : 'Delete BookType failed!',
					});
				}
			},
			async : true
		})

	});
	WinMove();
})
