public class AccountContact {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> allAccountsWithContacts(){
                		(SELECT Id, Name, Phone, Email FROM Contacts) 
                		FROM Account 
                		LIMIT 5];
    }

}