<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añade un usuario</title>
    </head>
    <body>
        
        <%
      request.setCharacterEncoding("UTF-8");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/registro", "root", "");
      Statement s = conexion.createStatement();
      
      String contrasena = request.getParameter("Password");
      String repetirContrasena = request.getParameter("Password2");
      
      // Comprueba si el Nombre de Usuario ya existe
      String consulta = "SELECT COUNT(*) AS NumUsuario FROM usuario WHERE NomUsuario='"
              + request.getParameter("NomUsuario")
              + "'";
      
      ResultSet coincidencias = s.executeQuery(consulta);
      coincidencias.next();
      
      if (coincidencias.getInt(1) != 0) {
        out.print("<script type=\"text/javascript\">alert(\"Lo siento, el usuario " + request.getParameter("NomUsuario") + " ya existe\");</script>");
        out.print("<script>document.location = \"listado.jsp\"</script>");
      }else if(contrasena.equals(repetirContrasena)) {
        
        String insercion = "INSERT INTO usuario (NomUsuario,Password) ";
      insercion += "VALUES ('";
      insercion += request.getParameter("NomUsuario") + "', '";
      insercion += request.getParameter("Password") + "')";
      
      s.execute(insercion);
      
      response.sendRedirect("listado.jsp");
      } else {
        
        session.setAttribute("error", "Las contraseñas no coinciden, vuelve a introducirlas corectamente.");
        response.sendRedirect("signIn.jsp");
      
      }
      
      //out.print(insercion);
      
      conexion.close();
    %>
    </body>
</html>
