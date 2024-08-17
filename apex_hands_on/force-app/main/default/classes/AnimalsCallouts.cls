public with sharing class AnimalsCallouts {
    public static HttpResponse makeGetCallout(Integer D){
        Http http = new Http();

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'+ D);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        //if the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200){
            //Deserializes the JSON string into collections of Primitiva data types.
            Map<String,Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal : animals){
                System.debug(animal);
            }
        }
        return response;

    }

    public static HttpResponse makePostCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name": "mighty moose"}');
        HttpResponse response = http.send(request);
        //parse the JSON response
        if(response.getStatusCode() !=201){
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        }else{
            System.debug(response.getBody());
        }
        return response;
    }
}