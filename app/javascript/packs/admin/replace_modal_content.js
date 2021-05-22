function replaceWithDestroyModal(target) {
  $modalTitle.text("Confirmation");
  $modalBody.text(`Are you sure you want to delete this ${target} permanently?\nThis action cannot be undone.`);
  $modalFooter.html("<button class='btn btn-secondary' type='button' data-dismiss='modal'>Cancel</button>");
  $modalFooter.append(`<a class='btn btn-primary' type='button' data-method="delete" href='${href}'>Delete</a>`);
  $modal.modal();
}

$(document).ready(() => {
  $modal = $('.modal'),
  $modalBody = $('.modal-body'),
  $modalTitle = $('.modal-title');
  $modalFooter = $('.modal-footer');

  $modal.on('show.bs.modal', function (e) {
    $modal.data("link", $(e.relatedTarget));
  });

  $(document).on("click", ".js-user-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("user");
  });

  $(document).on("click", ".js-article-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("article");
  });

  $(document).on("click", ".js-league-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("league");
  });

  $(document).on("click", ".js-season-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("season");
  });

  $(document).on("click", ".js-club-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("club");
  });

  $(document).on("click", ".js-match-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("match");
  });

  $(document).on("click", ".js-player-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("player");
  });

  $(document).on("click", ".js-transfer-history-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("transfer history");
  });

  $(document).on("click", ".js-match-event-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("match event");
  });

})
