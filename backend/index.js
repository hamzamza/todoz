import express from 'express'
import connectDb from './db/conection.js';
import dotenv from "dotenv"
import authRouter from  "./routes/auth.js"
 import taskRouter from './routes/Taks.js'
 
 dotenv.config()

const  app = express();
 
app.use(express.json());
 

const port = process.env.PORT  || 5000 ;
const url = process.env.URL ; 

app.use('/api/auth'  , authRouter )
 app.use('/api/task', taskRouter )
app.listen(port ,   ()=>{
 connectDb(url)
  console.log("the app is listening in the port " , 5000 , `http://localhost:${port}/`) ;

})

