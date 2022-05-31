const User = require('../models/user');
const Rol = require('../models/rol');
const jwt = require('jsonwebtoken');
const keys = require('../config/keys');
const storage = require('../utils/cloud_storage');

module.exports = {

    async getAll(req, res, next){
        try {
            const data = await User.getAll();
            console.log(`Usuarios: ${data}`);
            return res.status(201).json(data);
        } catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al obtener los usuarios'
            });
        }
    },

    async findById(req, res, next) {
        try {
            const id = req.params.id;

            const data = await User.findById(id);    
            console.log(`Usuario: ${data}`);
            return res.status(201).json(data);
        } 
        catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al obtener el usuario por ID'
            });
        }
    },

    async login(req, res, next) {
        try {
            const user_id = req.body.user_id;
            const password = req.body.password;
           // console.log(password);
            const myUser = await User.findByUserId(user_id);

            if (!myUser) {
                return res.status(401).json({
                    success: false,
                    message: 'El id no fue encontrado'
                });
            }
            const token = jwt.sign({id: myUser.id, password: myUser.password}, keys.secretOrKey, {
                // expiresIn: (60*60*24) // 1 HORA
                // expiresIn: (60 * 3) // 2 MINUTO
            });
            const data = {
                id: myUser.id,
                user_id: myUser.user_id,
                password: myUser.password,
                session_token: `JWT ${token}`,
               // roles: myUser.r},
            }
            
            await User.updateToken(myUser.id, `JWT ${token}`);

            console.log(`USUARIO ENVIADO` + JSON.stringify (data));

            return res.status(201).json({
                success: true,
                data: data,
                message: 'El usuario ha sido autenticado'
            });

         /*   if (User.isPasswordMatched(password)) {
               
            }
            else {
                return res.status(401).json({
                    success: false,
                    message: 'La contraseña es incorrecta'
                });
            }*/

        } 
        catch (error) {
            console.log(`Error: ${error}`);
            return res.status(501).json({
                success: false,
                message: 'Error al momento de hacer login',
                error: error
            });
        }
    },
};