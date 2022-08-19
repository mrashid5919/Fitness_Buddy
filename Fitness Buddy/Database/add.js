const database=require('./config');
const oracledb=require('oracledb');
oracledb.autoCommit = true;

async function findFood(food){
    const sql="SELECT * FROM FOOD_ITEMS WHERE ITEM_NAME LIKE :food";
    const binds ={
        food: food
    };
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result;
}

async function getMeal(meal,dat,userid){
    const sql=`SELECT * FROM MEAL_LOGGER WHERE MEAL_TYPE=:meal AND MEAL_DATE=TO_DATE(:dat,'DD-MON-YYYY') AND USER_ID=:userid`;
    const binds={
        meal: meal,
        dat: dat,
        userid: userid
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

async function getMealDetails(meal,dat,userid){
    const sql=`SELECT ITEM_NAME,QUANTITY*MEASURE_QUANTITY,MEASURE_UNIT,QUANTITY*CALORIE,QUANTITY*CARBS,QUANTITY*FAT,QUANTITY*PROTEIN,QUANTITY*VITAMIN_C,QUANTITY*IRON,QUANTITY*SODIUM,QUANTITY*SUGAR,QUANTITY*DIETARY_FIBER
    FROM FOOD_ITEMS i
    JOIN CONTAINS c ON i.ITEM_ID=c.ITEM_ID
    JOIN MEAL_LOGGER m ON c.MEAL_ID=m.MEAL_ID
    WHERE m.MEAL_DATE=TO_DATE(:dat,'DD-MON-YYYY')
    AND m.MEAL_TYPE=:meal
    AND m.USER_ID=:userid`;
    //console.log(dat)
    //console.log(userid)
    const binds={
        dat: dat,
        userid: userid,
        meal: meal
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result;
}



async function create_meal(sql,binds)
{    
    let connection,result;

    try{
   connection= await oracledb.getConnection(database.database);
   
   result=await connection.execute(sql,binds,{});
   return result;
}

catch(err)
{  
     console.log(err);
  

}
}

async function getFoodToday(userid)
{
    const sql=`SELECT SUM(CALORIE),SUM(CARBS),SUM(FAT),SUM(PROTEIN),SUM(VITAMIN_C),SUM(IRON),SUM(SODIUM),SUM(SUGAR),SUM(DIETARY_FIBER)
    FROM FOOD_ITEMS i
    JOIN CONTAINS c ON i.ITEM_ID=c.ITEM_ID
    JOIN MEAL_LOGGER m ON c.MEAL_ID=m.MEAL_ID
    WHERE TO_CHAR(m.MEAL_DATE,'DD-MON-YYYY')=TO_CHAR(SYSDATE,'DD-MON-YYYY')
    AND m.USER_ID=:userid`;
    const binds={
        userid: userid
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result;
}

module.exports={findFood,
                getMeal,
                create_meal,
                getMealDetails,
                getFoodToday              
}