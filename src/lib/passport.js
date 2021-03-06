const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/Helpers');
const { isLoggedIn } = require('../lib/auth');

passport.use('local.login', new LocalStrategy({
        usernameField: 'Usuario',
        passwordField: 'contraseña',
        passReqToCallback: true
    },
    async(req, username, password, done) => {
        const filas = await pool.query('SELECT * FROM users WHERE ID= ?', username);
        if (filas.length > 0) {
            const user = filas[0];
            const ContraValida = await helpers.deryptPassword(password, user.Cont_usu);
            if (ContraValida) {
                if (user.Cargo == "Administrador") {
                    req.session.level3 = true;
                } else if (user.Cargo == "Auxiliar") {
                    req.session.level2 = true;
                } else if (user.Cargo == "Funcionario") {
                    req.session.level2 = false;
                    req.session.level3 = false;
                }

                await pool.query('UPDATE users SET Lst_conn=CURRENT_TIMESTAMP WHERE ID=?', username);
                done(null, user, req.flash('Logged', 'Bienvenido ' + user.Nom_usu));
                //Permisos
            } else {
                done(null, false, req.flash('NotMatch', 'Contraseña Incorrecta'));
            }
        } else {
            return done(null, false, req.flash('NoUser', 'Usuario no encontrado'));
        }
    }));





passport.use('local.signup', new LocalStrategy({
    usernameField: 'ID',
    passwordField: 'Cont_usu',
    passReqToCallback: true

}, async(req, username, password, done) => {
    const { Nom_usu } = req.body;
    const { Cargo } = req.body;
    const { Institucion } = req.body;
    const Usuario = {
        ID: username,
        Nom_usu,
        Cont_usu: password,
        Cargo,
        Institucion,
        Estado: 'Habilitado'
    };
    Usuario.Cont_usu = await helpers.encryptPassword(password);
    const res = await pool.query('INSERT INTO users SET ?', [Usuario]);
    if (isLoggedIn) {
        return done(null, req.user);
    } else {
        return done(null, Usuario);
    }


}));

passport.serializeUser((usr, done) => {
    done(null, usr.ID);
});

passport.deserializeUser(async(id, done) => {
    const filas = await pool.query('SELECT * FROM users WHERE ID = ?', [id]);
    done(null, filas[0]);
});