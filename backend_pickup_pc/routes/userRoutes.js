const UsersController = require('../controllers/UsersController');

module.exports = (app) => {
    app.get('/api/users/getAll', UsersController.getAll);

    app.post('/api/users/login', UsersController.login);
    app.post('/api/users/findById', UsersController.findById);

}