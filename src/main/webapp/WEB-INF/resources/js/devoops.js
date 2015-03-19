//
//    Main script of DevOOPS v1.0 Bootstrap Theme
//
"use strict";

jQuery.DownloadFile = function(parameters) {
	var url = parameters.url;
	var data = parameters.data;
	var method = parameters.method
	if (url && data) {
		data = typeof data == 'string' ? data : jQuery.param(data);
		var inputs = '';
		jQuery.each(data.split('&'), function() {
			var pair = this.split('=');
			inputs += '<input type="hidden" name="' + pair[0] + '" value="' + pair[1] + '" />';
		});
		jQuery('<form style="display:none;" action="' + url + '" method="' + (method || 'post') + '">' + inputs + '</form>').appendTo('body').submit().remove();
	}
}
function LoadOpenLayersScript(callback) {
	if (!$.fn.OpenLayers) {
		$.getScript('http://www.openlayers.org/api/OpenLayers.js', callback);
	} else {
		if (callback && typeof (callback) === "function") {
			callback();
		}
	}
}
function loadJs(url) {
	var dtd = $.Deferred();
	$.getScript(url, function() {
		dtd.resolve();
	})
	return dtd.promise();
}

function LoadJsFile(urls) {
	if (!$.isArray(urls)) {
		return loadJs(urls);
	}
	var ret = [];
	for (var i = 0, len = urls.length; i < len; i++) {

		ret[i] = loadJs(urls[i]);
	}
	return $.when.apply($, ret);
}
function LoadLeafletScript(callback) {
	if (!$.fn.L) {
		$.getScript('resources/plugins/leaflet/leaflet.js', callback);
	} else {
		if (callback && typeof (callback) === "function") {
			callback();
		}
	}
}
String.prototype.trimEnd = function(trimStr) {
	if (!trimStr) {
		return this;
	}
	var temp = this;
	while (true) {
		if (temp.substr(temp.length - trimStr.length, trimStr.length) != trimStr) {
			break;
		}
		temp = temp.substr(0, temp.length - trimStr.length);
	}
	return temp;
};
function unix2human(unixtime) {
	var dateObj = new Date(unixtime);
	var UnixTimeToDate = dateObj.getFullYear() + '-' + (dateObj.getMonth() + 1) + '-' + dateObj.getDate() + ' ' + p(dateObj.getHours()) + ':' + p(dateObj.getMinutes()) + ':' + p(dateObj.getSeconds());
	return UnixTimeToDate;
}
function p(s) {
	return s < 10 ? '0' + s : s;
}

function LoadBootstrapValidatorScript(callback) {
	if (!$.fn.bootstrapValidator) {
		$.getScript('resources/plugins/bootstrapvalidator/bootstrapValidator.min.js', callback);
	} else {
		if (callback && typeof (callback) === "function") {
			callback();
		}
	}
}

function LoadDataTablesScripts(callback) {
	function LoadDatatables() {
		$.getScript('resources/plugins/datatables/jquery.dataTables.min.js', function() {
			$.getScript('resources/plugins/datatables/ZeroClipboard.min.js', function() {
				$.getScript('resources/plugins/datatables/dataTables.tableTools.min.js', function() {
					$.getScript('resources/plugins/datatables/dataTables.bootstrap.min.js', callback);
				});
			});
		});
	}
	if (!$.fn.dataTables) {
		LoadDatatables();
	} else {
		if (callback && typeof (callback) === "function") {
			callback();
		}
	}
}

function LoadSpringyScripts(callback) {
	function LoadSpringyScript() {
		$.getScript('resources/plugins/springy/springy.js', LoadSpringyUIScript);
	}
	function LoadSpringyUIScript() {
		$.getScript('resources/plugins/springy/springyui.js', callback);
	}
	if (!$.fn.Springy) {
		LoadSpringyScript();
	} else {
		if (callback && typeof (callback) === "function") {
			callback();
		}
	}
}

