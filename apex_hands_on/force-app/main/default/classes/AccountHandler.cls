public with sharing class AccountHandler{

    public static  void insertAccount(Integer num) {
        Integer n = 0;
        //creating account List
        List<Account> addAccounts = new List <Account>();
        while (n != num){
            Account factory = new Account();
            factory.Name = 'Acme Inc ' + n;
            factory.AccountNumber = 'A000' + n;
            System.debug('account created successfully');
            //increment n
            n++;
            //add the account to the list after creation
            addAccounts.add(factory);
            
        }
        System.debug('we have a total of ' + addAccounts.size() + ' new accounts');
        insert addAccounts;

    }
}