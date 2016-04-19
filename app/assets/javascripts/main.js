var onReady = function(){
	setTimeout( "jQuery('.alert, .notice').hide();", 5000 );
}
jQuery(document).ready(onReady);
jQuery(document).on('page:load', onReady);