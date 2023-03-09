import express from 'express'
 
import {updateTasks , getTasks, addTask, deleteTask} from '../controllers/TaskController.js'
import verifyToken from '../midllware/tokenverification.js'
const router  = express.Router() 
router.route('/updateTask' ).post( verifyToken , updateTasks)
 router.route('/getTasks').get(verifyToken , getTasks )
 router.route('/addtask').post(verifyToken , addTask)
 router.route('/deletTask').delete(verifyToken , deleteTask) ;
export default router 