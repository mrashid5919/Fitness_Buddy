const router = require('express').Router();
const DB_user = require('../Database/insert_user');
const {verify} = require('../middlewares/user-verification');
const DB_goal=require('../Database/user_goal');
const DB_add=require('../Database/add');
const DB_info=require('../Database/getinfo');

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
    const goal=await DB_goal.getCalorieGoal(user[0]);
    //const macro=await DB_info.getMacros(user[0]);
    var eaten=await DB_add.getFoodToday(user[0]);
    //console.log(parseFloat(eaten[1]));
    let remain=[]
    //var remain=parseFloat(goal[1])-parseFloat(eaten[0][0]);
    if(eaten[0]==null){
        //console.log('Null');
        remain.push(goal[1]);
        //remain.push(0);
    }
    else
    {
        remain.push(parseFloat(goal[1])-parseFloat(eaten[0]));
    }
    //console.log(remain);
    res.render('home.ejs', {
                cur_user: user,
                cur_goal: goal,
                cur_eaten: eaten,
                cur_remain: remain
            });
});

router.get('/food',verify,async (req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('food.ejs',{
        cur_user: user,
        dat: [],
        dat1: [],
        dat2: [],
        dat3: [],
        cur_remain: [],
        cur_total: [],
        cur_eaten: []
    })
})

router.post('/food',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    const text=req.body.date;
    date=getDate(text);
    let result=[],result1=[],result2=[],result3=[];
    result=await DB_add.getMealDetails("Breakfast",date,user[0]);
    result1=await DB_add.getMealDetails("Lunch",date,user[0]);
    result2=await DB_add.getMealDetails("Dinner",date,user[0]);
    result3=await DB_add.getMealDetails("Snacks",date,user[0]);
    const goal=await DB_goal.getCalorieGoal(user[0]);
    const macro=await DB_info.getMacros(user[0]);
    var eaten=await DB_add.getFoodDate(user[0],date);
    //console.log(eaten);
    //console.log(parseFloat(eaten[1]));
    let remain=[],total=[]
    //var remain=parseFloat(goal[1])-parseFloat(eaten[0][0]);
    if(eaten[0]==null){
        //console.log('Null');
        remain.push(goal[1]);
        total.push(goal[1]);
        for(var i=0;i<3;i++){
            remain.push(macro[i]);
            total.push(macro[i]);
        }
        for(var i=1;i<=5;i++){
            remain.push(await DB_info.getMicros(user[0],user[7],i));
            total.push(await DB_info.getMicros(user[0],user[7],i));
        }
        //remain.push(0);
    }
    else
    {
        remain.push(parseFloat(goal[1])-parseFloat(eaten[0]));
        for(var i=0;i<3;i++)
            remain.push(parseFloat(macro[i])-parseFloat(eaten[i+1]));
        for(var i=1;i<=5;i++)
            remain.push(await DB_info.getMicros(user[0],user[7],i)-parseFloat(eaten[i+3]));
            total.push(goal[1]);
            for(var i=0;i<3;i++)
                total.push(macro[i]);
            for(var i=1;i<=5;i++)
                total.push(await DB_info.getMicros(user[0],user[7],i));
        
    }
    //console.log(result)
    res.render('food.ejs',{
        cur_user: user,
        dat: result,
        dat1: result1,
        dat2: result2,
        dat3: result3,
        cur_remain: remain,
        cur_total: total,
        cur_eaten: eaten
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
    food=food.toLowerCase();
    food="%"+food+"%";
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
       result=await DB_add.create_meal(sql,binds);
       
    }
    result=await DB_add.getMeal(meal,date,user[0]);
    const sql=`INSERT INTO CONTAINS(MEAL_ID,ITEM_ID,QUANTITY) VALUES(:meal_id,:item_id,:quantity)`;
    binds={
        meal_id: result[0],
        item_id: item,
        quantity: serve
    }
    DB_add.create_meal(sql,binds);
    //console.log(date);
    //console.log(data);
    res.redirect('/food');
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