function logout() {
	$.TeachDialog({
		title : 'Warnning!',
		content : 'Are you sure submit to Log Out?',
		showCloseButton : true,
		bootstrapModalOption : {},
		otherButtons : [ 'Yes' ],
		clickButton : function(sender, modal, index) {
			if (index == 0) {
				$.ajax({
					url : "User/AuthLogout",
					type : 'post',
					async : false,
					success : function() {
						window.top.location.href = '/';
					}
				})
			}
		}
	});
}
function sessionout() {
	$.TeachDialog({
		content : 'Your Login Session is out of date,please login  again!',
		dialogHidden : function() {
			window.top.location.href = '/';
		},
	});
}

function MessagesMenuWidth() {
	var W = window.innerWidth;
	var W_menu = $('#sidebar-left').outerWidth();
	var w_messages = (W - W_menu) * 16.666666666666664 / 100;
	$('#messages-menu').width(w_messages);
}

function LoadFancyboxScript(callback) {
	if (!$.fn.fancybox) {
		$.getScript('resources/plugins/fancybox/jquery.fancybox.js', callback);
	} else {
		if (callback && typeof (callback) === "function") {
			callback();
		}
	}
}

function LoadAjaxContent(url) {
	$('.preloader').show();
	$.ajax({
		mimeType : 'text/html; charset=utf-8', // ! Need set mimeType only when
		// run from local file
		url : url,
		type : 'GET',
		success : function(data) {
			$('.preloader').hide();
			$('#ajax-content').html(data);
			if (parseInt($('#animation').attr('data-open')) == 1) {
				$('#ajax-content').addClass('am-animation-slide-right');
				setTimeout('removeAnmaClass()', 1000);
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
		},
		complete : function(xhr, textStatus) {
			if (xhr.status == 3389) {
				sessionout();
				return;
			}
		},
		dataType : "html",
		async : false
	});
}

function WinMove() {
	$("div.box").not('.no-drop').draggable({
		revert : true,
		zIndex : 2000,
		cursor : "crosshair",
		handle : '.box-name',
		opacity : 0.8
	}).droppable({
		tolerance : 'pointer',
		drop : function(event, ui) {
			var draggable = ui.draggable;
			var droppable = $(this);
			var dragPos = draggable.position();
			var dropPos = droppable.position();
			draggable.swap(droppable);
			setTimeout(function() {
				var dropmap = droppable.find('[id^=map-]');
				var dragmap = draggable.find('[id^=map-]');
				if (dragmap.length > 0 || dropmap.length > 0) {
					dragmap.resize();
					dropmap.resize();
				} else {
					draggable.resize();
					droppable.resize();
				}
			}, 50);
			setTimeout(function() {
				draggable.find('[id^=map-]').resize();
				droppable.find('[id^=map-]').resize();
			}, 250);
		}
	});
}

jQuery.fn.swap = function(b) {
	b = jQuery(b)[0];
	var a = this[0];
	var t = a.parentNode.insertBefore(document.createTextNode(''), a);
	b.parentNode.insertBefore(a, b);
	t.parentNode.insertBefore(b, t);
	t.parentNode.removeChild(t);
	return this;
};

function SetMinBlockHeight(elem) {
	elem.css('min-height', window.innerHeight - 49)
}

function DashboardTabChecker() {
	$('#content').on('click', 'a.tab-link', function(e) {
		e.preventDefault();
		$('div#dashboard_tabs').find('div[id^=dashboard]').each(function() {
			$(this).css('visibility', 'hidden').css('position', 'absolute');
		});
		var attr = $(this).attr('id');
		$('#' + 'dashboard-' + attr).css('visibility', 'visible').css('position', 'relative');
		$(this).closest('.nav').find('li').removeClass('active');
		$(this).closest('li').addClass('active');
	});
}

function OpenModalBox(header, inner, bottom) {
	var modalbox = $('#modalbox');
	modalbox.find('.modal-header-name span').html(header);
	modalbox.find('.devoops-modal-inner').html(inner);
	modalbox.find('.devoops-modal-bottom').html(bottom);
	modalbox.fadeIn('fast');
	$('body').addClass("body-expanded");
}

function CloseModalBox() {
	var modalbox = $('#modalbox');
	modalbox.fadeOut('fast', function() {
		modalbox.find('.modal-header-name span').children().remove();
		modalbox.find('.devoops-modal-inner').children().remove();
		modalbox.find('.devoops-modal-bottom').children().remove();
		$('body').removeClass("body-expanded");
	});
}

(function($) {
	$.fn.beautyTables = function() {
		var table = this;
		var string_fill = false;
		this.on('keydown', function(event) {
			var target = event.target;
			var tr = $(target).closest("tr");
			var col = $(target).closest("td");
			if (target.tagName.toUpperCase() == 'INPUT') {
				if (event.shiftKey === true) {
					switch (event.keyCode) {
					case 37: // left arrow
						col.prev().children("input[type=text]").focus();
						break;
					case 39: // right arrow
						col.next().children("input[type=text]").focus();
						break;
					case 40: // down arrow
						if (string_fill == false) {
							tr.next().find('td:eq(' + col.index() + ') input[type=text]').focus();
						}
						break;
					case 38: // up arrow
						if (string_fill == false) {
							tr.prev().find('td:eq(' + col.index() + ') input[type=text]').focus();
						}
						break;
					}
				}
				if (event.ctrlKey === true) {
					switch (event.keyCode) {
					case 37: // left arrow
						tr.find('td:eq(1)').find("input[type=text]").focus();
						break;
					case 39: // right arrow
						tr.find('td:last-child').find("input[type=text]").focus();
						break;
					case 40: // down arrow
						if (string_fill == false) {
							table.find('tr:last-child td:eq(' + col.index() + ') input[type=text]').focus();
						}
						break;
					case 38: // up arrow
						if (string_fill == false) {
							table.find('tr:eq(1) td:eq(' + col.index() + ') input[type=text]').focus();
						}
						break;
					}
				}
				if (event.keyCode == 13 || event.keyCode == 9) {
					event.preventDefault();
					col.next().find("input[type=text]").focus();
				}
				if (string_fill == false) {
					if (event.keyCode == 34) {
						event.preventDefault();
						table.find('tr:last-child td:last-child').find("input[type=text]").focus();
					}
					if (event.keyCode == 33) {
						event.preventDefault();
						table.find('tr:eq(1) td:eq(1)').find("input[type=text]").focus();
					}
				}
			}
		});
		table.find("input[type=text]").each(function() {
			$(this).on('blur', function(event) {
				var target = event.target;
				var col = $(target).parents("td");
				if (table.find("input[name=string-fill]").prop("checked") == true) {
					col.nextAll().find("input[type=text]").each(function() {
						$(this).val($(target).val());
					});
				}
			});
		})
	};
})(jQuery);
//
// Beauty Hover Plugin (backlight row and col when cell in mouseover)
//
//
(function($) {
	$.fn.beautyHover = function() {
		var table = this;
		table.on('mouseover', 'td', function() {
			var idx = $(this).index();
			var rows = $(this).closest('table').find('tr');
			rows.each(function() {
				$(this).find('td:eq(' + idx + ')').addClass('beauty-hover');
			});
		}).on('mouseleave', 'td', function(e) {
			var idx = $(this).index();
			var rows = $(this).closest('table').find('tr');
			rows.each(function() {
				$(this).find('td:eq(' + idx + ')').removeClass('beauty-hover');
			});
		});
	};
})(jQuery);

//
// Function for create test sliders on Progressbar page
//
function CreateAllSliders() {
	$(".slider-default").slider();
	var slider_range_min_amount = $(".slider-range-min-amount");
	var slider_range_min = $(".slider-range-min");
	var slider_range_max = $(".slider-range-max");
	var slider_range_max_amount = $(".slider-range-max-amount");
	var slider_range = $(".slider-range");
	var slider_range_amount = $(".slider-range-amount");
	slider_range_min.slider({
		range : "min",
		value : 37,
		min : 1,
		max : 700,
		slide : function(event, ui) {
			slider_range_min_amount.val("$" + ui.value);
		}
	});
	slider_range_min_amount.val("$" + slider_range_min.slider("value"));
	slider_range_max.slider({
		range : "max",
		min : 1,
		max : 100,
		value : 2,
		slide : function(event, ui) {
			slider_range_max_amount.val(ui.value);
		}
	});
	slider_range_max_amount.val(slider_range_max.slider("value"));
	slider_range.slider({
		range : true,
		min : 0,
		max : 500,
		values : [ 75, 300 ],
		slide : function(event, ui) {
			slider_range_amount.val("$" + ui.values[0] + " - $" + ui.values[1]);
		}
	});
	slider_range_amount.val("$" + slider_range.slider("values", 0) + " - $" + slider_range.slider("values", 1));
	$("#equalizer > div.progress > div").each(function() {
		// read initial values from markup and remove that
		var value = parseInt($(this).text(), 10);
		$(this).empty().slider({
			value : value,
			range : "min",
			animate : true,
			orientation : "vertical"
		});
	});
}
function ScreenSaver() {
	var canvas = document.getElementById("canvas");
	var ctx = canvas.getContext("2d");
	// Size of canvas set to fullscreen of browser
	var W = window.innerWidth;
	var H = window.innerHeight;
	canvas.width = W;
	canvas.height = H;
	// Create array of particles for screensaver
	var particles = [];
	for (var i = 0; i < 25; i++) {
		particles.push(new Particle());
	}
	function Particle() {
		// location on the canvas
		this.location = {
			x : Math.random() * W,
			y : Math.random() * H
		};
		// radius - lets make this 0
		this.radius = 0;
		// speed
		this.speed = 3;
		// random angle in degrees range = 0 to 360
		this.angle = Math.random() * 360;
		// colors
		var r = Math.round(Math.random() * 255);
		var g = Math.round(Math.random() * 255);
		var b = Math.round(Math.random() * 255);
		var a = Math.random();
		this.rgba = "rgba(" + r + ", " + g + ", " + b + ", " + a + ")";
	}
	// Draw the particles
	function draw() {
		// re-paint the BG
		// Lets fill the canvas black
		// reduce opacity of bg fill.
		// blending time
		ctx.globalCompositeOperation = "source-over";
		ctx.fillStyle = "rgba(0, 0, 0, 0.02)";
		ctx.fillRect(0, 0, W, H);
		ctx.globalCompositeOperation = "lighter";
		for (var i = 0; i < particles.length; i++) {
			var p = particles[i];
			ctx.fillStyle = "white";
			ctx.fillRect(p.location.x, p.location.y, p.radius, p.radius);
			// Lets move the particles
			// So we basically created a set of particles moving in random
			// direction
			// at the same speed
			// Time to add ribbon effect
			for (var n = 0; n < particles.length; n++) {
				var p2 = particles[n];
				// calculating distance of particle with all other particles
				var yd = p2.location.y - p.location.y;
				var xd = p2.location.x - p.location.x;
				var distance = Math.sqrt(xd * xd + yd * yd);
				// draw a line between both particles if they are in 200px range
				if (distance < 200) {
					ctx.beginPath();
					ctx.lineWidth = 1;
					ctx.moveTo(p.location.x, p.location.y);
					ctx.lineTo(p2.location.x, p2.location.y);
					ctx.strokeStyle = p.rgba;
					ctx.stroke();
					// The ribbons appear now.
				}
			}
			// We are using simple vectors here
			// New x = old x + speed * cos(angle)
			p.location.x = p.location.x + p.speed * Math.cos(p.angle * Math.PI / 180);
			// New y = old y + speed * sin(angle)
			p.location.y = p.location.y + p.speed * Math.sin(p.angle * Math.PI / 180);
			// You can read about vectors here:
			// http://physics.about.com/od/mathematics/a/VectorMath.htm
			if (p.location.x < 0)
				p.location.x = W;
			if (p.location.x > W)
				p.location.x = 0;
			if (p.location.y < 0)
				p.location.y = H;
			if (p.location.y > H)
				p.location.y = 0;
		}
	}
	setInterval(draw, 30);
}
function removeAnmaClass() {
	if ($('#ajax-content').hasClass('am-animation-slide-right')) {
		$('#ajax-content').removeClass('am-animation-slide-right');
	}
}
// ////////////////////////////////////////////////////
// ////////////////////////////////////////////////////
//
// MAIN DOCUMENT READY SCRIPT OF DEVOOPS THEME
//
// In this script main logic of theme
//
// ////////////////////////////////////////////////////
// ////////////////////////////////////////////////////
$(function() {
	if (parseInt($('#animation').attr('data-open')) == 1) {
		setTimeout(function() {
			removeAnmaClass();
			$('#sidebar-left').removeClass('am-animation-slide-left');
			$('#headernavbar').removeClass('am-animation-slide-top');
		}, 1000);
	}
	$('body').on('click', '.show-sidebar', function(e) {
		e.preventDefault();
		$('div#main').toggleClass('sidebar-show');
		setTimeout(MessagesMenuWidth, 250);
	});
	var ajax_url = location.hash.replace(/^#/, '');
	if (ajax_url.length < 1) {
		ajax_url = 'ajax/dashboard.html';
	}
	LoadAjaxContent(ajax_url);
	var item = $('.main-menu li a[href$="' + ajax_url + '"]');
	item.addClass('active-parent active');
	$('.dropdown:has(li:has(a.active)) > a').addClass('active-parent active');
	$('.dropdown:has(li:has(a.active)) > ul').css("display", "block");
	$('.main-menu').on('click', 'a', function(e) {
		var parents = $(this).parents('li');
		var li = $(this).closest('li.dropdown');
		var another_items = $('.main-menu li').not(parents);
		another_items.find('a').removeClass('active');
		another_items.find('a').removeClass('active-parent');
		if ($(this).hasClass('dropdown-toggle') || $(this).closest('li').find('ul').length == 0) {
			$(this).addClass('active-parent');
			var current = $(this).next();
			if (current.is(':visible')) {
				li.find("ul.dropdown-menu").slideUp('fast');
				li.find("ul.dropdown-menu a").removeClass('active')
			} else {
				another_items.find("ul.dropdown-menu").slideUp('fast');
				current.slideDown('fast');
			}
		} else {
			if (li.find('a.dropdown-toggle').hasClass('active-parent')) {
				var pre = $(this).closest('ul.dropdown-menu');
				pre.find("li.dropdown").not($(this).closest('li')).find('ul.dropdown-menu').slideUp('fast');
			}
		}
		if ($(this).hasClass('active') == false) {
			$(this).parents("ul.dropdown-menu").find('a').removeClass('active');
			$(this).addClass('active')
		}
		if ($(this).hasClass('ajax-link')) {
			e.preventDefault();
			if ($(this).hasClass('add-full')) {
				$('#content').addClass('full-content');
			} else {
				$('#content').removeClass('full-content');
			}
			var url = $(this).attr('href');
			window.location.hash = url;
			LoadAjaxContent(url);
		}
		if ($(this).attr('href') == '#') {
			e.preventDefault();
		}
	});
	var height = $(window).height() - 50;
	$('#main').css('min-height', height).on('click', '.expand-link', function(e) {
		var body = $('body');
		e.preventDefault();
		var box = $(this).closest('div.box');
		var button = $(this).find('i');
		button.toggleClass('fa-expand').toggleClass('fa-compress');
		box.toggleClass('expanded');
		body.toggleClass('body-expanded');
		var timeout = 0;
		if (body.hasClass('body-expanded')) {
			timeout = 100;
		}
		setTimeout(function() {
			box.toggleClass('expanded-padding');
		}, timeout);
		setTimeout(function() {
			box.resize();
			box.find('[id^=map-]').resize();
		}, timeout + 50);
	}).on('click', '.collapse-link', function(e) {
		e.preventDefault();
		var box = $(this).closest('div.box');
		var button = $(this).find('i');
		var content = box.find('div.box-content');
		content.slideToggle('fast');
		button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
		setTimeout(function() {
			box.resize();
			box.find('[id^=map-]').resize();
		}, 50);
	}).on('click', '.close-link', function(e) {
		e.preventDefault();
		var content = $(this).closest('div.box');
		content.remove();
	});
	$('body').on('click', 'a.close-link', function(e) {
		e.preventDefault();
		CloseModalBox();
	});
	// lock screen
	$('#locked-screen').on('click', function(e) {
		e.preventDefault();
		$('body').addClass('body-screensaver');
		$('#screensaver').addClass("show");
		ScreenSaver();
	});

	// unlock screen
	$('#screen_unlock').on(
			'mouseover',
			function() {
				var header = 'Enter current username and password';
				var form = $('<div class="form-group"><label class="control-label">Username</label><input type="text" class="form-control" name="username" /></div>'
						+ '<div class="form-group"><label class="control-label">Password</label><input type="password" class="form-control" name="password" /></div>');
				var button = $('<div class="text-center"><a href="index.html" class="btn btn-primary">Unlock</a></div>');
				OpenModalBox(header, form, button);
			});
	$('#search').on('keydown', function(e) {
		if (e.keyCode == 13) {
			e.preventDefault();
			$('#content').removeClass('full-content');
			ajax_url = 'ajax/page_search.html';
			window.location.hash = ajax_url;
			LoadAjaxContent(ajax_url);
		}
	});

	$('#content').css('height', $(window).height() - $('#headernavbar').height() + 'px');
	NProgress.configure({
		parent : '#headernavbar',
		ease : 'ease',
		speed : 800
	})
	$(document).ajaxStart(function() {
		NProgress.start();
	});
	$(document).ajaxStop(function() {
		NProgress.done();
	});
	// for session out of date
	$.ajaxSetup({
		complete : function(xhr, textStatus) {
			switch (xhr.status) {
			case 3389: {
				sessionout();
				break;
			}
			case 500: {
				$.TeachDialog({
					title : 'Sorry!',
					content : 'Service is Down!Please Contact us!',
					showCloseButton : true,
				});
				break;
			}
			case 3388: {
				$.TeachDialog({
					title : 'Warnning!',
					content : 'You don\'t have power to operate it!',
					showCloseButton : true,
				});
				break;
			}
			case 3387: {
				$.TeachDialog({
					title : 'Warnning!',
					content : 'Unknown Error!',
					showCloseButton : true,
				});
				break;
			}
			case 3386: {
				$.TeachDialog({
					title : 'Warnning!',
					content : 'Parameters Error!',
					showCloseButton : true,
				});
				break;
			}
			case 3385: {
				$.TeachDialog({
					title : 'Warnning!',
					content : 'Information validation error!',
					showCloseButton : true,
				});
				break;
			}
			case 3384: {
				$.TeachDialog({
					title : 'Warnning!',
					content : 'the type is in use!',
					showCloseButton : true,
				});
				break;
			}
			case 3383: {
				$.TeachDialog({
					title : 'Warnning!',
					content : 'Save Logs ERROR!',
					showCloseButton : true,
				});
				break;
			}
			}
		}
	});

});
