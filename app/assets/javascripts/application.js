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

//= require jquery
//= require rails-ujs
//= require jquery-ui
//= require popper
//= require cocoon
//= require bootstrap-sprockets
//= require turbolinks
//= require owl.carousel
//= require ckeditor/init
//= require ckeditor/config

//= require gritter
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require bootstrap-datepicker/locales/bootstrap-datepicker.fr.js
//= require rails.validations
//= require activestorage
//= require_tree .


$(document).on('turbolinks:load', function() {

    var btn = $('#button-scroll');
    $(window).scroll(function() {
      if ($(window).scrollTop() > 300) {
        btn.addClass('show');
      } else {
        btn.removeClass('show');
      }
    });

    btn.on('click', function(e) {
      e.preventDefault();
      $('html, body').animate({scrollTop:0}, '300');
    });

    $('.owl-carousel').owlCarousel({
        loop:true,
        items:1,
        margin:10,
        autoplay: true,
        dots: true
    });

    /*$('#search').autocomplete({
      open: function(){
        setTimeout(function () {
            $('.ui-autocomplete').css('z-index', 99999999999999);
            $('.ui-autocomplete').css('background-color', 'white');
        }, 0);
      }
    });

    $("#search").val('');

    $('#search').autocomplete({
      source: $('#search').data('autocomplete-source')
    });*/

});




