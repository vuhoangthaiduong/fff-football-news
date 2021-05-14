function replaceWithDestroyModal(target) {
  $modalTitle.text("Confirmation");
  $modalBody.text(`Are you sure you want to delete this ${target} permanently?\nThis action cannot be undone.`);
  $modalFooter.html("<button class='btn btn-secondary' type='button' data-dismiss='modal'>Cancel</button>");
  $modalFooter.append(`<a class='btn btn-primary' type='button' data-method="delete" href='${href}'>Delete</a>`);
  $modal.modal();
}

$(document).ready(() => {
  $modal = $('#modal'),
  $modalBody = $('#modalBody'),
  $modalTitle = $('#modalTitle');
  $modalFooter = $('#modalFooter');

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

  $(document).on("click", ".js-season-destroy", function(e) {
    href = $($modal.data("link")).data('href');
    replaceWithDestroyModal("season");
  });
})
