const express = require('express');
const { isEmpty } = require('../lib/auth');
const router = express.Router();

//Rutas

router.get('/', isEmpty, (req, res) => {
    res.render('index');
});


//Exportacion de variables

module.exports = router;