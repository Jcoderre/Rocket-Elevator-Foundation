$("#hour_building_id").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#hour_customer_id").onclick(function(){
  	customer = $(this).val();
  	if(customer == ''){
  		$("#form_building_id").prop("disabled", true);
  	}else{
  		$("#form_building_id").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/emp_interventions",
	    method: "GET",  
	    dataType: "json",
	    data: {customer: customer},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var buildings = response["buildings"];
	      	$("#form_building_id").empty();

	      	$("#form_building_id").append('<option>Select Building</option>');
	      	for(var i = 0; i < buildings.length; i++){
	      		$("#form_building_id").append('<option value="' + buildings[i]["id"] + '">' +buildings[i]["name"] + '</option>');
	      	}
	    }
  	});
});