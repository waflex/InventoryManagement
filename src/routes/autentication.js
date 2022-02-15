const express = require("express");
const router = express.Router();

const pool = require("../database");
const passport = require('passport');


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

router.get("/NuevoUsuario", (req, res) => {
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
router.get("/Perfil", (req, res) => {
    res.render('Perfil');

});

module.exports = router;