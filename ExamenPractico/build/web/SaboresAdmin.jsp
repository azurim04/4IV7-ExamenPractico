<%-- 
    Document   : SaboresAdmin
    Created on : May 1, 2021, 3:13:14 PM
    Author     : Azurim-Chuba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Sabores</title>
        <link rel="stylesheet" href="./CSS/colores.css">
    </head>
    <body>
        <header><img src="./CSS/Logo.png" width="110px" height="110px" id="logo2">
            <a href="" id="up">Gestionar Promociones</a><a href="" id="up2">Gestionar Productos</a>
            <img src="./CSS/User.png" width="70px" height="70px" id="user2"></header>
            <div class="container" id="sabores">
            <h1>Sabores</h1>
            <hr>
            <aside id="form">
                <section id="agregar">
                    <h2>Agregar</h2>
                    <form name="formularioagregar" method="post" action="agregarsabor.jsp">
                        <label>Nombre del sabor:</label>
                        <input class="cadena" name="agregar" maxlength="11">
                        <br>
                        <input type="submit" value="Agregar">
                    </form>
                </section>
                <br>
                <section id="actualizar">
                    <h2>Actualizar</h2>
                    <form name="formularioactualizar" method="post" action="actualizarsabor.jsp">
                        <label>Nombre del sabor anterior:</label>
                        <input class="cadena" name="sabor1"maxlength="11">
                        <br>
                        <label>Nombre del sabor nuevo:</label>
                        <input class="cadena" name="sabor2" maxlength="11">
                        <br>
                        <input type="submit" value="Actualizar">
                    </form>
                </section>
                <br>
                <section id="eliminar">
                    <h2>Eliminar</h2>
                    <form name="formularioeliminar" method="post" action="eliminarsabor.jsp">
                        <label>Nombre del sabor a eliminar:</label>
                        <input class="cadena" name="eliminar" maxlength="11">
                        <br>
                        <input type="submit" value="Eliminar">
                    </form>
                </section>
            </aside>
            <aside id="tabla">
                <h1>Tabla de Sabores</h1>
                <br>
                <table border="2">
                <thead>
                    <tr>
                        <th>Nombre</th>
                    </tr>
                </thead>
                <tbody>
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
                            String q = "select * from sabores order by Nombre asc";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                            %>
                    <tr>
                        <td><%=rs.getString("Nombre")%></td>
                    </tr>
                            <%
                            }
                            rs.close();
                            set.close();

                        }catch(SQLException ed){
                            System.out.println("Error al consultar los sabores");
                            System.out.println(ed.getMessage());
                            %>
                    </tbody>
                    <h3>Recurso no disponible, sucedio un error</h3>
                            <%
                        }
                        con.close();

                    }catch(Exception e){
                        System.out.println("Error al conectar a la bd");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        %>
                <h1>Sitio en construccion</h1>
                        <%
                    }
                    
                            
                    %>
                
                </table>
            </aside>
        </div>
        <br>
        <footer>
            <p>Equipo 8</p>
            <p>Lopez Castillo Azurim Sua</p>
            <p>Tellez de la Cruz Esaul</p>
            <p>Ugalde Tellez Aron</p>
        </footer>
    </body>
</html>
