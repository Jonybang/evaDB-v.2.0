// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
// require app_assets
// require polyfiller
//= require modernizr.min
//= require jquery
//= require angular.min
//= require angular-date-picker-polyfill.min
//= require angular-resource.min
//= require angular-route.min
//= require ui-bootstrap-tpls-0.13.0.min
//= require jquery_ujs
//= require jquery.validate.min
//= require jquery_nested_form
//= require select2
//= require select2_locale_ru
//= require bootstrap
//= require bootstrap-formhelpers.min
//= require bootstrap-formhelpers-phone
//= require showErrors.min
// require turbolinks
//= require d3.min
//= require d3/text-wrap
//= require d3/gantt-chart-d3v2
//= require angular/app.js.erb
//= require_tree ./angular

// require manager

//webshim.polyfill('es5 mediaelement forms forms-ext');
//$(function(){
//    webshim.polyfill('es5 mediaelement forms forms-ext');
//});

//$(document).on("ready page:load", function(){
//    $('.eva-select').select2();
//    $("form").validate();
//    $("input[type='url']").keydown(function() {
//        if(!this.value || this.value == "http:/" || this.value == "https:/"){
//            this.value = '';
//            return;
//        }
//
//        if (!/^https?:\/\//.test(this.value)) {
//            this.value = "http://" + this.value;
//        }
//    });
//});