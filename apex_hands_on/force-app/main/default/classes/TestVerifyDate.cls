@isTest
public class TestVerifyDate {
    
    @isTest
    static void checkDates(){
        
        Date date1 = date.today();
        Date date2 = date.newInstance(2024,08,04);
        
        Date checkDdate= VerifyDate.CheckDates(date1, date2);
        
        Date date3 = date.newInstance(2024,08,31);
        
        System.assertEquals(date3, checkDdate);
    }
    
    @isTest
    static void checkDates2(){
        Date date1 = date.today();
        Date date2 = date.newInstance(2024,09,09);
        Date checkDdate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2,checkDdate);
        
        
    }
    
    
    @isTest
    static void test30days(){
        
        Date date1 = date.today();
        Date date2 = date.newInstance(2024,09,10);
        
        boolean result = VerifyDate.DateWithin30Days(date1, date2);
        
        System.assertEquals(true,result);
        
    }
    
    @isTest
    static void test30days2(){
        Date date1 = date.today();
        Date date2 = date.newInstance(2024,06,10);
        boolean result = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(false,result);
        
        
    }
    
    @isTest
    static void test30days3(){
    	Date date1 = date.today();
        Date date2 = date.newInstance(2024,09,13);
        boolean result = VerifyDate.DateWithin30Days(date1, date2);
        System.assertEquals(false,result);
        
    }
    
    @isTest
    static void setEndOfTheMonthTest(){
        Date date1 = date.today();
        Date result =VerifyDate.SetEndOfMonthDate(date1);
        Date date2 = date.newInstance(2024,08,31);
        System.assertEquals(date2,result);
    }

}