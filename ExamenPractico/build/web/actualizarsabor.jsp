<%-- 
    Document   : actualizarsabor
    Created on : May 2, 2021, 5:51:01 PM
    Author     : Azurim-Chuba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Sabor</title>
        <link rel="stylesheet" href="./CSS/colores.css">
    </head>
    <body>
        <header><img src="./CSS/Logo.png" width="110px" height="110px" id="logo2">
            <a href="" id="up">Gestionar Promociones</a><a href="" id="up2">Gestionar Productos</a>
            <img src="./CSS/User.png" width="70px" height="70px" id="user2"></header>
            <div class="container" id="sabores">
                <% 
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/examenpsw";
            userName = "root";
            password = "Violetta2004";
            driver = "com.mysql.jdbc.Driver";
            //voy a lanzar una vista para cuando hace la insercion, cuando 
            //hay error en la lectura de la tabla
            //hay error por parte de bd
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    String nombre, nuevo, q;
                    nombre = request.getParameter("sabor1");
                    nuevo = request.getParameter("sabor2");
                    
                    set = con.createStatement();
                    
                    q = "update sabores set Nombre = '"+nuevo+"' where Nombre = '"+nombre+"'";
                    
                    int actualizar = set.executeUpdate(q);
                    
                    %>
        <h1>Registro Exitoso</h1>            
                    <%
                        set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
        <h1>Registro No Exitoso, error en la lectura de la tabla</h1>            
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            %>
        <h1>Sitio en Construcción</h1>            
                    <%
            }
            %>
            </div>
            <br>
            <a href="SaboresAdmin.jsp" id="regsabores3">Regresar a Sabores</a>
    </body>
</html>
