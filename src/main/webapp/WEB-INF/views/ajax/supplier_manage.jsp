<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.panel-header, .panel-body {
	border-width: 0px;
}

.panel-title {
	cursor: pointer
}

.datagrid, .combo-p {
	border: solid 1px #D4D4D4;
}

.inlineblock {
	margin-top: 10px;
}

.inlineblock div {
	display: inline-block;
}

.inlineblock div label {
	display: inline-block;
	top: 5px;
}

.inlineblock div select {
	width: 48%;
}

.inlineblock div input {
	width: 48%;
}
</style>
<div class="row">
	<div id="breadcrumb" class="col-xs-12" style="margin-bottom: 10px">
		<a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">书籍</a></li>
			<li><a href="#">供应商管理</a></li>
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
					<i class="fa fa-clipboard"></i> <span>供应商信息面板</span>
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

				<div class="panel panel-default" style="border: 1px solid #CCC;">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForAdd">
							功能菜单 <span class="fa fa-chevron-down" style="float: right"></span>
						</h4>
					</div>

					<div id="collapseForAdd" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<div class="container-fluid" style="margin-top: 10px;">

								<div id="operationpanel" class="col-xs-12" style="overflow-x: hidden;">
									<div class="alert alert-danger" role="alert">
										<strong>警告!</strong> <br>[1]在编辑或者删除前，你要先选中一行.<br>[2]如果你想批量取消选择，你可以直接刷新整个Table.<br>[3]如果你没有权限，你需要向管理申请.
									</div>
									<div class="col-xs-12 btn-menu-top-minus">
										<c:if test="${addsupplier eq true}">
											<button class="btn btn-primary btn-sm addsupplier">
												<i class="fa fa-file-o"></i> 添加供应商
											</button>
										</c:if>
										<c:if test="${editsupplier eq true}">
											<button class="btn btn-primary btn-sm editsupplier">
												<i class="fa fa-file-text"></i> 编辑供应商
											</button>
										</c:if>
										<c:if test="${rmsupplier eq true}">
											<button class="btn btn-danger btn-sm removesupplier">
												<i class="fa fa-trash-o"></i> 删除供应商
											</button>
										</c:if>
									</div>
								</div>
								<c:if test="${addsupplier eq true}">
									<div id="addnewsupplier" class="col-xs-12" style="display: none; padding-top: 5px">
										<div id="newformRange">
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-6">编号</label><input class="newform form-control col-xs-6" id="newCode" type="text" placeholder="Input Code" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">名称</label><input class="newform form-control col-xs-6" id="newName" type="text" placeholder="Input Name" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">地址</label><input class="newform form-control col-xs-6" id="newAddress" type="text" placeholder="Input Address" />
												</div>
											</div>
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4 controls">
													<label class="col-xs-6">公司电话</label><input class="newform form-control col-xs-6" id="newCompanyPhone" placeholder="Input Company Phone" />
												</div>
												<div class="col-xs-4 controls">
													<label class="col-xs-6">负责人</label><input class="newform form-control col-xs-6" id="newHandlePerson" type="text" placeholder="Input Handle Person" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">负责人电话</label><input class="newform form-control col-xs-6" id="newHandlePhone" type="text" placeholder="Input Handle Phone" />
												</div>
											</div>
											<div class="col-xs-12 inlineblock">
												<div class="col-xs-4">
													<label class="col-xs-6">联系人</label><input class="newform form-control col-xs-6" id="newContactPerson" type="text" placeholder="Input Contact Person" />
												</div>
												<div class="col-xs-4">
													<label class="col-xs-6">联系人电话</label><input class="newform form-control col-xs-6" id="newContactPhone" placeholder="Input Contact Phone" />
												</div>
											</div>
										</div>
										<div class="col-xs-12 inlineblock">
											<div class="col-xs-12 btn-menu">
												<button class="btn btn-primary btn-sm submitAdd" style="width: 100px">添加</button>
												<button class="btn btn-default btn-sm cancelAdd" style="width: 100px">取消</button>
												<strong><label style="color: red;" id="adderrormsg"></label></strong>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${editsupplier eq true}">
									<div id="editsuppliercontainer" class="col-xs-12" style="display: none; overflow-x: hidden;">
										<div class="col-xs-12">
											<ul class="nav nav-tabs" role="tablist" id="supplierEditTable">
											</ul>
											<div class="tab-content"></div>
										</div>
										<div class="col-xs-12 btn-menu-top-plus">
											<button class="btn btn-primary btn-sm submitEdit">提交编辑</button>
											<button class="btn btn-default btn-sm cancelEdit">取消</button>
											<strong><label style="color: red;" id="editerrormsg"></label></strong>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<c:if test="${querysupplier eq true}">
					<div class="panel panel-default" style="border: 1px solid #CCC;">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title" data-toggle="collapse" data-target="#collapseForsupplierTable">
								供应商信息<span class="fa fa-chevron-down" style="float: right"></span>
							</h4>
						</div>
						<div id="collapseForsupplierTable" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
							<div class="panel-body" style="overflow-x: hidden;"></div>
							<table id="datatable_supplierinfo"  data-size="${suppliergridsize}" style="width: 100%">
							</table>
						</div>
					</div>
				</c:if>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	<c:if test="${managesupplier eq true}">
	$(function() {
		$.getScript("resources/js/ajax/min/supplier.js");
	})
	</c:if>
</script>