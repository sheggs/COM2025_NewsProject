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
	count = ($(".slide").length - 1);
	$(".slide").each(function(i){
		if(i != count){
			$(this).attr("style","display:none;")
		}
	})

	// For the Login

	$(".registerForm").validate({
		rules: {
			"user[email]": {
                required: true,
                email: true
            },
			"user[password]": {
                required: true,
            },
			user[password_confirmation]: {
                required: true,
            },
		},
		messages: {
			"user[email]": "Email Required",
			user[password]: "Password Required",
			user[password_confirmation]: "Confirm Password"
		},
		submitHandler: function(form) {
      	form.submit();
    	}
	})


})

// function previous_carousel(){

// 	if(((count - 1) < 0)){
// 		count = ($(".slide").length);
// 		$(".slide").each(function(i){
// 			if(i == (count - 1)){
// 				$(this).attr("style","display:block;")
// 			}else{
// 				$(this).attr("style","display:none;")

// 			}
// 		})
// 		count = count - 1;

// 	}else{
// 		$(".slide").each(function(i){
// 			if(i == (count-1)){
// 				$(this).attr("style","display:block;")
// 			}else{
// 				$(this).attr("style","display:none;")

// 			}

// 		})
// 		count = count - 1;
// 	}
// 		console.log("COUNTER " + count)

// }
// function next_carousel(){
// 	console.log(($(".slide").length - 1))
// 	if(count > ($(".slide").length -1)){
// 		count = 0
// 		$(".slide").each(function(i){
// 			if(i == (count)){
// 				$(this).attr("style","display:block;")
// 			}else{
// 				$(this).attr("style","display:none;")

// 			}
// 		})
// 	}else{
// 		$(".slide").each(function(i){
// 		count = count + 1

// 		if(i == (count)){
// 			$(this).attr("style","display:block;")
// 		}else{
// 			$(this).attr("style","display:none;")

// 		}
// 		})

// 	}
// 	console.log("COUNTER " + count)

// }
// function next_carousel(){
// 	console.log(($(".slide").length - 1))
// 	if(count > ($(".slide").length -2)){
// 		count = 0
// 		if(i == (count)){
// 			$(this).attr("style","display:block;")
// 		}else{
// 			$(this).attr("style","display:none;")

// 		}
// 	}else{
// 		count = count + 1
// 		$(".slide").each(function(i){
// 			console.log("I : " + i)
// 			if(i == (count)){
// 				$(this).attr("style","display:block;")
// 			}else{
// 				$(this).attr("style","display:none;")
// 			}
// 		})

// 	}
// 	console.log("COUNTER " + count)

// }
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


