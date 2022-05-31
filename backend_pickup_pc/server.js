const express = require("express");
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
const res = require('express/lib/response');
const multer = require('multer');
const admin = require('firebase-admin');
const serviceAccount = require('./serviceAccountKey.json');


/*
*Rutas
*/
const users = require('./routes/userRoutes')
const categories = require('./routes/categoriesRoutes');
const apps = require('./routes/appsRoutes');

const port = process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cors());
app.disable('x-powered-by');
app.set('port',port);

users(app);
categories(app);
apps(app);
server.listen(3000, '192.168.1.89' || 'localhost', function(){
    console.log('app de node ' + process.pid + ' Iniciando ...')
 }
);

app.get('/',(req,res) => {
    res.send("Ruta raiz back");
});

//error handler
app.use((err, req, next) => {
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});

module.exports = {
    app: app,
    server: server
}