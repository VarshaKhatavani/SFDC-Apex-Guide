public class OrderofExecution {

	public integer cnt = 0;
    public static integer increment = 0;
    
    // initialization block 1
    {
        System.debug('Initilization Block 1 is Called');
    }
    
    // initialization block 2
    {
         System.debug('Initilization Block 2 is Called');
    }
    
    // static initialization block 1
    static{
    	System.debug('Static Initilization Block 1 is Called');    
    }
    
    // static initialization block 2
    static{
        System.debug('Static Initilization Block 2 is Called');    
    }
    
    //blank constructor
    public OrderofExecution(){
        System.debug('Blank Constructor is called');
    }
    
    // paramterrized constructor to set the class variable value
    public OrderofExecution(Integer increment){
        this(); //calling blank constructor
        System.debug('Parameterized Constructor is called');
    }
    
    public void increaseCounter(){
        cnt++;
        increment++;
    }
	
    public static void printCount(){
        System.debug('Total Increment....'+increment);
    }
}

/*
    OrderofExecution obj = new OrderofExecution(6);
    obj.increaseCounter();
    System.debug('After increase counter is..'+obj.cnt);
    OrderofExecution.printCount();
*/