const mysql = require('mysql2');
const { promisify } = require('util');


const { database } = require('./keys');

const pool = mysql.createPool(database);
pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('LA CONEXION CON LA BD FUE CERRADA');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('LA BASE DE DATOS TIENE DEMASIADAS CONEXIONES');
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('LA CONEXION CON LA BASE DE DATOS FUE RECHAZADA, VERIFIQUE CREDENCIALES');
        }
    }

    if (connection) connection.release();
    console.log('CONECTADO A LA BASE DE DATOS');
    return;
});


//Recordar Al iniciar Sesion UPDATE `users` SET `Lst_conn`=CURRENT_TIMESTAMP WHERE `ID`="Admin";

//Promisify Pool Querys Con esto puedo hacer consultas y permitirme esperar la respuesta, para un mejor manejo de conexiones
pool.query = promisify(pool.query);

module.exports = pool;