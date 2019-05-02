<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imgs/favicon.ico">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <title>Modificación perruna</title>
    </head>
    <body id="container">
        <h1 class="text-center">Modifica tu perro</h1>
        <h3 class="text-center">En caso de que te hayas equivocado introduciendo tu perro, modifíquelo ahora.</h3>
        <% request.setCharacterEncoding("UTF-8");%>
        <div >
            <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/perrera", "root", "");
              Statement s = conexion.createStatement();

              ResultSet Mascota = s.executeQuery("SELECT * FROM mascota order by CodMascota");
            %>
            <br><br>

            <hr><br><br>
            <form method="get" action="grabaPerroModificado.jsp">


                <input type="hidden" name="CodMascota" value="<%= request.getParameter("CodMascota")%>" readonly>

                <label>&nbsp;&nbsp;Nombre:&nbsp;</label>
                <input type="text" name="NomMascota" value="<%= request.getParameter("NomMascota")%>">

                <label>&nbsp;&nbsp;Número de Celda:&nbsp;</label>
                <input type="integer" name="NumCelda" value="<%= request.getParameter("NumCelda")%>">
                <br><br>

                <label>&nbsp;&nbsp;Sexo:&nbsp;</label>
                <input type="text" name="Sexo" value="<%= request.getParameter("Sexo")%>">

                <label>&nbsp;&nbsp;Raza:&nbsp;</label>
                <select name="CodRaza">
                    <%
                      ResultSet listadoRaza = s.executeQuery("SELECT * FROM raza ");
                      while (listadoRaza.next()) {
                        out.print("<option");
                        if (listadoRaza.getString("CodRaza").equals(request.getParameter("CodRaza"))) {
                          out.print(" selected=\"selected\"");
                        }
                    %>
                    value="<%= listadoRaza.getString("CodRaza")%>"><%= listadoRaza.getString("NomRaza")%></option>


                    <%
                      }
                    %>
                </select>

                <br><br>
                <hr>
                &nbsp;&nbsp;
                <button style="float: right;" class="eliminar" type="submit" >Aceptar</button><br><br>
            </form>
            <form method="get" action="listado.jsp">
                <button style="float: right;" type="submit" class="inicio">Cancelar</button>
            </form><br>

        </div>
    </div>
</body>
</html>
