import express from 'express'
 
import updateTasks from '../controllers/TaskController.js'
import verifyToken from '../midllware/tokenverification.js'
const router  = express.Router() 

router.route('/updateTask' ).post( verifyToken , updateTasks)
 

export default router 