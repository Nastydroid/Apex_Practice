/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-06-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
//Doing a bulk dml efficiently

trigger DmlTriggerBulk on Account (before insert, before update) {
//Getting the related opportunities for the accounts in this trigger.

List<Opportunity> relatedOpps = [SELECT Id, Name, Probability FROM Opportunity WHERE AccountId IN :Trigger.new];

//a list to hold the iterated 
List<Opportunity> oppsUpdate = new List<Opportunity>();

for(Opportunity opp : relatedOpps){
    //update the description when probability is greater than 50% but less than 100%

    if((opp.Probability >= 50) && (opp.Probability < 100)){
        opp.Description = 'This is an average won rate for us';
        oppsUpdate.add(opp);

    }
}
//perform the dml on a collection at once
update oppsUpdate;



}