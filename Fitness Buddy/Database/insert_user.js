const database=require('./config');
const oracledb=require('oracledb');
oracledb.autoCommit = true;
async function create_user(sql,binds)
{    console.log('yea');
    let connection,result;

    try{
   connection= await oracledb.getConnection(database.database);
   
   result=await connection.execute(sql,binds,{});
}
catch(err)
{  
     console.log(err);
  

}
}

async function getUserByuserName(USERNAME){
     const sql = `SELECT * FROM USERS 
                 WHERE USERNAME = :USERNAME`;
     const binds ={
         USERNAME: USERNAME
     };
     connection= await oracledb.getConnection(database.database);
     const result = (await connection.execute(sql, binds)).rows;
     return result[0];
 }

async function getUserByemail(EMAIL)
{
     const sql = `SELECT * FROM USERS 
                 WHERE EMAIL = :EMAIL`;
     const binds ={
         EMAIL: EMAIL
     };
     connection= await oracledb.getConnection(database.database);
     const result = (await connection.execute(sql, binds)).rows;
     return result[0];
}
module.exports={create_user,
     getUserByuserName,
     getUserByemail
}