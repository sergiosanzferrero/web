

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="modelo.Plaza" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>CarTime - Publicar plaza</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7/leaflet.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="http://cdn.leafletjs.com/leaflet-0.7/leaflet.js"></script>
        <script src="http://ahalota.github.io/Leaflet.CountrySelect/Leaflet.CountrySelect.js"></script>
        <link href="css/navbar.css" rel="stylesheet" type="text/css"> 
	<link href="css/publicar.css" rel="stylesheet" type="text/css"> 
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
				<h2>Publicar plaza</h2>
                                
				<div class="container col-sm-6" style="margin:0;padding:0;padding-right:1em;height:90%;">
					<form action="publicar" id="mySearcher" method="POST" style="height:100%" autocomplete="off" enctype="multipart/form-data">
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
							<label for="llegada" style="margin-bottom:0.5em;"> Latitud: </label>
							<input class="form-control" type="text" id="lat" name="lat" readonly="readonly" required>
						</div>
						<div class="col-md-3" style="margin:0;padding:0;padding-right:1em;margin-bottom:1em;"> 
							<label for="salida" style="margin-bottom:0.5em;"> Longitud: </label>
							<input class="form-control" type="text" id="lon" name="lon" readonly="readonly" required>
						</div>
					</div>
					<div class="row" style="margin-left:0;padding-right:1em;">
						<div class="col-md-3" style="margin-left:0;padding:0;padding-right:1em;margin-bottom:1em;"> 
							<label for="sel1">Tamaño:</label>
							<input id="tamanio" value="Coche" hidden required>
							<select class="form-control" name="tipo" id="tamanio-sel">
								<option>Coche</option>
								<option>Moto</option>
								<option>Furgoneta</option>
							</select>
						</div>
						<div class="col-md-3" style="margin-left:0;padding:0;padding-right:1em;margin-bottom:1em;"> 
							<label for="ord">Horario:</label>
							<input id="horario" value="Jornada completa" hidden required>
							<select class="form-control" id="horario-sel">
								<option>Jornada completa</option>
								<option>Parcial mañana</option>
								<option>Parcial tarde</option>
							</select>
						</div>	
						<div class="col-md-3" style="margin-left:0;padding:0;padding-right:1em;padding-left:0;margin-bottom:1em;"> 
						<label for="imagen" style="margin-bottom:0.5em;"> Precio:</label>
						<input class="form-control" type="text" id="imagen" name="precio" placeholder="€" required>
													
						</div>
                                            <input type="hidden" name="dni" value="11159437S">
						<div class="col-md-3" style="margin-left:0;padding:0;padding-right:1em;padding-left:0;margin-bottom:1em;"> 
						<label style="margin-bottom:0.5em;"> Imagen: </label><br>
							<label for="file-upload" class="btn btn-default" style="width:100%">
								Subir imagen
							</label>
							<input id="file-upload" name="file-upload" type="file" style="display:none;">
						</div>
                                             
                                              
					</div>
					
					<div class="row" style="margin-left:0;padding-right:2em;">
						<label for="descripcion" style="margin-bottom:0.5em;"> Descripción: </label>
                            ​<textarea  class="form-control" rows="8" name="descripcion" id="descripcion" maxlength="500" style="width:100%; margin:0;padding:0;" placeholder="Máximo 500 caracteres."  required></textarea>
                    </div>
						
					<div class="row" style="margin-left:0;padding-right:2em;"> 
						<button type="submit" style="width:100%;margin-top:1.75em;" class="btn btn-default form-button">Publicar plaza <span class="glyphicon glyphicon-send"></span></button>
					</div>	

				</div>
			</form>
				</div>
				<div class="container col-sm-6" style="margin:0;padding:0;height:90%;">
					<div id="map" style="width: 100%;height:100%;position:static;padding:0;"></div>
				</div>
			</div>
            <hr>
            <footer>
            <p>Desarrollado por el equipo Cartime. Todos los derechos reservados. <span class="glyphicon glyphicon-copyright-mark"></span></p>
            </footer>  
      </div>
	  <script src="js/mapa.js"></script>
	  <script src="js/publicar.js"></script>
    </body>
</html>
