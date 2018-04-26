
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 
	Author     : pamaco
 */

var osmLink = '<a href="http://openstreetmap.org">OpenStreetMap</a>',
        thunLink = '<a href="http://thunderforest.com/">Thunderforest</a>';

var osmUrl = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        osmAttrib = '&copy; ' + osmLink + ' Contributors',
        landUrl = 'http://{s}.tile.thunderforest.com/landscape/{z}/{x}/{y}.png',
        thunAttrib = '&copy; '+osmLink+' Contributors & '+thunLink;

var osmMap = L.tileLayer(osmUrl, {attribution: osmAttrib}),
        landMap = L.tileLayer(landUrl, {attribution: thunAttrib});

var map = L.map('map', { layers: [osmMap] }).setView([40, 4], 3);

var isLocationSelected = false;

var geojson;
var selectedLocation;

/*To make easier the HTTP requests*/

var HttpClient = function() 
{
    this.get = function(url, aCallback) 
    {
        var req = new XMLHttpRequest();
		
        req.onreadystatechange = function()
        { 
            if (req.readyState == 4 && req.status == 200)
                aCallback(req.responseText);
        }
		
        req.open("GET", url, true);            
        req.send( null );
    }
}


/*ANULADO - Check if the formulary options are correct before to make the POST*/
/*
$(function()
{
    $('#mySearcher').on('submit', function(e) 
    {
        e.preventDefault();
		if(!isLocationSelected)
		{
			alert("there is not selected location");
			return;
		}
		
		$('#carousel').css('display', 'none');
		$('.items').css('display', 'block');
		$('.scrollable-items').css('overflow-y', 'scroll');
		map.setView([selectedLocation.lat, selectedLocation.lon], 20);
    });
});
*/


/*Event to search the results meanwhile the user is writting the query*/

$('#searcher').on('keyup', function()
{
     if (this.value.length > 1) 
	 {
		var client = new HttpClient();
		
		client.get('https://nominatim.openstreetmap.org/search.php?q=' + this.value + '&polygon=1&addressdetails=1&format=json', function(response) 
		{
			geojson = JSON.parse(response);
			isLocationSelected = false;
			
			var results = $('#results');
					
			/*Remove the last nodes.
			Warning we have to write it slowly in order to execute the event with our last query.
			If we write fast meanwhile we are writting the last event has not ended yet so our actually query event will not be executed.
			This issue can be parsed by loading all results in an array. */
			
			results.empty(); 
					
			if(Object.keys(geojson).length > 0)
			{
					/* We add the results to the select */
					
					for(i = 0; i < Object.keys(geojson).length; ++i)
					{
							var opt = document.createElement("option");
							
							opt.value = i.toString();
							opt.innerHTML = '';
							
							/*if(geojson[i].address.house_number != null)
								opt.innerHTML += geojson[i].address.house_number + ', ';
							
							if(geojson[i].address.road != null)
								opt.innerHTML += geojson[i].address.road + ', ';
							
							if(geojson[i].address.city != null)
								opt.innerHTML += geojson[i].address.city + ', ';
							
							if(geojson[i].address.postcode != null)
								opt.innerHTML += geojson[i].address.postcode + ', ';

							if(geojson[i].address.state != null)
								opt.innerHTML += geojson[i].address.state + ', ';
							
							if(geojson[i].address.country != null)
								opt.innerHTML += geojson[i].address.country;*/

							opt.innerHTML = geojson[i].display_name;
							
							$('#results').append(opt);
					}
					
					/*We show the available locations*/
					
					$('.scrollable-results').css('display', 'block');
			}
			else
				$('.scrollable-results').css('display', 'none');
		});
    }
	else
		$('.scrollable-results').css('display', 'none');
});


/*Allow to put events for future locations and focus the selected one in the map*/

$('#results').on('click','option',function() 
{
	isLocationSelected = true;
    $('#searcher').val(this.innerHTML);
	$('.scrollable-results').css('display', 'none');
	if(window.location.href.search('publicar') > 0)
	{
		map.setView([geojson[this.value].lat, geojson[this.value].lon], 20);
                $('#lat').val(geojson[this.value].lat);
                $('#lon').val(geojson[this.value].lon);
	}
	selectedLocation = geojson[this.value];
});


/*Clean searcher input text when user press the button and remove items*/

$('.clean-search-button').click(function()
{
	isLocationSelected = false;
    $('#searcher').val('');
	
	while (results.firstChild) 
	{
		results.removeChild(results.firstChild);
	}	
	
	$('.scrollable-results').css('display', 'none');
	
	$('.items').css('display', 'none');
	$('.scrollable-items').css('overflow-y', 'hidden');
	$('#carousel').css('display', 'block');

	map.setView([40, 4], 3);
});

