public with sharing class CreateAccountAndContact {
    static ID acctid;
    //A method to create new account 
    public static void account(String account_name,String phone_number,Integer NumberofEmployees,String BillingCity){
        try{
        Account freshAcct = new Account(Name = account_name, Phone = phone_number,NumberofEmployees= NumberofEmployees,BillingCity =BillingCity);
        //persist the account inside the org database
        insert freshAcct;
        //this will be used to map contacts to accounts
        acctid = freshAcct.Id;
        System.debug('Account created successfully');
        }catch(DmlException e){
            System.debug('There was an error' + e.getMessage());
            
        }


    }

    public static void contact(String FirstName, String LastName,String phone_number,String Department){
        try{
        Contact FreshCon = new Contact(FirstName = FirstName, LastName = LastName, Phone = phone_number, Department = Department, AccountId = acctid);
        insert FreshCon;
        System.debug('A new contact was created');
        }catch(DmlException e){
            System.debug('There was an error ' + e.getMessage());
            
        }
    }

    //CreateAccountAndContact.account('SFDC Space Man','(234)123-2331',50,'Lagos'); test code for execution
    //CreateAccountAndContact.contact('oluwafemi','Thompson','(234)32-1212','Wingo');
}