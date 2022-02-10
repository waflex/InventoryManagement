const express = require("express");
const morgan = require("morgan");
const { engine } = require("express-handlebars");
const path = require("path");
const { create } = require("domain");
//Inicializacion
const app = express();


//Configuraciones
app.set('port', process.env.PORT || 4000);
app.engine('handlebars', engine({ extname: '.hbs' }));
app.set('view engine', '.handlebars');
app.set('views', path.join(__dirname, './views'));
app.set('layouts');


/*
app.engine('.hbs', exphbs({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: require('./lib/handlebars')
}))
*/
//Middelware
app.use(morgan("dev"));

//Variables Globales

//Rutas
app.use(require('./routes'));
//PUBLIC

//Inicio Server
app.listen(app.get('port'), () => {
    console.log('Server on Port', app.get('port'));
});