public with sharing class AccountController {

    @AuraEnabled(cacheable = true)
    public static List<Account> getAccountList() {
        try {
            return [ Select Id, Name, Type, Industry from Account LIMIT 10 ] ;   
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> filterAccountType(String type){
        try {
            return [ Select Id, Name, Industry, Type from Account where Type  =: type LIMIT 5]  ;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey){
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, Name, AccountNumber, Type, Industry
            FROM Account
            WHERE Name LIKE : key
            ];
    }

}