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
        <title>Hotel Mascotas</title>
    </head>
    <body id="container">
        <% request.setCharacterEncoding("UTF-8");%>
        <div >
            <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/perrera", "root", "");
              Statement s = conexion.createStatement();

              ResultSet Animal = s.executeQuery("SELECT * FROM Animal order by CodAnimal");
            %>
            <br><br>
            
                <div><img src="foto.png"></div>
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
                              ResultSet Raza = s.executeQuery("SELECT * FROM Raza ORDER BY CodRaza");
                              while (Raza.next()) {
                                out.println("<option value=\"" + Raza.getString("CodRaza") + "\">" + Raza.getString("NomRaza") + "</option>");
                              }
                            %>
                        </select>
                 
                        <br><br>
                    <hr>
                    &nbsp;&nbsp;
                    <button style="float: right;" class="eliminar" type="submit" >Aceptar</button><br><br>
                </form>
                <form method="get" action="index.jsp">
                    <button style="float: right;" type="submit" class="inicio">Cancelar</button>
                </form><br>

            </div>
            <div class="footer">&copy; Juan Luis Aranda</div>
        </div>
    </body>
</html>
