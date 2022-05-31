const promise = require('bluebird');
const options = {
    promiseLib: promise,
    query: (e) => {}
}

const pgb = require('pg-promise')(options);
const types = pgb.pg.types;
types.setTypeParser(1114, function(stringValue){
    return stringValue;
});

const databaseConfing = {
    'host': '127.0.0.1',
    'port': 5432, 
    'database': 'pickuppc_db',
    'user': 'postgres',
    'password': '0000'
};

const db = pgb(databaseConfing);
module.exports = db;