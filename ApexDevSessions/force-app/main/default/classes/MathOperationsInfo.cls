public with sharing class MathOperationsInfo {

    public void Addition(Integer firstNo, Integer secondNo){
        System.debug('Addition Result is....'+(firstNo+secondNo));
    }

    public Integer AdditionFunc(Integer firstNo, Integer secondNo){
        return firstNo + secondNo;
    }

    public void Multiply(Integer firstNumber, Integer secondNumber, Integer thirdNumber){
        System.debug('Multiply Result is.....: '+ (firstNumber * secondNumber * thirdNumber));
    }

    public void Division(Integer firstNumber, Integer secondNumber){
        if(secondNumber > 0)
            System.debug('Division Operation Result is....: '+ (firstNumber / secondNumber));
        else
            System.debug('We cannot Perform Division Operation. As the Second Number Value is Zero.');
    }

    public MathOperationsInfo(){
        System.debug('Executing Methods within the Class');
        Addition(10, 20);
        Multiply(2, 3, 4);
        Division(10, 2);
        Division(10, 0);
        System.debug('Addition of two numbers is....'+ AdditionFunc(10, 20));
    }
}

// execute in anonymous window
//new MathOperationsInfo(); // Creating an instance will automatically call the constructor and execute the methods