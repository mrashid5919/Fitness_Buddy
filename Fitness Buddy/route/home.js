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

router.get('/goals',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    res.render('goals.ejs',{
        cur_user: user
    })
})

router.post('/goals',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    //console.log(user);
    const diet_type=parseInt(req.body.diet);
    const vit_c=parseInt(req.body.inlineRadioOptions);
    const iron=parseInt(req.body.inlineRadioOptions2);
    const sodium=parseInt(req.body.inlineRadioOptions3);
    const sugar=parseInt(req.body.inlineRadioOptions4);
    const fiber=parseInt(req.body.inlineRadioOptions5);
    const sql="UPDATE GOALS SET DIET_TYPE=:diet_type, VITAMIN_C=:vit_c, IRON=:iron, SODIUM=:sodium, SUGAR=:sugar, DIETARY_FIBER=:fiber WHERE USER_ID=:user_id";
    binds={
        diet_type: diet_type,
        vit_c: vit_c,
        iron: iron,
        sodium: sodium,
        sugar: sugar,
        fiber: fiber,
        user_id: user[0]
    }
    DB_goal.update_goals(sql,binds);
    res.redirect('/home');
})

module.exports = router;