String waterLevel ='hlf';

if(waterLevel == 'empty'){
    System.debug('fill the kettle up');
    waterLevel = 'full';
}else if(waterLevel=='half'){
    System.debug('the kettle is almost full');
}else{
    System.debug('baba the kettle is full full');
}

//using switch\

switch on waterLevel{
    when 'empty'{
        System.debug('kettle needs water');
    }

    when 'full'{
        System.debug('kettle is full leave it');
    } 
    when 'half'{
        System.debug('Okay it is almost full');
    }
    when else{
        System.debug('error error');
    }
}