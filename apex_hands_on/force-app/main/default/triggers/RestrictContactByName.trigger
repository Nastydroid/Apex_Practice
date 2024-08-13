/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 08-13-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger RestrictContactByName on Contact (before insert, before update) {
    for(Contact con : Trigger.new){
        if(con.LastName == 'INVALIDNAME'){
            //i want to figure out what the comment below does
            //Trigger.newMap.get(con.Id).addError('Last Name cannot be Invalid');
            con.addError('The Last Name "'+ con.LastName+'" is not allowed for DML');
        }
    }

}