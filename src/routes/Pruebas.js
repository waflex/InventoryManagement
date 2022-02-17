const express = require('express');
const router = express.Router();


const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

const carro = require("../lib/Carrito");


router.get("/testing123", (req, res) => {
    res.render('Pruebas');
});
router.post("/testing123", async(req, res) => {
    var json = JSON.stringify(req.body, null, '\t');
    const NuevoProducto = {
        datamax: json,
        numero: 0
    };
    console.log(NuevoProducto);
    await pool.query('INSERT INTO `trash` set ?', [NuevoProducto]);

    res.redirect('testing123');
});
/*router.post("/parse", async(req, res) => {
    const data = await pool.query('SELECT * FROM trash WHERE ID = 1');
    //'{\n\t"id": "123@w123.q",\n\t"ps": "123"\n}'
    for (let v in data) {
        let str = data[v].datamax;
        let obj = JSON.parse(str);
        console.log(obj.ps);
    }

    //await pool.query('INSERT INTO `trash` set ?', [NuevoProducto]);

    res.redirect('testing123');
});*/
router.post("/parse", async(req, res) => {
    var carrin = new carro(req.session.cart ? req.session.cart : {});
    carrin.Empty();
    console.log(Object.keys(req.session.cart));
    res.redirect('testing123');
});

module.exports = router;