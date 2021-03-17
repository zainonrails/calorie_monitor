$(document).ready(function () {
  $('.select2').select2({
    placeholder: 'Select a Food.',
    maximumSelectionLength: 3,
  })

  $('.meal-foods, .intake_foods').on('cocoon:after-insert', function() {
    console.log('cocoon before event')
    $('.select2').select2({
      placeholder: 'Select a Food.',
      maximumSelectionLength: 3,
    })
  })

  document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
  })

})