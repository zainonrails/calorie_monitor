document.addEventListener("turbolinks:load", () => {
  $('#search-field').on('keyup', $.debounce( 200, false, function(e){
    if($(this).val().length >= 3) {
      Rails.fire($('#main-search-form')[0], 'submit');
    }
  }));
})