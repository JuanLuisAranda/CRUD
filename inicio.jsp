<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estilos.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" href="imgs/favicon.ico">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <title>Inicio</title>
    </head>
    <body>

        <div id="container">
            <br>
            <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro", "root", "");
              Statement s = conexion.createStatement();
            %>
            <h1 class="text-center">Iniciar Sesión</h1>
            <br>
            <div class="cuadro">
                <div class="row">
                    <div class="col-4">

                    </div>
                    <div class="col-4">
                        <form action="compruebaUsuario.jsp" method="POST">

                            <!-- Usuario -->
                            <div class="row">
                                <div class="col-5">
                                    <label>Usuario: </label>
                                </div>
                                <div class="col-7">
                                    <input type="text"  style="width: 165px;" name="NomUsuario">
                                </div>
                            </div>

                            <!-- Contraseña -->
                            <div class="row">
                                <div class="col-5">
                                    <label>Contraseña: </label>
                                </div>
                                <div class="col-7">
                                    <input type="password"  style="width: 165px;" name="Password">
                                </div>
                            </div>

                            <!-- Enviar -->
                            <div class="row">
                                <div class="col-8">

                                </div>
                                <div class="col-4">
                                    <button type="submit" class="entrar">Entrar</button>
                                </div>

                            </div>

                        </form>
                    </div>

                    <div class="col-4">

                    </div>
                </div>
                <div class="text-center">
                  ¿Aún no te has registrado?
                </div>
                <div class="text-center">
                    <a href="signIn.jsp" >¡Regístrate!</a>
                </div>
            </div>

        </div>
        <br>
        <div class="text-center">&copy; Juan Luis Aranda</div>
        <br>
    </div>
</body>
</html>