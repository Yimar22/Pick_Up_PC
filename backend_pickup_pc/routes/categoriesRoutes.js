const CategoriesController = require('../controllers/categoriesController');
const passport = require('passport');

module.exports = (app) => {

    /*
    * GET ROUTES
    */
  // app.get('/api/categories/getAll', passport.authenticate('jwt', {session: false}), CategoriesController.getAll);
   app.get('/api/categories/getAll', CategoriesController.getAll);


}