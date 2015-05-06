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
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">系统设置</a></li>
			<li><a href="#">权限管理</a></li>
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
					<i class="fa fa-clipboard"></i> <span>管理面板</span>
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
					<div id="usertypecontainer">
						<div id="tree" class="col-xs-4">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3 class="panel-title">
										权限管理<i class="fa fa-refresh fa-lg pull-right usertype" style="margin-top: 3px"></i>
									</h3>

								</div>
								<div class="panel-body">
									<div id="ul_tree" class="ztree"></div>
								</div>
							</div>
						</div>
						<div id="useroperate_menu" class="col-xs-8" style="height: 150px;">
							<div id="userPanel" role="tabpanel">

								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<c:if test="${accesscontrol eq true}">
										<li role="presentation" class="active"><a href="#controlpanel" aria-controls="controlpanel" role="tab" data-toggle="tab">操作面板</a></li>
									</c:if>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<c:if test="${accesscontrol eq true}">
										<div role="tabpanel" class="tab-pane active" id="controlpanel">
											<div class="row">
												<label class="col-xs-4">用户类型</label><select class="form-control col-xs-8" id="usertype"></select>
											</div>
											<div class="row text-center">
												<button class="btn btn-primary center-block" id="Update">更新</button>
												<button class="btn btn-primary center-block" id="Reset">重置</button>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<div id="notification" class="col-xs-8" style="height: 250px;">
							<div class="alert alert-danger" role="alert">
								<strong>注意点!</strong> <br> 用户类型，书籍类型，系部管理，权限控管菜单，在系统设置菜单下，意味着需要前者的权限，首选需要设置菜单的权限。
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		<c:if test="${accesscontrol eq true}">
		$.getScript("resources/plugins/ztree/js/jquery.ztree.core-3.5.min.js", function() {
			$.getScript("resources/plugins/ztree/js/jquery.ztree.excheck-3.5.min.js", function() {
				$.getScript("resources/js/ajax/min/access_manage.js");
			})
		})
		</c:if>
	})
</script>