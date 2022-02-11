const express = require("express");
const morgan = require("morgan");
const { create } = require("express-handlebars");
const path = require("path");
const { urlencoded } = require("express");
//Inicializacion
const app = express();

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
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: true }));


//Variables Globales
app.use((req, res, next) => {
    next();
});


//Rutas
app.use(require("./routes"));
app.use(require("./routes/autentication"));
app.use('/Inventario', require("./routes/Inventario"));


//PUBLIC
app.use(express.static(path.join(__dirname, 'public')));
//Inicio Server 
app.listen(app.get("port"), () => {
    console.log("Server on Port", app.get("port"));
});