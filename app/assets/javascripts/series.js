$(document).on('turbolinks:load', function() {
  $("#datepicker").datepicker({
    minDate: new Date(),
    firstDay: 1,
    format: "yyyy/mm/dd",
    todayHighlight: true,
    autoclose: true,
    language: 'es',
    orientation: "bottom right"
      
  });
});
