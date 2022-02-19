const express = require("express");
const router = express.Router();
const ids = require("../lib/Ids");
const fechas = require("../lib/format fechas");
const pool = require("../database");
const { isLoggedIn, isEmpty } = require("../lib/auth");
const carro = require("../lib/Carrito");
const { OutStock } = require("../lib/Helpers");

router.get("/", isLoggedIn, async(req, res) => {
    const data = await pool.query("SELECT * FROM productos");
    const result = [];
    for (let key in data) {
        if (data[key].Stock_Actual < data[key].Stock_Minimo) {
            result.push(
                Object.assign({}, data[key], {
                    status: true,
                })
            );
        } else if (
            data[key].Stock_Actual == data[key].Stock_Minimo ||
            data[key].Stock_Actual == data[key].Stock_Minimo + 1
        ) {
            result.push(
                Object.assign({}, data[key], {
                    StatusEq: true,
                })
            );
        } else {
            result.push(
                Object.assign({}, data[key], {
                    status: false,
                })
            );
        }
    }
    res.render("Solicitudes/Listas", { result });
});

router.post("Solicitudes/Listas", isLoggedIn, (req, res) => {
    res.render("/Listas");
});

router.post(
    "/AgregarSolicitud/:Id_Producto",
    OutStock,
    isLoggedIn,
    async(req, res) => {
        var cant = parseInt(req.body.Cantidad);
        const { Id_Producto } = req.params;
        var soli = new carro(req.session.cart ? req.session.cart : {});
        var prod = await pool.query(
            "SELECT * FROM productos WHERE Id_Producto= ?", [Id_Producto]
        );
        prod = prod[0];
        id = prod.Id_Producto;
        soli.agregar(prod, prod.Id_Producto, cant);
        req.session.cart = soli; ////IMPORTANTE ALMACENAR LOS DATOS EN LA SESION, SINO ESTARAS 3 HORAS BUSCANDO XQ CHUCHA NO FUNCIONA
        req.session.productos = true;
        res.redirect("../../Solicitudes");
    }
);

router.get("/Eliminar1/:Id_Producto", isEmpty, isLoggedIn, (req, res) => {
    const { Id_Producto } = req.params;
    var soli = new carro(req.session.cart ? req.session.cart : {});
    soli.recudir1(Id_Producto);
    req.session.cart = soli;
    if (req.session.cart.CantTotal == 0) {
        req.session.productos = false;
        res.redirect("../../Solicitudes");
    } else {
        res.redirect("../../Solicitudes/Estado");
    }
});
router.get(
    "/EliminarProducto/:Id_Producto",
    isEmpty,
    isLoggedIn,
    (req, res) => {
        const { Id_Producto } = req.params;
        var soli = new carro(req.session.cart ? req.session.cart : {});
        soli.eliminarProd(Id_Producto);
        req.session.cart = soli;
        if (req.session.cart.CantTotal == 0) {
            req.session.productos = false;
            res.redirect("../../Solicitudes");
        } else {
            res.redirect("../../Solicitudes/Estado");
        }
    }
);

router.get("/Estado", isLoggedIn, isEmpty, (req, res) => {
    var Productos = req.session.productos;

    if (!req.session.cart) {
        return res.render("Solicitudes/Estado", { Productos });
    } else {
        var cart = new carro(req.session.cart);
        return res.render("Solicitudes/Estado", {
            elementos: cart.generarArray(),
            cantTotal: cart.CantTotal,
            Productos,
        });
    }
});

router.post("/EnviarSolicitud", async(req, res) => {
    var prods = JSON.stringify(req.session.cart.items, null, "\t");
    const solicitud = {
        Id_Solicitud: ids.makeid(10),
        Id_Usuario: req.user.ID,
        PSolicitados: prods,
        Estado: "En Proceso",
        Id_Usuario_Entrega: null,
        Observacion: null,
        PrEntregados: null,
    };
    await pool.query("INSERT INTO `solicitudes` set ?", [solicitud]);
    req.session.cart = null;
    req.flash("success", "Solicitud Enviada");
    res.redirect("../../Solicitudes");
});

router.get("/Informacion/:ID", async(req, res) => {
    var prods = JSON.stringify(req.session.cart.items, null, "\t");
    const solicitud = {
        Id_Solicitud: ids.makeid(10),
        Id_Usuario: req.user.ID,
        PSolicitados: prods,
        Estado: "En Proceso",
        Id_Usuario_Entrega: null,
        Observacion: null,
        PrEntregados: null,
    };
    await pool.query("INSERT INTO `solicitudes` set ?", [solicitud]);
    req.session.cart = null;
    req.flash("success", "Solicitud Enviada");
    res.redirect("../../Solicitudes");
});

router.get("/MisSolicitudes", isLoggedIn, async(req, res) => {
    var solicitudes = await pool.query(
        "SELECT * FROM solicitudes WHERE Id_Usuario = ?", [req.user.ID]
    );
    //console.log(solicitudes);
    for (let v in solicitudes) {
        let str = solicitudes[v].PSolicitados;
        let obj = JSON.parse(str);
        solicitudes[v].PSolicitados = obj;
    }
    res.render("Solicitudes/MisSolicitudes", { solicitudes });
});

