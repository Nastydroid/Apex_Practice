//Declare an Integer variable called totalGuests and set it to 100
Integer totalGuests = 100;
  
//Declare an Integer variable called totalAmountSugar and set it to 159 (number of teaspoons in a bag of sugar).
Integer totalAmountSugar = 159;
  
//Declare an Integer variable called totalAmountTea and set it to 35 (number of teabags).
Integer totalAmountTea = 35;
  
do {
    //deduct sugar serving
    totalAmountSugar--;
  
    //deduct tea serving
    totalAmountTea--;
  
    //deduct guest
    totalGuests--;
  
    System.debug(totalGuests + ' Guests Remaining!');
  
    //check ingredients
    if(totalAmountSugar == 0 || totalAmountTea == 0) {
        System.debug('Out of ingredients!');
        break; //ends the While loop
    }
  
} while(totalGuests > 0);