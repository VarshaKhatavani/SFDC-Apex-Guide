public with sharing class RefreshController {
    
    @AuraEnabled
    public static List<Account>  getAccountRating(Id accountId){
        try {
            return [ SELECT Id, Rating from Account WHERE Id =: accountId ] ; 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

}