public with sharing class NewAccounts {
    public static void sObjectsInsert(Integer value) {
        Integer counter = 1;
        //creating a list to add our contacts
        List<Account> teaFactoryAccounts = new List<Account>();
        while (counter <= value){
            System.debug('The counter value before increment is : ' + counter);
            //creating a new account
            Account store = new Account();
            store.Name = 'The Bread Factory ' + counter;
            store.phone='35629-2828' + counter;
            store.AccountNumber = '35629' + counter; 
            //adding the account to the list
            teaFactoryAccounts.add(store);
            System.debug(teaFactoryAccounts);
            //increment the counter
            counter++;
            System.debug('Counter value afer increment: ' + counter);
        }
        System.debug('Size of Account List ' + teaFactoryAccounts.size());
        System.debug('Element in Account List: ' + teaFactoryAccounts);
        //inserts the list of accounts
        insert teaFactoryAccounts;

    }
    
}