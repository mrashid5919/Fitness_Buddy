const oracledb=require('oracledb');


var conString="(DESCRIPTION =(LOAD_BALANCE = ON)(FAILOVER = ON)(ADDRESS =(PROTOCOL = TCP)(HOST = server1)(PORT = 1521))(ADDRESS = (PROTOCOL = TCP)(HOST = server2)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XE)(FAILOVER_MODE=(TYPE=SELECT)(METHOD = BASIC))))";

const database={
    user:'C##MAY',
    password: 'abcd',
    tns: conString
}
const options = {
    outFormat: oracledb.OUT_FORMAT_OBJECT
}
jwtSecretKey='my-32-character-ultra-secure-and-ultra-long-secret'

// const database=()=>{
//     console.log('ki je hocche');
//     oracledb.getConnection(
//     {
//         user:'C##MAY',
//         password: 'abcd',
//         tns: conString

//     },(err,con)=>
//     {
//         if(err)
//         {
//             console.log('connect hoy nai');
//         }
//         else
//         {
//             console.log('hoise');
//         }
//     }
// )}
module.exports={database,options,jwtSecretKey};