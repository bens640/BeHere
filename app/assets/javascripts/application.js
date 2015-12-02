// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require pick
//= require timepick
//= require_tree .
// = require jquery.geocomplete


        function start_js() {
        $('#datepicker').datepicker({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year
            autoclose: true,
            format: 'yyyy-mm-dd'
        });

        $('#timepicker').timepicker();


        var options = {
            map: '#map',
            types: 'establishment',
            details: '#location-info',
            detailsAttribute: 'data-geo',
            country: 'us'
   };

    $('#geo-input').geocomplete( options).bind('geocode:result', function(event, result){
        console.log(result);
        var hours = function(){
            var total = result.opening_hours.weekday_text;
            for (var x in total){

                var h = '';
                h = (total[x]);
                //console.log(h);
                $('#hours').append(h);
                $('#hours').append('<br>');

            }
        };
        x =hours();
        var loc_nam = $('#loc-name-id').text();
        var loc_city = $('#loc-city-id').text();
        var loc_full = $('#loc-full-id').text();
        $('#post_location').val(loc_nam);
        $('#post_city').val(loc_city);
        $('#post_full_address').val(loc_full);
        console.log(loc_nam);

    });

    $("#aroma").click(function(){
        $("#geo-input").val('aroma espresso bar');
    });


}
$(function() {
});

$(document).on('ready page:load', start_js);