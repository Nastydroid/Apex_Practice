public with sharing class TemperatureConverter {
    //takes in farenheit and return celsius

    public static Decimal farenheitToCelsius(Decimal farenheit){
         if(farenheit == null){
            return null;
        }
        Decimal celsius = (farenheit - 32) * 5/9;
        return celsius.setScale(2);

       
    }
}