const database=require('./config');
const oracledb=require('oracledb');
oracledb.autoCommit = true;

async function getMacros(userid)
{
    const sql=`SELECT TRUNC((CALORIE_INTAKE_GOAL*CARB*0.01)/4),TRUNC((CALORIE_INTAKE_GOAL*FAT*0.01)/9),TRUNC((CALORIE_INTAKE_GOAL*PROTEIN*0.01)/4)
    FROM DIET_TYPE d
    JOIN GOALS g on d.DIET=g.DIET_TYPE
    WHERE USER_ID=:userid`;
    const binds={
        userid: userid
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).rows;
    return result[0];
}

async function getMicros(userid,gender,op)
{
    const sql=`
    BEGIN
	FIND_MICROS(:userid,:gender,:op,:res);
    END;`;
    const binds={
        userid: userid,
        gender: gender,
        op: op,
        res: {
            dir: oracledb.BIND_OUT, 
            type: oracledb.NUMBER
        }
    }
    connection= await oracledb.getConnection(database.database);
    const result = (await connection.execute(sql, binds)).outBinds.res;
    //console.log(result);
    return result;
}

module.exports={getMacros,getMicros}