//
//    Main script of DevOOPS v1.0 Bootstrap Theme
//
"use strict";

function LoadOpenLayersScript(callback) {
	if (!$.fn.OpenLayers) {
		$.getScript('http://www.openlayers.org/api/OpenLayers.js', callback);
	} else {
		if (callback && typeof (callback) === "function") {
			callback();
		}
	}
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
		title : 'Sorry about the Meaasge!',
		content : 'Your Login Session is out of date,please login  again!',
		dialogHidden : function() {
			window.top.location.href = '/';
		},
	});
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
			$('#ajax-content').html(data);
			$('.preloader').hide();
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
	var height = window.innerHeight - 49;
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
	$('#top-panel').on('click', 'a', function(e) {
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
	$('.about').on('click', function() {
		$('#about').toggleClass('about-h');
	})
	$('#about').on('mouseleave', function() {
		$('#about').removeClass('about-h');
	})
	// for session out of date
	$.ajaxSetup({
		complete : function(xhr, textStatus) {
			if (xhr.status == 3389) {
				sessionout();
				return;
			}
		}
	});
});
