public class AcctController {
    
    //Insert list of account
    public static List<Account> insertAccounts(List<Account> accountToInsert){
        insert accountToInsert;
        return accountToInsert;
    }
    
    //Insert an account record
    public static Account insertAccount(Account acctToInsert){
        insert acctToInsert; 
        return acctToInsert;
    }
    
    public static List<Account> getAllAccounts(){
     	   // Retrieve all accounts and assign to a List Collection
     	   List<Account> accounts = [SELECT Name, Phone FROM Account];
		   return accounts;
    }
    
    //print all accounts
    public static void printAllAccounts(){
     		List<Account> acctList = getAllAccounts(); 
        	for(Account account : acctList){
                System.debug('Account Name: '+account.Name+' Account Phone: '+account.Phone);
            }
    }
    
    public static Integer getAccountSize(){
        	List<Account> accounts = getAllAccounts();
        	return accounts.size();
    }

}