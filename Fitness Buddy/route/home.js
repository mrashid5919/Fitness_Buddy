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
    var goal=await DB_goal.getCalorieGoal(user[0]);
    var ex=await DB_add.getExerciseToday(user[0],user[4]);
    var progress=parseFloat(user[12],1)-parseFloat(user[4],1);
    //const macro=await DB_info.getMacros(user[0]);
    var eaten=await DB_add.getFoodToday(user[0]);
    //console.log(parseFloat(eaten[1]));
    let remain=[],net=[]
    var exer;
    if(ex[0]==null)
        exer=0;
    else
        exer=parseFloat(ex[0]);
    //var remain=parseFloat(goal[1])-parseFloat(eaten[0][0]);
    if(eaten[0]==null){
        //console.log('Null');
        remain.push(goal[1]+exer);
        net.push((-1)*exer);
        //remain.push(0);
    }
    else
    {
        remain.push(parseFloat(goal[1])-parseFloat(eaten[0])+exer);
        net.push(parseFloat(eaten[0])-exer);
    }
    //console.log(remain);
    res.render('home.ejs', {
                cur_user: user,
                cur_goal: goal,
                cur_eaten: eaten,
                cur_remain: remain,
                cur_done: exer,
                cur_net: net,
                progress: progress,
                pro: (-1)*progress
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
        cur_eaten: [],
        cur_done: [],
        wat: [],
        water_goal: []
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
    const water=await DB_add.findWater(date,user[0]);
    var eaten=await DB_add.getFoodDate(user[0],date);
    var ex=await DB_add.getExerciseToday(user[0],user[4]);
    var exer,wat;
    if(ex[0]==null)
        exer=0;
    else
        exer=parseFloat(ex[0]);
    //console.log(eaten);
    //console.log(parseFloat(eaten[1]));
    let remain=[],total=[]
    //var remain=parseFloat(goal[1])-parseFloat(eaten[0][0]);
    //console.log(water);
    if(water==undefined)
        wat=0;
    else
        wat=parseInt(water[1]);
    if(eaten[0]==null){
        //console.log('Null');
        remain.push(parseFloat(goal[1])+exer);
        total.push(parseFloat(goal[1])+exer);
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
        remain.push(parseFloat(goal[1])+exer-parseFloat(eaten[0]));
        for(var i=0;i<3;i++)
            remain.push(parseFloat(macro[i])-parseFloat(eaten[i+1]));
        for(var i=1;i<=5;i++)
            remain.push(await DB_info.getMicros(user[0],user[7],i)-parseFloat(eaten[i+3]));
            total.push(goal[1]+exer);
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
        cur_eaten: eaten,
        cur_done: exer,
        wat: wat,
        water_goal: goal[3]
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

router.get('/viewgoals',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    const goal=await DB_goal.getCalorieGoal(user[0]);
    const macro=await DB_info.getMacros(user[0]);
    let data=[]
    for(var i=1;i<=3;i++)
    {
        data.push(goal[i]);
    }
    for(var i=0;i<3;i++)
        data.push(macro[i]);
    for(var i=1;i<=5;i++)
        data.push(await DB_info.getMicros(user[0],user[7],i));
    res.render('viewgoals.ejs',{
        cur_user: user,
        data: data
    })
})

router.get('/goals',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    console.log(user);
    res.render('goals.ejs',{
        cur_user: user
    })
})

router.post('/goals',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    const calorieBurn=parseInt(req.body.calorieBurn);
    //console.log(user);
    const diet_type=parseInt(req.body.diet);
    const vit_c=parseInt(req.body.inlineRadioOptions);
    const iron=parseInt(req.body.inlineRadioOptions2);
    const sodium=parseInt(req.body.inlineRadioOptions3);
    const sugar=parseInt(req.body.inlineRadioOptions4);
    const fiber=parseInt(req.body.inlineRadioOptions5);
    const sql="UPDATE GOALS SET CALORIE_BURN_GOAL =:calorieBurn, DIET_TYPE=:diet_type, VITAMIN_C=:vit_c, IRON=:iron, SODIUM=:sodium, SUGAR=:sugar, DIETARY_FIBER=:fiber WHERE USER_ID=:user_id";
    binds={
        calorieBurn: calorieBurn,
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

router.get('/updateweight',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    console.log(user);
    res.render('updateweight.ejs',{
        errors: [],
        cur_user: user
    })
})

router.post('/updateweight',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    const currWeight=parseFloat(req.body.currWeight,2);
    DB_info.setWeight(currWeight,user[0]);
    res.redirect('/profile');
})

router.get('/editpass',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    console.log(user);
    res.render('editpass.ejs',{
        errors: [],
        cur_user: user
    })
})

