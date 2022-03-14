const express = require("express");
const router = express.Router();
var paginate = require('handlebars-paginate');
const pool = require("../database");
const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
const { mkIdSol, makeid } = require('../lib/Ids');
const fechas = require("../lib/format fechas");
const helpers = require("../lib/Helpers");
const Handlebars = require("handlebars");
var paginate = require('handlebars-paginate');
Handlebars.registerHelper('paginate', paginate);


///INICIO SESION

router.get("/Login", (req, res) => {
    res.render("Auth/Login");
});


router.post("/Login", (req, res, next) => {
    passport.authenticate('local.login', {
        successRedirect: '/Perfil',
        failureRedirect: '/Login',
        failureFlash: true
    })(req, res, next);
});


//CREAR USUARIOS

router.get("/NuevoUsuario", isLoggedIn, (req, res) => {
    res.render("Auth/NuevoUsuario");
});

//FORMA 1 PARA CREACION CON PASSPORT

/*router.post("/NuevoUsuario", (req, res) => {
    passport.authenticate('local.signup', {
        successRedirect: '/Perfil',
        failureRedirect: '/NuevoUsuario',
        failureFlash: true
    });
    res.send("inicio");
});*/


//FORMA 2 CREACION CON PASSPORT
router.post('/Auth/NuevoUsuario', passport.authenticate('local.signup', {
    successRedirect: '/Perfil',
    failureRedirect: '/NuevoUsuario',
    failureFlash: true
}));



//REDIRECCIONAMIENTO USUARIO INICIADO
router.get("/Perfil", isLoggedIn, (req, res) => {
    res.render('Perfil');
});


//CAMBIAR CONTRASEÑA
router.get("/CambiarContrasena", isLoggedIn, (req, res) => {

    res.render('Auth/CambiarContrasena');

});

router.post('/Auth/CambiarContrasena', isLoggedIn, helpers.Compare, async(req, res) => {
    req.flash("success", "Su contraseña ha sido actualizada");
    res.redirect('../Perfil');
});




//CERRAR SESION MIRA LA WEA FACIL, MANSO WEBEO PA INICIAR SESION Y PA CERRAR?
router.get('/logout', isLoggedIn, (req, res) => {
    req.session.level3 = false;
    req.session.level2 = false;
    req.session.cart = null;
    req.session.CantidadTotal = null;
    req.session.productos = null;
    req.logOut();
    res.redirect('/');
});


router.get("/ControlUsuarios", isLoggedIn, async(req, res) => {
    var maxPages = await pool.query("SELECT * FROM users");
    const perPage = parseInt(maxPages.length / 10) + 1;
    const page = req.query.p;
    var min;
    var max;
    if (req.query.p > 1) {
        min = (((req.query.p * 10) - 10) + 1);
        max = req.query.p * 10;
    } else {
        min = ((req.query.p * 10) - 10);
        max = req.query.p * 10;
    }
    var sql = "SELECT * FROM users WHERE ID != '" + req.user.ID + "' LIMIT " + min + "," + max;
    var data = await pool.query(sql);
    var b = 0;
    for (let i in data) {
        Object.assign(data[i], { Nav: "A" + b });
        b++;
    }
    res.render("Auth/ControlUsuarios", {
        pagination: {
            page: req.query.p,
            pageCount: perPage

        },
        data
    });
});

router.post("/ControlUsuarios", isLoggedIn, async(req, res) => {
    var maxPages = await pool.query("SELECT * FROM users");
    const perPage = parseInt(maxPages.length / 10) + 1;
    if (!req.query.p) { req.query.p = 1; }
    const page = req.query.p;
    var min;
    var max;
    if (req.query.p > 1) {
        min = (((req.query.p * 10) - 10) + 1);
        max = req.query.p * 10;
    } else {
        min = ((req.query.p * 10) - 10);
        max = req.query.p * 10;
    }
    var sql = "SELECT * FROM users WHERE 1";

    if (req.body.ID != "") {
        sql += " AND ID LIKE '%" + req.body.ID + "%'";
    }

    if (req.body.Institucion != "Seleccione Institucion") {
        sql += " AND Institucion = '" + req.body.Institucion + "'";
    }

    if (req.body.Cargo != "Seleccione Cargo") {
        sql += " AND Cargo = '" + req.body.Cargo + "'";
    }

    sql += " LIMIT " + min + "," + max;

    var data = await pool.query(sql);

    res.render("Auth/ControlUsuarios", {
        pagination: {
            page: req.query.p,
            pageCount: perPage

        },
        data
    });
});

router.get("/ModificarUsuario/:ID", isLoggedIn, async(req, res) => {
    const { ID } = req.params;
    var usuario = await pool.query('SELECT * FROM users WHERE ID =?', ID);
    usuario = usuario[0];
    //Conversion Fecha a String para concatenar texto
    var fecha = usuario.F_add.toString();
    var parts = fecha.split(" ");
    usuario.F_add =
        "El dia " +
        fechas.formatoDia(parts[0]) +
        " " +
        parts[2] +
        " de " +
        fechas.formatoMes(parts[1]) +
        " " +
        parts[3] +
        " a las " +
        parts[4] +
        " Hrs"; //El dia 22 de Febrero, a las 00:00:00 Hrs

    res.render("Auth/ModificarUsuario", { usuario });
});

router.post("/ModificarUsuario/:ID", isLoggedIn, async(req, res) => {
    const { Nom_usu, Cargo, ID, Institucion } = req.body;
    const user = {
        ID,
        Nom_usu,
        Cargo,
        Institucion
    };

    await pool.query('UPDATE users SET ? WHERE ID = ?', [user, ID]);
    req.flash('success', 'Usuario Modificado Existosamente');
    res.redirect("/ModificarUsuario/" + ID);
});



router.get("/Movimientos/:ID", async(req, res) => {
    const ID = req.params.ID;
    const data = await pool.query('SELECT * FROM modificaciones_productos WHERE Id_Usuario =?', ID);
    //ID to Nombre
    for (let i in data) {
        var nombre = await pool.query('Select * from productos where  Id_Producto= ?', data[i].Id_Producto);
        data[i].Id_Producto = nombre[0].N_Producto;
    }

    res.render("Auth/Movimientos", { data });
});

module.exports = router;