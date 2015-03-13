function getSearchParams(params) {
	var searchParams = new Object();
	if (params != undefined) {
		searchParams = params;
	}
	$('.settingForm').each(function() {
		var param = $(this).val().trim();
		if (param == undefined)
			param = '';
		searchParams[$(this).attr('id')] = param;
	});
	return searchParams;
}

$(function() {
	console.log('as');
	// initial date input
	$("#BookGridSize,#UserGridSize,#SupplierGridSize,#PlanGridSize").TouchSpin({
		min : 1,
		max : 50,
		step : 1
	});

	$('#AnimationToggle').bootstrapSwitch();

	$('#AnimationToggle').bootstrapSwitch('onSwitchChange', function(e, data) {
		$('#AnimationToggle').val(data ? 'on' : 'off');
	});
	$('#AnimationToggle').val($(this).attr('data-open') == 1 ? 'on' : 'off');
	$('#AnimationToggle').bootstrapSwitch('state', parseInt($('#AnimationToggle').attr('data-open')) == 1 ? true : false);
	$("#reset").click(function() {
		LoadAjaxContent("ajax/personal_setting");
	})

	$('#savechange').click(function() {
		$.ajax({
			url : 'PersonalConfig/SaveChanges',
			dataType : 'json',
			type : 'post',
			data : getSearchParams(undefined),
			async : true
		}).success(function(data) {
			if (data) {
				$.TeachDialog({
					content : 'Update Settings Success!',
				});
			} else {
				$.TeachDialog({
					content : 'Update Settings failed!',
				});
			}
		});
	});

})