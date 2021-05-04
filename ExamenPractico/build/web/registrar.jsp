<%-- 
    Document   : registrar
    Created on : May 2, 2021, 4:37:03 PM
    Author     : Azurim-Chuba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" 
        language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuarios</title>
        <link rel="stylesheet" href="./css/colores.css">
    </head>
    <body>
        <header><img src="./img/78229efd84acddf7358bffeb61a64557.png" width="110px" height="110px" id="logo"></img>
            <img src="./img/iconfinder_multimedia-05_2849831.png" width="70px" height="70px" id="user"></img></header>
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
    //voy a lanzar una vista para cuando hace una insercion,
    //cuando hay error en la lectura de la tabla
    //hay error por parte del bd
    
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url, userName, password);

            try{
                String nombre, appat, apmat, dir, nombreusu, q, fnac;
                int edad, telpar, telcel,contra;             
                nombreusu = request.getParameter("nombreusu");
                nombre = request.getParameter("nombre");
                appat = request.getParameter("appat");
                apmat = request.getParameter("apmat");
                edad = Integer.parseInt(request.getParameter("edad"));
                fnac = request.getParameter("fecha");
                dir = request.getParameter("dom");
                telpar = Integer.parseInt(request.getParameter("telpart"));
                telcel = Integer.parseInt(request.getParameter("telcel"));
                contra = Integer.parseInt(request.getParameter("contra"));

                set = con.createStatement();

                /*q = "insert into usuarios(Nombre De Usuario, Nombre, Apellido Paterno, Apellido Materno,"
                        + "Edad, fecha, Domicilio, Telefono Particular, Celular, Contraseña)"
                        + "values ('"+nombreusu+"', '"+nombre+"', '"+appat+"', '"+apmat+"', "+edad+","
                        + "'"+fnac+"', '"+dir+"', "+telpar+", "+telcel+", '"+contra+"')";*/
                q = "insert into usuarios(`Nombre De Usuario`, `Nombre`, `Apellido Paterno`, `Apellido Materno`, `Edad`, `Domicilio`, `Telefono Particular`, `Celular`, `Contraseña`, `fecha`) values('"+nombreusu+"','"+nombre+"','"+appat+"','"+apmat+"','"+edad+"','"+dir+"','"+telpar+"','"+telcel+"','"+contra+"','"+fnac+"')";
                int registro = set.executeUpdate(q);
                
                %>
        <h1>Registro Exitoso</h1>
                <%
                    set.close();
            }catch(SQLException e){
                System.out.println("Error al registrar en la tabla");
                System.out.println(e.getMessage());
                %>
        <h1>Registro No Exitoso, error en la lectura de la tabla</h1>
                <%
            }
            con.close();
        }catch(Exception e){
            System.out.println("Error al conectar a la BD");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            %>
        <h1>Sitio en construccion</h1>
                <%
        }
            %>
            <a href="index.html">Regresar al menu principal</a>
    </body>
</html>
