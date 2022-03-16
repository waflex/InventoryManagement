const pool = require('../database');

const ids = {};

ids.mkIdSol = async function(last) {
    console.log(last);
    var ID;
    if (!last[0].Id_Solicitud) {
        ID = "SOL-00001";
        return ID;
    } else {
        last = last[0];
        let aux = last.Id_Solicitud;
        const array = aux.split("-");
        var incrementvalue = (+array[1]) + 1;
        incrementvalue = ("0000" + incrementvalue).slice(-incrementvalue.length);
        array[1] = incrementvalue;
        ID = array[0] + "-" + array[1];
        return ID;
    }
};

ids.mkIdProd = async function(last) {
    console.log(last);
    var ID;
    if (!last[0].Id_Producto) {
        ID = "PROD-00001";
        return ID;
    } else {
        last = last[0];
        let aux = last.Id_Producto;
        const array = aux.split("-");
        var incrementvalue = (+array[1]) + 1;
        incrementvalue = ("0000" + incrementvalue).slice(-incrementvalue.length);
        array[1] = incrementvalue;
        ID = array[0] + "-" + array[1];
        return ID;
    }
};
module.exports = ids;