const express = require("express");
const router = express.Router();
var paginate = require('handlebars-paginate');
const pool = require("../database");
const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');
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
    console.log(sql);
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
    console.log(usuario);
    res.render("Auth/ModificarUsuario", { usuario });
});

router.post("/ModificarUsuario/:ID", isLoggedIn, async(req, res) => {
    //var cargos = document.getElementById("Cargo").textContent;
    console.log(req.body);
});

module.exports = router;