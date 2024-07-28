public with sharing class Tea {
    
    public static void orderTea(){
        Set<String> teaTypes = new Set<String>();
        teaTypes.add('Black');
        teaTypes.add('White');
        teaTypes.add('Herbal');
        System.debug(teaTypes);

    }

   Tea.orderTea();
}