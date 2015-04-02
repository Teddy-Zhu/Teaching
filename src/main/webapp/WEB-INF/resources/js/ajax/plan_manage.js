function getSearchParams(params) {
    var searchParams = new Object();
    if (params != undefined) {
        searchParams = params;
    }
    $('.SearchForm').each(function () {
        var param = $(this).val()
        if (param == null && param == undefined) {
            param = ''
        } else {
            param = param.trim();
        }
        searchParams[$(this).attr('id')] = param;
    });
    return searchParams;
}

function initUserType(id, addition) {
    var dtd = $.Deferred();
    var fillDom = function (domData) {
        $('#' + id).empty();
        if (addition != undefined) {
            $('#' + id).append('<option value="-1">All UserType</option>');
        }
        for (var i = 0; len = domData.length, i < len; i++) {
            $('#' + id).append('<option value="' + domData[i].intidentityid + '">' + domData[i].strname + '</option>');
        }
        dtd.resolve();
    }
    if ($('#datatable_perplaninfo').data('usertype') != undefined) {
        fillDom($('#datatable_perplaninfo').data('usertype'));
    } else {
        $.ajax({
            url: 'Type/GetUserTypeAll',
            dataType: 'json',
            type: 'post',
            success: function (data) {
                $('#datatable_perplaninfo').data('usertype', data);
                fillDom(data);
            },
            async: true
        })
    }
    return dtd.promise();
}
function initUserDepartMent(id, type, addition) {
    var typedata = type.toString().replace('-', 'minus');
    var dtd = $.Deferred();
    var filldom = function (domData) {
        $('#' + id).empty();
        if (addition != undefined) {
            $('#' + id).append('<option value="-1">All DepartMent</option>');
        }
        for (var i = 0; len = domData.length, i < len; i++) {
            $('#' + id).append('<option value="' + domData[i].intid + '">' + domData[i].strname + '</option>');
        }
        dtd.resolve();
    }
    if ($('#datatable_perplaninfo').data('userdepartment' + typedata) != undefined) {
        filldom($('#datatable_perplaninfo').data('userdepartment' + typedata));
    } else {
        $.ajax({
            url: 'Type/GetDepartMent',
            type: 'post',
            dataType: 'json',
            data: {
                id: type
            },
            success: function (data) {
                $('#datatable_perplaninfo').data('userdepartment' + typedata, data);
                filldom(data);
            },
            async: true
        })
    }

    return dtd.promise();
}
function getDialogSearchParams(params) {
    var searchParams = new Object();
    if (params != undefined) {
        searchParams = params;
    }
    $('.DialogSearchForm').each(function () {
        var param = $(this).val();
        if (param == null && param == undefined) {
            param = ''
        } else {
            param = param.trim();
        }
        searchParams[$(this).attr('id')] = param;
    });
    return searchParams;
}

function getPlanStatus(domId) {
    var dtd = $.Deferred();
    var fillDom = function (domData) {
        for (var i = 0; len = domData.length, i < len; i++) {
            $('#' + domId).append('<option value="' + domData[i].intplanstatusid + '">' + domData[i].strmark + '</option>')
        }
        dtd.resolve();
    }
    if ($('#PlanStatus').data('bookplanstatus') == undefined) {
        $.ajax({
            url: 'Plan/GetBookPlanStatus',
            dataType: 'json',
            type: 'post'
        }).success(function (data) {
            $('#PlanStatus').data('bookplanstatus', data);
            fillDom(data);
        })
    } else {
        fillDom($('#PlanStatus').data('bookplanstatus'));
    }
    return dtd.promise();
}

