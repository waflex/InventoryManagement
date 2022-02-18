const bcrypt = require('bcryptjs');
const pool = require('../database');
const carro = require("../lib/Carrito");

const helpers = {};
helpers.encryptPassword = async(contraseña) => {

    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(contraseña, salt); //hash contraseña convertida final final de los finales  
    return hash;

};

helpers.deryptPassword = async(contraseña, ContraseñaBD) => {
    try {
        return await bcrypt.compare(contraseña, ContraseñaBD);
    } catch (error) {
        console.log(error);
    }


};

helpers.OutStock = async(req, res, next) => {
    if (!req.session.cart) { next(); } else {
        const { Id_Producto } = req.params;
        var cant = parseInt(req.body.Cantidad);
        var prod = await pool.query("SELECT * FROM productos WHERE Id_Producto= ?", [
            Id_Producto,
        ]);
        var cart = new carro(req.session.cart);
        let elementos = cart.generarArray();
        prod = prod[0];

        for (let key in elementos) {
            if (Id_Producto == elementos[key].items.Id_Producto) {
                if (elementos[key].qty + cant > prod.Stock_Actual) {

                    req.flash('OutStock', 'Producto no se pudo agregar, sobrepasa el stock actual');
                    res.redirect('../../Solicitudes/');
                }
            }
        }
    }
    next();
};
module.exports = helpers;