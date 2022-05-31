const db = require('../config/config');

const Apps = {};

Apps.getAll = () =>{
    const sql = `
    SELECT 
    id,
    name,
    description,   
    image1,
    id_category
    FROM
        apps
    ORDER BY
        id
    `;

    return db.manyOrNone(sql); 
}

Product.findByCategory = (id_category) => {
    const sql = `
    SELECT
        P.id,
        P.name,
        P.description,   
        P.image1,
        P.id_category
    FROM
        apps AS P
    INNER JOIN
        categories AS C
    ON
        P.id_category = C.id
    WHERE
        C.id = $1
    `;

    return db.manyOrNone(sql, id_category);
}

module.exports = Apps;