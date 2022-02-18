//PROTECCION DE ENLACES

module.exports = {
    isLoggedIn(req, res, next) {
        if (req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/');
    },
    isNotLoggedIn(req, res, next) {
        if (!req.isAuthenticated()) {
            return next();
        }
        return res.redirect('/Perfil');
    },
    isEmpty(req, res, next) {
        if (!req.session.cart || req.session.cart.CantTotal < 0) {
            req.session.cart.CantTotal = 0;
            req.session.productos = false;
        }
        next();
    }

};