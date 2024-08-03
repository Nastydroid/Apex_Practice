//storing soql result in a list
List<Contact> listOfContacts = [SELECT FirstName,LastName FROM Contact LIMIT 2];

System.debug(listOfContacts);