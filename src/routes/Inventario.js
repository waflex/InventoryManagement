const express = require("express");
const router = express.Router();

const pool = require("../database");
const { isLoggedIn } = require('../lib/auth')

//Links Pag Principal Inventario
router.get('/', isLoggedIn, async(req, res) => {
    const data = await pool.query('SELECT * FROM productos');
    const result = [];
    for (let key in data) {

        if (data[key].Stock_Actual < data[key].Stock_Minimo) {
            result.push(Object.assign({}, data[key], {
                status: true
            }));
        } else if (data[key].Stock_Actual == data[key].Stock_Minimo || data[key].Stock_Actual == data[key].Stock_Minimo + 1) {
            result.push(Object.assign({}, data[key], {
                StatusEq: true
            }));
        } else {
            result.push(Object.assign({}, data[key], {
                status: false
            }));
        }
    }
    res.render("Inventario/Listado", { result });
});



//Links Y Procedimientos Agregar
router.get("/Agregar", isLoggedIn, (req, res) => {
    res.render("Inventario/Agregar");
});
router.post("/Agregar", async(req, res) => {
    const { N_Producto, Stock_Actual, Stock_Minimo, Institucion, Tipo, Ubicacion, Observacion } = req.body;
    const NuevoProducto = {
        Id_Producto: makeid(5),
        N_Producto,
        Stock_Actual,
        Stock_Minimo,
        Institucion,
        Tipo,
        Ubicacion,
        Observacion,
        Func_Agrega: "Admin"

    };
    await pool.query('INSERT INTO `productos` set ?', [NuevoProducto]);
    req.flash('success', 'Producto Guardado Correctamente');
    res.redirect("/Inventario");
});

module.exports = router;

//Links Modificacion
router.get("/Modificar/:Id_Producto", isLoggedIn, async(req, res) => {
    const { Id_Producto } = req.params;
    const data = await pool.query('SELECT * FROM productos WHERE Id_Producto= ?', [Id_Producto]);

    res.render("Inventario/Modificar", { data: data[0] });
});
router.post("/Modificar/:Id_Producto", async(req, res) => {
    const { Id_Producto, N_Producto, Stock_Actual, Stock_Minimo, Institucion, Tipo, Ubicacion, Observacion } = req.body;
    const NuevoProducto = {

        Id_Producto,
        N_Producto,
        Stock_Actual,
        Stock_Minimo,
        Institucion,
        Tipo,
        Ubicacion,
        Observacion

    };
    await pool.query('UPDATE productos set ? WHERE Id_Producto = ?', [NuevoProducto, NuevoProducto.Id_Producto]);
    req.flash('success', 'Producto Modificado Correctamente');
    res.redirect("/Inventario");
});

//Eliminacion de Productos
router.get("/Eliminar/:Id_Producto", isLoggedIn, async(req, res) => {
    const { Id_Producto } = req.params;
    const data = await pool.query('DELETE FROM productos WHERE Id_Producto= ?', [Id_Producto]);
    req.flash('success', 'Producto Eliminado Correctamente');
    res.redirect("/Inventario");
});

//Creacion de ID's Productos
function makeid(length) {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() *
            charactersLength));
    }
    return result;
}