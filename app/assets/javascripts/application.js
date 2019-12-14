// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function() {

})


function hide(index){
	let x = 0;
	// Getting all the description cards.
	$(".card-description").each(function(i){
		// Getting the specified selected card
		if(i == index){
			// If the description is not hidden hide the text.
			if($(this).attr("hide_value") == "true"){
				$(this).text("");
				$(this).attr("hide_value","false");
				// Getting all the buttons
				$("button").each(function(i){
					// Getting the button associated with the card
					if(i == index){
						// Setting the text of the button
						$(this).text("Show description")
					}
				})
			}
			// If the description is hidden reset it.
			else{
				$(this).text($(this).attr("text"));
				$(this).attr("hide_value","true");
				// Getting all the buttons
				$("button").each(function(i){
					// Getting the button associated with the card
					if(i == index){
						// Setting the text of the button
						$(this).text("Hide description")
					}
				})
			}
		}
	
	})
}