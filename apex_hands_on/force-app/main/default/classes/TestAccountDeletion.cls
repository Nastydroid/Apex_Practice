
@isTest
private class TestAccountDeletion {
    @isTest
    static void TestDeleteAccountWithOneOpportunity(){
        //Test data setup
        //create an account with an opportunity, and then try to delete it
        Account[] accts = TestDataFactory.createAccountWithOpps(1, 1);
    
        //perform the test

        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0],false);
        Test.stopTest();
        //verify
        //in this case the deletion should have been stopped by the trigger
        //so verify that we got back an error.

        System.assert((!result.isSuccess()));
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('Cannot delete account with related opportunities', result.getErrors()[0].getMessage());
    }

    @isTest
    static void TestDeleteAccountWithNoOpportunities(){
        //test data setup
        //create one account with no opportunities by calling the utility method
        Account[] accts = TestDataFactory.createAccountWithOpps(1,0);
        //perform test
        Test.startTest(); 
        Database.DeleteResult result = Database.Delete(accts[0],false);
        Test.stopTest();
        //verify that deletion was successful
        System.assert(result.isSuccess());
    }

    @isTest
    static void TestDeleteBulkAccountsWithOneOpportunity(){
        //test data setup
        //create accounts with one opportunity each by calling the utility method
        Account[] accts = TestDataFactory.createAccountWithOpps(200, 1);
        //perform the test
        Test.startTest();
        Database.DeleteResult[] result = Database.Delete(accts,false);
        Test.stopTest();
        //verify for each record
        //in this case the deletion should be stop by the trigger because there is an opportunity
        //so check that we got an error 
        for(Database.DeleteResult dr : result){
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size() > 0);
            System.assertEquals('Cannot delete account with related opportunities', dr.getErrors()[0].getMessage());
        }
    }

    @isTest
    static void TestDeleteBulkAccountsWithNoOpportunities(){
        //Test data setup
        //create account with no opportunity by calling a utility method
        Account[] accts = TestDataFactory.createAccountWithOpps(200, 0);
        //perform Test
        Test.startTest();
        Database.DeleteResult[] result = Database.Delete(accts,false);
        Test.stopTest();
        //for each record let verify the deletion was successful
        for(Database.DeleteResult dr : result){
            System.assert(dr.isSuccess());
        }
    }
    
}