public with sharing class ContactAndLeadSearch {

        public static List<List<SObject>> searchContactsAndLeads(String findme){
            List<List<SObject>> findCl =[FIND :findme IN ALL FIELDS RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
            return findCl;

        }

    
}