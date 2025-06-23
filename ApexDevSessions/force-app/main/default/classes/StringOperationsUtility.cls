public with sharing class StringOperationsUtility {

    public static void concateString(String str1, String str2){
        System.debug('Concatenation Result is......: '+ str1 + ' '+ str2);
    }

    public static void checkEquals(String str1, String str2){
        //text comparisons are case sensitive
        if(str1 == str2){
            System.debug('Text - Both strings are identicle');
        }
        else{
            System.debug('Text - both strings are different');
        }

        //Binary comparisons are case insensitive
        if(str1.equals(str2)){
            System.debug('Binary - Both the Strings are Same.');
        }
        else{
            System.debug('Binary - Both the Strings are Different.');
        }
    }

    public static void GetStringLength(String str){
        System.debug('Number of character count is....'+str.length());
    }

    public StringOperationsUtility() {
        System.debug('Constructor Called');
    }
}