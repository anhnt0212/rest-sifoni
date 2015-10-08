var Website = {
	run: function(){
		$('#btnSearch').click(function(){
			if($('#txtSearch').hasClass('active')) $('#txtSearch').removeClass('active'); else $('#txtSearch').addClass('active');
		});
		$(window).mouseup(function(e){
			var subject = $("#btnSearch");
			if(e.target.id != 'btnSearch' && e.target.id != 'txtSearch' && !subject.has(e.target).length) { $("#txtSearch").removeClass('active'); }
		});
		$(document).keydown(function(e){ if(e.keyCode==27){ $("#txtSearch").removeClass('active'); } });
		if($(window).width() > 992){
			$(window).scroll(function () {
				if ($(this).scrollTop() > ($('#header').height())){ $('.navmenu').addClass('scroll');$('body').css('padding-top',$('.navmenu').height()) }else{ $('.navmenu').removeClass('scroll');$('body').removeAttr('style') }
			});
		}
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) $('#goTop').fadeIn();
			else $('#goTop').fadeOut();
		});
		$('#goTop').click(function () {
			$('body,html').animate({ scrollTop: 0 }, 'slow');
		});
		$('.fanpagef .fb-like-box').attr('data-width',$('.fanpagef').width()-1);
		//
	}
};

//Initialize
$(document).ready(function(){
	Website.run();
});