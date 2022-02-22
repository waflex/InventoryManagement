const express = require("express");
const morgan = require("morgan");
const { create } = require("express-handlebars");
const path = require("path");
const { urlencoded } = require("express");
const flash = require("connect-flash");
const esession = require('express-session');
const MySQLStore = require('express-mysql-session');
const { database } = require("./keys");
const passport = require('passport');

//Inicializacion
const app = express();
require('./lib/passport');

//Configuraciones
app.set("port", process.env.PORT || 4000);
app.set("views", path.join(__dirname, "views"));

app.engine(
    ".hbs",
    create({
        defaultLayout: "main",
        layoutsDir: path.join(app.get("views"), "layouts"),
        partialsDir: path.join(app.get("views"), "partials"),
        extname: ".hbs",
        helpers: require("./lib/handlebars"),
    }).engine
);
app.set("view engine", ".hbs");

/*
Handelbars te odio, pero basicamente se declaro como { create } con el objetivo de llamar el metodo create de handlebars 
y lograr crear el motor de forma personalizada y no lo que viene por defecto asi bien ordenadico
*/


//Middelware
app.use(esession({
    secret: 'DevNotCooked_(JRT)',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database),
}));
app.use(flash());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: true }));
app.use(passport.initialize());
app.use(passport.session());



//Variables Globales
app.use((req, res, next) => {
    app.locals.success = req.flash('success');
    app.locals.Logged = req.flash('Logged');
    app.locals.NotMatch = req.flash('NotMatch');
    app.locals.NoUser = req.flash('NoUser');
    app.locals.OutStock = req.flash('OutStock');
    app.locals.usuarioActivo = req.user;
    app.locals.level3 = req.session.level3;
    app.locals.level2 = req.session.level2;
    app.locals.productos = req.session.productos;
    app.locals.CantidadTotal = req.session.CantidadTotal;
    next();
});


//Rutas
app.use(require("./routes"));
app.use(require("./routes/autentication"));
app.use('/Inventario', require("./routes/Inventario"));
app.use('/Solicitudes', require('./routes/Solicitudes'));
app.use(require('./routes/Pruebas'));


//PUBLIC
app.use(express.static(path.join(__dirname, 'public')));




//Inicio Server 
app.listen(app.get("port"), () => {
    console.log("Server on Port", app.get("port"));
});