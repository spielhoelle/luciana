var initialize;
const SHOW_MAP_ID = 'show_map'
const SHOW_MAP = document.getElementById(SHOW_MAP_ID);

const toggleMapVisibility = function(e) {
  e.stopPropagation();
  //$('#new_contact').toggleClass('mapped').toggleClass('notclickable');
  //$('#mapbutton-container').toggleClass('notclickable');
  $('.gmap').toggleClass('showmap');
  $('#mapoverlay').toggleClass('overlay-hidden');
}

initialize = function() {
  var address, geocoder, latlng, map, myOptions;
  if ($('#map_canvas').length) {
    address = $('#map_canvas').attr('data-description');
    geocoder = new google.maps.Geocoder;
    latlng = new google.maps.LatLng(-34.397, 150.644);
    myOptions = {
      zoom: 15,
      center: latlng,
      mapTypeControlOptions: {
        style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
      },
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      disableDefaultUI: true
    };
    map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);
    window.map = map;
    map.setOptions({
      styles: [{"featureType":"all","elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"featureType":"all","elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"featureType":"all","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]}]
    });
    if (geocoder) {
      geocoder.geocode({
        'address': address
      }, function(results, status) {
        var infowindow, marker, newCenter, pixelOffset, scale, worldCoordinateCenter, worldCoordinateNewCenter;
        if (status === google.maps.GeocoderStatus.OK) {
          if (status !== google.maps.GeocoderStatus.ZERO_RESULTS) {
            scale = Math.pow(2, map.getZoom());
            worldCoordinateCenter = map.getProjection().fromLatLngToPoint(results[0].geometry.location);
            pixelOffset = new google.maps.Point(0 / scale || 0, -200 / scale || 0);
            worldCoordinateNewCenter = new google.maps.Point(worldCoordinateCenter.x - pixelOffset.x, worldCoordinateCenter.y + pixelOffset.y);
            newCenter = map.getProjection().fromPointToLatLng(worldCoordinateNewCenter);
            map.setCenter(newCenter);
            infowindow = new google.maps.InfoWindow({
              content: '<b>' + address + '</b>',
              size: new google.maps.Size(120, 50)
            });
            marker = new google.maps.Marker({
              position: results[0].geometry.location,
              map: map,
              title: address
            });

            const showInfoWindow = function() {
              infowindow.open(map, marker);
            }

            if (SHOW_MAP){
              SHOW_MAP.addEventListener("click", showInfoWindow)
            }

          } else {
            console.log('No results found');
          }
        } else {
          console.log('Geocode was not successful for the following reason: ' + status);
        }
      });
    }
    google.maps.event.addListenerOnce(map, 'idle', function(){
      $('.loader.site-loader').addClass('done');
    });
  }
};

$("#map_canvas a[target=_blank]").hide();


$(document).on('turbolinks:load', function() {
  $('#map_canvas, .contactwrap').click(function(e) {
    return e.stopPropagation();
  });
  if (SHOW_MAP){
    SHOW_MAP.addEventListener("click", toggleMapVisibility)
  }
});



// $(document).on('turbolinks:load', function() {
google.maps.event.addDomListener(window, 'turbolinks:load', initialize);
// google.maps.event.addDomListener(window, 'page:load', initialize);
