<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Registro</title>
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
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            String url, userName, password, driver;
            url = "jdbc:mysql://localhost/examenpsw";
            userName = "root";
            password = "uata040302";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    String dinero, porcentaje, q;
                    dinero = request.getParameter("dineroActualizar");
                    porcentaje = request.getParameter("porcentajeActualizar");
                    int id = Integer.parseInt(request.getParameter("idPorcentajeActualizar"));
                    
                    q = "update promociones set descuento = '"+porcentaje+"', precio = '"+dinero+"' where id = "+id+"";                    
                    
                    set = con.createStatement();
                    
                    int actuzalizar = set.executeUpdate(q);
                    
                    %>
            <h1>Registro Actualizado con Exito</h1>        
                    <%
                    set.close();
                
                }catch(SQLException ed){
                    System.out.println("Error al actualizar el registro de la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Registro No Actualizado con Exito, error en el recurso, solo juguito again</h1>        
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
        
        <br>
                    <a href="index.html" >Regresar al Menú Principal</a>
                    <br>
                    <a href="promociones.jsp" >Consulta la tabla de promociones</a> 
        
        </div>
        <footer>
            <p>Equipo 8</p>
            <p>Lopez Castillo Azurim</p>
            <p>Tellez de la cruz Esaul</p>
            <p>Ugalde Tellez Aaron</p>
        </footer>
                </body>
</html>
