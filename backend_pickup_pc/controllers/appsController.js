
const Apps = require ('../models/apps');
const storage = require('../utils/cloud_storage');
const asyncForEach = require('../utils/async_foreach');

module.exports = {
    async getAll(req, res, next){
        try {
            const data = await Apps.getAll();
            console.log(`Apps: ${JSON.stringify(data)}`);
            return res.status(201).json(data);
        } 
        catch (error) {
            console.log(`Error ${error}`);    
            return res.status(501).json({
                message: 'Hubo un error al tratar de obtener las apps',
                error: error,
                success: false
            })
        }

    },
}