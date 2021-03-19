$(document).ready(function () {
  $('.select2-intake-meals').select2({
    placeholder: 'Select a Meal.',
    maximumSelectionLength: 3,
    multiple: true
  })

  $('.select2-intake-foods').select2({
    placeholder: 'Select a Food.',
    maximumSelectionLength: 3,
  })

  $('.meal-foods').on('cocoon:after-insert', function() {
    console.log('before select2-meal-create')
    $('.select2-meal-create').select2({
      placeholder: 'Select a Food.',
      maximumSelectionLength: 3,
    })
  })

  $('.intake_foods').on('cocoon:after-insert', function() {
    console.log('before intake_foods')
    $('.select2-intake-foods').select2({
      placeholder: 'Select a Food.',
      maximumSelectionLength: 3,
    })
  })

  document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()

    $('.select2-intake-meals, .select2-intake-foods').select2({
      placeholder: 'Select a Meal.',
      maximumSelectionLength: 3,
    })
  })

})