
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


/*Allow to select the size of the place*/

$('#tamanio-sel').on('click','option',function() 
{
	$('#tamanio').val(this.innerHTML);
});


/*Allow to select the schedule of the place*/

$('#horario-sel').on('click','option',function() 
{
	$('#horario').val(this.innerHTML);
});

