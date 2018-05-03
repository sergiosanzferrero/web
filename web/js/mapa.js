
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

var map = L.map('map', { layers: [osmMap] }).setView([40, 4], 2);

var isLocationSelected = false;
var selectedLocation;
var geojson; //The jsons that are returned after the address query
var placesjson; //The jsons that are returned from the controller and database.
var markers = {}; //The map markers we are going to print

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

var HttpPostClient = function() 
{
    this.get = function(url, aCallback) 
    {
        var req = new XMLHttpRequest();
		
        req.onreadystatechange = function()
        { 
            if (req.readyState == 4 && req.status == 200)
                aCallback(req.responseText);
        }
		
        req.open("POST", url, true);            
        req.send( null );
    }
}

/* Check if the formulary options are correct before to make the POST*/

$(function()
{
    $('#mySearcher').on('submit', function(e) 
    {
		
        /*This part of code only must run on map view.*/ 
		
        if(window.location.href.search('mapa') > 0)
	{
            e.preventDefault();
			
            if(isLocationSelected) //It should check the rest of values before to send them.
            {
                    //Static values for testing.
				
                    removeMarkersAndItems();
                    
                    var client = new HttpPostClient();
		
                    client.get('http://localhost:8080/WebApplication1/mapa', function(response) 
                    {
			placesjson = JSON.parse(response);
                        
                    /*placesjson = 
                    [
                        {
                            "description" : "aparcamiento publico cuando vengais saco el coche y os cedo la plaza",
                            "address" : "calle del mambo 9 sevilla",
                            "type" : "furgoneta",
                            "schedule" : "mañana",
                            "latitude" : "51.5",
                            "longitude" : "-0.09",
                            "price" : "8",
                            "contactName" : "javier",
                            "appreciationAverage" : "3",
                            "imagePath" : "Imagenes/plazas/parking1.jpg"
                        },
                        {
                            "description" : "el aparcamiento de mi vecino que me deja las llaves",
                            "address" : "calle del rondo 134 caceres",
                            "type" : "coche",
                            "schedule" : "tarde",
                            "latitude" : "40.71727401",
                            "longitude" : "-74.00898606",
                            "price" : "10",
                            "contactName" : "cardenas",
                            "appreciationAverage" : "4",
                            "imagePath" : "Imagenes/plazas/parking2.jpg"
                        }
                    ];*/

                    if(Object.keys(placesjson).length > 0)
                    {
                        /* We add the results to items */

                        for(i = 0; i < Object.keys(placesjson).length; ++i)
                        {
                            var stars = "";

                            for(j = 0; j < 5; j++)
                            {
                                    if(j < parseInt(placesjson[i].appreciationAverage))
                                            stars += "<span class=\"glyphicon glyphicon-star\"></span>";
                                    else
                                            stars += "<span class=\"glyphicon glyphicon-star-empty\"></span>";
                            }

                            var item = "<div class=\"col-md-6\" style=\"margin:0;padding:0;padding-left:0.5em;padding-bottom:1em;\">" +
                                                    "<li id=\"itembox\" value=\"" + i.toString() + "\"style=\"height:120px;width:100%;float:left;margin:0;padding:0;\">" +
                                                            "<a class=\"item\" href=\"plaza.html\">" + 
                                                                    "<img id=\"img\" class=\"container col-md-4\" style=\"margin:0;padding:0;height:100%\" src=\"" + placesjson[i].imagePath + "\" alt=\"parking1\">" + 
                                                                    "<div class=\"container col-md-8\" style=\"margin:0;padding:0;float:left;height:100%\">" + 
                                                                            "<p style=\"background:#ddd;margin:0;padding:0.2em;padding-bottom:0;\">" + placesjson[i].address + "</p>" + 
                                                                            "<div class=\"container col-md-6\" style=\"margin:0;padding:0.3em;float:left;\">" + 
                                                                                    "<h6>Precio: " + placesjson[i].price + " €</h6>" + 
                                                                                    "<h6>Tamaño: " + placesjson[i].type + "</h6>" + 
                                                                                    "<h6>Descripcion: " + placesjson[i].description + "</h6>" + 
                                                                            "</div>" + 
                                                                            "<div class=\"container col-md-6\" style=\"margin:0;padding:0.3em;\">" + 
                                                                                    "<h6>Valoración: " +
                                                                                    stars + 
                                                                                    "</h6>" + 
                                                                                    "<h6>Contacto: " + placesjson[i].contactName + "</h6>" + 
                                                                                    "<h6>Horario: " + placesjson[i].schedule + "</h6>" + 
                                                                            "</div>" + 
                                                                    "</div>" + 
                                                            "</a>" + 
                                                    "</li>" + 
                                            "</div>";

                            $('#items').append(item);

                            /*We put the marker in the map and we save it to our array*/

                            markers[i.toString()] = L.marker([parseFloat(placesjson[i].latitude), parseFloat(placesjson[i].longitude)]);

                            map.addLayer(markers[i.toString()]);
                        }
                    }
                    else
                    {
                            alert("no se encontraron plazas");
                            $('.scrollable-results').css('display', 'none');
                    }
                });
                    $('#carousel').css('display', 'none');
                    $('#items').css('display', 'block');
                    $('.scrollable-items').css('overflow-y', 'scroll');
                    //map.setView([selectedLocation.lat, selectedLocation.lon], 5);
            }
            else
            {
                    alert("There is not selected location.");
                    return;
            }
        }
    });
});



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
							
							/* We can custom the information we show about the found places here
							
							if(geojson[i].address.house_number != null)
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
	
	/*If the user selects an geo option and is publishing a place we make zoom and save the geolocation to the form. This part of code only must run on publish view.*/ 
	
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
	
	removeMarkersAndItems();
        
        /*Here we remove the results that were loaded by the searchbox*/
	
	while (results.firstChild) 
	{
		results.removeChild(results.firstChild);
	}
	
	$('.scrollable-results').css('display', 'none');
	$('.items').css('display', 'none');
	$('.scrollable-items').css('overflow-y', 'hidden');
	$('#carousel').css('display', 'block');

	map.setView([40, 4], 2);
});


/*An event to highlight the marker when the mouse hovers the place*/

 $(document).on('mouseover','#itembox',function()
{
	markers[this.value]._icon.src = "https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-yellow.png";
	//markers[this.value].valueOf()._icon.style.backgroundColor = '';
});


/*An event to set the default marker when the mouse sttops hover the place*/

 $(document).on('mouseleave','#itembox',function()
{
	markers[this.value]._icon.src = "http://cdn.leafletjs.com/leaflet-0.7/images/marker-icon.png";
});

/*Clean places and markers*/

function removeMarkersAndItems()
{
    /*We remove old data about the places; remove the map markers and the items*/
	
	for(i = 0; i < Object.keys(markers).length;i++)
	{
		map.removeLayer(markers[i]);
	}
	
        var itms = $('#items');
        
        while (itms.firstChild)
	{
		itms.removeChild(itms.firstChild);
	}	
        
	markers = {};
	
	$('#items').html("");    
}
