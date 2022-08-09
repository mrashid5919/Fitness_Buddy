const express=require('express');
const bcrypt=require('bcrypt')
const insert=require('../Database/insert_user')

const router=express.Router();

router.post('/login',async(req,res)=>{
    const username=req.body.username;
    const pass=req.body.password;
    const choice=req.body.choice;
    let result = [], errors = [];
    result=await insert.getUserByuserName(username);
    if(result==undefined)
        errors.push('Wrong username');
    else
    {
        var validPass=(pass==result[9]);
        //console.log(validPass)
        //console.log(result)
        if(validPass)
            res.redirect('/');
        else{
            errors.push('Wrong Password');
            //console.log(pass)
            //console.log(result[9])
        }

    }
    if(errors.length!=0)
    {
        //console.log(errors)
        res.render('login', {
            user: null,
            errors : errors,
            form: {
                username:req.body.username,
                pass:req.body.password,
                choice:req.body.choice
            }
        });
    }
})

router.get('/login',(req,res)=>{
    res.render('login',{
        errors: []
    })
})

module.exports=router;
