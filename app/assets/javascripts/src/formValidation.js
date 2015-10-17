$('#editFormBox').ready(function() {
	
	function toggleCurrentPassword() {	
		var passwordValue = $("input#password").val();
		if (passwordValue === undefined || passwordValue === null) {
			$("div#current-password").hide();
		}
		else {
			$("div#current-password").show();
		}
	};

	
		$("#current-password").hide(); 

		$('#editFormBox').on('change', 'input#password', function() {
			toggleCurrentPassword();
		});
	
});
