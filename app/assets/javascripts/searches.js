$(document).ready(function () {
  $('#search-field').on('keyup', $.debounce( 250, false, function(e){
    if($(this).val().length >= 3) {
      Rails.fire($('#main-search-form')[0], 'submit');
    }
  }));
})