// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery3
//= require jquery.turbolinks
//= require turbolinks
//= require datatables
//= require select2
//= require foods
//= require cocoon
//= require jquery-ui/widgets/autocomplete
//= require autocomplete-rails
//= require Chart.min
//= require_tree .


document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()

  $('input[type="file"]').change(function(e){
    let fileName = e.target.files[0].name;
    $('.custom-file-input').html(fileName)
    document.getElementById('file').files[0].name;
  });

  // this is to initialize the first meal form on daily intake page
  $('.select2-intake-meals').select2({
    placeholder: 'Select a Meal.',
    maximumSelectionLength: 3
  })

  // this is to initialize the first food form on daily intake page
  $('.select2-intake-foods').select2({
    placeholder: 'Select a Food.',
    maximumSelectionLength: 3,
  })

  //   ** cocoon:after-insert **
  //   This is a special event that is triggered everytime we
  //   render/display a form for meal or food selection dynamically
  //   on daily intake page.
  //
  //   We apply the `select2` plugin on our dropdowns to give it
  //   special features.

  // to render food selection form dynamically for meal creation
  $('.meal-foods').on('cocoon:after-insert', function() {
    $('.select2-meal-create').select2({
      placeholder: 'Select a Food.',
      maximumSelectionLength: 3,
    })
  })

  // to render meal selection form dynamically for daily intake
  $('.intake_meals').on('cocoon:after-insert', function() {
    $('.select2-intake-meals').select2({
      placeholder: 'Select a Meal.',
      maximumSelectionLength: 3,
    })
  })

  // to render food selection form dynamically for daily intake
  $('.intake_foods').on('cocoon:after-insert', function() {
    $('.select2-intake-foods').select2({
      placeholder: 'Select a Food.',
      maximumSelectionLength: 3,
    })
  })

  $('#foods-datatable').dataTable({
    "processing": true,
    "serverSide": true,
    "language": {
      "zeroRecords": "No available records",
    },
    "ajax": {
      "url": $('#foods-datatable').data('source')
    },
    "pagingType": "full_numbers",
    "columns": [
      {"data": "name"},
      {"data": "calories"},
      {"data": "water"},
      {"data": "proteins"},
      {"data": "fat"},
      {"data": "carbs"},
      {"data": "calcium"},
      {"data": "phosphorus"},
      {"data": "iron"},
      {"data": "sodium"},
      {"data": "potassium"},
      {"data": "quantity"},
    ]
  });
  new Chart(document.getElementById("chartjs-1"),
    {
      "type":"bar",
      "data":{
        "labels":
          ["January","February","March","April","May","June","July"],
        "datasets":[
          {
            "label":"My First Dataset",
            "data":[65,59,80,81,56,55,40],
            "fill":false,
            "backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],
            "borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],
            "borderWidth":1}]},
      "options":{
        "scales":{
          "yAxes":[
            {"ticks":{
                "beginAtZero":true
              }}]}}});
})

