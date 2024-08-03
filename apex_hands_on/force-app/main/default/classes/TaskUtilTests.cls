@IsTest
public with sharing class TaskUtilTests {

    @IsTest
    static void testGetTaskPriorityNormal(){
        String state = 'LA';

        Test.startTest();
        String testPriority = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        Assert.areEqual('Normal', testPriority);
    }

    @IsTest
    static void testGetTaskPriorityHigh(){
        String state = 'CA';

        Test.startTest();
        String testPriority = TaskUtil.getTaskPriority(state);
        Test.stopTest();
        Assert.areEqual('High', testPriority);
    }
    
}