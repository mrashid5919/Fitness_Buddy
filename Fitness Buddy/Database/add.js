const database=require('./config');
const oracledb=require('oracledb');
oracledb.autoCommit = true;

async function findFood(food){
    const sql="SELECT * FROM FOOD_ITEMS WHERE LOWER(ITEM_NAME) LIKE :food";
    const binds ={
        food: food
    };
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result;
}

async function findExercise(weight,exercise){
    const sql=`SELECT EXERCISE_ID,EXERCISE_NAME,:weight*CALORIE_BURN,QUANTITY,UNIT
    FROM EXERCISES WHERE LOWER(EXERCISE_NAME) LIKE :exercise`;
    const binds ={
        weight: weight,
        exercise: exercise
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

async function findWater(dat,userid){
    const sql=`SELECT * FROM WATER_CONSUMPTION WHERE CONSUME_DATE=TO_DATE(:dat,'DD-MON-YYYY') AND USER_ID=:userid`;
    const binds={
        dat: dat,
        userid: userid
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

async function getElog(dat,userid){
    const sql=`SELECT * FROM EXERCISE_LOG WHERE EXERCISE_DATE=TO_DATE(:dat,'DD-MON-YYYY') AND USER_ID=:userid`;
    const binds={
        dat: dat,
        userid: userid
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

async function getMealDetails(meal,dat,userid){
    const sql=`SELECT ITEM_NAME,QUANTITY*MEASURE_QUANTITY,MEASURE_UNIT,QUANTITY*CALORIE,QUANTITY*CARBS,QUANTITY*FAT,TRUNC(QUANTITY*PROTEIN,2),QUANTITY*VITAMIN_C,QUANTITY*IRON,QUANTITY*SODIUM,QUANTITY*SUGAR,QUANTITY*DIETARY_FIBER
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

async function create_elog(sql,binds)
{    
    let connection,result;

    try{
   connection= await oracledb.getConnection(database.database);
   
   result=await connection.execute(sql,binds);
   return result;
}

catch(err)
{  
     console.log(err);
  

}
}

async function getExerciseDetails(dat,weight,userid){
    const sql=`SELECT EXERCISE_NAME,EXERCISE_DURATION,UNIT,(EXERCISE_DURATION/QUANTITY)*CALORIE_BURN*:weight
    FROM EXERCISES e
    JOIN CONSISTS c ON e.EXERCISE_ID=c.EXERCISE_ID
    JOIN EXERCISE_LOG el ON c.ELOG_ID=el.ELOG_ID
    WHERE el.EXERCISE_DATE=TO_DATE(:dat,'DD-MON-YYYY')
    AND el.USER_ID=:userid`;
    const binds={
        dat: dat,
        userid: userid,
        weight: weight
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

async function create_water(sql,binds)
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
    return result[0];
}

async function getFoodDate(userid,dat)
{
    const sql=`SELECT SUM(QUANTITY*CALORIE),SUM(QUANTITY*CARBS),SUM(QUANTITY*FAT),SUM(QUANTITY*PROTEIN),SUM(QUANTITY*VITAMIN_C),SUM(QUANTITY*IRON),SUM(QUANTITY*SODIUM),SUM(QUANTITY*SUGAR),SUM(QUANTITY*DIETARY_FIBER)
    FROM FOOD_ITEMS i
    JOIN CONTAINS c ON i.ITEM_ID=c.ITEM_ID
    JOIN MEAL_LOGGER m ON c.MEAL_ID=m.MEAL_ID
    WHERE m.MEAL_DATE=TO_DATE(:dat,'DD-MON-YYYY')
    AND m.USER_ID=:userid`;
    const binds={
        userid: userid,
        dat: dat
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

async function getExerciseToday(userid,weight)
{
    const sql=`SELECT SUM((EXERCISE_DURATION/QUANTITY)*CALORIE_BURN*:weight)
    FROM EXERCISES i
    JOIN CONSISTS c ON i.EXERCISE_ID=c.EXERCISE_ID
    JOIN EXERCISE_LOG m ON c.ELOG_ID=m.ELOG_ID
    WHERE TO_CHAR(m.EXERCISE_DATE,'DD-MON-YYYY')=TO_CHAR(SYSDATE,'DD-MON-YYYY')
    AND m.USER_ID=:userid`;
    const binds={
        userid: userid,
        weight: weight
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

async function getExerciseDate(userid,dat,weight)
{
    const sql=`SELECT SUM((EXERCISE_DURATION/QUANTITY)*CALORIE_BURN*:weight)
    FROM EXERCISES i
    JOIN CONSISTS c ON i.EXERCISE_ID=c.EXERCISE_ID
    JOIN EXERCISE_LOG m ON c.ELOG_ID=m.ELOG_ID
    WHERE m.EXERCISE_DATE=TO_DATE(:dat,'DD-MON-YYYY')
    AND m.USER_ID=:userid`;
    const binds={
        userid: userid,
        dat: dat,
        weight: weight
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

module.exports={findFood,
                getMeal,
                create_meal,
                getMealDetails,
                getFoodToday,
                getFoodDate,
                getExerciseDetails,
                create_elog,
                getElog,
                findExercise,
                getExerciseDate,
                getExerciseToday,
                findWater,
                create_water            
}