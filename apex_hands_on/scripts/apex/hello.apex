// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

/*string tempvar = 'Macdodger';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);*/

List<String> groce = new List<String>{'tea','sugar','honey','milk'};

System.debug('groce: ' + groce);

groce.add(2,'nut');
groce.add(4,'granola');

System.debug('groce extra: ' + groce);

