<%-- 
    Document   : agregarPromociones
    Created on : 1/05/2021, 07:03:45 PM
    Author     : Aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuarios</title>
        <link rel="stylesheet" href="./css/colores.css">
    </head>
    <body>
        <header>
            <img src="img/78229efd84acddf7358bffeb61a64557.png" alt="" height="110px" width="110px" id="logo2">
            <img src="img/iconfinder_multimedia-05_2849831.png" alt="" width="70px" height="70px" id="user2">
            <a href="promociones.jsp" id="up">Gestionar promociones</a>
            <a href="SaboresAdmin.jsp" id="up2">Gestionar Sabores</a>
        </header>
        <div class="container">
        <% 
            //aqui va codigo java
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "jdbc:mysql://localhost/examenpsw";
            userName = "root";
            password = "uata040302";
            driver = "com.mysql.jdbc.Driver";
            //voy a lanzar una vista para cuando hace la insercion, cuando 
            //hay error en la lectura de la tabla
            //hay error por parte de bd
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                try{
                    String descuento,precio, q;
                    descuento = request.getParameter("porcentajeAgregar");
                    precio = request.getParameter("dineroAgregar");
                    
                    set = con.createStatement();
                    
                    q = "insert into promociones(descuento, precio) "
                            + "values ('"+descuento+"', '"+precio+"')";
                    int registro = set.executeUpdate(q);
                    
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
        
        
            <a href="index.html" >Regresar al menú principal</a>
            <a href="promociones.jsp" >Consultar la tabla de promociones</a>
        </div>
        <footer>
            <p>Equipo 8</p>
            <p>Lopez Castillo Azurim</p>
            <p>Tellez de la cruz Esaul</p>
            <p>Ugalde Tellez Aaron</p>
        </footer>
    </body>
</html>