router.get("/SolicitudesGenerales", isLoggedIn, async(req, res) => {
    var solicitudes = await pool.query("SELECT * FROM solicitudes");
    var nombre;
    //console.log(solicitudes);
    for (let v in solicitudes) {
        nombre = await pool.query("SELECT Nom_usu FROM users WHERE ID = ?", [
            solicitudes[v].Id_Usuario,
        ]);
        solicitudes[v].Id_Usuario = nombre[0].Nom_usu;
        if (solicitudes[v].Estado == "Entregada") {
            //Asignacion de icono
            solicitudes[v].Estado =
                solicitudes[v].Estado +
                ' <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-check" viewBox="0 0 16 16">\n' +
                '<path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>\n' +
                '<path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>\n' +
                '<path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>\n' +
                "</svg>";
        }
        if (solicitudes[v].Estado == "Cancelada") {
            //Asignacion de icono
            solicitudes[v].Estado =
                solicitudes[v].Estado +
                ' <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">\n' +
                '<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>\n' +
                '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>\n' +
                "</svg>";
        }
        if (solicitudes[v].Estado == "En Proceso") {
            //Asignacion de icono
            solicitudes[v].Estado =
                solicitudes[v].Estado +
                ' <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">\n' +
                '<path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>\n' +
                '<path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>' +
                "</svg>";
        }
        let str = solicitudes[v].PSolicitados;
        let obj = JSON.parse(str);
        solicitudes[v].PSolicitados = obj;
    }
    res.render("Solicitudes/SolicitudesGenerales", { solicitudes, nombre });
});

router.get("/DetallesSolicitud/:Id_Solicitud", isLoggedIn, async(req, res) => {

    //Obtencion datos solicitud
    var Id_Solicitud = req.params.Id_Solicitud;
    var solicitudes = await pool.query("SELECT * FROM solicitudes WHERE Id_Solicitud=?", [Id_Solicitud]);

    //Conversion Productos a objeto
    let str = solicitudes[0].PSolicitados;
    let obj = JSON.parse(str);
    solicitudes[0].PSolicitados = obj;
    //Conversion Rut a Nombre
    nombre = await pool.query("SELECT Nom_usu FROM users WHERE ID = ?", [
        solicitudes[0].Id_Usuario,
    ]);
    solicitudes[0].Id_Usuario = nombre[0].Nom_usu;

    //Asignacion Icono segun estado Solicitud
    if (solicitudes[0].Estado == "Entregada") {
        //Asignacion de icono
        solicitudes[0].Estado =
            solicitudes[0].Estado +
            ' <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard-check" viewBox="0 0 16 16">\n' +
            '<path fill-rule="evenodd" d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>\n' +
            '<path d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>\n' +
            '<path d="M9.5 1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5h3zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3z"/>\n' +
            "</svg>";
    }
    if (solicitudes[0].Estado == "Cancelada") {
        //Asignacion de icono
        solicitudes[0].Estado =
            solicitudes[0].Estado +
            ' <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">\n' +
            '<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>\n' +
            '<path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>\n' +
            "</svg>";
    }
    if (solicitudes[0].Estado == "En Proceso") {
        //Asignacion de icono
        solicitudes[0].Estado =
            solicitudes[0].Estado +
            ' <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-stopwatch" viewBox="0 0 16 16">\n' +
            '<path d="M8.5 5.6a.5.5 0 1 0-1 0v2.9h-3a.5.5 0 0 0 0 1H8a.5.5 0 0 0 .5-.5V5.6z"/>\n' +
            '<path d="M6.5 1A.5.5 0 0 1 7 .5h2a.5.5 0 0 1 0 1v.57c1.36.196 2.594.78 3.584 1.64a.715.715 0 0 1 .012-.013l.354-.354-.354-.353a.5.5 0 0 1 .707-.708l1.414 1.415a.5.5 0 1 1-.707.707l-.353-.354-.354.354a.512.512 0 0 1-.013.012A7 7 0 1 1 7 2.071V1.5a.5.5 0 0 1-.5-.5zM8 3a6 6 0 1 0 .001 12A6 6 0 0 0 8 3z"/>' +
            "</svg>";
    }

    //Conversion Fecha a String para concatenar texto
    var fecha = solicitudes[0].F_Solicitud.toString();
    var parts = fecha.split(" ");
    solicitudes[0].F_Solicitud = "El dia " + fechas.formatoDia(parts[0]) + " " + parts[2] + " de " + fechas.formatoMes(parts[1]) + " " + parts[3] + " a las " + parts[4] + " Hrs"; //El dia 22 de Febrero, a las 00:00:00 Hrs

    //Impresiones en consola


    //Almacenar todo para envio a hbs
    solicitudes = solicitudes[0];


    res.render("Solicitudes/DetallesSolicitud", { solicitudes });
});

module.exports = router; ///la wea mas imporante para control de rutas, no olvidar