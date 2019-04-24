<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="shortcut icon" href="imgs/favicon.ico">
        <script src="js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <title>Perrera - Página Principal</title>
        <link rel="stylesheet" href="css/right.css">
    </head>
    <body>
        <p class="right">
            <%
              if (session.getAttribute("usuario") != null) {
                out.print("Usuario " + session.getAttribute("usuario"));
                %>
                <!--<a class="btn" href="logout.jsp" role="button" title="Logout"><i class="fas fa-sign-out-alt"></i></a>-->
                <!-- Button trigger modal -->
    <button type="button" title="Logout" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-sign-out-alt"></i></button>
            
            <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">¿Está seguro de que quiere cerrar sesión?</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>        
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
              <a class="btn btn-primary" href="logout.jsp" role="button">Aceptar</a>
            </div>
        </div>
      </div>
    </div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                
                <%
              } else {
            %>
            <a class="btn btn-primary" href="inicio.jsp" role="button" title="Login"><i class="fas fa-sign-in-alt"></i></a>
            
            
            
            <a class="btn btn-success" href="signIn.jsp" role="button" title="Sign In">Sign In</a>
            <%
              }
             %>
        </p>
        <h1 class="text-center">Perrera</h1>
        <h2 class="text-center">¡Deja en buenas manos a tus mascotas en vacaciones!</h2>
        <%
          request.setCharacterEncoding("UTF-8");

          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/perrera", "root", "");
          Statement s = conexion.createStatement();

        %>

        <table class="table">
            <tr><th>CodigoMascota</th><th>Nombre</th><th>Celda</th><th>Sexo</th><th>Raza</th><th></th></tr>



            <form action="insertaPerro.jsp" method="GET"
                  <tr>
                    <td>

                    </td>
                    <td>
                        <div class="form-group">
                            <input type="text" name="NomMascota">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <input type="text" name="Celda">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <input type="text" name="Sexo">
                        </div>
                    </td>
                    <td>
                        <div class="form-group">

                            <select name="CodRaza">

                                <%ResultSet listadoRaza = s.executeQuery("SELECT * FROM raza ");
                                  while (listadoRaza.next()) {
                                %>

                                <option value="<%=listadoRaza.getString("CodRaza")%>"><%=listadoRaza.getString("NomRaza")%>
                                </option>
                                <%
                             }
                                %>
                            </select>

                        </div>
                    </td>
                    <td><button type="submit" class="btn btn-primary"><i class="fas fa-user-plus"></i></button></td>
                </tr>



                <%
                  ResultSet listado = s.executeQuery("SELECT * FROM mascota INNER JOIN raza ON mascota.CodRaza=raza.CodRaza");
                  while (listado.next()) {
               %>
                <tr>
                    <td><%= listado.getString("CodMascota")%></td>
                    <td><%= listado.getString("NomMascota")%></td>
                    <td><%= listado.getString("NumCelda")%></td>
                    <td><%= listado.getString("Sexo")%></td>
                    <td><%= listado.getString("NomRaza")%></td>
                    <td>
                         <a
                        class="btn btn-warning"
                        href="modificaPerro.jsp?CodMascota=<%= listado.getString("CodMascota")%>&NomMascota=<%= listado.getString("NomMascota")%>&NumCelda=<%= listado.getString("NumCelda")%>&Sexo=<%= listado.getString("Sexo")%>&CodRaza=<%= listado.getString("CodRaza")%>" role="button"><i class="fas fa-pencil-alt"></i></a>
                        <a class="btn btn-danger" href="borraPerro.jsp?CodMascota=<%= listado.getString("CodMascota")%>" role="button"><i class="fas fa-trash-alt"></i></a>
                    </td>
                    
                </tr>
                <%
                  }
                  conexion.close();
                %>

        </table>


    </body>
</html>
