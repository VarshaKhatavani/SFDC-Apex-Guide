/* Fitness class with methods to calculate human fitness */

public class Fitness {
    
    /* calculateBMI method 
	   accepts body weight (should be in kg)
	   returns BMI value */
    
    public static Decimal calculateBMI(Decimal weight, Decimal height){
        if(height <= 0 || weight < 0){
            return -1;
        }
        Decimal result = weight / (height*height);
        return result;
    }
    
    /**
     * calculatePace method
     * accepts distance (in km)
     * and minutes
     * returns pace in km/hr
	 */
    
    public static Decimal calculatePace(Decimal distance, Decimal minutes){
        if(distance < 0 || minutes <= 0){
            return -1;
        }
        Decimal hr = minutes/60 ;
        Decimal pace = distance / hr ; 
        return pace ;
    }

}