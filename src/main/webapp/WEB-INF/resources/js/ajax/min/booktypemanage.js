function bookTreeonClick(e,o,t,n){curBookTreeNode=t,$("#book_editname").val(curBookTreeNode.strbooktypename)}function loadBookType(){$.ajax({url:"Type/GetBookTypeForType",type:"post",dataType:"json",success:function(e){nodes=$.fn.zTree.init($("#ul_tree_booktype"),booksetting,e),bookTreeObj=$.fn.zTree.getZTreeObj("ul_tree_booktype"),bookTreeObj.expandAll(!0),curBookTreeNode=null},async:!0})}var bookTreeObj,booksetting={data:{key:{name:"strbooktypename",url:""},simpleData:{enable:!0,idKey:"intbooktypeid",rootPId:0},view:{showLine:!0,showIcon:!0}},callback:{onClick:bookTreeonClick}},curBookTreeNode=null;$(function(){$("#ul_tree_booktype").length>0&&loadBookType(),$(".booktype").click(function(){loadBookType()}),$("#book_edit").click(function(){var e=$("#book_editname").val().trim();return null==curBookTreeNode?void $.TeachDialog({content:"请至少选择一行!"}):""==e||void 0==e?void $.TeachDialog({content:"请输入一个名称!"}):void $.ajax({url:"TypeOperate/UpdateBookType",type:"post",dataType:"json",data:{id:curBookTreeNode.intbooktypeid,name:e},success:function(o){o?(curBookTreeNode.strbooktypename=e,bookTreeObj.updateNode(curBookTreeNode),$.TeachDialog({content:"更新书籍类型成功!"})):$.TeachDialog({content:"更新书籍类型失败!"})},async:!0})}),$("#book_insert").click(function(){var e=$("#book_insertname").val().trim();return""==e||void 0==e?void $.TeachDialog({content:"请输入一个名称!"}):void $.ajax({url:"TypeOperate/InsertBookType",type:"post",dataType:"json",data:{name:e},success:function(o){isNaN(o)?$.TeachDialog({content:"新增失败!"}):(bookTreeObj.addNodes(null,{intbooktypeid:parseInt(o),strbooktypename:e}),$.TeachDialog({content:"新增成功!"}))},async:!0})}),$("#book_delete").click(function(){return null==curBookTreeNode?void $.TeachDialog({content:"请至少选择一行!"}):void $.ajax({url:"TypeOperate/DeleteBookType",type:"post",dataType:"json",data:{id:curBookTreeNode.intbooktypeid},success:function(e){e?(bookTreeObj.removeNode(curBookTreeNode),$.TeachDialog({content:"删除书籍类型成功!"})):$.TeachDialog({content:"删除书籍类型失败！"})},async:!0})})});