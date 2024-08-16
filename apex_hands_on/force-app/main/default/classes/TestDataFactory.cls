
@isTest
public class TestDataFactory {
    public static List<Account> createAccountWithOpps(Integer numAcct, Integer numOppsPerAcct){
        List<Account> accts =new List<Account>();
        for(Integer i = 0; i < numAcct; i++){
            Account a = new Account(Name ='TestAccount  ' + i);
            accts.add(a);
        }

        insert accts;

        List<Opportunity> opp = new List<Opportunity> ();
        for(Integer j = 0; j < numAcct; j++){
            Account acct =accts[j];

            for(Integer k =0; k < numOppsPerAcct; k++) {
                opp.add(new Opportunity(Name = acct.Name + ' Opportunity ' + k,
                 StageName = 'Prospecting',
                 CloseDate = System.today().addMonths(1),
                 AccountId = acct.Id));
            }
            
        }

        insert opp;
        return accts;
        
        
    }
}