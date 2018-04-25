
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

/*When the user uploads an image his name is putted on the box*/

$('#file-upload').change(function() 
{
	var file = $('#file-upload')[0].files[0].name;
	$(this).prev('label').text(file);
});

$('#tamanio-sel').on('click','option',function() 
{
	$('#tamanio').val(this.innerHTML);
});

$('#horario-sel').on('click','option',function() 
{
	$('#horario').val(this.innerHTML);
});

