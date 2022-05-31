const AppsController = require('../controllers/appsController');

module.exports = (app) => {
    app.get('/api/apps/getAll', AppsController.getAll);
    app.get('/api/apps/findByCategory', AppsController.findByCategory);
}