function toolBarClick(type, oneneed, pendingneed) {
    var rows = $('#datatable_perplaninfo').datagrid('getSelections');

    if (rows.length < 1) {
        $.TeachDialog({
            content: 'You should select one row at least!',
            bootstrapModalOption: {}
        });
        return;
    }
    if (oneneed) {
        if (rows.length > 1) {
            $.TeachDialog({
                content: 'You should select one row at most!',
                bootstrapModalOption: {}
            });
            return;
        }
    }
    var plans = new Array();

    for (var i = 0, len = rows.length; i < len; i++) {
        plans.push(rows[i].intplanid);
        if (pendingneed && rows[i].bookPlanStatus.intplanstatusid != 1) {
            $.TeachDialog({
                content: 'The plan status you selected is not pending!',
                bootstrapModalOption: {}
            });
            return;
        }
    }

    var url = undefined;
    switch (type) {
        case 1:
        {
            if (url == undefined) {
                url = 'PassPlan';
            }
        }
        case 2:
        {
            if (url == undefined) {
                url = 'RejectPlan';
            }
        }
        case 3:
        {
            if (url == undefined) {
                url = 'RefusePlan';
            }
            $.ajax({
                url: 'Plan/' + url,
                dataType: 'json',
                type: 'post',
                data: {
                    planId: plans
                }
            }).success(function (data) {
                if (data) {
                    $.TeachDialog({
                        content: 'Change Plan Status Successfully!',
                        bootstrapModalOption: {}
                    });
                } else {
                    $.TeachDialog({
                        content: 'Change Plan Status failed!',
                        bootstrapModalOption: {}
                    });
                }
            })
            break;
        }
        case 4:
        {
            url = 'ChangeStatus';
            $.TeachDialog({
                title: 'Change The Plan Status',
                content: '<div class="col-xs-offset-1 row" style="width: 80%;"><label class="col-xs-5"><span class="label label-danger">Danger</span>Plan Status:</label><select id="ChangePlanStatus" style="width:50%" type="text" class="col-xs-8 form-control" ></select></div>',
                otherButtons: ['Change'],
                otherButtonStyles: ['btn btn-primary'],
                dialogShow: function () {
                    getPlanStatus('ChangePlanStatus');
                },
                clickButton: function (sender, modal, index) {
                    if (index == 0) {
                        $.ajax({
                            url: 'Plan/' + url,
                            dataType: 'json',
                            type: 'post',
                            data: {
                                planId: plans,
                                Status: $('#ChangePlanStatus').val()
                            }
                        }).success(function (data) {
                            modal.modal('hide');
                            if (data) {
                                $.TeachDialog({
                                    content: 'Change Plans Status Success!'
                                });
                                $('#datatable_perplaninfo').datagrid('reload');
                            } else {
                                $.TeachDialog({
                                    content: 'Change Plans Status failed!'
                                });
                            }
                        })
                    }
                }
            })
            break;
        }
        case 5:
        {
            $.TeachDialog({
                title: 'The Plan History',
                content: '<div id="historytable" class="table-responsive"><table class="table"><caption>Plan Histroy Changes</caption></table></div>',
                largeSize: true,
                dialogShow: function () {
                    $.ajax({
                        url: 'Plan/GetPlanHistory',
                        dataType: 'json',
                        type: 'post',
                        data: {
                            PlanId: plans[0]
                        }
                    }).success(function (data) {
                        $('#historytable table').append('<thead><tr><th>Id</th><th>Operation Name</th><th>Changes</th><th>Operation Personal</th><th>Operation Time</th></tr></thead><tbody></tbody>');
                        for (var i = 0, len = data.length; i < len; i++) {
                            var changeString = '';
                            if (data[i].bookPlanChange && data[i].bookPlanChange.intbookchangeid != -1) {
                                var stcount = data[i].bookPlanChange.intstudent;
                                var teacount = data[i].bookPlanChange.intteacher;
                                if (stcount != 0) {
                                    changeString += (stcount > 0 ? 'Increase' : 'Decrease') + ' Student Number :' + Math.abs(stcount) + '<br>';
                                }
                                if (teacount != 0) {
                                    changeString += (teacount > 0 ? 'Increase' : 'Decrease') + ' Teacher Number :' + Math.abs(teacount) + '<br>';
                                }
                            } else {
                                changeString = 'none';
                            }
                            $('#historytable table tbody').append('<tr><td>' + (i + 1) + '</td><td>' + data[i].operation.stroperationname + '</td><td>' + changeString.trimEnd('<br>') + '</td><td>' + data[i].user.strname + '</td><td>' + unix2human(data[i].datecreatetime) + '</td></tr>');
                        }
                    });
                }
            })
            break;
        }
    }
}

