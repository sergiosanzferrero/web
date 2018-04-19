
var lat;
var lng;
var marker;
var lastMarker;

map.on('click', function(e)
{
	if(lastMarker != null)
		map.removeLayer(lastMarker);
	
    marker = new L.marker(e.latlng);
	map.addLayer(marker);

	lat = marker.getLatLng().lat;
	lng = marker.getLatLng().lng;
	$('#lat').val(lat);
	$('#lng').val(lng);
	lastMarker = marker;
});