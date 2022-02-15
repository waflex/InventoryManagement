const bcrypt = require('bcryptjs');
const passport = require('passport');

const helpers = {};
helpers.encryptPassword = async(contraseña) => {

    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(contraseña, salt); //hash contraseña convertida final final de los finales  
    return hash;

};

helpers.deryptPassword = async(contraseña, ContraseñaBD) => {
    try {
        return await bcrypt.compare(contraseña, ContraseñaBD);
    } catch (error) {
        console.log(error);
    }


};
module.exports = helpers;