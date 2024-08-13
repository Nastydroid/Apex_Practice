@isTest
private with sharing class TestRestrictContactByName {

    @isTest
    Static void TestInvalidContact(){
        //Test data setup

        Contact con = new Contact(LastName = 'INVALIDNAME');

        Test.startTest();
        Database.SaveResult result = Database.insert(con,false);
        Test.stopTest();
        
        System.assert((!result.isSuccess()));
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());


    }

        @isTest
        static void validContactTest(){

            Contact con1 = new Contact(LastName='ValidName');
            Test.startTest();
            insert con1;
            Test.stopTest();

        }

        
    
    
}