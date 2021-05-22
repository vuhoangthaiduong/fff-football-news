$(document).ready(function() {
  var $modal = $('#modal');

  const targetNode = document.getElementById('modal');

  // Options for the observer (which mutations to observe)
  const config = { attributes: true, childList: true, subtree: true };

  // Callback function to execute when mutations are observed
  const callback = function(mutationsList, observer) {
      // Use traditional 'for loops' for IE 11
      for(const mutation of mutationsList) {
        if($modal.css("display") == "none") {
          console.log("it runs");
          $eventType = $('#match_event_event_type');
          $subjectTeam = $('#match_event_subject_team_id');
          $objectTeam = $('#match_event_object_team_id');
          $subjectPlayer = $('#match_event_subject_player_id');
          $objectPlayer = $('#match_event_object_player_id');

          $('label[for="match_event_object_player"]').hide();
          $objectPlayer.hide();

          // Listen for the type changing
          $eventType.change(function(){
            // Grab the id of currenly selected type
            var event_type_id = $(this).val();

            switch (event_type_id) {
              case "1":
              case "2":
                $('label[for="match_event_object_player"]').hide();
                $('label[for="match_event_object_team"]').show();
                $objectPlayer.hide();
                $subjectTeam.show();
                $objectTeam.show();
                $subjectPlayer.show();
                break;
              case "3":
              case "4":
                $('label[for="match_event_object_player"]').show();
                $('label[for="match_event_object_team"]').show();
                $objectPlayer.show();
                $subjectTeam.show();
                $objectTeam.show();
                $subjectPlayer.show();
                break;
              case "5":
                $('label[for="match_event_object_team"]').hide();
                $('label[for="match_event_object_player"]').show();
                $objectTeam.hide();
                $objectPlayer.show();
                $subjectTeam.show();
                $subjectPlayer.show();
                break;
              default:
                console.log('default')
            }
          });
        }
      }
  };

  // Create an observer instance linked to the callback function
  const observer = new MutationObserver(callback);

  // Start observing the target node for configured mutations
  observer.observe(targetNode, config);

});
