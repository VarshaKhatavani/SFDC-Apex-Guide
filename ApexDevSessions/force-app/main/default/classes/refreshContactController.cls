public with sharing class refreshContactController {
    
    @AuraEnabled(cacheable=true)
    public static List<Contact>  getContactList(){
        try {          
            return [ SELECT Id, FirstName, LastName, Email, Phone FROM Contact LIMIT 10 ] ;         
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}