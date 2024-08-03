public with sharing class EmailMissionSpecialist {
    //public method
    public void sendMail(String address, String subject, String body){
        //create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses =new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //pass this email message to the built in sendEmail method
        //of Messaging class
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        //call a helper method to inspect the returned results
        inspectResults(results);
    }

    //Helper method
    Private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean SendResult = true;
        // sendEmail returns an array of result objects.
      // Iterate through the list to inspect results. 
      // In this class, the methods send only one email, 
      // so we should have only one result.
      for(Messaging.SendEmailResult res : results){
        if(res.isSuccess()){
            System.debug('Email sent successfully');
        }
        else{
            SendResult = false;
            System.debug('The following errors occured: ' + res.getErrors());
        }
      }
      return SendResult;
    }
    
}