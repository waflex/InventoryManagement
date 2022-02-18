const express = require("express");
const router = express.Router();
const ids = require('../lib/Ids');

const pool = require("../database");
const { isLoggedIn, isEmpty } = require("../lib/auth");
const carro = require("../lib/Carrito");
const { OutStock } = require('../lib/Helpers');

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

router.post("/AgregarSolicitud/:Id_Producto", OutStock, isLoggedIn, async(req, res) => {
    var cant = parseInt(req.body.Cantidad);
    const { Id_Producto } = req.params;
    var soli = new carro(req.session.cart ? req.session.cart : {});
    var prod = await pool.query("SELECT * FROM productos WHERE Id_Producto= ?", [Id_Producto]);
    prod = prod[0];
    id = prod.Id_Producto;
    soli.agregar(prod, prod.Id_Producto, cant);
    req.session.cart = soli; ////IMPORTANTE ALMACENAR LOS DATOS EN LA SESION, SINO ESTARAS 3 HORAS BUSCANDO XQ CHUCHA NO FUNCIONA
    req.session.productos = true;
    res.redirect("../../Solicitudes");
});

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
router.get("/EliminarProducto/:Id_Producto", isEmpty, isLoggedIn, (req, res) => {
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
});

router.get("/Estado", isLoggedIn, isEmpty, (req, res) => {
    var Productos = req.session.productos;

    if (!req.session.cart) {

        return res.render("Solicitudes/Estado", { Productos });
    } else {
        var cart = new carro(req.session.cart);
        return res.render("Solicitudes/Estado", {
            elementos: cart.generarArray(),
            cantTotal: cart.CantTotal,
            Productos

        });
    }
});

router.post('/EnviarSolicitud', async(req, res) => {
    var prods = JSON.stringify(req.session.cart.items, null, '\t');
    const solicitud = {
        Id_Solicitud: ids.makeid(10),
        Id_Usuario: req.user.ID,
        PSolicitados: prods,
        Estado: "En Proceso",
        Id_Usuario_Entrega: null,
        Observacion: null,
        PrEntregados: null
    };
    await pool.query('INSERT INTO `solicitudes` set ?', [solicitud]);
    req.session.cart = null;
    req.flash('success', 'Solicitud Enviada');
    res.redirect('../../Solicitudes');
});

router.get('/Informacion/:ID', async(req, res) => {
    var prods = JSON.stringify(req.session.cart.items, null, '\t');
    const solicitud = {
        Id_Solicitud: ids.makeid(10),
        Id_Usuario: req.user.ID,
        PSolicitados: prods,
        Estado: "En Proceso",
        Id_Usuario_Entrega: null,
        Observacion: null,
        PrEntregados: null
    };
    await pool.query('INSERT INTO `solicitudes` set ?', [solicitud]);
    req.session.cart = null;
    req.flash('success', 'Solicitud Enviada');
    res.redirect('../../Solicitudes');
});

router.get('/MisSolicitudes', isLoggedIn, async(req, res) => {
    var solicitudes = await pool.query("SELECT * FROM solicitudes WHERE Id_Usuario = ?", [req.user.ID]);
    //console.log(solicitudes);
    for (let v in solicitudes) {
        let str = solicitudes[v].PSolicitados;
        let obj = JSON.parse(str);
        solicitudes[v].PSolicitados = obj;
    }
    res.render('Solicitudes/MisSolicitudes', { solicitudes });
});
router.get('/SolicitudesGenerales', isLoggedIn, async(req, res) => {
    var solicitudes = await pool.query("SELECT * FROM solicitudes");
    //console.log(solicitudes);
    for (let v in solicitudes) {
        let str = solicitudes[v].PSolicitados;
        let obj = JSON.parse(str);
        solicitudes[v].PSolicitados = obj;
    }
    var usuarios;
    res.render('Solicitudes/SolicitudesGenerales', { solicitudes });
});


module.exports = router; ///la wea mas imporante para control de rutas, no olvidar