function queryPlanHistory() {
    $.TeachDialog({
        title: 'The Plan History',
        content: '<div id="historytable" class="table-responsive"><table class="table"><caption>Plan Histroy Changes</caption></table></div>',
        dialogShow: function () {
            $.ajax({
                url: 'Plan/GetPerPlanHistory',
                dataType: 'json',
                type: 'post',
                data: {
                    PlanId: planId
                }
            }).success(function (data) {
                $('#historytable table').append('<thead><tr><th>Id</th><th>Operation Name</th><th>Changes</th><th>Operation Time</th></tr></thead><tbody></tbody>');
                for (var i = 0, len = data.length; i < len; i++) {
                    var changeString = '';
                    if (data[i].bookPlanChange && data[i].bookPlanChange.intbookchangeid != -1) {
                        var stcount = data[i].bookPlanChange.intstudent;
                        var teacount = data[i].bookPlanChange.intteacher;
                        if (stcount != 0) {
                            changeString += (stcount > 0 ? 'Increase' : 'Decrease') + ' Student Number :' + Math.abs(stcount) + '<br>';
                        }
                        if (teacount != 0) {
                            changeString += (teacount > 0 ? 'Increase' : 'Decrease') + ' Teacher Number :' + Math.abs(teacount) + '<br>';
                        }
                    } else {
                        changeString = 'none';
                    }
                    $('#historytable table tbody').append('<tr><td>' + (i + 1) + '</td><td>' + data[i].operation.stroperationname + '</td><td>' + changeString.trimEnd('<br>') + '</td><td>' + unix2human(data[i].datecreatetime) + '</td></tr>');
                }
            });
        }
    })
}

