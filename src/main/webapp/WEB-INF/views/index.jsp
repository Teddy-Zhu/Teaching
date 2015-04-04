<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN" style="min-width: 1000px;">
<head>
    <title>Teaching ManageMent System</title>
    <meta charset="utf-8">
    <link rel="alternate icon" type="image/png" href="resources/img/favicon.png">
    <link rel="stylesheet" href="resources/plugins/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="resources/css/self.min.css"/>
    <link rel="stylesheet" href="resources/plugins/pnotify/pnotify.custom.min.css"/>
    <link href="resources/plugins/nprogress/nprogress.min.css" rel="stylesheet">
    <link href="resources/plugins/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">
</head>
<style>
    span.passwordc {
        width: initial;
        top: 0px;
    }

    .input-group.col-xs-7.col-sm-offset-2 {
        margin-top: 10px;
    }

    .alert {
        margin-bottom: 0px;
    }

    .panel.panel-default {
        -webkit-box-shadow: 0px 2px 10px rgba(255, 255, 255, 0.5);
        -moz-box-shadow: 0px 2px 10px rgba(255, 255, 255, 0.5);
        box-shadow: 0px 2px 10px rgba(255, 255, 255, 0.5);
    }

    .input-group {
        -webkit-box-shadow: 0px 5px 5px rgba(255, 255, 255, 0.5);
        -moz-box-shadow: 0px 5px 5px rgba(255, 255, 255, 0.5);
        box-shadow: 0px 5px 5px rgba(98, 98, 98, 0.5);
    }

    #registerModal div div div div {
        margin-bottom: 2%;
    }

    #loginModal div div div div {
        margin-bottom: 2%;
    }

    #registerModal div div div div .input-group {
        width: 100%;
    }

    #loginModal div div div div .input-group {
        width: 100%;
    }

    .input-span {
        width: 100px;
        text-align: left;
        width: 100px;
    }

    after-span {
        width: 70%;
    }
</style>
<body style="background-color: #353535 ! important">
<div class="container">
    <div class="col-xs-12 text-center" style="height: 170px;">
        <div class="col-xs-12">
            <h1 style="color: white; margin-top: 40px;">
                <strong>Teaching ManageMent System</strong>
            </h1>
            <h5 style="color: white; margin-top: 25px;">It's a System For Teaching</h5>
        </div>
        <div class="col-xs-12" style="text-align: center">
            <div class="preloader" style="display: none;">
                <img src="resources/img/devoops_getdata.gif" class="devoops-getdata" alt="preloader"/>
            </div>
        </div>
    </div>

    <div id="loginModal" class="text-center col-xs-12 am-animation-slide-top" style="display: block; margin-bottom: 5%;">
        <div class="col-xs-12 text-center">
            <div class="panel panel-default center-block" style="width: 50%;">
                <div class="panel-heading text-center">Login Your Account and Continue!</div>
                <div class="panel-body text-center">
                    <a href="javascript:void(0);" class="glyphicon glyphicon-chevron-down" style="color: #000000; text-decoration: none; font-size: 40px; float: right;"></a>

                    <div class="col-xs-8 col-sm-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-user">User</span></span> <input id="loginUserName" type="text" class="form-control" value="Admin" placeholder="Username">
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock">Password</span></span> <input id="loginPassWord" type="password" value="a" class="form-control" placeholder="Password"><span
                                class="passwordc input-group-addon glyphicon glyphicon-eye-close"></span>
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-offset-2">
                        <button id="loginButton" data-toggle="button" type="button" class="btn btn-primary" style="float: left">Login</button>
                        <button id="resetButton" type="button" data-toggle="button" class="btn btn-default" style="float: right">Reset</button>
                    </div>
                    <div class="col-xs-12">
                        <div class="alert alert-success" role="alert">Reminder:Lost Password?</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="registerModal" class="col-xs-12 am-animation-slide-top" style="display: none; margin-bottom: 5%;">
        <div class="col-xs-12 text-center">
            <div class="panel panel-default center-block" style="width: 50%;">
                <div class="panel-heading text-center">Register Your Account and Continue!</div>
                <div class="panel-body text-center">
                    <a href="javascript:void(0);" class="glyphicon glyphicon-chevron-down" style="color: #000000; text-decoration: none; font-size: 40px; float: right;"></a>

                    <div class="col-xs-8 col-sm-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-stats">UserType</span></span><select id="UserType" class="RegisterForm after-span form-control"></select>
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-user"> User</span></span> <input id="UserName" type="text" class="RegisterForm after-span form-control" placeholder="Username">
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock">Password</span></span> <input id="PassWord" type="password" class="RegisterForm form-control" placeholder="Password"><span
                                class="passwordc input-group-addon glyphicon glyphicon-eye-close"></span>
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock"> Re-Pass</span></span> <input id="RePassWord" type="password" class="RegisterForm form-control" placeholder="Re-Password"><span
                                class="passwordc input-group-addon glyphicon glyphicon-eye-close"></span>
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">Depart</span></span> <select id="DepartMent" class="RegisterForm after-span form-control"></select>
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">Majors</span></span><select id="Majors" class="RegisterForm after-span form-control"></select>
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">RealName</span></span> <input id="RealName" type="text" class="RegisterForm after-span form-control" placeholder="Your Name">
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-file">Number</span></span> <input id="StudentId" type="text" class="RegisterForm after-span form-control" placeholder="Your Student Id">
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-envelope"> Email</span></span> <input id="Email" type="text" class="RegisterForm after-span form-control" placeholder="Email">
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <div class="input-group">
                            <span class="input-group-addon input-span"><span class="glyphicon glyphicon-lock"> Phone</span></span> <input id="Phone" type="text" class="RegisterForm after-span form-control" placeholder="Your Phone Number">
                        </div>
                    </div>
                    <div class="col-xs-8 col-xs-offset-2">
                        <button id="registerButton" data-toggle="button" type="button" class="btn btn-primary" style="float: left">Register</button>
                        <button id="resetRegButton" type="button" data-toggle="button" class="btn btn-default" style="float: right">Reset</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-xs-12 navbar-fixed-bottom">
    <h5 class="text-center" style="color: white; background-color: #353535; margin-bottom: 0px;">
        Designed By ZhuXi Powered By Bootstrap And Others OpenCode. <strong>Copy Right©2014-${year} JinChengOpenSource Inc.Deployed By Jenkins</strong> <a href="#" class="label label-default UserAccount">Avaiable UserAccount For Test</a>-<a href="#" class="label label-default version"
                                                                                                                                                                                                                                                 style="margin-top: 10px"><strong>Current Version
        :${version}</strong></a> <span style="text-align: center; display: inline-block;"> <span style="color: white; display: inline-block;">Pic</span> <input id="toggleBackGround" type="checkbox"/>
			</span>
    </h5>
</div>
<script type="text/javascript" src="resources/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="resources/plugins/bootstrap/bootstrap.min.js"></script>
<script src="resources/plugins/nprogress/nprogress.min.js"></script>
<script type="text/javascript" src="resources/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="resources/js/min/TeachDialog.js"></script>
<script type="text/javascript" src="resources/js/min/index.js"></script>
</body>
</html>