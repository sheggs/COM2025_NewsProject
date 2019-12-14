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