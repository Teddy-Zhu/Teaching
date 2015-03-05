function getSearchParams(params) {
	var searchParams = new Object();
	if (params != undefined) {
		searchParams = params;
	}
	$('.SearchForm').each(function() {
		var param = $(this).val().trim();
		if (param == undefined)
			param = '';
		searchParams[$(this).attr('id')] = param;
	});
	return searchParams;
}
function initBookType(id, addition) {
	$.ajax({
		url : 'Type/GetBookType',
		dataType : 'json',
		type : 'post',
		success : function(data) {
			$('#' + id).empty();
			if (addition != undefined) {
				$('#' + id).append('<option value="-1">All Type</option>');
			}
			for ( var i in data) {
				$('#' + id).append('<option value="' + data[i].intbooktypeid + '">' + data[i].strbooktypename + '</option>');
			}
		},
		async : true
	})
}

function initSupplierType(id, addition) {
	$.ajax({
		url : 'Type/GetSupplierType',
		dataType : 'json',
		type : 'post',
		success : function(data) {
			$('#' + id).empty();
			if (addition != undefined) {
				$('#' + id).append('<option value="-1">All Supplier</option>');
			}
			for ( var i in data) {
				$('#' + id).append('<option value="' + data[i].intsupplierid + '">' + data[i].strname + '</option>');
			}
		}
	})
}

$(function() {
	// $.ajax({
	// url : 'Plan/Submit',
	// dataType : 'json',
	// type : 'post',
	// data : {
	// id : $('#usertype').val()
	// }
	// })
	console.log('a');
	$.ajax({
		url : 'Plan/GetCourseType',
		dataType : 'json',
		type : 'post',
	}).success(function(data) {
		for ( var i in data) {
			$('#CourseType').append('<option value="' + data[i].intcoursetypeid + '">' + data[i].strcoursename + '</option>')
		}
	})

	$('#bookselect')
			.click(
					function() {
						$
								.TeachDialog({
									title : 'Select Books From Table',
									content : '<div class="searchClass row"><div class="col-xs-12"><label>Code</label><input class="SearchForm form-control" type="text" id="SearchCode" /> <label>Name</label><input class="SearchForm form-control" type="text" id="SearchName" /> <label>SN</label><input class="SearchForm form-control" type="text" id="SearchSN" /> <label>Type</label><select class="SearchForm form-control" id="SearchType"><option value="-1">All Type</option></select></div><div class="col-xs-12"><label>Press</label><input class="SearchForm form-control" type="text" id="SearchPress" /> <label>Author</label><input class="SearchForm form-control" type="text" id="SearchAuthor" /> <label>Supplier</label><select class="SearchForm form-control" id="SearchSupplier"><option value="-1">All Supplier</option></select> <label>Price</label><input class="SearchForm form-control" type="text" id="SearchPrice" /></div><div class="col-xs-12"><label>Discount</label><input class="SearchForm form-control" type="text" id="SearchDiscount" /><button id="Search" class="btn btn-default btn-xs pull-right">Search</button></div></div><table id="datatable_bookinfo" style="margin-top:10px;"></table>',
									largeSize : true,
									otherButtons : [ 'Select' ],
									clickButton : function(sender, modal, index) {
										if (index == 0) {
											var rows = $('#datatable_bookinfo').datagrid('getSelections');
											if (rows.length != 1) {
												$.TeachDialog({
													content : 'You should select a row!',
													bootstrapModalOption : {},
												});
												return;
											} else {
												$('#BookId').empty();
												$('#BookId').append('<option value="' + rows[0].intbookid + '">' + rows[0].strbookname + '</option>')
											}
											modal.modal('hide');
										}
									},
									dialogShown : function() {
										initBookType('SearchType', "type");
										initSupplierType('SearchSupplier', "type")
										cellwidth = ($(".modal-body").width() - 55) / 11;
										$('#datatable_bookinfo').datagrid({
											striped : true,
											remoteSort : false,
											collapsible : true,
											singleSelect : true,
											fit : false,
											url : 'Book/GetBooks',
											loadMsg : 'Please waiting for loading date.....',
											pagination : true,
											rownumbers : true,
											fitColumns : true,
											columns : [ [ {
												field : 'strbookcoding',
												title : 'Code',
												align : 'center',
												sortable : true,
												width : cellwidth,
											}, {
												field : 'strbookname',
												title : 'Name',
												align : 'center',
												width : cellwidth,
												sortable : true
											}, {
												field : 'strbooksn',
												title : 'SN',
												align : 'center',
												width : cellwidth,
												sortable : true
											}, {
												field : 'bookType',
												title : 'Type',
												align : 'center',
												width : cellwidth,
												sortable : true,
												formatter : function(value) {
													return value.strbooktypename;
												}
											}, {
												field : 'strpress',
												title : 'Press',
												align : 'center',
												width : cellwidth,
												sortable : true
											}, {
												field : 'strauthor',
												title : 'Author',
												align : 'center',
												width : cellwidth,
												sortable : true
											}, {
												field : 'supplier',
												title : 'Supplier',
												align : 'center',
												width : cellwidth,
												sortable : true,
												formatter : function(value) {
													return value.strname;
												}
											}, {
												field : 'strprice',
												title : 'Price',
												align : 'center',
												width : cellwidth,
												sortable : true
											}, {
												field : 'intpricediscount',
												title : 'DisCount',
												align : 'center',
												width : cellwidth,
												sortable : true
											}, {
												field : 'dateaddtime',
												title : 'Add Time',
												align : 'center',
												width : cellwidth + 35,
												sortable : true,
												formatter : function(value) {
													return unix2human(value);
												}
											} ] ],
											onBeforeLoad : function(param) {
												param = getSearchParams(param);
											},
										});
										$('#Search').click(function() {
											$('#datatable_bookinfo').datagrid('reload');
										})
									}
								});

					})
	$("#reset").click(function() {
		LoadAjaxContent("ajax/plan_submit");
	})
})
