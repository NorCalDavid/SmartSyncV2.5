// $('#form-for-reminders').on('load', function() {
// 	jQuery(function($) {
//   // when the #search field changes
//   	console.log("Form Ready");
// 	  $("#selected-recipient-field").change(function() {
// 	    var config = {  url: '/reminders/refresh_form',
// 								    	type: 'post',
// 								    	dataType: 'json',
// 								    	data: { recipient_id: $("#selected-recipient-field").val() } }
// 	    $.ajax(config)
// 	    .done(function(response) { $("#recipient-phone-number-field").val(response),
// 	    													 $("#recipient-phone-number-field").mask('(999) 999-9999'); })
// 	    .fail(function(response) { console.log("Error: Response - " + response) }); 
// 	  });

// 	  $("#selected-property-field").change(function() {
// 	    var config = {  url: '/reminders/refresh_form',
// 								    	type: 'post',
// 								    	dataType: 'html',
// 								    	data: { property_id: $("#selected-property-field").val() } }
// 	    $.ajax(config)
// 	    .done(function(response) { $("#selected-recipient-field").html(response) })
// 	    .fail(function(response) { console.log("Error: Response - " + response) }); 
// 	  });
// 	})
// });