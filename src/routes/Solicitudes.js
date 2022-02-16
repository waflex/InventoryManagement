const express = require("express");
const router = express.Router();

const pool = require("../database");
const { isLoggedIn } = require("../lib/auth");
const carro = require("../lib/Carrito");

router.get("/", async(req, res) => {
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

router.post("Solicitudes/Listas", (req, res) => {
    res.render("/Listas");
});

router.post("/AgregarSolicitud/:Id_Producto", async(req, res) => {
    /*console.log(req.body);
      console.log(req.params.Id_Producto);*/
    var cant = parseInt(req.body.Cantidad);
    const { Id_Producto } = req.params;
    var soli = new carro(req.session.cart ? req.session.cart : {});
    var prod = await pool.query("SELECT * FROM productos WHERE Id_Producto= ?", [
        Id_Producto,
    ]);
    prod = prod[0];
    soli.agregar(prod, prod.Id_Producto, cant);
    req.session.cart = soli; ////IMPORTANTE ALMACENAR LOS DATOS EN LA SESION, SINO ESTARAS 3 HORAS BUSCANDO XQ CHUCHA NO FUNCIONA
    res.redirect("../");
});

router.get("/Estado", (req, res) => {
    if (!req.session.cart) {
        return res.render("/Estado", { productos: null });
    } else {
        return res.render("/Estado", { productos: true });
    }
});

module.exports = router; ///la wea mas imporante para control de rutas, no olvidar