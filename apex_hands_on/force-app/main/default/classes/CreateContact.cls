/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-23-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CreateContact {

        public static Contact cCreate(String first, String last){
            Contact newContact = new Contact (FirstName = first, LastName = last);
            try{
                insert newContact;
                return newContact;
            }catch(DmlException e){
                System.debug('A Dml execption occcured ' + e.getMessage());
                return null;
            }
            

        }

    
}