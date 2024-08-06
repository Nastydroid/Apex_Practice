/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-06-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger AddRelatedRecord on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    List<Account> toProcess = null;

    switch on Trigger.operationType {
        when AFTER_INSERT  {
            toProcess = Trigger.New;
            
        }
        when AFTER_UPDATE {
            toProcess = [SELECT Id,Name FROM Account
            WHERE Id IN :Trigger.New AND Id NOT IN (SELECT AccountId FROM Opportunity WHERE AccountId in :Trigger.New)];
            
        }
    }
    //add an opportunity for each account if it does not have one
    //iterate through each account
    for(Account a : toProcess){
    
        oppList.add(new Opportunity(Name = a.Name + 'Opportunity',
                                       StageName='Prospecting',
                                       CloseDate = System.today().addMonths(1),
                                       AccountId = a.Id));
        }
    
    if(oppList.size() > 0){
        insert oppList;
    }
        
 
}