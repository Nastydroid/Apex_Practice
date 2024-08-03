public with sharing class Covid19 {
   private Integer recoveredInArea = 0;
   private static Integer recoveredInCountry = 0;

   public Covid19(Integer recoveredInArea){
    this.recoveredInArea = recoveredInArea;
    recoveredInCountry += recoveredInArea;
   }

   public void treatPatient(){
    recoveredInArea++;
    recoveredInCountry++;
   }

   public Integer getTreated(){
    return recoveredInArea;
   }

  
}