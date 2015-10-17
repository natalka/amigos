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
//
//= require jquery
//= require jquery_ujs
//= require typeahead.bundle
//= require_tree .

$( document ).ready(function() {
  var search_fields = $(' #to_deliver, #from_deliver ');
  var possible_locations = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/search.json?location_name=%QUERY',
      wildcard: '%QUERY'
    }
  });

  search_fields.typeahead(null, {
    display: 'value',
    source: possible_locations
  });

  search_fields.bind('typeahead:select', function(ev, query, dataset) {
    var $element_longitude = $('#'+this.id+'_longitude');
    var $element_latitude  = $('#'+this.id+'_latitude');
    // value: "Alexanderstraße, Berlin, Deutschland", latitude: 52.5223299, longitude: 13.41557
    $element_latitude.val(query.latitude);
    $element_longitude.val(query.longitude);
  });

});