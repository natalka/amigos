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
//= require_tree .

$( document ).ready(function() {
  nokia.Settings.set("app_id", "i6eH7aQVYK2RFCDfUOA5");
  nokia.Settings.set("app_code", "R-s0s6ahDxkxOEXxrCzZAw");

  var searchBox = new nokia.places.widgets.SearchBox ({
    targetNode: 'to_deliver_location',
    searchCenter: function () {
      return {
        latitude: 52.516274,
        longitude: 13.377678
      }
    },
    onResults: function (data) {
      renderResults (data);
    }
  });

  function renderResults (data) {
    var previewList = document.getElementById ('results');
    previewList.innerHTML = '';

    var results = data.results.items;

    for (var i = 0, l = results.length; i < l; i++) {
      var result = results[i];
      var resultLi = document.createElement ('li');
      resultLi.innerHTML = result.title;
      previewList.appendChild (resultLi);
    }
  }

});