$(function () {
    // initial date input
    $('#SearchDate').datepicker({
        format: "yyyy-mm-dd",
        todayBtn: "linked",
        autoclose: true,
        todayHighlight: true,
        clearBtn: true
    });

    // initial type
    $.ajax({
        url: 'Plan/GetCourseType',
        dataType: 'json',
        type: 'post'
    }).success(function (data) {
        for (var i = 0; len = data.length, i < len; i++) {
            $('#CourseType').append('<option value="' + data[i].intcoursetypeid + '">' + data[i].strcoursename + '</option>')
        }
    })

    getPlanStatus('PlanStatus');

    var psval = $('#datatable_perplaninfo').attr('data-size');
    if (psval == undefined || psval == "") {
        psval = 10;
    }
    cellwidth = ($(".box-content.table-responsive").width() - 55) / 11;
    var $mydatagrid = $('#datatable_perplaninfo');
    $mydatagrid.datagrid({
        striped: true,
        remoteSort: false,
        fit: false,
        url: 'Plan/GetAllPlan',
        loadMsg: 'Please waiting for loading date.....',
        pagination: true,
        rownumbers: true,
        fitColumns: true,
        pageSize: psval,
        pageList: [psval, psval * 2, psval * 3, psval * 4, psval * 5],
        columns: [[{
            field: 'strcoursename',
            title: 'CourseName',
            align: 'center',
            sortable: true,
            width: cellwidth
        }, {
            field: 'courseType',
            title: 'CourseType',
            align: 'center',
            width: cellwidth,
            sortable: true,
            formatter: function (value) {
                return value.strcoursename;
            }
        }, {
            field: 'strclass',
            title: 'ClassId',
            align: 'center',
            width: cellwidth,
            sortable: true
        }, {
            field: 'intstudcount',
            title: 'Student Count',
            align: 'center',
            width: cellwidth * 0.5,
            sortable: true
        }, {
            field: 'intteaccount',
            title: 'Teacher Count',
            align: 'center',
            width: cellwidth * 0.5,
            sortable: true
        }, {
            field: 'book',
            title: 'BookName',
            align: 'center',
            width: cellwidth * 2,
            sortable: true,
            formatter: function (value) {
                return value.strbookname;
            }
        }, {
            field: 'intfromyear',
            title: 'Time',
            align: 'center',
            width: cellwidth,
            formatter: function (value, row) {
                return value + '-' + row.inttoyear;
            }
        }, {
            field: 'intterm',
            title: 'Term',
            align: 'center',
            width: cellwidth,
            sortable: true,
            formatter: function (value) {
                if (value) {
                    return '下半学年';
                } else {
                    return '上半学年';
                }
            }
        }, {
            field: 'user',
            title: 'Applicant',
            align: 'center',
            width: cellwidth,
            formatter: function (value) {
                return value.strname;
            }
        }, {
            field: 'strmark',
            title: 'Mark',
            align: 'center',
            width: cellwidth
        }, {
            field: 'datecreatetime',
            title: 'CreateTime',
            align: 'center',
            width: cellwidth + 35,
            sortable: true,
            formatter: function (value) {
                return unix2human(value);
            }
        }, {
            field: 'bookPlanStatus',
            title: 'Status',
            align: 'center',
            width: cellwidth,
            sortable: true,
            formatter: function (value) {
                return value.strmark;
            }
        }]],
        onBeforeLoad: function (param) {
            param = getSearchParams(param);
        },
        toolbar: [{
            text: "Pass Plan",
            iconCls: 'fa fa-pencil',
            handler: function () {
                toolBarClick(1, false, true);
            }
        }, '-', {
            text: "Reject Plan",
            iconCls: 'fa fa-remove',
            handler: function () {
                toolBarClick(2, false, true);
            }
        }, '-', {
            text: "Refuse Plan",
            iconCls: 'fa fa-recycle',
            handler: function () {
                toolBarClick(3, false, true);
            }
        }, '-', {
            text: "Change Other Status",
            iconCls: 'fa fa-search',
            handler: function () {
                toolBarClick(4, false, false);
            }
        }, '-', {
            text: "Query Plan History",
            iconCls: 'fa fa-search',
            handler: function () {
                toolBarClick(5, true, false);
            }
        }, '-', {
            text: "Export Below Plan To Excel",
            iconCls: 'fa fa-download',
            handler: function () {
                $.DownloadFile({
                    url: 'Plan/ExportPerPlan',
                    method: 'post',
                    data: getSearchParams()
                });
            }
        }, '-', {
            text: "Export Below Plan Statistics To Excel",
            iconCls: 'fa fa-download',
            handler: function () {
                $.DownloadFile({
                    url: 'Plan/ImportPerPlan',
                    method: 'post',
                    data: getSearchParams()
                })
            }
        }],
        onClickRow: function (rowIndex, rowData) {
            $('#notification').html('<strong class="col-xs-3">Unit Price:' + rowData.book.strprice.toFixed(2) + '</strong><strong class="col-xs-3">Discount:' + rowData.book.intpricediscount.toFixed(2) +  '</strong><strong class="col-xs-3">Student Total:' + (rowData.intstudcount * rowData.book.strprice * rowData.book.intpricediscount /10).toFixed(2) + '</strong><strong class="col-xs-3">Teacher Total:'+ (rowData.intteaccount * rowData.book.strprice * rowData.book.intpricediscount/10).toFixed(2) +'</strong>');
        },
        onLoadSuccess :function(data){
            $('#notification').html('No Selected Plan');
        }
    });

    $('#userselect')
        .click(
        function () {
            $
                .TeachDialog({
                    modalID: "SelectUsersModal",
                    title: 'Select Users From Table',
                    content: '<div class="searchClass row"><div class="col-xs-12"><label>Id</label><input class="DialogSearchForm form-control" type="text" id="SearchUserId" /><label>UserName</label><input class="DialogSearchForm form-control" type="text" id="SearchUserName" /> <label>RealName</label><input class="DialogSearchForm form-control" type="text" id="SearchRealName" /> <label>UserType</label><select class="DialogSearchForm form-control" id="SearchUserType"><option value="-1">All UserType</option></select></div><div class="col-xs-12"><label>Id Card</label><input class="DialogSearchForm form-control" id="SearchIdCard" /><label>DepartMent</label><select class="DialogSearchForm form-control" id="SearchDepartMent"><option value="-1">All Department</option></select> <label>Major</label><select class="DialogSearchForm form-control" id="SearchMajor"><option value="-1">All Department</option></select> <label>Phone</label><input class="DialogSearchForm form-control" id="SearchPhone" type="text" /></div><div class="col-xs-12"><label>CreateTime</label><input class="DialogSearchForm form-control" type="text" id="SearchTime" ReadOnly /><label>Email</label><input class="DialogSearchForm form-control" type="text" id="SearchEmail" /><button id="DialogSearch" class="btn btn-primary btn-xs" style="height: 30px">Search</button></div></div><table id="datatable_userinfo" style="width: 100%"></table>',
                    largeSize: true,
                    otherButtons: ['Select'],
                    otherButtonStyles: ['btn btn-primary'],
                    clickButton: function (sender, modal, index) {
                        if (index == 0) {
                            var rows = $('#datatable_userinfo').datagrid('getSelections');
                            if (rows.length != 1) {
                                $.TeachDialog({
                                    content: 'You should select a row!',
                                    bootstrapModalOption: {}
                                });
                                return;
                            } else {
                                $('#UserId').empty();
                                $('#UserId').append('<option value="' + rows[0].intid + '">' + rows[0].strname + '</option>')
                            }
                            modal.modal('hide');
                        }
                    },
                    dialogHide: function () {
                        $('#DialogSearch').off('click');
                    },
                    dialogShown: function () {
                        initUserType('SearchUserType', true);
                        initUserDepartMent('SearchDepartMent', 1, true).done(function () {
                            $('#SearchDepartMent').change(function () {
                                initUserDepartMent('SearchMajor', $('#SearchDepartMent').val(), true);
                            })
                            initUserDepartMent('SearchMajor', $('#SearchDepartMent').val(), true);
                        })
                        $('#DialogSearch').click(function () {
                            $('#datatable_userinfo').datagrid('reload');
                        })
                        $('#SearchTime').datepicker({
                            format: "yyyy-mm-dd",
                            todayBtn: "linked",
                            autoclose: true,
                            todayHighlight: true,
                            clearBtn: true
                        });
                        var cellwidth = ($(".modal-body").width() - 55) / 11;
                        $('#datatable_userinfo').datagrid({
                            striped: true,
                            remoteSort: false,
                            collapsible: true,
                            fit: false,
                            url: 'User/GetAllUser',
                            loadMsg: 'Please waiting for loading date.....',
                            pagination: true,
                            rownumbers: true,
                            singleSelect: true,
                            fitColumns: true,
                            columns: [[{
                                field: 'intid',
                                title: 'User ID',
                                align: 'center',
                                sortable: true,
                                width: cellwidth * 0.5
                            }, {
                                field: 'username',
                                title: 'UserName',
                                align: 'center',
                                sortable: true,
                                width: cellwidth
                            }, {
                                field: 'strname',
                                title: 'RealName',
                                align: 'center',
                                width: cellwidth,
                                sortable: true
                            }, {
                                field: 'userType',
                                title: 'UserType',
                                align: 'center',
                                width: cellwidth,
                                sortable: true,
                                formatter: function (value) {
                                    return value.strname;
                                }
                            }, {
                                field: 'userDepartMent',
                                title: 'DepartMent',
                                align: 'center',
                                width: cellwidth,
                                sortable: true,
                                formatter: function (value) {
                                    return value.strname;
                                }
                            }, {
                                field: 'userMajor',
                                title: 'Major',
                                align: 'center',
                                width: cellwidth * 1.4,
                                sortable: true,
                                formatter: function (value) {
                                    return value.strname;
                                }
                            }, {
                                field: 'strstunum',
                                title: 'Id Card',
                                align: 'center',
                                width: cellwidth,
                                sortable: true
                            }, {
                                field: 'strphone',
                                title: 'Phone',
                                align: 'center',
                                width: cellwidth,
                                sortable: true
                            }, {
                                field: 'strmail',
                                title: 'Email',
                                align: 'center',
                                width: cellwidth,
                                sortable: true
                            }, {
                                field: 'dateregtime',
                                title: 'CreateTime',
                                align: 'center',
                                width: cellwidth * 1.1 + 10,
                                sortable: true,
                                formatter: function (value) {
                                    return unix2human(value);
                                }
                            }]],
                            onBeforeLoad: function (param) {
                                param = getDialogSearchParams(param);
                            },
                            onDblClickRow: function (rowIndex, rowData) {
                                $('#UserId').empty();
                                $('#UserId').append('<option value="' + rowData.intid + '">' + rowData.strname + '</option>')
                                $('#SelectUsersModal').modal('hide');
                            }
                        });
                    }
                });
        })
    $('#Search').click(function () {
        $mydatagrid.datagrid('reload');
    })
})