const db =  require('../config/config');
const userRoutes = require('../routes/userRoutes');

const User = {};

User.getAll= () => {
    const sql = `
    SELECT 
        *
    FROM 
        users
    `;

    return db.manyOrNone(sql);
}

User.findById = (id, callback) => {

    const sql = `
    SELECT
        id,
        password,
        session_token
    FROM
        users
    WHERE
        id = $1`;
    
    return db.oneOrNone(sql, id).then(user => { callback(null, user); })

}

User.findByUserId = (user_id) => {
    const sql = `
    SELECT
        U.id,
        U.user_id,
        U.password,
        U.session_token
    FROM 
        users AS U
    WHERE
        U.user_id = '1006037731'
 `
    return db.oneOrNone(sql, user_id);
}

User.updateToken = (id, token) => {
    const sql = `
    UPDATE
        users
    SET
        session_token = $2
    WHERE
        id = $1
    `;

    return db.none(sql, [
        id,
        token
    ]);
}

User.isPasswordMatched = (password) => {
    if (User.password === password) {
        return true;
    }
    return false;
}

module.exports = User;