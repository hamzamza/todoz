import User from "../models/User.js";



const updateTasks = async (req, res, next) => {
    const newtasks = req.body.newsTaks;
    try {

        await User.findById(req.user._id).then(async (user) => {

            user.tasks = newtasks;
            await User.updateOne(user);

            res.status(200).json({ msg: "everything uptodate" })

        }).catch((error) => {
            if (error) {
                console.log(error);
                res.status(500).json({ msg: "bad" })

                return;
            }
        })

    } catch (error) {
        console.log(error);
        res.status(500).json({ msg: error })
    }
}


const getTasks = async (req, res) => {
    res.status(200).json(req.user.tasks);
}

const addTask = async (req, res) => {
    const newTask = req.body.task
    await User.findOneAndUpdate(
        { _id: req.user._id },
        { $push: { tasks: newTask } },
        { new: true }).then(
            (updatedUser) => {
                console.log(updatedUser);
                res.status(200).json(updatedUser)
            })
}
const deleteTask = async (req, res) => {
    await User.findByIdAndUpdate({ _id: req.user._id }, { $pull: { tasks: { _id: taskId } } } , {new : true} ).then((newuser)=>{
        res.status(200).json(newuser)
    }).catch((error)=>{
        res.status(400).jsont({msg : error.msg})
    })

}

export { updateTasks, getTasks, addTask, deleteTask };