public  class RandomContactFactory {
    //a public static method to generate the contacts
    public static List<Contact> generateRandomContacts(Integer amtCon, String LastName){
        List<Contact> conCr = new List<Contact>();
        for(Integer i = 0; i<amtCon; i++){
            Contact con = new Contact(FirstName = 'Robot ' + i, LastName = LastName);
            conCr.add(con);
        }

        return conCr;

    }
    
}