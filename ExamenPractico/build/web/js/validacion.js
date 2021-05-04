function validar(formulario){
    var cadenas = formulario.getElementsByClassName("cadena")
    var numeros = formulario.getElementsByClassName("numero")
    var email = formulario.getElementsByClassName("email")
    var esEmail = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/
    var esNumero = /^[0-9]+$/
    var esCadena = /([A-Za-z])+ ?/
    alert("hola?")
    for(var i=0;i<cadenas.length;i++){
        if (!esCadena.test(cadenas[i].value)){
            alert("recuerda ingresar solo letras y no dejar el espacio vacio")
            return false;
        }
    }
    for(var i=0;i<numeros.length;i++){
        if (!esNumero.test(numeros[i].value)){
            alert("recuerda ingresar solo numeros y no dejar espacios vacios")
            return false;
        }
    }
    for(var i=0;i<email.length;i++){
        if (!esEmail.test(email[i].value)){
            alert("recuerda ingresar solo un email y no dejar el espacio vacio")
            return false;
        }
    }
    return true;
}
function registro(formulario){
    if(validar(formulario)){
        formulario.action = "agregarPromociones.jsp"
    }        
}
function eliminar(formulario){
    if(validar(formulario)){
        formulario.action = "eliminarPromociones.jsp"
    }
}
function actualizar(formulario){
    if(validar(formulario)){
        formulario.action = "actualizarPromociones.jsp"
    }
}
function registrarUsuario (formulario){
    if(validar(formulario)){
        formulario.action = "registrar.jsp"
    }
}