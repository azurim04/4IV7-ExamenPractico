<%-- 
    Document   : eliminarsabor
    Created on : May 2, 2021, 6:03:24 PM
    Author     : Azurim-Chuba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Sabor</title>
        <link rel="stylesheet" href="./CSS/colores.css">
    </head>
    <body>
        <header><img src="./CSS/Logo.png" width="110px" height="110px" id="logo2">
            <a href="" id="up">Gestionar Promociones</a><a href="" id="up2">Gestionar Productos</a>
            <img src="./CSS/User.png" width="70px" height="70px" id="user2"></header>
            <div class="container" id="sabores">
                <% 
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            String url, userName, password, driver;
            url = "jdbc:mysql://localhost/examenpsw";
            userName = "root";
            password = "Violetta2004";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    String nombre, q;
                    nombre = request.getParameter("eliminar");
                    
                    set = con.createStatement();
                    
                    q = "delete from sabores where Nombre = '"+nombre+"'";
                    
                    int borrar = set.executeUpdate(q);
                    
                    %>
            <h1>Registro Borrado con Exito</h1>        
                    <%
                    set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al borrar el registro de la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Registro No Borrado con Exito, error en el recurso, solo juguito again</h1>        
                    <%
                }
                con.close();
                
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
        <h1>Sitio en Construcción</h1>            
                    <%
            
            }
            %>
            </div>
            <br>
            <a href="SaboresAdmin.jsp" id="regsabores">Regresar a Sabores</a>
    </body>
</html>
