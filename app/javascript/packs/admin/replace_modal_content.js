function replaceWithDestroyUserModal() {
  $modalTitle.text("Confirmation");
  $modalBody.text("Are you sure you want to delete this user permanently?\nThis action cannot be undone.");
  $modalFooter.html("<button class='btn btn-secondary' type='button' data-dismiss='modal'>Cancel</button>");
  $modal.modal();
}

function replaceWithDestroyArticleModal() {
  $modalTitle.text("Confirmation");
  $modalBody.text("Are you sure you want to delete this article permanently?\nThis action cannot be undone.");
  $modalFooter.html("<button class='btn btn-secondary' type='button' data-dismiss='modal'>Cancel</button>");
  $modal.modal();
}

$(document).ready(() => {
  $modal = $('#modal'),
  $modalBody = $('#modalBody'),
  $modalTitle = $('#modalTitle');
  $modalFooter = $('#modalFooter');

  $('.js-user-destroy').on('click', () => {
    replaceWithDestroyUserModal();
  });
  $('.js-article-destroy').on('click', () => {
    replaceWithDestroyArticleModal();
  })
})
