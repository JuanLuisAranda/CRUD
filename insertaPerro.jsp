<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Añade un perro</title>
    </head>
    <body>
        
        <%
      request.setCharacterEncoding("UTF-8");

      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/perrera", "root", "");
      Statement s = conexion.createStatement();

      String insercion = "INSERT INTO mascota (NomMascota,NumCelda,Sexo,CodRaza) ";
      insercion += "VALUES ('";
      insercion += request.getParameter("NomMascota") + "', '";
      insercion += request.getParameter("Celda") + "', '";
      insercion += request.getParameter("Sexo") + "', ";
      insercion += request.getParameter("CodRaza") + ")";
      

      //out.print(insercion);
      s.execute(insercion);
      conexion.close();
    %>
    </body>
</html>
