/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-06-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    //a list to hold the iterated opportunities

    List<Task>  newTask = new List <Task> ();

    //let us iterate through the sObject

    for(Opportunity opps : Trigger.New){
        
        //let's check our conditon for the trigger to work

        if(opps.StageName == 'Closed Won'){
            newTask.add(new Task(Subject = 'Follow Up Test Task', WhatId = opps.Id));
        }
    }

    //let's do a bulk dml
    if(newTask.size() > 0){
        insert newTask;
    }


}