require('dotenv').config();
const jwt = require('jsonwebtoken');
const config=require('../Database/config')
const DB_user = require('../Database/insert_user');

async function verify(req,res,next){
    const cookie  = req.header('cookie');
    if(!cookie) return res.redirect('/login');
    const token = cookie.slice(11);
    try{
        const verified = jwt.verify(token, config.jwtSecretKey);
        req.user =await DB_user.getUserByuserName(verified.user_name);
        next();

    }catch(err){
        res.status(400).send('Invalid Token');
    }
}

module.exports={verify}