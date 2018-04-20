
var marker;
var lastMarker;

/*When the map is clicked it loads the value of imput lat and lng in the form*/

map.on('click', function(e)
{
	if(lastMarker != null)
		map.removeLayer(lastMarker);
	
    marker = new L.marker(e.latlng);
	map.addLayer(marker);
	$('#lat').val(marker.getLatLng().lat);
	$('#lon').val(marker.getLatLng().lng);
	lastMarker = marker;
});