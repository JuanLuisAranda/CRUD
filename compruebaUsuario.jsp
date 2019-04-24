<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="shortcut icon" href="imgs/favicon.ico">
        <script src="js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1 class="text-center">Comprobar</h1>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
          
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro", "root", "");
          Statement s = conexion.createStatement();
        %>
        <%
          
          request.setCharacterEncoding("UTF-8");
          String usuario = request.getParameter("NomUsuario");
          String contrasena = request.getParameter("Password");
          
          String consulta = "SELECT COUNT(*) AS comprueba FROM usuarios WHERE NomUsuario='"
                      + request.getParameter("NomUsuario")
                      + "' AND Password='"
                      + request.getParameter("Password")
                      + "'";
          
          

          if (usuario.equals("juanlu") && contrasena.equals("1234")) {
            session.setAttribute("usuario", usuario);
            response.sendRedirect("index.jsp");
          } else {
        %>
        <p>Nombre de usuario o contraseña incorrecto.</p>
        <p>Vuelva a la página de <a href="inicio.jsp">Login</a></p>
        <%
          }
        %>

    </body>
</html>
