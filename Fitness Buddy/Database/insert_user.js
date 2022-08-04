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
module.exports=create_user;