<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div id="breadcrumb" class="col-xs-12">
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
					<i class="fa fa-linux"></i> <span>Books Information</span>
				</div>
				<div class="box-icons">
					<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
					</a> <a class="expand-link"> <i class="fa fa-expand"></i>
					</a> <a class="close-link"> <i class="fa fa-times"></i>
					</a>
				</div>
				<div class="no-move"></div>
			</div>
			<div class="box-content no-padding table-responsive">
				<table class="table table-bordered table-striped table-hover table-heading table-datatable" id="datatable_bookinfo">
					<thead>
						<tr>
							<th><label><input type="text" name="search_code" value="Search Code" class="search_init" /></label></th>
							<th><label><input type="text" name="search_name" value="Search Name" class="search_init" /></label></th>
							<th><label><input type="text" name="search_sn" value="Search SN" class="search_init" /></label></th>
							<th><label><input type="text" name="search_type" value="Search Type" class="search_init" /></label></th>
							<th><label><input type="text" name="search_press" value="Search Press" class="search_init" /></label></th>
							<th><label><input type="text" name="search_author" value="Search Author" class="search_init" /></label></th>
							<th><label><input type="text" name="search_price" value="Search Price" class="search_init" /></label></th>
							<th><label><input type="text" name="search_discount" value="Search Discount" class="search_init" /></label></th>
							<th><label><input type="text" name="search_addtime" value="Search AddTime" class="search_init" /></label></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>29</td>
							<td>Zorin OS</td>
							<td>0.1%</td>
							<td><i class="fa fa-home"></i><a href="http://zorin-os.com" target="_blank">http://zorin-os.com</a></td>
							<td>8</td>
						</tr>
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
<script type="text/javascript">
	//
	//Function for table, located in element with id = datatable-2
	//
	function tableinit() {
		var asInitVals = [];
		var oTable = $('#datatable_bookinfo').dataTable({
			"aaSorting" : [ [ 0, "asc" ] ],
			"sDom" : "<'box-content'<'col-sm-6'f><'col-sm-6 text-right'l><'clearfix'>>rt<'box-content'<'col-sm-6'i><'col-sm-6 text-right'p><'clearfix'>>",
			"sPaginationType" : "bootstrap",
			"oLanguage" : {
				"sSearch" : "",
				"sLengthMenu" : '_MENU_'
			},
			bAutoWidth : false
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
	$(document).ready(function() {
		// Load Datatables and run plugin on tables 
		LoadDataTablesScripts(tableinit);
		// Add Drag-n-Drop feature
		WinMove();
	});
</script>
