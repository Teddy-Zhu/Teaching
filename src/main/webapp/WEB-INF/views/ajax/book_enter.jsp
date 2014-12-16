<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="index.html">Dashboard</a></li>
			<li><a href="#">Books Manage</a></li>
			<li><a href="#">Book Query</a></li>
		</ol>
		<div id="social" class="pull-right">
			<a href="#"><i class="fa fa-google-plus"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a
				href="#"><i class="fa fa-youtube"></i></a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name">
					<i class="fa fa-clipboard"></i> <span>Books Check In</span>
				</div>
				<div class="box-icons">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="expand-link"> <i class="fa fa-expand"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
				<div class="no-move"></div>
			</div>
			<div class="box-content table-responsive" style="padding-top: 15px">

				<div class="panel panel-default">
					<div class="panel-body">
						<div style="font-weight: bold;">Show Or Hide Column:</div>
					</div>
					<div class="panel-footer">
						<button class="toggle-vis btn btn-default" data-column="0">Code</button>
						-
						<button class="toggle-vis btn btn-default" data-column="1">Name</button>
						-
						<button class="toggle-vis btn btn-default" data-column="2">SN</button>
						-
						<button class="toggle-vis btn btn-default" data-column="3">Type</button>
						-
						<button class="toggle-vis btn btn-default" data-column="4">Press</button>
						-
						<button class="toggle-vis btn btn-default" data-column="5">Author</button>
						-
						<button class="toggle-vis btn btn-default" data-column="6">Supplier</button>
						-
						<button class="toggle-vis btn btn-default" data-column="7">Price</button>
						-
						<button class="toggle-vis btn btn-default" data-column="8">Discount</button>
						-
						<button class="toggle-vis btn btn-default" data-column="9">AddTime</button>
					</div>
				</div>

				<div class="panel panel-default" style="margin-top: 15px;">
					<div class="panel-body">Data Table</div>
					<div class="panel-footer">
						<table class="table table-bordered table-striped table-hover table-heading table-datatable" id="datatable_bookinfo">
							<thead>
								<tr>
									<th><label><input type="text" name="search_code" value="Code" class="search_init" /></label></th>
									<th><label><input type="text" name="search_name" value="Name" class="search_init" /></label></th>
									<th><label><input type="text" name="search_sn" value="SN" class="search_init" /></label></th>
									<th><label><input type="text" name="search_type" value="Type" class="search_init" /></label></th>
									<th><label><input type="text" name="search_press" value="Press" class="search_init" /></label></th>
									<th><label><input type="text" name="search_author" value="Author" class="search_init" /></label></th>
									<th><label><input type="text" name="search_price" value="Supplier" class="search_init" /></label></th>
									<th><label><input type="text" name="search_price" value="Price" class="search_init" /></label></th>
									<th><label><input type="text" name="search_discount" value="Discount" class="search_init" /></label></th>
									<th><label><input type="text" name="search_addtime" value="AddTime" class="search_init" /></label></th>
								</tr>
							</thead>
							<tbody>
							</tbody>
							<tfoot>
								<tr>
									<th>Code</th>
									<th>Name</th>
									<th>SN</th>
									<th>Type</th>
									<th>Press</th>
									<th>Author</th>
									<th>SupplierName</th>
									<th>Price</th>
									<th>PriceDiscount</th>
									<th>AddedTime</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//
	//Function for table, located in element with id = datatable-2
	//
	function tableinit() {
		var asInitVals = [];
		var oTable = $('#datatable_bookinfo').dataTable({
			"aaSorting" : [ [ 0, "asc" ] ],
			"sDom" : "<'box-content-nocolor'<'col-sm-6'f><'col-sm-6 text-right'l><'clearfix'>>rt<'box-content'<'col-sm-6'i><'col-sm-6 text-right'p><'clearfix'>>",
			"sPaginationType" : "bootstrap",
			"oLanguage" : {
				"sLengthMenu" : 'Display _MENU_ records per page',
				"sSearch" : "Search All Data :  ",
				"sZeroRecords" : '<div style="text-align:center">Nothing found - sorry</div>',
				"sInfo" : "Showing page _PAGE_ of _PAGES_",
				"sInfoEmpty" : '<br><div style="text-align:left">No records available</div>',
				"sInfoFiltered" : ''
			},
			bAutoWidth : false
		});
		$('button.toggle-vis').on('click', function(e) {
			e.preventDefault();

			// Get the column API object
			var columnvisible = oTable.api(true).column($(this).attr('data-column')).visible();
			// Toggle the visibility
			oTable.api(true).column($(this).attr('data-column')).visible(!columnvisible);
		});
		var header_inputs = $("#datatable_bookinfo thead input");
		header_inputs.on('keyup', function() {
			/* Filter on the column (the index) of this element */
			oTable.fnFilter(this.value, header_inputs.index(this));
		}).on('focus', function() {
			if (this.className == "search_init") {
				this.className = "";
				this.value = "";
			}
		}).on('blur', function(i) {
			if (this.value == "") {
				this.className = "search_init";
				this.value = asInitVals[header_inputs.index(this)];
			}
		});
		header_inputs.each(function(i) {
			asInitVals[i] = this.value;
		});
	}
	function unix2human(unixtime) {
		var dateObj = new Date(unixtime);
		var UnixTimeToDate = dateObj.getFullYear() + '-' + (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' ' + p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':'
				+ p(dateObj.getSeconds());
		return UnixTimeToDate;
	}
	function p(s) {
		return s < 10 ? '0' + s : s;
	}
	$(document).ready(function() {
		$.ajax({
			url : 'books',
			type : 'post',
			dataType : 'json',
			complete : function(data) {
			},
			success : function(data) {
				if (data != null) {
					var trstring = ""
					for (var i = 0; i < data.length; i++) {
						trstring += "<tr>";
						trstring += '<th>' + data[i].strbookcoding + '</th>'
						trstring += '<th>' + data[i].strbookname + '</th>'
						trstring += '<th>' + data[i].strbooksn + '</th>'
						trstring += '<th>' + data[i].bookType.strbooktypename + '</th>'
						trstring += '<th>' + data[i].strpress + '</th>'
						trstring += '<th>' + data[i].strauthor + '</th>'
						trstring += '<th>' + data[i].supplier.strname + '</th>'
						trstring += '<th>' + data[i].strprice + '</th>'
						trstring += '<th>' + data[i].intpricediscount + '</th>'
						trstring += '<th>' + unix2human(data[i].dateaddtime) + '</th>'
						trstring += "</tr>";

					}
					$('#datatable_bookinfo tbody').append(trstring);
				}
			},
			error : function(data) {
				console.debug(data.status);
			},
			async : true
		});
		// Load Datatables and run plugin on tables 
		LoadDataTablesScripts(tableinit);
		// Add Drag-n-Drop feature
		WinMove();
	});
</script>
