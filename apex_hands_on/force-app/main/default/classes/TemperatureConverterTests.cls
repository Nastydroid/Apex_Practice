@IsTest
public with sharing class TemperatureConverterTests {
    
    @IsTest
    static void TestWarmTemp(){
        //Given
        Decimal initialTemp = 70;
        //when
        Test.startTest();
        Decimal celsius = TemperatureConverter.farenheitToCelsius(initialTemp);
        Test.stopTest();
        //then
        Assert.areEqual(21.11, celsius);
    }

    @IsTest
    static void testFreezingPoint(){
        //given
        Decimal initialTemp = 32;
        //when
        Test.startTest();
        Decimal celsius = TemperatureConverter.farenheitToCelsius(initialTemp);
        Test.stopTest();
        Assert.areEqual(0, celsius);
    }

    @IsTest
    static void testBoilingPoint(){
        Decimal initialTemp = 212;
        Test.startTest();
        Decimal celsius = TemperatureConverter.farenheitToCelsius(initialTemp);
        Test.stopTest();

        Assert.areEqual(100, celsius,'Boiling point temperature is not expected');

    }

    @isTest
    static void testNegativeTemp(){
        Decimal initialTemp = -10;
        Test.startTest();
        Decimal celsius = TemperatureConverter.farenheitToCelsius(initialTemp);
        Test.stopTest();
        Assert.areEqual(-23.33, celsius);
    }

    @IsTest
    static void testNullTemp(){
        //given
        Decimal initialTemp = null;
        Test.startTest();
        Decimal celsius = TemperatureConverter.farenheitToCelsius(initialTemp);
        Test.stopTest();
        Assert.areEqual(null, celsius);
    }


}