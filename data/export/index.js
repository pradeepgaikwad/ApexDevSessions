const express = require('express');
const jsforce = require('jsforce');
require('dotenv').config();
const app = express();
const PORT = 8001;
const {SF_LOGIN_URL,SF_USERNAME,SF_PASSWORD,SF_TOKEN} = process.env;
const conn = new jsforce.Connection({
    loginUrl:SF_LOGIN_URL
});
conn.login(SF_USERNAME,SF_PASSWORD+SF_TOKEN,(err,userInfo)=>{
    if(err){
        console.error(err);
    }
    else{
        console.log("User ID: "+userInfo.id);
        console.log("Org ID: "+userInfo.organizationId);
    }
});
app.get('/',(req,res)=>{
   // console.log(req);
   // console.log(res);
    conn.query("SELECT Id, Name FROM Account", (err, result)=>{
        if(err){
            res.send(err);
        }
        else{
            console.log("Total Records "+result.totalSize);
            res.json(result.records);
        }
    });
    //res.send("Salesforce integration with nodejs")
});
app.listen(PORT,()=>{
    console.log(`Server is running at http://localhost:${PORT}`)
})