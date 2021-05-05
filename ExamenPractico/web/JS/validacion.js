function validar(e){
    var teclado = (document.all)?e.keyCode:e.which;

    if(teclado == 8) return true;

    var patron = /[0-9\d]/;

    var prueba = String.fromCharCode(teclado);

    return patron.test(prueba);
}

function enviar(){
    var vnomusu = document.formularioregistro.nombreusu.value;
    var vnom = document.formularioregistro.nombre.value;
    var vappat = document.formularioregistro.appat.value;
    var vapmat = document.formularioregistro.apmat.value;
    var vappat = document.formularioregistro.appat.value;
    var vedad = document.formularioregistro.edad.value;
    var redad = parseInt(vedad);
    var vdom = document.formularioregistro.dom.value;
    var vtelp = document.formularioregistro.telpart.value;
    var vtelcel = document.formularioregistro.telcel.value;
    var vcon = document.formularioregistro.contra.value;

    var a =/^[a-zA-Z]{2,10}ñ?\s?[a-zA-Zñ]{1,9}$|^[a-zA-Zñ]{2,9}\s?[a-zA-Zñ]{2,10}$/;//nombre(s)
    var c = /^[01-99]{0,2}$/;//edad
    var d = /^[a-zA-Zñ]{2,10}ñ?$/;//apellidos

    var n = a.test(vnom);
    var p = d.test(vappat);
    var m = d.test(vapmat);
    var e = c.test(redad);

    if (n === true && p === true && m === true && e === true && em === true) {
        document.formulario.action = "";
    }else{
        alert('Error, debes ingresar solo datos validos en cada campo');
    }
}

