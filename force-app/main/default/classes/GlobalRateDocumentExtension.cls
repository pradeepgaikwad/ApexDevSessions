public with sharing class GlobalRateDocumentExtension {
    public List<GlobalRateTier__c> rateList {get; set;} 
    public GlobalRateDocumentExtension(ApexPages.StandardController controller){
        rateList = [SELECT Id, Name, ProductCode__c, ProductName__c, RegionCode__c, Rate__c, Product__c FROM GlobalRateTier__c];
    }
}