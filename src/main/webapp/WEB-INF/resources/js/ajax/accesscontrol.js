var setting = {
	check : {
		enable : true,
		chkboxType : {
			"Y" : "p",
			"N" : "ps"
		},
	},
	data : {
		key : {
			checked : "intauthvalue",
			name : "strname",
			url : ""
		},
		simpleData : {
			enable : true,
			idKey : "intpowerid",
			pIdKey : "intparentid",
			rootPId : 0
		},
		view : {
			showLine : true,
			showIcon : true
		}
	},
};

$(function() {
	WinMove();
})