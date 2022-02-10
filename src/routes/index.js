const express = require('express');
const router = express.Router();

//Rutas

router.get('/', (req, res) => {
    res.render('index');
});


//Exportacion de variables

module.exports = router;