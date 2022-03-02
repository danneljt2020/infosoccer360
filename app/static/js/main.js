"use strict";
/*------------------------------------------
		CUSTOM FUNCTION WRITE HERE
------------------------------------------*/
$(document).ready(function() {
	
	/* -------------------------------------
			COLLAPSE MENU SMALL DEVICES
	-------------------------------------- */
	function collapseMenu(){
		jQuery('#tg-navigationm-mobile .menu-item-has-children').prepend('<span class="tg-dropdowarrow"><i class="fa fa-angle-down"></i></span>');
		jQuery('#tg-navigationm-mobile .menu-item-has-children span').on('click', function() {
			jQuery(this).next().next().slideToggle(300);
			jQuery(this).parent('#tg-navigationm-mobile .menu-item-has-children').toggleClass('tg-open');
		});
	}
	collapseMenu();
	/*------------------------------------------
			SLIDER BACKGROUND MOVE
	------------------------------------------*/
	function sliderbgMove(){
		var moveForce = 25;
		var rotateForce = 15;
		$(document).mousemove(function(e) {
			var docX = $(document).width();
			var docY = $(document).height();
			var moveX = (e.pageX - docX/2) / (docX/2) * -moveForce;
			var moveY = (e.pageY - docY/2) / (docY/2) * -moveForce;
			var rotateY = (e.pageX / docX * rotateForce*2) - rotateForce;
			var rotateX = -((e.pageY / docY * rotateForce*2) - rotateForce);
			$('.tg-imglayer')
			.css('left', moveX+'px')
			.css('top', moveY+'px')
			.css('transform', 'rotateX('+rotateX+'deg) rotateY('+rotateY+'deg)');
		});
	}
	sliderbgMove();
	/*------------------------------------------
			HOME SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-home-slider', {
		nextButton: '.tg-btn-next',
		prevButton: '.tg-btn-prev',
		loop: true,
	});
	/*------------------------------------------
			NAV CLOSE
	------------------------------------------*/
	function closeToggle(){
		$('.tg-nav .navbar-toggle').on('click', function(){
			$('.tg-nav .tg-close').addClass('active');
		});
		$('.tg-nav .tg-close').on('click', function(){
			$('.tg-nav .tg-close').removeClass('active');
		});
	}
	closeToggle();
	/*------------------------------------------
			SEARCH AREA
	------------------------------------------*/
	function searchToggle(){
		$('#tg-btn-search').on('click', function(){
			$('.tg-searchbox').addClass('in');
		});
		$('#tg-close-search').on('click', function(){
			$('.tg-searchbox').removeClass('in');
		});
	}
	searchToggle();
	/*------------------------------------------
			MATCH COUNTER
	------------------------------------------*/
	function matchCounter(){
		var launch = new Date('2022', '05', '15', '16', '00');
		var days = $('.tg-days');
		var hours = $('.tg-hours');
		var minutes = $('.tg-minutes');
		var seconds = $('.tg-seconds');
		setDate();
		function setDate(){
			var now = new Date();
			if( launch < now ){
				days.html('<h3>0</h3><h4>Day</h4>');
				hours.html('<h3>0</h3><h4>Hour</h4>');
				minutes.html('<h3>0</h3><h4>Minute</h4>');
				seconds.html('<h3>0</h3><h4>Second</h4>');
			}
			else{
				var s = -now.getTimezoneOffset()*60 + (launch.getTime() - now.getTime())/1000;
				var d = Math.floor(s/86400);
				days.html('<h3>'+d+'</h3><h4>Day'+(d>1?'s':''),'</h4>');
				s -= d*86400;
				var h = Math.floor(s/3600);
				hours.html('<h3>'+h+'</h3><h4>Hour'+(h>1?'s':''),'</h4>');
				s -= h*3600;
				var m = Math.floor(s/60);
				minutes.html('<h3>'+m+'</h3><h4>Minute'+(m>1?'s':''),'</h4>');
				s = Math.floor(s-m*60);
				seconds.html('<h3>'+s+'</h3><h4>Second'+(s>1?'s':''),'</h4>');
				setTimeout(setDate, 1000);
			}
		}
	}
	matchCounter();
	/*------------------------------------------
			PRICE RANGE
	------------------------------------------*/
	$(function() {
		$("#tg-slider-range").slider({
			range: true,
			min: 0,
			max: 500,
			values: [ 75, 300 ],
			slide: function( event, ui ) {
				$( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
			}
		});
		$( "#amount" ).val( "$" + $( "#tg-slider-range" ).slider( "values", 0 ) + " - $" + $( "#tg-slider-range" ).slider( "values", 1 ));
	});
	/*------------------------------------------
			ALL MATCHS SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-match-slider', {
		direction: 'vertical',
		slidesPerView: 4,
		spaceBetween: 10,
		mousewheelControl: true,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		//autoplay: 2000,
	});
	/*------------------------------------------
			ALL MATCHS SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-slideshow-slider', {
		slidesPerView: 1,
		pagination: '.swiper-pagination',
		paginationType: 'fraction',
		mousewheelControl: true,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		autoplay: 2000,
	});
	/*------------------------------------------
			PLAYER DETAIL SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-playerslider', {
		slidesPerView: 1,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		//autoplay: 2000,
	});
	/* ---------------------------------------
			STATISTICS
	 -------------------------------------- */
	try {
		$('.tg-statistic').appear(function () {
			$('.tg-statistic-count').countTo();
		});
	} catch (err) {}
	/*------------------------------------------
			ALL MATCHS SLIDER
	------------------------------------------*/
	var mainswiper = new Swiper('#tg-upcomingmatch-slider', {
		direction: 'vertical',
		slidesPerView: 3,
		spaceBetween: 10,
		mousewheelControl: true,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		autoplay: 0,
	});
	/*------------------------------------------
			SPONSER SLIDER
	------------------------------------------*/
	var mainswiper = new Swiper('#tg-sponser-slider', {
		direction: 'vertical',
		slidesPerView: 3,
		spaceBetween: 10,
		mousewheelControl: true,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
	});
	/*------------------------------------------
			OTHER FIXTURES SLIDER
	------------------------------------------*/
	var mainswiper = new Swiper('#tg-otherfixtures-slider', {
		direction: 'vertical',
		slidesPerView: 5,
		spaceBetween: 10,
		mousewheelControl: true,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		breakpoints: {
			991: {
				slidesPerView: 3,
			}
		}
	});
	/*------------------------------------------
			ALL MATCHS SCROLLBAR
	------------------------------------------*/
	$("#tg-playerscrollbar, #tg-matchscrollbar").mCustomScrollbar({
		axis:"y",
	});
	/* ---------------------------------------
			PRETTY PHOTO GALLERY
	 -------------------------------------- */
	$("a[data-rel]").each(function () {
		$(this).attr("rel", $(this).data("rel"));
	});
	$("a[data-rel^='prettyPhoto']").prettyPhoto({
		animation_speed: 'normal',
		theme: 'dark_square',
		slideshow: 3000,
		autoplay_slideshow: false,
		social_tools: false
	});
	/*------------------------------------------
			POINTS TABLE SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-pointstable-slider', {
		direction: 'vertical',
		slidesPerView: 6,
		spaceBetween: 10,
		mousewheelControl: true,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		autoplay: 2500,
	});
	/*------------------------------------------
			TESTIMONIOAL SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-testimonial-slider', {
		slidesPerView: 1,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		autoplay: 0,
	});

	/*------------------------------------------
			CONTENT ANIMATION
	------------------------------------------*/
	var swiper = new Swiper('#tg-home-sliderfade', {
		autoplay: 3000,
		effect: 'fade',
		loop: true,
	});
	/*------------------------------------------
			HOME SLIDER VERTICAL
	------------------------------------------*/
	var swiper = new Swiper('#tg-home-slidertwo', {
		autoplay: 3000,
		loop: true,
		direction: 'vertical',
	});
	/*------------------------------------------
			RESULT DETAIL SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-matchdetailslider', {
		slidesPerView: 1,
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		autoplay: 0,
	});
	/*------------------------------------------
			SHOP BANNER SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-shopslider', {
		loop: true,
		slidesPerView: 1,
		pagination: '.swiper-pagination',
		paginationClickable: true,
	});
	/*------------------------------------------
			PRODUCT INCREASE
	------------------------------------------*/
	$('em.minus').on('click', function () {
		$('#quantity1').val(parseInt($('#quantity1').val(), 10) - 1);
	});
	$('em.plus').on('click', function () {
		$('#quantity1').val(parseInt($('#quantity1').val(), 10) + 1);
	});
	/*------------------------------------------
			RELATED PRODUCT SLIDER
	------------------------------------------*/
	var swiper = new Swiper('#tg-relatedproductslider', {
		slidesPerView: 3,
		spaceBetween: 30,
		mousewheelControl: true,
		paginationType: 'fraction',
		nextButton: '.tg-themebtnnext',
		prevButton: '.tg-themebtnprev',
		pagination: '.swiper-pagination',
		breakpoints: {
			479: {slidesPerView: 1,},
			640: {slidesPerView: 2,},
			767: {slidesPerView: 3,},
			991: {slidesPerView: 2,}
		}
	});
	/* ---------------------------------------
			PORTFOLIO FILTERABLE
	-------------------------------------- */
	var $container = $('.tg-soccermedia-content');
	var $optionSets = $('.option-set');
	var $optionLinks = $optionSets.find('a');
	function doIsotopeFilter() {
		if ($().isotope) {
			var isotopeFilter = '';
			$optionLinks.each(function () {
				var selector = $(this).attr('data-filter');
				var link = window.location.href;
				var firstIndex = link.indexOf('filter=');
				if (firstIndex > 0) {
					var id = link.substring(firstIndex + 7, link.length);
					if ('.' + id == selector) {
						isotopeFilter = '.' + id;
					}
				}
			});
			$container.isotope({
				filter: isotopeFilter
			});
			$optionLinks.each(function () {
				var $this = $(this);
				var selector = $this.attr('data-filter');
				if (selector == isotopeFilter) {
					if (!$this.hasClass('active')) {
						var $optionSet = $this.parents('.option-set');
						$optionSet.find('.active').removeClass('active');
						$this.addClass('active');
					}
				}
			});
			$optionLinks.on('click', function () {
				var $this = $(this);
				var selector = $this.attr('data-filter');
				$container.isotope({itemSelector: '.masonry-grid', filter: selector});
				if (!$this.hasClass('active')) {
					var $optionSet = $this.parents('.option-set');
					$optionSet.find('.active').removeClass('active');
					$this.addClass('active');
				}
				return false;
			});
		}
	}
	var isotopeTimer = window.setTimeout(function () {
		window.clearTimeout(isotopeTimer);
		doIsotopeFilter();
	}, 1000);
	/*------------------------------------------
			HOME TWO NAVIGATION
	------------------------------------------*/
	$('#tg-btnnav').on('click', function () {
		$('#tg-wrapper').toggleClass('tg-sidenavshow');
	});
	/*------------------------------------------
			HOME ONE MOBILE NAVIGATION
	------------------------------------------*/
	$('#tg-close').on('click', function () {
		$('#tg-navigationm-mobile').removeClass('in');
	});

	/*------------------------------------------
			MEDIA SCROLLBAR
	------------------------------------------*/
	$("#tg-soccermediascrollbar").mCustomScrollbar({
		axis:"x",
		advanced:{
			autoExpandHorizontalScroll:true
		}
	});
	/* ---------------------------------------
			MEDIA SCROLLBAR RESET
	-------------------------------------- */
	function resetScrollbar(){
		$('#tg-filterbale-nav li a').on('click', function () {
			$('#tg-soccermediascrollbar').html();
			$('#mCSB_1_container').animate({left: '0'});
		});
	}
	resetScrollbar();
});

(function($){$.sticky=$.fn.sticky=function(note,options,callback){if(typeof options==='function')callback=options;var hashCode=function(str){var hash=0,i=0,c='',len=str.length;if(len===0)return hash;for(i=0;i<len;i++){c=str.charCodeAt(i);hash=((hash<<5)-hash)+c;hash&=hash;}return's'+Math.abs(hash);},o={position:'top-right',speed:'fast',allowdupes:true,autoclose:5000,classList:''},uniqID=hashCode(note),display=true,duplicate=false,tmpl='<div class="sticky border-POS CLASSLIST" id="ID"><span class="sticky-close"></span><p class="sticky-note">NOTE</p></div>',positions=['top-right','top-center','top-left','bottom-right','bottom-center','bottom-left'];if(options)$.extend(o,options);$('.sticky').each(function(){if($(this).attr('id')===hashCode(note)){duplicate=true;if(!o.allowdupes)display=false;}if($(this).attr('id')===uniqID)uniqID=hashCode(note);});if(!$('.sticky-queue').length){$('body').append('<div class="sticky-queue '+o.position+'">');}else{$('.sticky-queue').removeClass(positions.join(' ')).addClass(o.position);}if(display){$('.sticky-queue').prepend(tmpl.replace('POS',o.position).replace('ID',uniqID).replace('NOTE',note).replace('CLASSLIST',o.classList)).find('#'+uniqID).slideDown(o.speed,function(){display=true;if(callback&&typeof callback==='function'){callback({'id':uniqID,'duplicate':duplicate,'displayed':display});}});}$('.sticky').ready(function(){if(o.autoclose){$('#'+uniqID).delay(o.autoclose).fadeOut(o.speed,function(){$(this).remove();});}});$('.sticky-close').on('click',function(){$('#'+$(this).parent().attr('id')).dequeue().fadeOut(o.speed,function(){$(this).remove();});});};})(jQuery);