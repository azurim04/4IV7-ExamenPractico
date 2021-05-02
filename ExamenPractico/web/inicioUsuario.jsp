<%-- 
    Document   : inicioUsuario
    Created on : 1/05/2021, 11:45:40 PM
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
            <img src="img/78229efd84acddf7358bffeb61a64557.png" height="110px" width="110px" id="logo2" >
            <img src="img/iconfinder_multimedia-05_2849831.png" width="70px" height="70px" id="user2">
            <a href="comprar.html"></a>
        </header>
        <div class="container">
         <div id="tabla">
            <table border="2" width="100%">
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
        </div>
        <footer>
            <p>Equipo 8</p>
            <p>Lopez Castillo Azurim</p>
            <p>Tellez de la cruz Esaul</p>
            <p>Ugalde Tellez Aaron</p>
        </footer>
    </body>
</html>
