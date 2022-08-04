const express=require('express');
const insert=require('../Database/insert_user')


const router=express.Router();

var info=[];

router.post('/signup',(req,res)=>{

 const firstname=req.body.firstName;
 const lastname=req.body.lastName;
 const username=req.body.userName;
 const email=req.body.floatingEmail;
 const pass=req.body.floatingPassword;
 const conpass=req.body.floatingConfirm;
  if( conpass==pass)
  {
     info.push(firstname);
     info.push(lastname);
     info.push(username);
     info.push(email);
     info.push(pass);
     console.log(info[0],info[1],info[2],info[3]);

     res.redirect('/signup2');
    // res.send("jene valo laglo")
  }
  else
  {

  }
})

router.get('/signup',(req,res)=>{
    res.render('signup')
})



router.post('/signup2',(req,res)=>{
    const birthdate=req.body.birthDate;
    const gender=req.body.inlineRadioOptions;
    const height=req.body.height;
    const weight=req.body.weight;
    const caloriegoal=req.body.calorieGoal;
    const burngoal=req.body.burnGoal;
    const watergoal=req.body.waterGoal;
   
    console.log(info[0],info[1],info[2],info[3],birthdate,gender,height,weight);

    const sql='INSERT INTO USERS(EMAIL,USERNAME,PASSWORD,FIRST_NAME,LAST_NAME,WEIGHT,HEIGHT,DATE_OF_BIRTH,GENDER) VALUES(:email,:username,:password, :firstname, :lastname, :weight, :height, :birthdate, :gender)';
    
    binds={
         
         email:info[3],
         username:info[2],
         password:info[4],
         firstname: info[0],
         lastname: info[1],
         weight: parseFloat(weight),
         height: parseFloat(height),
         birthdate: birthdate,
         gender: gender
    }

    
    insert(sql,binds);
    info=[];
    res.redirect('/');
})

router.get('/signup2',(req,res)=>{
    res.render('signup2')
})




module.exports=router;
