const db = require('../config/config');

const Rol = {};

Rol.getAll = () =>{
    const sql = `
    SELECT 
        *
    FROM
        roles
    `;

    return db.manyOrNone(sql); 
}

module.exports = Rol;