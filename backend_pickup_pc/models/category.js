const db = require('../config/config');

const Category = {};

Category.getAll = () => {

    const sql = `
        SELECT
            id,
            name,
            description
        FROM
            categories
        ORDER BY
            id
    `;

    return db.manyOrNone(sql);
}


module.exports = Category;