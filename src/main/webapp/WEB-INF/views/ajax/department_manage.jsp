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
</style>
<link rel="stylesheet" href="resources/plugins/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css" />
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

					<div id="department_tree" class="col-xs-4" style="height: 400px;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									DepartMent Tree<i class="fa fa-refresh fa-lg pull-right" style="margin-top: 3px"></i>
								</h3>

							</div>
							<div class="panel-body">
								<div id="ul_tree" class="ztree"></div>
							</div>
						</div>
					</div>
					<div id="operate_menu" class="col-xs-8" style="height: 100px;">

						<div id="DepartPanel" role="tabpanel">

							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<c:if test="${edituserdepart eq true}">
									<li role="presentation" class="active"><a href="#parent_edit" aria-controls="parent_edit" role="tab" data-toggle="tab">Edit</a></li>
								</c:if>
								<c:if test="${adduserdepart eq true}">
									<li role="presentation"><a href="#parent_insert" aria-controls="parent_insert" role="tab" data-toggle="tab">Insert</a></li>
								</c:if>
								<c:if test="${rmuserdepart eq true}">
									<li role="presentation"><a href="#parent_delete" aria-controls="parent_delete" role="tab" data-toggle="tab">Delete</a></li>
								</c:if>
							</ul>

							<!-- Tab panes -->
							<div class="tab-content">
								<c:if test="${edituserdepart eq true}">
									<div role="tabpanel" class="tab-pane active" id="parent_edit">
										<div class="row">
											<label class="col-xs-4">Parent DepartMent</label><select class="form-control col-xs-8" id="parent_edit_sel"></select>
										</div>
										<div class="row">
											<label class="col-xs-4">DepartMent or Major Name</label><input class="form-control col-xs-8" id="parent_edit_name" type="text" placeholder="Input Name" />
										</div>
										<div class="row text-center">
											<button class="btn btn-primary btn-xs center-block" id="edit">Submit</button>
										</div>
									</div>
								</c:if>
								<c:if test="${adduserdepart eq true}">
									<div role="tabpanel" class="tab-pane" id="parent_insert">
										<div class="row">
											<label class="col-xs-4">Parent DepartMent</label><select class="form-control col-xs-8" id="parent_insert_sel"></select>
										</div>
										<div class="row">
											<label class="col-xs-4">DepartMent or Major Name</label><input class="form-control col-xs-8" id="parent_insert_name" type="text" placeholder="Input Name" />
										</div>
										<div class="row text-center">
											<button class="btn btn-primary btn-xs center-block" id="insert">Submit</button>
										</div>
									</div>
								</c:if>
								<c:if test="${rmuserdepart eq true}">
									<div role="tabpanel" class="tab-pane" id="parent_delete">
										<div class="row text-center">
											<button id="delete" class="btn btn-danger center-block">Delete</button>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	<c:if test="${getalluserdepart eq true}">
	$(function() {
		$.getScript("resources/plugins/ztree/js/jquery.ztree.core-3.5.min.js", function() {
			$.getScript("resources/js/ajax/department.js");
		});
	})
	</c:if>
</script>