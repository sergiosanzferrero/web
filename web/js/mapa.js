/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var osmLink = '<a href="http://openstreetmap.org">OpenStreetMap</a>',
        thunLink = '<a href="http://thunderforest.com/">Thunderforest</a>';

var osmUrl = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        osmAttrib = '&copy; ' + osmLink + ' Contributors',
        landUrl = 'http://{s}.tile.thunderforest.com/landscape/{z}/{x}/{y}.png',
        thunAttrib = '&copy; '+osmLink+' Contributors & '+thunLink;

var osmMap = L.tileLayer(osmUrl, {attribution: osmAttrib}),
        landMap = L.tileLayer(landUrl, {attribution: thunAttrib});

var map = L.map('map', {
                layers: [osmMap]
        }).setView([25, 25], 1);

var select = L.countrySelect({exclude:""});

var json;

var HttpClient = function() 
{
    this.get = function(aUrl, aCallback) 
    {
        var anHttpRequest = new XMLHttpRequest();
        anHttpRequest.onreadystatechange = function() 
        { 
            if (anHttpRequest.readyState == 4 && anHttpRequest.status == 200)
                aCallback(anHttpRequest.responseText);
        }
        anHttpRequest.open("GET", aUrl, true);            
        anHttpRequest.send( null );
    }
}

$(function() 
{
    $('#mySearcher').on('submit', function(e) 
    {
        e.preventDefault();
        var data = $("#myText").val();
        var client = new HttpClient();
        client.get('https://nominatim.openstreetmap.org/search.php?q=' + data + '&polygon=1&addressdetails=1&format=json', function(response) 
        {
            json = JSON.parse(response);
            var div = document.getElementById('address');
            div.innerHTML = '';

            if(Object.keys(json).length == 0)
                    alert("No se pudo geolocalizar la direccion");

            else if(Object.keys(json).length == 1)
                    map.setView([json[0].lat, json[0].lon], 20);
            else
            {	
                map.setView([json[0].lat, json[0].lon], 20);

                for(a = 0; a < Object.keys(json).length; a++)
                {
                    div.innerHTML += JSON.stringify(json[a].address) + '<br>';
                }
            }
        });
    });
});
