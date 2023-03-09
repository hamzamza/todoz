import User from "../models/User.js";

 

const updateTasks = async (req, res, next)=>{
const newtasks = req.body.newsTaks ; 
    try {
        console.log(req.user._id);
        await User.findById(req.user._id).then( async( user ) =>{
            
             user.tasks = newtasks ; 
           await   User.updateOne(user) ;

            res.status(200).json({msg: "everything uptodate"})
            
        } ).catch((error) => {
            if (error){
                console.log(error);
                res.status(500).json({msg: "bad"})
            
                return ; 
            }
        })
        
    } catch (error) {
        console.log(error);
        res.status(500).json({ msg: error })
    }
}

export default updateTasks ;