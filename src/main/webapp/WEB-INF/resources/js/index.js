$(function() {
	$('#PassWord').popover({
		content : "Please input username and password!",
		title : "<div style=\"width:200px;\">Message</div>",
		html : true
	})
	$('#PassWord').popover('show');
	$('#loginButton').click(function() {
		$(this).button('loading')

		setTimeout(function() {
			$('#loginButton').button('reset');
		}, 5000);
	})
	var i = true;
	$('.glyphicon.glyphicon-chevron-down').click(function() {
		if (i == true) {
			i = false;
			$('#loginModal').slideToggle();
			$('#registerModal').slideToggle();

		} else {
			i = true;
			$('#registerModal').slideToggle();
			$('#loginModal').slideToggle();
		}
	})

	var t = false;
	$('.input-group-addon.glyphicon.glyphicon-eye-close').click(function() {
		var str = 'text';
		if (t)
			str = "password";
		$('#loginPassWord').attr('type', str);
		$('#RePassWord').attr('type', str);
		$('#PassWord').attr('type', str);
		if (t) {
			$(this).removeClass('glyphicon-eye-open');
			$(this).addClass('glyphicon-eye-close')
		} else {
			$(this).removeClass('glyphicon-eye-close');
			$(this).addClass('glyphicon-eye-open')
		}
		if (t)
			t = false;
		else
			t = true;
	})
})