const router = require('express').Router();
const DB_user = require('../Database/insert_user');
const {verify} = require('../middlewares/user-verification');
const DB_goal=require('../Database/user_goal');
const DB_add=require('../Database/add');

function getDate(text)
{
    const arr=text.split('-');
    var date=arr[2]+'-';
    if(arr[1]=='01')
        date+='Jan';
    else if(arr[1]=='02')
        date+='Feb';
    else if(arr[1]=='03')
        date+='Mar';
    else if(arr[1]=='04')
        date+='Apr';
    else if(arr[1]=='05')
        date+='May';
    else if(arr[1]=='06')
        date+='June';
    else if(arr[1]=='07')
        date+='July';
    else if(arr[1]=='08')
        date+='Aug';
    else if(arr[1]=='09')
        date+='Sep';
    else if(arr[1]=='10')
        date+='Oct';
    else if(arr[1]=='11')
        date+='Nov';
    else
        date+='Dec';
    date+='-'+arr[0];
    return date;
}

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
        cur_user: user,
        dat: []
    })
})

router.post('/food',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    const text=req.body.date;
    date=getDate(text);
    let result=[];
    result=await DB_add.getBreakfast(date,user[0]);
    console.log(result)
    res.render('food.ejs',{
        cur_user: user,
        dat: result
    })
})

router.get('/addfood',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('addfood.ejs',{
        cur_user: user,
        items:[]
    })
})

router.post('/addfood',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    var food=req.body.item;
    food='%'+food+'%';
    //console.log(food);
    let result=[];

    result=await DB_add.findFood(food);
    res.render('addfood.ejs',{
        cur_user:user,
        items: result
    })
})

router.post('/test',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    const item=parseInt(req.body.id);
    const serve=parseFloat(req.body.serving);
    const text=req.body.date;
    const meal=req.body.meal;
    date=getDate(text);
    let result=[]
    //console.log(user[0]);
    result=await DB_add.getMeal(meal,date,user[0]);
    //console.log(result);
    if(result==undefined)
    {
        console.log('Hi');
        const sql=`INSERT INTO MEAL_LOGGER(MEAL_TYPE,MEAL_DATE,USER_ID) VALUES(:meal,TO_DATE(:dat,'DD-MON-YYYY'),:user_id)`;
        binds={
         
            meal: meal,
            dat: date,
            user_id: parseInt(user[0])
       }
       DB_add.create_meal(sql,binds);
       result=await DB_add.getMeal(meal,date,user[0]);
    }
    const sql=`INSERT INTO CONTAINS(MEAL_ID,ITEM_ID,QUANTITY) VALUES(:meal_id,:item_id,:quantity)`;
    binds={
        meal_id: result[0],
        item_id: item,
        quantity: serve
    }
    DB_add.create_meal(sql,binds);
    //console.log(date);
    //console.log(data);
    res.redirect('/home');
})

router.get('/test',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('test.ejs')
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