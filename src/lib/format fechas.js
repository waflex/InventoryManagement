const fechas = {};

fechas.formatoDia = (dia) => {
    var a = "Mon";
    var b = "Tue";
    var c = "Wed";
    var d = "Thu";
    var f = "Fri";
    var g = "Sat";
    var h = "Sun";
    switch (dia) {
        case a:
            dia = "Lunes";
            return (dia);
        case b:
            dia = "Martes";
            return (dia);
        case c:
            dia = "Miercoles";
            return (dia);
        case d:
            dia = "Jueves";
            return (dia);
        case f:
            dia = "Viernes";
            return (dia);
        case g:
            dia = "Sabado";
            return (dia);
        case h:
            dia = "Domingo";
            return (dia);
    }

};

fechas.formatoMes = (mes) => {
    var a = "Jan";
    var b = "Feb";
    var c = "Mar";
    var d = "Apr";
    var f = "May";
    var g = "Jun";
    var h = "Jul";
    var i = "Aug";
    var j = "Sep";
    var k = "Oct";
    var l = "Nov";
    var m = "Dec";
    switch (mes) {
        case a:
            mes = "Enero";
            return (mes);
        case b:
            mes = "Febrero";
            return (mes);
        case c:
            mes = "Marzo";
            return (mes);
        case d:
            mes = "Abril";
            return (mes);
        case f:
            mes = "Mayo";
            return (mes);
        case g:
            mes = "Junio";
            return (mes);
        case h:
            mes = "Julio";
            return (mes);
        case i:
            mes = "Agosto";
            return (mes);
        case j:
            mes = "Septiembre";
            return (mes);
        case k:
            mes = "Octubre";
            return (mes);
        case l:
            mes = "Noviembre";
            return (mes);
        case m:
            mes = "Diciembre";
            return (mes);
    }

};


module.exports = fechas;