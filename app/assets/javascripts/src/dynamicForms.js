$(document).ready(function() {
	function resetForm(id) {
		$(id)[0].reset();
	}
});

$('form').ready(function() {
	jQuery(function($) {
		$(".phone-input").mask('(999) 999-9999');
	});

	jQuery(function($) {
		$('.draggable').draggable({ scroll: true,
      													cursor: 'crosshair' });
	});
	  

	// jQuery(function($) {
	// 	$('#event-modal').html("#{ j render 'modal' }");
	// 	$('#event-modal').modal('show');
	// 	debugger;
	// 	var config = {  url: '/events/new',
	// 						    	type: 'get',
	// 						    	dataType: 'html' };
	// 						    	debugger;
	//     $.ajax(config)
	//     .done(function(response) { $("#new-modal-landing").append(response) })
	//     .fail(function(response) { console.log("Error: Response - " + response) }); 
	// });

	jQuery(function($) {
		$('#event-modal').html("#{ j render 'modal' }");
		$('#hidden-delete').show();
		$('#event-modal').modal('show').is(':visible');
	});

	// jQuery(function dynamicSave() {
	//   $('#calendar').fullCalendar( 'refetchEvents' );
	//   $('#event-modal').modal('hide');
	// }

});

$('#form-for-reminders').ready(function() {
	jQuery(function($) {
  // when the #search field changes
  	console.log("Form Ready");
	  $("#selected-recipient-field").change(function() {
	    var config = {  url: '/reminders/refresh_form',
								    	type: 'post',
								    	dataType: 'json',
								    	data: { recipient_id: $("#selected-recipient-field").val() } }
	    $.ajax(config)
	    .done(function(response) { $("#recipient-phone-number-field").val(response),
	    													 $("#recipient-phone-number-field").mask('(999) 999-9999'); })
	    .fail(function(response) { console.log("Error: Response - " + response) }); 
	  });

	  $("#selected-property-field").change(function() {
	    var config = {  url: '/reminders/refresh_form',
								    	type: 'post',
								    	dataType: 'html',
								    	data: { property_id: $("#selected-property-field").val() } }
	    $.ajax(config)
	    .done(function(response) { $("#selected-recipient-field").html(response) })
	    .fail(function(response) { console.log("Error: Response - " + response) }); 
	  });
	})
});