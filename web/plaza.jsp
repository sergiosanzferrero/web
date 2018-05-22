<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>CarTime - Detalles de plaza</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/navbar.css">
        <link href="css/plaza.css" rel="stylesheet" type="text/css">      
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
                         <%@ page import="modelo.Usuario" %>
                        <%Usuario usuario= (Usuario) session.getAttribute("login");%>
                    </div>
                   <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Inicio</a></li>
                        <li><a href="mapa.jsp">Buscar plaza</a></li>
                        <%if(usuario!=null){%>
                        <li><a href="publicar.jsp">Publicar plaza</a></li>                  
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
                        <li><a href="ControladorLogOut">Logout <span class="glyphicon glyphicon-log-out"></span></a></li>
                    </ul>
                    <% } %>    
                    </div>
                </div>
            </nav>
        
        
        
        <div class="container-fluid" id="contplaza">
            <h1>Calle de Espoz y Mina, 60</h1>
            <h1>Madrid</h1>
            <div class="row">
                    <div class="col-md-8">
        <div class="row">
            <div class="col-md-12">
                <div class="well">
                    
<a href="#ip">Información de la plaza</a>&nbsp;|&nbsp;<a href="perfil.html">Propietario</a>&nbsp;|&nbsp;<a href="#ub">Ubicación</a>&nbsp;|&nbsp;<a href="#va">Valoraciones</a>

                    
                </div>
            </div>

        </div>
                                <div class="row">
            <div class="col-md-12">
                <div class="well">
                    <div class="row">
                        <div class="col-md-3">
                    <h4 id="ip"> Descripción </h4>
                    </div>
                        <div class="col-md-9">
                            Plaza para moto, coche o furgoneta en parking de residentes. Vigilancia 24h. Disponible todo el fin de semana.
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                    <h4 > Tamaño </h4>
                    </div>
                        <div class="col-md-9">
                            Moto&nbsp;|&nbsp;Coche pequeño&nbsp;|&nbsp;Coche grande&nbsp;|&nbsp;Furgoneta
                            </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                    <h4 > Acceso </h4>
                    </div>
                        <div class="col-md-9">
                            El dueño te dejará el mando. Tendrás que devolverlo cuando acabe la reserva.
                            </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="well"><img src="Imagenes/fotoperfil.png"  alt="Foto de perfil"><h4 id="pr"> Julián </h4><p>Ha alquilado varias veces su plaza.</p><p>Reserva la plaza para ponerte en contacto con él y llegar a un acuerdo.</p><p>Tiempo de respuesta: Menos de 10 minutos ?</p></div>
            </div>

        </div>
    </div>
    <div class="col-md-4" >
        <div class="well" >
            <h4> Reservar plaza </h4>
            <h5> 2,50 ?/hora </h5>
            <p> 4,00 ?/día </p>
            <p> 20,00 ?/semana </p>
            <form action="Reservar" method="post">
            <div class="row">
                <div class="col-md-6">
                    <h5> Llegada </h5>
                    <input class="form-control" type="date" id="llegada-date-input" name="fecha_llegada" required>
                </div>
                <div class="col-md-6"> 
                    <h5> Salida </h5> 
                    <input class="form-control" type="date" id="salida-date-input" name="fecha_salida" required>
                </div>
                </div>
                            <input type="hidden" name="id" value="3">
                            <input type="hidden" name="dni" value="71156437P">
            <h4> Total: </h4>
            <br/>
            <br/>
            <br/>
            <br/>
                   <div class="submit-row">

                        <input class="btn btn-default submit-form" id="submit-reservar" name="submit-reservar" value=" Reservar " type="submit">

                   </div>
            </form>
        </div>
    </div>

</div>
                    <div  id="contubica" style="border:1px solid #000000;">
                        <h3 id="ub"> Ubicación </h3>
<div class="row">
    <div class="col-md-8">
        <div class="well">
            <p>Mapa</p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="well">
            <p>Imagen de la plaza</p>

        
        </div>
    </div>
</div>
                        </div>
            <br>
 <div  id="contvalora" style="border:1px solid #000000;">
  <h3 id="va"> Valoraciones </h3>
<div class="row">
    <div class="col-md-6">
        <div class="well">
            <p>?????&emsp;&emsp;&emsp;Diciembre 2017</p>
            <br>
            <p>Todo perfecto.</p>
            <p>Volvería a alquilar esta plaza sin dudarlo.</p>
        
        </div>
    </div>
    <div class="col-md-6">
        <div class="well">           
            <p>????&emsp;&emsp;&emsp;Enero 2018</p>
            <br>
            <p>Buena ubicación.</p>
            <p>Julián puntual y amable.</p>
        </div>
    </div>
</div >

<form action="valoracion.html">
 <button type="submit"  class="btn btn-default" style="margin:10px 10px 10px 10px;">Añadir valoración</button>  
</form>
 </div>
            <hr>
            <footer>
            <p>Desarrollado por el equipo Cartime. Todos los derechos reservados. <span class="glyphicon glyphicon-copyright-mark"></span></p>
            </footer>  
        </div></div>
    </body>
</html>
