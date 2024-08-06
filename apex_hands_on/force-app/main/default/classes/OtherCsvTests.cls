@IsTest
public with sharing class OtherCsvTests {
    @TestSetup
    static void loadAccount(){
        //Given
        List<SObject> acct = test.loadData(Account.SObjectType, 'otherAccountData');
    }

    @IsTest
    static void testLoadOtherAccountsFromStaticResource(){
        Test.startTest();
        List<Account> accts = [SELECT ID FROM Account];
        Test.stopTest();
        //Then 
        Assert.isTrue(accts.size() == 15, 'Expected 15 accounts');
    }
    
}