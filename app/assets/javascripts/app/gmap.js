const SHOW_MAP_ID = 'show_map'
const SHOW_MAP = document.getElementById(SHOW_MAP_ID);

const toggleMapVisibility = function(e) {
  e.stopPropagation();
  $('.gmap').toggleClass('showmap');
  $('#mapoverlay').toggleClass('overlay-hidden');
}

$(document).on('turbolinks:load', function() {
  if (SHOW_MAP){
    SHOW_MAP.addEventListener("click", toggleMapVisibility)
  }
});

//var map = L.map('map_canvas').setView([52.5279,13.4347], 12);
  //L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/dark-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1Ijoic3BpZWxob2VsbGUiLCJhIjoiY2poOHM3ajYwMDRhbDM5bTZoMHR1cWh0ciJ9.mgPRfaP7QCFK2QRMRm_T8g', {
    //maxZoom: 18,
    //id: 'mapbox.streets',
    //accessToken: 'pk.eyJ1Ijoic3BpZWxob2VsbGUiLCJhIjoiY2poOHM3ajYwMDRhbDM5bTZoMHR1cWh0ciJ9.mgPRfaP7QCFK2QRMRm_T8g'
//}).addTo(map);

mapboxgl.accessToken = 'pk.eyJ1Ijoic3BpZWxob2VsbGUiLCJhIjoiY2poOHM3ajYwMDRhbDM5bTZoMHR1cWh0ciJ9.mgPRfaP7QCFK2QRMRm_T8g';
var map = new mapboxgl.Map({
    container: 'map_canvas',
    style: 'mapbox://styles/mapbox/light-v9',
    zoom: 13,
    center: [13.4347,52.5279]
});

