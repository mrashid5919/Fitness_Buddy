const router = require('express').Router();
const DB_user = require('../Database/insert_user');
const {verify} = require('../middlewares/user-verification');
const DB_goal=require('../Database/user_goal');

var use;

router.get('/home', verify, async (req, res) => {
    const user = await DB_user.getUserByuserName(req.user[1]);
    const goal=await DB_goal.getCalorieGoal(user[0])
    res.render('home.ejs', {
                cur_user: user,
                cur_goal: goal
            });
});

router.get('/food',verify,async (req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('food.ejs',{
        cur_user: user
    })
})

router.get('/profile',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('profile.ejs',{
        cur_user: user
    })
})

module.exports = router;