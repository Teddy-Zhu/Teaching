<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.panel-header, .panel-body {
	border-width: 0px;
}

.panel {
	border: 1px solid transparent;
	border-color: #ddd;
	border-radius: 4px;
}

.panel-title {
	cursor: pointer
}

.tab-content div .row {
	margin-top: 20px;
}

.tab-content div .row label {
	top: 5px;
}

.tab-content div .row select {
	width: 63%;
}

.tab-content div .row input {
	width: 63%;
}

.tab-pane {
	padding-left: 2%;
}
</style>
<link rel="stylesheet" href="resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
<link href="resources/plugins/icheck/skins/square/blue.css" rel="stylesheet">
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">System Settings</a></li>
			<li><a href="#">Depart Manage</a></li>
		</ol>
		<div id="social" class="pull-right">
			<a href="#"><i class="fa fa-google-plus"></i></a> <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a> <a href="#"><i class="fa fa-youtube"></i></a>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name">
					<i class="fa fa-clipboard"></i> <span>DepartMent ManageMent</span>
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
				<div class="container-fluid" style="margin-top: 10px;">
					<c:if test="${queryusertype eq true}">
						<div id="usertypecontainer">
							<div id="tree" class="col-xs-4" style="height: 250px">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											User Type<i class="fa fa-arrow-right fa-lg pull-right gotopower" data-toggle="tooltip" data-placement="right" title="click me then go to access control" style="margin-top: 3px"></i> <i class="fa fa-refresh fa-lg pull-right usertype" style="margin-top: 3px"></i>
										</h3>

									</div>
									<div class="panel-body">
										<div id="ul_tree_usertype" class="ztree"></div>
									</div>
								</div>
							</div>
							<div id="useroperate_menu" class="col-xs-8" style="height: 250px;">
								<div id="userPanel" role="tabpanel">

									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist">
										<c:if test="${editusertype eq true}">
											<li role="presentation" class="active"><a href="#parent_edit" aria-controls="parent_edit" role="tab" data-toggle="tab">Edit</a></li>
										</c:if>
										<c:if test="${addusertype eq true}">
											<li role="presentation"><a href="#parent_insert" aria-controls="parent_insert" role="tab" data-toggle="tab">Insert</a></li>
										</c:if>
										<c:if test="${rmusertype eq true}">
											<li role="presentation"><a href="#parent_delete" aria-controls="parent_delete" role="tab" data-toggle="tab">Delete</a></li>
										</c:if>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">
										<c:if test="${editusertype eq true}">
											<div role="tabpanel" class="tab-pane active" id="parent_edit">
												<div class="row">
													<label class="col-xs-4">Type Name</label><input class="form-control col-xs-8" id="user_editname" type="text" placeholder="Input Name" />
												</div>
												<div class="row">
													<label for="regcheck" class="col-xs-4">Allow Register </label><input class="col-xs-8" id="regcheck" type="checkbox" checked>
												</div>
												<div class="row text-center">
													<button class="btn btn-primary btn-sm center-block" id="user_edit">Submit</button>
												</div>
											</div>
										</c:if>
										<c:if test="${addusertype eq true}">
											<div role="tabpanel" class="tab-pane" id="parent_insert">
												<div class="row">
													<label class="col-xs-4">Type Name</label><input class="form-control col-xs-8" id="user_insertname" type="text" placeholder="Input Name" />
												</div>
												<div class="row">
													<label for="regcheck" class="col-xs-4">Allow Register </label><input class="col-xs-8" id="insertcheck" type="checkbox" checked>
												</div>
												<div class="row text-center">
													<button class="btn btn-primary btn-sm center-block" id="user_insert">Submit</button>
												</div>
											</div>
										</c:if>
										<c:if test="${rmusertype eq true}">
											<div role="tabpanel" class="tab-pane" id="parent_delete">
												<div class="row text-center">
													<button id="user_delete" class="btn btn-danger btn-sm center-block">Delete</button>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${querybooktype eq true}">
						<div id="bookTypecontainer">
							<div id="tree" class="col-xs-4" style="height: 250px;">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											Book Type<i class="fa fa-refresh fa-lg pull-right booktype" style="margin-top: 3px"></i>
										</h3>
									</div>
									<div class="panel-body">
										<div id="ul_tree_booktype" class="ztree"></div>
									</div>
								</div>
							</div>
							<div id="bookoperate_menu" class="col-xs-8" style="height: 250px;">

								<div id="bookDepartPanel" role="tabpanel">

									<!-- Nav tabs -->
									<ul class="nav nav-tabs" role="tablist">
										<c:if test="${editbooktype eq true}">
											<li role="presentation" class="active"><a href="#parent_edit_b" aria-controls="parent_edit" role="tab" data-toggle="tab">Edit</a></li>
										</c:if>
										<c:if test="${addbooktype eq true}">
											<li role="presentation"><a href="#parent_insert_b" aria-controls="parent_insert" role="tab" data-toggle="tab">Insert</a></li>
										</c:if>
										<c:if test="${rmbooktype eq true}">
											<li role="presentation"><a href="#parent_delete_b" aria-controls="parent_delete" role="tab" data-toggle="tab">Delete</a></li>
										</c:if>
									</ul>

									<!-- Tab panes -->
									<div class="tab-content">
										<c:if test="${editbooktype eq true}">
											<div role="tabpanel" class="tab-pane active" id="parent_edit_b">
												<div class="row">
													<label class="col-xs-4">Type Name</label><input class="form-control col-xs-8" id="book_editname" type="text" placeholder="Input Name" />
												</div>
												<div class="row text-center">
													<button class="btn btn-primary btn-sm center-block" id="book_edit">Submit</button>
												</div>
											</div>
										</c:if>
										<c:if test="${addbooktype eq true}">
											<div role="tabpanel" class="tab-pane" id="parent_insert_b">
												<div class="row">
													<label class="col-xs-4">Type Name</label><input class="form-control col-xs-8" id="book_insertname" type="text" placeholder="Input Name" />
												</div>
												<div class="row text-center">
													<button class="btn btn-primary btn-sm center-block" id="book_insert">Submit</button>
												</div>
											</div>
										</c:if>
										<c:if test="${rmbooktype eq true}">
											<div role="tabpanel" class="tab-pane" id="parent_delete_b">
												<div class="row text-center">
													<button id="book_delete" class="btn btn-danger btn-sm center-block">Delete</button>
												</div>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$.getScript("resources/plugins/ztree/js/jquery.ztree.core-3.5.min.js", function() {
			$.getScript("resources/plugins/icheck/icheck.min.js", function() {
				<c:if test="${manageusertype eq true}">
				$.getScript("resources/js/ajax/usertypemanage.js");
				</c:if>
				<c:if test="${managebooktype eq true}">
				$.getScript("resources/js/ajax/booktypemanage.js");
				</c:if>
			});

		});
	})
</script>