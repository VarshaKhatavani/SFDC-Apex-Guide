public class HelloWorld{

    String greeting = 'Hello World';

    public void printGreeting() {
        System.debug(greeting);
    }
    
    /*
    * Generic method to print any message
    * */
    public void printMessage(String msg){
		system.debug(msg) ; 
    }
    
    /*method accepts a day number and returns the day name*/
    
    public String getDay(Integer dayNumber){
        String dayString = '' ;
        switch on dayNumber {
            when 0 {
                dayString = 'Sunday' ;
            }
            when 1 {
                dayString = 'Monday' ;
            }
             when 2 {
                dayString = 'Tuesday';
            }
            when 3 {
                dayString = 'Wednesday';
            }
            when 4 {
                dayString = 'Thursday';
            }
            when 5 {
                dayString = 'Friday';
            }
            when 6 {
                dayString = 'Saturday';
            }
            when else {
                dayString = 'Invalid day number';
            }
        }
        return dayString;
    }
    
    /*
     * This method accepts a day abbreviation and
     * returns the name of the day
     * */
    public String getDay(String dayAbbreviation){
        String dayString = '';

        switch on dayAbbreviation {
            when 'Sun' {
                dayString = 'Sunday';
            }
            when 'Mon' {
                dayString = 'Monday';
            }
            when 'Tue' {
                dayString = 'Tuesday';
            }
            when 'Wed' {
                dayString = 'Wednesday';
            }
            when 'Thu' {
                dayString = 'Thursday';
            }
            when 'Fri' {
                dayString = 'Friday';
            }
            when 'Sat' {
                dayString = 'Saturday';
            }
            when else {
                dayString = 'Invalid abbreviation';
            }
        }
        return dayString;
    }
    
    // get an error about access modifiers
    // public class ===> global method not possible
    /*global void printPublicGreeting() {
        System.debug(publicGreeting);
    }*/
}