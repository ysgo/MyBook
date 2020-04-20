<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jQuery CDN -->
<script src="/js/ext/handlebars-v4.1.1.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Popper.JS -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
	crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- Font Awesome JS -->
<script defer	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<!-- <script src="http://code.jquery.com/jquery-2.1.3.min.js"></script> -->
<!-- jQuery Custom Scroller CDN -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// hide sidebar when refresh the page
	$('#sidebar').toggleClass('active');

	$("#sidebar").mCustomScrollbar({
		theme : "minimal"
	});

	$('#sidebarCollapse').on('click', function() {
		// open sidebar when clicked
		$('#sidebar, #content').toggleClass('active');
		$('.collapse.in').toggleClass('in');
		$('a[aria-expanded=true]').attr('aria-expanded', 'false');
	});

});

function slide() {
	var i, index=0;
	var x = document.getElementsByClassName("slide");
	for(i = 0 ; i < x.length ; i++) {
		x[i].style.display = "none"; 
	}
	index++;
	if(index > x.length) {
		index = 1;
	}
	x[index-1].style.display= "block";
	setTimeout(slide, 2000);
}
</script>