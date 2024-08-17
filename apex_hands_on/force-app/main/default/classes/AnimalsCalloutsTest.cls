@isTest
public with sharing class AnimalsCalloutsTest {
    
    @isTest static void testGetCallout(){
        //create the mock response based on a static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        //Associate the calllout with a mock response
        Test.setMock(HttpCalloutMock.class,mock);
        //Call method to Test
        HttpResponse result = AnimalsCallouts.makeGetCallout();
        //verify that the mock response is not null
        Assert.areNotEqual(null,result, 'The callout returned a null response');
        //verify the status code
        Assert.areEqual(200,result.getStatusCode(), 'The status code is not 200.');
        //verify content type
        Assert.areEqual('application/json;charset=UTF-8', result.getHeader('Content-Type'), 'The content type value is not expected');
        //verify thatthe array contains 3 items
        Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        Assert.areEqual(3, animals.size(),'The array should only contain 3 items');

    
    }

    @isTest
    public static void testPostCallout(){
        //set the mock callout class
        Test.setMock(HttpCalloutMock.class, new AnimalsHttpCalloutMock());
        //This causes a fake response to be sent
        //from the class that implements HttpCalloutMock.
        HttpResponse response = AnimalsCallouts.makePostCallout();
        //verify that the respose receieved contains fake values
        String contentType = response.getHeader('Content-Type');
        Assert.isTrue(contentType == 'application/json');
        String actualValue = response.getBody();
        System.debug(response.getBody());
        String expectedValue = '{"animals": ["majestic badger", "fluffy bunny", "scary bear","chicken","mighty moose"]}';
        Assert.areEqual(expectedValue, actualValue);
        Assert.areEqual(200, response.getStatusCode());

    }
    
}