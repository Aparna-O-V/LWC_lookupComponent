@isTest
private class LWC_lookupControllerTest {

    @isTest
    static void testFetchRecords() {
        // Test data setup
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        LWC_lookupController.SearchWrapper inputWrapper = new LWC_lookupController.SearchWrapper();
        inputWrapper.objectApiName = 'Account';
        inputWrapper.fieldApiName = 'Name';
        inputWrapper.searchString = 'Test';
        inputWrapper.parentFieldApiName = null;
        inputWrapper.parentRecordId = null;
        inputWrapper.selectedRecordId = null;
        inputWrapper.otherFieldApiName = null;

        // Test the fetchRecords method
        Test.startTest();
        List<LWC_lookupController.ResultWrapper> result = LWC_lookupController.fetchRecords(inputWrapper);
        Test.stopTest();

        // Perform assertions
        System.assertNotEquals(null, result, 'Result should not be null');
        System.assertEquals(1, result.size(), 'There should be one result');

        LWC_lookupController.ResultWrapper wrapper = result[0];
        System.assertEquals(testAccount.Name, wrapper.mainField, 'Main field should match Account Name');
        System.assertEquals(null, wrapper.subField, 'Sub field should be null');
        System.assertEquals(testAccount.Id, wrapper.id, 'Id should match Account Id');
    }
}