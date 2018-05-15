
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.

    Author     : pamaco
-->

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>CarTime - Mapa</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7/leaflet.css"/>
        <link rel="stylesheet" href="css/navbar.css"/>
        <link rel="stylesheet" href="css/mapa.css"/>
		
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://cdn.leafletjs.com/leaflet-0.7/leaflet.js"></script>
        <script src="http://ahalota.github.io/Leaflet.CountrySelect/Leaflet.CountrySelect.js"></script>
    </head>
	
    <body>
        <div class="container principal">
		
            <nav class="navbar navbar-light bg-light navbar-static-top">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle nabvar" data-toggle="collapse" data-target="#myNavbar" style="">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.jsp">
                            <img class="img-responsive navbar" src="Imagenes/logo.jpg" alt="logo">
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Inicio</a></li>
                        <li><a href="mapa.jsp">Buscar plaza</a></li>
                        <li><a href="publicar.jsp">Publicar plaza</a></li>
                       
                         <%@ page import="modelo.Usuario" %>
                        <%Usuario usuario= (Usuario) session.getAttribute("login");
                        if(usuario!=null){%>
                        <li><a href="perfil.jsp">Perfil</a></li>
                        <%}%>
                    </ul>
                        
                    <% if(usuario==null){%>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Acceder <span class="glyphicon glyphicon-user"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="login.html">Iniciar sesión</a></li>
                            <li><a href="registro.html">Registrarse</a></li>
                        </ul>
                        </li>
                    </ul>
                      <% } else{ %>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
                    </ul>
                    <% } %>     
                    </div>
                </div>
            </nav>
			
            <div class="row container secundario">
				<h2>Buscador de parkings</h2>
					<div class="container col-sm-6 scrollable-items" style="height:90%;">
						<form action="/mapa.jsp" id="mySearcher" method="POST" autocomplete="off">
							<div class="form-group">
								<div class="row" style="margin-left:0;padding-right:1em;">
									<div class="col-md-6" style="margin:0;padding:0;padding-right:1em;"> 
										<label for="searcher">Lugar:</label><br>
										<div class="btn-group" style="width:100%;">
											<input list="results"  name="searcher" class="form-control" style="margin:0;width:100%;padding-right:2em" id="searcher" placeholder="Numero calle provincia pais">
											<span class="glyphicon glyphicon-remove-circle clean-search-button"></span>
										</div>
										<div class="scrollable-results" style="display:none;">
										<select multiple id="results"></select>
										</div>
										<!--<datalist id="results">
										</datalist>-->
											
									</div>
									<div class="col-md-3" style="margin:0;padding:0;padding-right:1em;margin-bottom:1em;">
										<label for="llegada" style="margin-bottom:0.5em;"> Llegada: </label>
										<input class="form-control" type="date" id="llegada" name="fecha_llegada" required>
									</div>
									<div class="col-md-3" style="margin:0;padding:0;padding-right:1em;margin-bottom:1em;"> 
										<label for="salida" style="margin-bottom:0.5em;"> Salida: </label>
										<input class="form-control" type="date" id="salida" name="fecha_salida" required>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3" style="margin-left:0;padding-right:1em;margin-bottom:1em;"> 
										<label for="sel1">Vehículo:</label>
										<select class="form-control" id="sel1">
											<option>Coche</option>
											<option>Moto</option>
											<option>Furgoneta</option>
										</select>
									</div>
									<div class="col-md-3" style="margin-left:0;padding-right:1em;margin-bottom:1em;"> 
										<label for="ord">Ordenar por:</label>
										<select class="form-control" id="ord">
											<option>Cercanía</option>
											<option>Precio</option>
											<option>Valoración</option>
										</select>
									</div>					
									<div class="col-md-6" style="padding:0;margin:0;margin-left:0;padding-right:2em;margin-bottom:1em;"> 
										<button type="submit" style="width:100%;margin-top:1.75em;" class="btn btn-default form-button">Voy a tener suerte <span class="glyphicon glyphicon-search"></span></button>
									</div>
								</div>
							</div>
						</form>
						<hr>
						
						<div class="container" style="width:100%;height:80%;margin:0;padding:0">
						
							<div id="carousel" class="carousel slide container" style="margin:0 auto;padding:0;width:100%;height:100%;" data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#container" data-slide-to="0" class="active"></li>
									<li data-target="#container" data-slide-to="1"></li>
									<li data-target="#container" data-slide-to="2"></li>
								</ol>
								<div class="carousel-inner" style="width:100%">
									<div class="item active" style="width:100%">
										<img src="Imagenes/carousel4.jpg" alt="San Diego" style="width:100%">
									</div>
									<div class="item" style="width:100%">
										<img src="Imagenes/carousel5.jpg" alt="Chicago" style="width:100%">
									</div>
									<div class="item" style="width:100%">
										<img src="Imagenes/carousel6.jpg" alt="New York" style="width:100%">
									</div>
								</div>
								<a class="left carousel-control" href="#carousel" data-slide="prev">
									<span class="glyphicon glyphicon-chevron-left"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="right carousel-control" href="#carousel" data-slide="next">
									<span class="glyphicon glyphicon-chevron-right"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						
							<ul class="items" id="items" style="display:none">
								
							</ul>
						</div>
					</div>
					<div class="container col-sm-6" style="margin:0;padding:0;height:90%;">
						<div id="map" style="width:100%;height:100%;position:static;padding:0;"></div>
					</div>
				</div>
            <hr>
            <footer>
                <p>Desarrollado por el equipo Cartime. Todos los derechos reservados. <span class="glyphicon glyphicon-copyright-mark"></span></p>
            </footer>
        </div>
        <script src="js/mapa.js"></script>
    </body>
</html>