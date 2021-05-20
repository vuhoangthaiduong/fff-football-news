$(document).ready(function() {

  // Listen for the league changing
  $('#league').change(function(){

    // Grab the id of currenly selected league
    var league_id = $(this).val();
    console.log(league_id);

    // Query the seasons for this league:
    // $.get( "/admin/seasons/get_seasons_by_league/seasons.json", { league_id: league_id }, function( data ) {

    //   // Remove the existing options in the seasons drop down:
    //   $("#match_season_id").html("");

    //   // Loop over the json and populate the Responses options:
    //   $.each( data, function( index, value ) {
    //     $("#match_season_id").append( "<option value='" + value.id + "'>" + value.name + "</option>" );
    //   });

    // });

    $.ajax({
	    url: "/admin/seasons/get_seasons_by_league/seasons.json",
	    method: "GET",  
	    dataType: "json",
      data: {'league_id' : league_id},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var seasons = response["seasons"];
	      	$("#match_season_id").empty();
          
	      	for(var i = 0; i < response.length; i++){
	      		$("#match_season_id").append('<option value="' + response[i]["id"] + '">' + response[i]["start_at"] + ' - ' + response[i]["end_at"] + '</option>');
	      	}
	    }
  	});
  });

});
