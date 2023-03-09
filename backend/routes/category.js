import express from 'express'
import  getCategories  from '../controllers/category.js'
const router=express.Router() 

router.route('/getCategories').get( getCategories ) 
export default router 