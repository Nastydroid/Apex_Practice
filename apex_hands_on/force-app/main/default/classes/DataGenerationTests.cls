@IsTest
private class DataGenerationTests {

    @TestSetup
    static void dataCreation(){
        //GIVEN
        Account acct = TestFactory.getAccount('Muddy Waters Inc', true);
        Contact con = TestFactory.getContact(acct.id, 'Muddy', 'Waters', true);
        List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1400.00, 1);
        insert opps;
    }
    @IsTest
    static void testBruteForceAccountCreation(){
        //Given
        List<Account> accts;
        Account acct = new Account(name ='McTesterson LLC');
        insert acct;

        //When
        Test.startTest();
        accts = [ SELECT Id FROM Account ];
        Test.stopTest();
        //then
        Assert.isTrue(accts.size() > 0 , 'was expecting to find at least one account');

    }

    @IsTest
    static void testUseTestFactoryToCreateAccountsWithContacts(){
        //Given
        List<Account> accts;
        List<Contact> contacts;
        TestFactory.generateAccountWithContacts(5);
        //when
        Test.startTest();
        accts = [SELECT Id FROM Account];
        contacts = [SELECT Id FROM Contact];
        Test.stopTest();
        //Then
        Assert.isTrue(accts.size() > 0, 'Was expecting to finf at least one account');
        Assert.areEqual(5, contacts.size(), 'Was expecting to find 5 contacts');
    }

    @IsTest
static void testAtTestSetupMethodsRule() {
  // WHEN
  Test.startTest();
    List<Opportunity> opps = [SELECT Id, AccountId FROM Opportunity];
  Test.stopTest();
  // THEN
  Assert.areEqual(1, opps.size(), 'Expected test to find a single Opp');
}
    
}