const express = require("express");
const router = express.Router();

const pool = require("../database");

router.get("/Login", (req, res) => {
    res.render("Auth/Login");
});
router.post("/Login", (req, res) => {
    res.render("/");
});

module.exports = router;

/*
<!--     <input type="text" name="username" id="username" maxlength="9" size="9"  onchange="compruebaRut(document.forms[0].username.value);" placeholder="Rut" onkeypress="return numbersonly(this, event)" >
    -->*/