const express=require('express');
const insert=require('../Database/insert_user')


const router=express.Router();

var info=[];

router.post('/signup',async(req,res)=>{

 const firstname=req.body.firstName;
 const lastname=req.body.lastName;
 const username=req.body.userName;
 const email=req.body.floatingEmail;
 const pass=req.body.floatingPassword;
 const conpass=req.body.floatingConfirm;
 let errors=[],result=[]
 result=await insert.getUserByuserName(username);
 if(result==undefined)
{
    result=await insert.getUserByemail(email)
    if(result==undefined)
    {
        if(conpass==pass)
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
    errors.push("Passwords do not match")
  }
    }
    else
        errors.push("User with this email address already exists")

}
else
{
    errors.push("Username already exists")
}
  if(errors.length!=0)
  {
    res.render('signup', {
        user: null,
        errors : errors,
        form: {
            firstname:req.body.firstName,
            lastname:req.body.lastName,
            username:req.body.userName,
            email:req.body.floatingEmail,
            pass:req.body.floatingPassword,
            conpass:req.body.floatingConfirm
        }
    });
  }
})

router.get('/signup',(req,res)=>{
    res.render('signup',{
        errors:[]
    })
})



router.post('/signup2',(req,res)=>{
    const birthdate=req.body.birthDate;
    const gender=req.body.inlineRadioOptions;
    const height=req.body.height;
    const weight=req.body.weight;
   
    console.log(info[0],info[1],info[2],info[3],birthdate,gender,height,weight);

    const sql='INSERT INTO USERS(EMAIL,USERNAME,PASSWORD,FIRST_NAME,LAST_NAME,WEIGHT,HEIGHT,DATE_OF_BIRTH,GENDER,BMI) VALUES(:email,:username,:password, :firstname, :lastname, :weight, :height, :birthdate, :gender, :bmi)';
    
    binds={
         
         email:info[3],
         username:info[2],
         password:info[4],
         firstname: info[0],
         lastname: info[1],
         weight: parseFloat(weight),
         height: parseFloat(height),
         birthdate: birthdate,
         gender: gender,
         bmi: parseFloat(weight)/((parseFloat(height)*2.54*0.01)*(parseFloat(height)*2.54*0.01))
    }

    
    insert.create_user(sql,binds);
    info=[];
    res.redirect('/');
})

router.get('/signup2',(req,res)=>{
    res.render('signup2')
})




module.exports=router;
