public with sharing class CaseController {
    @AuraEnabled(cacheable=true)
    public static List<Case> getRelatedCases(String accountId) {
        return [SELECT Id, Subject, Status, CaseNumber FROM Case WHERE AccountId = :accountId LIMIT 10];
    }
}