router.post('/editpass',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    const currPass=req.body.currPass;
    const newPass=req.body.newPass;
    const confirmNewPass=req.body.confirmNewPass;
    let errors=[]
    if(currPass!=user[9])
    {
        errors.push("Wrong current password")
    }
    else
    {
        if(newPass!=confirmNewPass)
        {
            errors.push("New password and confirmed new passwords are not same");
        }
        else
        {
            const sql=`UPDATE USERS SET PASSWORD=:newPass WHERE USER_ID=:user_id`;
            binds={
                newPass: newPass,
                user_id: user[0]
            }
            DB_goal.update_pass(sql,binds);
            res.redirect('/profile');
        }
        
    }
    if(errors.length!=0)
    {
        //console.log(errors)
        res.render('editpass.ejs', {
            errors : errors,
            cur_user: user,
            form: {
                currPass:req.body.currPass,
                newPass:req.body.newPass,
                confirmNewPass:req.body.confirmNewPass
            }
        });
    }
})

router.get('/exercise',verify,async (req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('exercise.ejs',{
        cur_user: user,
        dat: [],
        cur_remain: [],
        cur_total: [],
        cur_done: []
    })
})

router.post('/exercise',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    const text=req.body.date;
    date=getDate(text);
    let result=[];
    result=await DB_add.getExerciseDetails(date,user[4],user[0]);
    const goal=await DB_goal.getCalorieGoal(user[0]);
    var done=await DB_add.getExerciseDate(user[0],date,user[4]);
    let remain=[],total=[]
    if(done[0]==null)
    {
        remain.push(goal[2]);
        total.push(goal[2]);
    }
    else
    {
        remain.push(parseFloat(goal[2])-parseFloat(done[0]));
        total.push(goal[2]);
    }
    res.render('exercise.ejs',{
        cur_user: user,
        dat: result,
        cur_remain: remain,
        cur_total: total,
        cur_done: done
    })
})

router.get('/addexercise',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('addexercise.ejs',{
        cur_user: user,
        items:[]
    })
})

router.post('/addexercise',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    var exercise=req.body.item;
    exercise=exercise.toLowerCase();
    exercise="%"+exercise+"%";
    //console.log(food);
    let result=[];

    result=await DB_add.findExercise(req.user[4],exercise);
    res.render('addexercise.ejs',{
        cur_user:user,
        items: result
    })
})

router.get('/addwater',verify,async(req,res)=>{
    const user = await DB_user.getUserByuserName(req.user[1]);
    res.render('addwater.ejs',{
        cur_user: user
    })
})

router.post('/test3',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    const water=req.body.addwater;
    var date=getDate(req.body.date);
    //console.log(food);
    let result=[];

    result=await DB_add.findWater(date,user[0]);
    if(result==undefined)
    {
        //console.log('Hi');
        const sql=`INSERT INTO WATER_CONSUMPTION(USER_ID,CONSUME_DATE,CONSUMED_WATER) VALUES(:user_id,TO_DATE(:dat,'DD-MON-YYYY'),:water)`;
        binds={
            dat: date,
            water: parseInt(water),
            user_id: parseInt(user[0])
       }
       await DB_add.create_water(sql,binds);
       
    }
    else
    {
        const sql=`UPDATE WATER_CONSUMPTION SET CONSUMED_WATER=:water
    WHERE USER_ID=:user_id AND CONSUME_DATE=TO_DATE(:dat,'DD-MON-YYYY')`;
    binds={
        water: parseInt(water)+parseInt(result[1]),
        dat: date,
        user_id: parseInt(user[0])
    }
    DB_add.create_water(sql,binds);
    }
    //console.log(date);
    //console.log(data);
    res.redirect('/food');
})

router.post('/test2',verify,async(req,res)=>{
    const user=await DB_user.getUserByuserName(req.user[1]);
    const exe=parseInt(req.body.id);
    const duration=parseFloat(req.body.duration);
    const text=req.body.date;
    date=getDate(text);
    let result=[]
    //console.log(user[0]);
    result=await DB_add.getElog(date,user[0]);
    //console.log(result);
    if(result==undefined)
    {
        //console.log('Hi');
        const sql=`INSERT INTO EXERCISE_LOG(EXERCISE_DATE,USER_ID) VALUES(TO_DATE(:dat,'DD-MON-YYYY'),:user_id)`;
        binds={
            dat: date,
            user_id: parseInt(user[0])
       }
       result=await DB_add.create_elog(sql,binds);
       
    }
    result=await DB_add.getElog(date,user[0]);
    const sql=`INSERT INTO CONSISTS(ELOG_ID,EXERCISE_ID,EXERCISE_DURATION) VALUES(:elog_id,:exercise_id,:quantity)`;
    binds={
        elog_id: result[0],
        exercise_id: exe,
        quantity: duration
    }
    DB_add.create_elog(sql,binds);
    //console.log(date);
    //console.log(data);
    res.redirect('/exercise');
})

module.exports = router;