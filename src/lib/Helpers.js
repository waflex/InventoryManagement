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
    if (!req.session.cart || req.session.cart == null) { return next(); } else {
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
                    return res.redirect('../../Solicitudes/');
                }
            }
        }
    }
    return next();
};

helpers.Compare = async(req, res, next) => {
    var data = await pool.query('SELECT * FROM users WHERE ID = ?', req.user.ID);
    data[0].Cont_usu = await helpers.deryptPassword(req.body.OldPassword, data[0].Cont_usu);

    if (!data[0].Cont_usu) {
        req.flash('NotMatch', 'La contraseña actual no es la correcta');
        res.redirect("../../CambiarContrasena");
    }
    if (!req.body.Newpassword || !req.body.Copypassword) {
        req.flash('NotMatch', 'Debe llenar los campos');
        res.redirect("../../CambiarContrasena");
    } else {
        if (req.body.Newpassword == req.body.Copypassword) {
            req.body.Newpassword = await helpers.encryptPassword(req.body.Newpassword);
            await pool.query('UPDATE users set Cont_usu = ? WHERE ID = ?', [req.body.Newpassword, req.user.ID]);
            return next();
        } else {
            req.flash('NotMatch', 'Las contraseñas no coinciden');
            res.redirect("../../CambiarContrasena");
        }
    }


};
module.exports = helpers;