const path=require('path');
const express=require('express');
const oracledb=require('oracledb');
const bodyparser=require('body-parser');
// CUSTOM module

const signup_route= require('../route/signup');
const login_route=require('../route/login');
//const signup_route2= require('../route/signup2');
// const config=require('../Database/config');



const app=express();
//app.use(config.database);
//define paths for Express config
const publicDirectoryPath=path.join(__dirname,'../public');

//setup view engine
app.set('view engine','ejs')

//Setup static directory to serve
app.use(express.static(publicDirectoryPath))

app.use(bodyparser.urlencoded({
    extended: true
  }));
app.use('/',signup_route);
app.use('/',login_route);


app.get("/",(req,res)=>{
    
    res.render('index')
})

/*app.get("/login",(req,res)=>{
     res.render('login')
 })*/



// app.get("/signup2",(req,res)=>{
//     res.render('signup2')
// })

app.listen(3000,()=>{
    console.log('Server is up on port 3000.');
});
