<%-- 
    Document   : promociones
    Created on : 1/05/2021, 02:25:59 PM
    Author     : Aaron
--%>

<%@page import="java.sql.*, java.util.*, java.text.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/colores.css">
    </head>
    <body>
        <header>
            <img src="img/78229efd84acddf7358bffeb61a64557.png" alt="" height="110px" width="110px" id="logo2">
            <img src="img/iconfinder_multimedia-05_2849831.png" alt="" width="70px" height="70px" id="user2">
            <a href="promociones.jsp" id="up">Gestionar promociones</a>
            <a href="SaboresAdmin.jsp" id="up2">Gestionar Sabores</a>
            <script src="./js/validacion.js"></script>
        </header>
        <div class="container">
        <div id="form">
            <form action="" method="POST" id="agregar" onsubmit="return registro(this)">
                <h1>Agregar</h1>
                <p>porcentaje de descuento</p>
                <input type="text" name="porcentajeAgregar" maxlength="2" class="numero">
                <p>cantidad de dinero que se ocupa</p>
                <input type="tect" name="dineroAgregar" maxlength="4" class="numero">
                <input type="submit" value="agregar promocion">
            </form>
            <form action="" method="POST" id="agregar" onsubmit="return actualizar(this)">
                <h1>Actualizar</h1>
                <p>id de la promcion a actualizar</p>
                <input type="text" name="idPorcentajeActualizar" maxlength="4" class="numero">
                <p>porcentaje de descuento</p>
                <input type="text" name="porcentajeActualizar" maxlength="2" class="numero">
                <p>cantidad de dinero que se ocupa</p>
                <input type="text" name="dineroActualizar" maxlength="4" class="numero">
                <input type="submit" value="actualizar promocion">
            </form>
            <form action="" method="POST" id="agregar" class="numero" onsubmit="return eliminar(this)">
                <h1>Eliminar</h1>
                <p>id de la promocion a eliminar</p>
                <input type="text" name="idPorcentajeEliminar" maxlength="4" class="numero">
                <input type="submit" value="eliminar promocion">
            </form>
        </div>
            <table border="2" width="100%" id="tabla">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Descuento</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
            <%
                Connection con = null;
                Statement set = null;
                ResultSet rs = null;
                
                String url, userName, password, Driver;
                url = "jdbc:mysql://localhost/examenpsw";
                userName = "root";
                password = "uata040302";
                Driver = "com.mysql.jdbc.Driver";
                
                try{
                    Class.forName(Driver);
                    con = DriverManager.getConnection(url,userName,password);
                    try{
                       String q = "select * from promociones order by id asc";
                       
                       set = con.createStatement();
                       rs = set.executeQuery(q);
                       while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt("id")%></td>
                    <td><%=rs.getFloat("Descuento")%></td>
                    <td><%=rs.getFloat("Precio")%></td>
                </tr>
                <%
                       }
                       rs.close();
                       set.close();
                    }catch(SQLException ed){
                        System.out.println("Error al consultar la tabla");
                        System.out.println(ed.getMessage());
                %>
                </tbody>
                <h1>Recurso no disponible</h1>
                <%
                }
                con.close();
                }catch(Exception e){
                    System.out.println("Error al conectar con la bd");
                    System.out.println(e.getMessage());
                    System.out.println(e.getStackTrace());
                    %>
                    <h1>Sitio en construccion</h1>
                    <%
                }
            %>
                </tbody>
            </table>
        </div>
        <footer>
            <p>Equipo 8</p>
            <p>Lopez Castillo Azurim</p>
            <p>Tellez de la cruz Esaul</p>
            <p>Ugalde Tellez Aaron</p>
        </footer>
    </body>
</html>
