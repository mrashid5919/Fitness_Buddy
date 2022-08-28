const database=require('./config');
const oracledb=require('oracledb');
oracledb.autoCommit = true;

async function getCalorieGoal(USER_ID){
    const sql = `SELECT * FROM GOALS 
                WHERE USER_ID = :USER_ID`;
    const binds ={
        USER_ID: USER_ID
    };
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

async function update_goals(sql,binds)
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

module.exports={getCalorieGoal,
                update_goals
                }