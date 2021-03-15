$(document).ready(function () {
  // $('.select2').select2({
  //   placeholder: 'Select a Food.',
  //   maximumSelectionLength: 3,
  //   allowClear: true,
  //   multiple: true,
  //   width: 'resolve',
  //   theme: 'bootstrap'
  // })

  // $('.meal-foods').on('cocoon:before-insert', function() {
  //   console.log('cocoon before event')
  //   $('.select2').select2({
  //     placeholder: 'Select a Food.',
  //     maximumSelectionLength: 3,
  //     allowClear: true,
  //     multiple: true,
  //     width: 'resolve',
  //     theme: 'bootstrap'
  //   })
  // })

  document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
  })

})