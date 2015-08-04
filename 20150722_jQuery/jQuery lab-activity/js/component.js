/* ------------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Rococo Global Technologies, Inc - All Rights Reserved 2015
 * --------------------------------------------------------------------------- */

$(function() {
	//TODO add appropriate wrapper_even and wrapper_odd classes (see .css file) using jQuery code
	
	//TODO hide all p tags and show only the first
	
	//TODO study the jQuery codes below and add the necessary classes to the html markup. 
	//hint: You no longer need to create more css classes.
	$(document).ready(function() {
			$('div.wrapper:even').addClass('wrapper_even');
			$('div.wrapper:odd').addClass('wrapper_odd');
			$('p:first')
				.siblings()
				.not('input')
				.hide();
				
			$('.button_navigation').addClass('button_default');
			$('div.wrapper:even').find('input[type="button"]').addClass('button_even');
			$('div.wrapper:odd').find('input[type="button"]').addClass('button_odd');
			
			$('div.wrapper').find('.button_navigation').addClass('label_default');
			
			$('div.wrapper:even').find('.button_navigation').addClass('button_even');
			$('div.wrapper:odd').find('.button_navigation').addClass('button_odd');
			
			$('table').addClass('table_wrapper');
			$('table').find('tr:odd').addClass('table_odd');
			$('table').find('tr:even').addClass('table_even');
	})
	
	$('a.button_default').on('click', function() {
		doScroll($(this).attr('href'));
		return false;
	});
	
	$('input.button_default').on('click', function() {
		if ('Show' == $(this).val()) {
			for (var i = 0; i < $('p').length; i++) {
				if($('p').eq(i).is(':hidden')) {
					$('p').eq(i).slideDown();
					break;
				}
			}
		} else if ('Hide' == $(this).val()) {
			for (var i = $('p').length - 1; i >= 0; i--) {
				if($('p').eq(i).is(':visible')) {
					$('p').eq(i).slideUp();
					break;
				}
			}
		} else if ('Send' == $(this).val()) {
			for (var i = 0; i < $('.text_default').length; i++) {
				if ("" == $('.text_default').eq(i).val()) {
					$('.text_default').eq(i).addClass('text_error');
				} else {
					$('.text_default').eq(i).removeClass('text_error');
				}
			}
			
			for (var i = 0; i < $('.textarea_default').length; i++) {
				if ("" == $('.textarea_default').eq(i).val()) {
					$('.textarea_default').eq(i).addClass('text_error');
				} else {
					$('.textarea_default').eq(i).removeClass('text_error');
				}
			}
		} else if ('Cancel' == $(this).val()) {
			$('.text_default').val('').removeClass('text_error');
			$('.textarea_default').val('').removeClass('text_error');
		}
		
		if ($(this).hasClass('button_action')) {	
			$(this).closest('.wrapper').toggleClass('wrapper_action', 200).toggleClass('wrapper_action', 200);
		} else if( $(this).hasClass('button_danger')) {
			$(this).closest('.wrapper').toggleClass('wrapper_danger', 200).toggleClass('wrapper_danger', 200);
		}
		return false;
	});
	
	$('.table_wrapper').find('tr').on('hover', function() {
		$(this).toggleClass('wrapper_odd', 200);
	});
	
	$('.table_wrapper').find('tr').on('click', function() {
		$(this).toggleClass('wrapper_action', 200);
	});
});

function doScroll(id) {
	$('body').animate({scrollTop: $(id).offset().top}, 'slow');
}

