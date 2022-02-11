const express = require("express");
const router = express.Router();

const pool = require("../database");

//Links Pag Principal Inventario
router.get('/', async(req, res) => {
    const data = await pool.query('SELECT * FROM productos');
    res.render("Inventario/Listado", { data });
});



//Links Y Procedimientos Agregar
router.get("/Agregar", (req, res) => {
    res.render("Inventario/Agregar");
});
router.post("/Agregar", async(req, res) => {
    const { NombreP, StockA, StockMin, Institucion, Tipo, Ubicacion, Observacion } = req.body;
    const NuevoProducto = {
        Id_Producto: makeid(5),
        N_Producto: NombreP,
        Stock_Actual: StockA,
        Stock_Minimo: StockMin,
        Institucion,
        Tipo,
        Ubicacion,
        Observacion,
        Func_Agrega: ""

    };
    console.log(NuevoProducto);
    await pool.query('INSERT INTO `productos` set ?', [NuevoProducto]);
    res.render("Inventario/Agregar");
});

module.exports = router;

//Links Modificacion
router.post("/Modificar", (req, res) => {
    console.log(req.body);
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