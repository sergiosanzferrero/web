
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
			
			if(Object.keys(geojson).length > 0)
			{
					var results = $('#results');
					
					/*Remove the last nodes*/
					
					while (results.firstChild)
					{
						results.removeChild(results.firstChild);
					}
					
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

$('#results').on('click','option',function() 
{
	document.location = 'mapa.html?lat=1&lng=2&inner=' + this.innerHTML; 
});
