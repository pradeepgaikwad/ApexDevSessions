// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

/* Query For Retrieving Data if there is a lookup relationship created between two objects use below Query*/
SELECT GlobalRateTier__r.Name , GlobalRateTier__r.RegionCode__c, GlobalRateTier__r.Rate__c,Name, 
GlobalRateTier__r.ProductCode__c,ValueName__c, Value__c, GlobalRateTier__c FROM ProductFeature__c 

/*Use Below Command to retrieve the salesforce objects in the form of a json file
*when there is the Master Detail relationship and lookup relationship.
*/
sfdx force:data:tree:export -q "SELECT GlobalRateTier__r.Name , GlobalRateTier__r.RegionCode__c, GlobalRateTier__r.Rate__c,Name, 
GlobalRateTier__r.ProductCode__c ,ValueName__c, Value__c, GlobalRateTier__c FROM ProductFeature__c " -d data 
/*
* -q stands for query
* -d stands for directory
* -p can be added after the query to retrieve data in the form of complete salesforce objects information
*/

/*Use Below Command to retrieve the salesforce objects in the form of a json file
*when there is only lookup relationship.
*/
SELECT ValueName__c, Value__c, (SELECT Id, Name, ProductCode__c, 
ProductName__c, RegionCode__c, Rate__c, Product__c FROM GlobalRatesTier__r) FROM ProductFeature__c