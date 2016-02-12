// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require pace.min
//= require jquery
//= require jquery_ujs
//= require modernizr.custom
//= require jquery-ui.min
//= require bootstrap.min
//= require bootstrap-tagsinput.min
//= require jquery-easy
//= require jquery.unveil.min
//= require jquery.bez.min
//= require jquery.ioslist.min
//= require jquery.actual.min
//= require jquery.scrollbar.min
//= require select2.min
//= require classie
//= require pages.min
//= require scripts
//= require demo
//= require_self

$(document).ready(function(){
    setTimeout(function(){
        $('.pgn-wrapper').fadeOut("slow", function() {
            $(this).remove();
        })
    }, 4500);
});

function update_subscategories_div(parent_id) {
    jQuery.ajax({
        url: "/get_subscategories",
        type: "GET",
        data: {"parent_id" : parent_id},
        dataType: "html",
        success: function(data) {
            jQuery("#versionsDiv").html(data);
        }
    });
}

function update_newsubscategories_div(parent_id) {
    jQuery.ajax({
        url: "/get_newsubscategories",
        type: "GET",
        data: {"parent_id" : parent_id},
        dataType: "html",
        success: function(data) {
            jQuery("#versions1Div").html(data);
        }
    });
}

