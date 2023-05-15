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
// This is required
//= require jquery

//= require jquery_ujs
//= require_self
//= require activestorage
//= require popper
//= require bootstrap-sprockets
//= require dropzone
//= require active_admin
//= require application
//= require toastr
//= require turbolinks
//= require bootstrap-tooltip
//= require bootstrap-popover
//= require_tree .

$(document).on("click", ".bg-info", function(e){
  $(this).hide();
});

$(document).ready(function(){
/*global toastr*/
toastr.options = {
    "closeButton": false,
    "debug": false,
    "positionClass": "toast-bottom-right",
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }
});