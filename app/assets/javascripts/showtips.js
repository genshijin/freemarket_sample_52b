$(document).ready(function() {
  $('[data-js="show-tips-toggle"]').on("click", function() {
    $('[data-js="show-tips-content"]').toggleClass("is-show");
  });
});