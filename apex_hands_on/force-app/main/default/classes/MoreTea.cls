public with sharing class MoreTea {
    public static String flavor(){
        Map<String,String> teaTypes = new Map<String,String>();
        teaTypes.put('Black', 'Earthy');
        teaTypes.put('White','Sweet');
        teaTypes.put('Herbal','Sweet');
        System.debug(teaTypes); 
        String flavour = teaTypes.get('Black');

        System.debug('The flavour of Black tea is: ' + flavour);
        
        return flavour;
    }
    
}