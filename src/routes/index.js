const express = require('express');
const { redirect } = require('express/lib/response');
const { isEmpty, isLoggedIn } = require('../lib/auth');
const router = express.Router();

//Rutas

router.get('/', isEmpty, (req, res) => {
    res.render('index');
});


//Exportacion de variables

module.exports = router;