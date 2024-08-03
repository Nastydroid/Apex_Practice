public  class Company {
    public String companyName;
    public String ceo;
    public Integer employeeCount;
    public Long revenue;

    List<Client> customers = new List<Client>();


    public void addNewCustomer(String clientName, String website, String email, Long phone){
        Client customer = new Client (clientName, website, email, phone);
        customers.add(customer);
    }

    public void getAllCustomers(){
        for(Client cos : customers){
            System.debug('customer name and info -'+ cos.clientName + ' website ' + cos.website + ' email ' + cos.email + 'phone' + cos.phone );
        }
    }


    //innerClass
    private class Client{
        public String clientName;
        public String website;
        public String email;
        public Long phone;

        public Client(String clientName, String website, String email, Long phone){
            this.clientName = clientName;
            this.website = website;
            this.email = email;
            this.phone = phone;

        }


    }


}