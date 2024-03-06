/*******************************************************************************************************
* 
* @ Name            :   lookupAccountController
* @ Purpose         :   Controller for Account
* @ Author          :   Aparna O V
* @ Usage           :   1) For displaying data in the search bar of the lookup component
*                       2) For displaying account data to be used in the parent component
*
*   Date            |  Developer Name           |  Version      |  Changes
* ======================================================================================================
*   27-02-2024      |  aparna.ov@absyz.com      |  1.0          |  Initial Version
*
*******************************************************************************************************/
public with sharing class lookupAccountController {
@AuraEnabled(cacheable=true)
public static List<sObject> fetchLookupData(string searchKey, string sObjectApiName) {
    List<sObject> returnList = new List<sObject>();
    
    if(String.isNotBlank(searchKey) && String.isNotBlank(sObjectApiName)) {
        System.debug(searchKey+'hello');
        String sWildCardText = '%' + searchKey + '%';
        String sQuery = 'SELECT Id, LastName FROM ' + sObjectApiName + ' WHERE LastName LIKE :sWildCardText ORDER BY CreatedDate DESC LIMIT 10';
    }
    else {
        System.debug('Search key or sObjectApiName is null or empty.');
        // Handle null or empty search key or sObjectApiName
    }
    
    return returnList;

}

@AuraEnabled(cacheable=true)
    public static List<Account> getRelatedAccounts(String accountId) {
        return 
        [SELECT 
        Name, 
        Industry, 
        Phone  
        FROM Account 
        WHERE Id = :accountId 
        LIMIT 10];
    }
}