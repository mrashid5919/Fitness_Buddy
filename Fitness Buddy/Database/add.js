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
    return result[0];
}

module.exports={findFood}