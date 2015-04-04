function setVal(id,obj){$("#editCode"+id).val(obj.strbookcoding),$("#editName"+id).val(obj.strbookname),$("#editSN"+id).val(obj.strbooksn),$("#editPress"+id).val(obj.strpress),$("#editAuthor"+id).val(obj.strauthor),$("#editPrice"+id).val(obj.strprice),$("#editDisCount"+id).val(obj.intpricediscount),initBookType("editBookType"+id,void 0).done(function(){$("#editBookType"+id).val(obj.bookType.intbooktypeid)}),initSupplierType("editSupplierType"+id,void 0).done(function(){$("#editSupplierType"+id).val(obj.supplier.intsupplierid)})}function initBookType(id,addition){var dtd=$.Deferred(),fillDom=function(domData){$("#"+id).empty(),void 0!=addition&&$("#"+id).append('<option value="-1">All Type</option>');for(var i=0;len=domData.length,i<len;i++)$("#"+id).append('<option value="'+domData[i].intbooktypeid+'">'+domData[i].strbooktypename+"</option>");dtd.resolve()};return void 0!=$("#operationpanel").data("booktype")?fillDom($("#operationpanel").data("booktype")):$.ajax({url:"Type/GetBookType",dataType:"json",type:"post",async:!0}).success(function(data){$("#operationpanel").data("booktype",data),fillDom(data)}),dtd.promise()}function initSupplierType(id,addition){var dtd=$.Deferred(),fillDom=function(domData){$("#"+id).empty(),void 0!=addition&&$("#"+id).append('<option value="-1">All Supplier</option>');for(var i=0;len=domData.length,i<len;i++)$("#"+id).append('<option value="'+domData[i].intsupplierid+'">'+domData[i].strname+"</option>");dtd.resolve()};return void 0!=$("#operationpanel").data("suppliertype")?fillDom($("#operationpanel").data("suppliertype")):$.ajax({url:"Type/GetSupplierType",dataType:"json",type:"post",success:function(data){$("#operationpanel").data("suppliertype",data),fillDom(data)}}),dtd.promise()}function getSearchParams(params){var searchParams=new Object;return void 0!=params&&(searchParams=params),$(".SearchForm").each(function(){var param=$(this).val().trim();void 0==param&&(param=""),searchParams[$(this).attr("id")]=param}),searchParams}var htmltmp=$("#newformRange").html();$(function(){$("button.editbook").click(function(){var i,id,rows=$("#datatable_bookinfo").datagrid("getSelections");if(0==rows.length)return void $.TeachDialog({content:"You should select a row at least !",bootstrapModalOption:{}});for($("#bookEditTable").html(""),$("#editbookcontainer .tab-content").html(""),$("#editerrormsg").html(""),i=0;i<rows.length;i++)id=rows[i].intbookid,$("#bookEditTable").append('<li role="presentation"><a href="#editpanel'+id+'" role="tab" data-toggle="tab">'+rows[i].strbookname+"</a></li>"),$("#editbookcontainer .tab-content").append('<div role="tabpanel" class="tab-pane fade" id="editpanel'+id+'"></div>'),$("#editpanel"+id).html(htmltmp.replace("newCode","editCode"+id).replace("newName","editName"+id).replace("newSN","editSN"+id).replace("newBookType","editBookType"+id).replace("newPress","editPress"+id).replace("newAuthor","editAuthor"+id).replace("newPrice","editPrice"+id).replace("newDisCount","editDisCount"+id).replace("newSupplierType","editSupplierType"+id).replace(new RegExp("newform","gm"),"editform")),setVal(id,rows[i]);$("#bookEditTable a:first").tab("show"),$("#editbookcontainer").slideDown(),$("#operationpanel").slideUp()}),$("button.submitAdd").click(function(){var postdata={},check=!0;$(".newform").each(function(){return""==$(this).val().trim()?($("#adderrormsg").html("please input "+$(this).prev().html()+"!"),check=!1,!1):void(postdata[$(this).attr("id")]=$(this).val().trim())}),check&&$.ajax({url:"Book/AddBook",dataType:"json",type:"post",data:postdata,success:function(response){$.TeachDialog(response?{title:"Operation Message!",content:"Add a new book successfully and do you want to add more ?",showCloseButtonName:"No",otherButtons:["Yes","Yes & Keep Val"],bootstrapModalOption:{},CloseButtonAddFunc:function(){$("#operationpanel").slideToggle(),$("#addnewbook").slideToggle(),$("#datatable_bookinfo").datagrid("reload")},clickButton:function(sender,modal,index){(0==index||1==index)&&0==index&&($(".newform").val(""),$("#newBookType").get(0).selectedIndex=0,$("#newSupplierType").get(0).selectedIndex=0),$("#datatable_bookinfo").datagrid("reload"),modal.modal("hide")}}:{content:"Add Book Failed!"})}})}),$("button.cancelAdd").click(function(){$(".newform").val(""),$("#operationpanel").slideDown(),$("#addnewbook").slideUp()}),$("button.addbook").click(function(){$(".newform").val(""),initBookType("newBookType",void 0),initSupplierType("newSupplierType",void 0),$("#adderrormsg").html(""),$("#operationpanel").slideUp(),$("#addnewbook").slideDown()}),$("button.cancelEdit").click(function(){$("#operationpanel").slideDown(),$("#editbookcontainer").slideUp(),$("#bookEditTable").html(""),$("#editbookcontainer .tab-content").html("")}),$("button.submitEdit").click(function(){var postdata,check,idarray=new Array;if($("[id^=editCode]").each(function(){var l=$(this).attr("id");idarray.push(l.substring(8,l.length))}),postdata={},0!=idarray.length){if(check=!0,$(".editform").each(function(){return""==$(this).val().trim()?($("#editerrormsg").html("please input "+$(this).prev().html()+"!"),check=!1,!1):void(postdata[$(this).attr("id")]=$(this).val().trim())}),!check)return;postdata.bookId=idarray,$.ajax({url:"Book/EditBook",type:"post",dataType:"json",data:postdata,success:function(data){$.TeachDialog(data?{title:"Operation Message!",content:"Edit book successfully!",CloseButtonAddFunc:function(){$("#operationpanel").slideToggle(),$("#editbookcontainer").slideToggle(),$("#datatable_bookinfo").datagrid("reload")}}:{title:"Operation Message!",content:"Edit book failed!",CloseButtonAddFunc:function(){$("#operationpanel").slideToggle(),$("#editbookcontainer").slideToggle(),$("#datatable_bookinfo").datagrid("reload")}})}})}}),$("button.removebook").click(function(){var bookIdArray,bookNameArray,i,sureDialog,rows=$("#datatable_bookinfo").datagrid("getSelections");if(0==rows.length)return void $.TeachDialog({content:"You should select a row at least !",bootstrapModalOption:{}});for(bookIdArray=new Array,bookNameArray=new Array,i=0;i<rows.length;i++)bookIdArray.push(parseInt(rows[i].intbookid)),bookNameArray.push(rows[i].strbookname);sureDialog=function(){var dtd=$.Deferred();return $.TeachDialog({title:"Warnning Message!",content:"Are you sure remove this books :"+bookNameArray+" ?",showCloseButtonName:"No",otherButtons:["Yes"],CloseButtonAddFunc:function(){dtd.reject()},clickButton:function(sender,modal,index){0==index&&dtd.resolve(),modal.modal("hide")}}),dtd.promise()},sureDialog().done(function(){$.ajax({url:"Book/RemoveBook",type:"post",dataType:"json",data:{bookId:bookIdArray},success:function(response){var bookname,i;if(response===!0)$.TeachDialog({title:"Operation Message!",content:"Remove books successfully!"}),$("#datatable_bookinfo").datagrid("reload");else if(isNaN(response))$.TeachDialog({content:"Remove books failed!"});else{for(bookname="",i=0;i<rows.length;i++)if(parseInt(rows[i].intbookid)==parseInt(response)){bookname=rows[i].strbookname;break}$.TeachDialog({content:"Remove books failed! Book:"+bookname+" exist in use."})}},async:!0})})}),$("#SearchDate").datepicker({format:"yyyy-mm-dd",todayBtn:"linked",autoclose:!0,todayHighlight:!0,clearBtn:!0});var psval=$("#datatable_bookinfo").attr("data-size");(void 0==psval||""==psval)&&(psval=10),initBookType("SearchType","type"),initSupplierType("SearchSupplier","type"),cellwidth=($(".box-content.table-responsive").width()-55)/11,$("#datatable_bookinfo").datagrid({striped:!0,remoteSort:!1,collapsible:!0,fit:!1,url:"Book/GetBooks",loadMsg:"Please waiting for loading date.....",pagination:!0,rownumbers:!0,fitColumns:!0,pageSize:psval,pageList:[psval,2*psval,3*psval,4*psval,5*psval],columns:[[{field:"strbookcoding",title:"Code",align:"center",sortable:!0,width:cellwidth},{field:"strbookname",title:"Name",align:"center",width:cellwidth,sortable:!0},{field:"strbooksn",title:"SN",align:"center",width:cellwidth,sortable:!0},{field:"bookType",title:"Type",align:"center",width:cellwidth,sortable:!0,formatter:function(value){return value.strbooktypename}},{field:"strpress",title:"Press",align:"center",width:cellwidth,sortable:!0},{field:"strauthor",title:"Author",align:"center",width:cellwidth,sortable:!0},{field:"supplier",title:"Supplier",align:"center",width:cellwidth,sortable:!0,formatter:function(value){return value.strname}},{field:"strprice",title:"Price",align:"center",width:cellwidth,sortable:!0},{field:"intpricediscount",title:"DisCount",align:"center",width:cellwidth,sortable:!0},{field:"dateaddtime",title:"Add Time",align:"center",width:cellwidth+35,sortable:!0,formatter:function(value){return unix2human(value)}}]],onBeforeLoad:function(param){param=getSearchParams(param)}}),$("#Search").click(function(){$("#datatable_bookinfo").datagrid("reload")})});