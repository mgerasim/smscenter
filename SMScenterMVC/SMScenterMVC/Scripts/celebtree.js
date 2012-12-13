$(document).ready(function() {
  $('.celebTree ul')
    .show()
    .prev('span')
    .before('<span></span>')
    .prev()
    .addClass('handle opened')
    .click(function(){
      // plus/minus handle click
      $(this)
        .toggleClass('closed opened')
        .nextAll('ul')
        .toggle();
    });
});
