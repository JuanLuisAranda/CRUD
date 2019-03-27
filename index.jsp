<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <title>Perrera</title>
    </head>
    <body>
        <h1 class="text-center">Perrera</h1>
    <h2 class="text-center">¡Deja en buenas manos a tus mascostas en vacaciones!</h2>
    
    <%
      request.setCharacterEncoding("UTF-8");
      
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/perrera", "root", "");
      Statement s = conexion.createStatement();

      String estado = (request.getParameter("CodMascota") == null) ? "listado" : "edicion";
    %>
    
    <table class="table">
      <tr><th>CodigoMascota</th><th>Nombre</th><th>Celda</th><th>Sexo</th><th>Raza</th><th></th></tr>
      <form action="<%= estado.equals("listado") ? "añadirPerro.jsp" : "modificaPerro.jsp" %>" method="GET">
        <tr>
          <td>
            <%
              if (estado.equals("edicion")) {
            %>
            <div class="form-group">
            <input
              size="3"
              type="text"
              disabled
              value="<%= request.getParameter("CodMascota") %>"
              class="form-control">
            </div>
              
            <input
              name="id"
              type="hidden"
              value="<%= request.getParameter("CodMascota") %>">
            <%
              }
            %>
          </td>
          <td>
            <div class="form-group">
              <input
                value="<%= estado.equals("edicion") ? request.getParameter("NomMascota") : "" %>"
                name="Nombre"
                type="text"
                class="form-control">
            </div>
          </td>
          <td>
            <div class="form-group">
              <input
                value="<%= estado.equals("edicion") ? request.getParameter("NumCelda") : "" %>"
                name="Celda"
                type="text"
                class="form-control">
            </div>
          </td>
          <td>
            <div class="form-group">
              <input
                value="<%= estado.equals("edicion") ? request.getParameter("Sexo") : "" %>"
                name="Sexo"
                type="text"
                class="form-control">
            </div>
          </td>
          <td>
            <div class="form-group">
              <input
                value="<%= estado.equals("edicion") ? request.getParameter("CodRaza") : "" %>"
                name="Raza"
                type="number"
                min="1"
                style="width: 100px;"
                class="form-control">
            </div>
          </td>
          <td>
            <%
              if (estado.equals("listado")) {
            %>
            <button type="submit" class="btn btn-primary">Añadir</button>
            <%
            }
            
            if (estado.equals("edicion")) {
            %>
            <button type="submit" class="btn btn-success">Guardar</button>
          
            <a href="index.jsp">
              <button type="button" class="btn btn-dark">Cancelar</button>
            </a>
            <%
              }
            %>
          </td>
        </tr>
      </form>
      <%
        ResultSet listado = s.executeQuery("SELECT * FROM mascota");
        while (listado.next()) {
      %>
      <tr>
        <td><%= listado.getString("CodMascota")%></td>
        <td><%= listado.getString("NomMascota")%></td>
        <td><%= listado.getString("NumCelda")%></td>
        <td><%= listado.getString("Sexo")%></td>
        <td><%= listado.getString("CodRaza")%></td>
        <td>
          <a
            class="btn btn-warning"
            href="index.jsp?id=<%= listado.getString("CodMascota")%>&NomMascota=<%= listado.getString("Nombre")%>&NumCelda=<%= listado.getString("Celda")%>&Sexo=<%= listado.getString("Sexo")%>&CodRaza=<%= listado.getString("Raza")%>" role="button">Modificar</a>
          <a class="btn btn-danger" href="borraPerro.jsp?id=<%= listado.getString("CodMascota")%>" role="button">Borrar</a>
        </td>
      </tr>
      <%
        }
      %>

    </table>
    
    
    </body>
</html>
