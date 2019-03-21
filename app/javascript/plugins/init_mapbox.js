import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.longitude, marker.latitude ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};



const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
   const marker = JSON.parse(mapElement.dataset.markers);
  // markers.forEach((marker) => {
  //   new mapboxgl.Marker()
  //   .setLngLat([ marker.lng, marker.lat ])
  //   .addTo(map);
  // });
 new mapboxgl.Marker().setLngLat([ marker.longitude, marker.latitude ]).addTo(map);
  fitMapToMarkers(map, [marker]);
  }
};

export { initMapbox };
