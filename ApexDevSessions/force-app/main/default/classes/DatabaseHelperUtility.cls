public with sharing class DatabaseHelperUtility {

    public static void GetAllAccounts(){
        List<Account> lstAccounts = [Select ID, Name, Rating, Industry, AnnualRevenue, type, Ownership, Phone, Fax, SLA__c, Active__c from Account ] ;
        System.debug('Collection Size is.......: '+ lstAccounts.size() );
        if(!lstAccounts.isEmpty()){
            for(Account accRecord : lstAccounts){
                 System.debug('Account Record Id is.....: '+ accRecord.id);
                System.debug('Account Name is.....: '+ accRecord.Name);
                System.debug('Rating Value is.....: '+ accRecord.Rating);
                System.debug('Industry Name is.....: '+ accRecord.Industry);
                System.debug('Annual Revenue is....: '+ accRecord.AnnualRevenue);
                System.debug('Account Type is.....: '+ accRecord.Type);
                System.debug('Contact Number is.....: '+ accRecord.Phone);
                System.debug('Fax Number is.......: '+ accRecord.Fax);
                System.debug('Customer SLA is......: '+ accRecord.SLA__c);
                System.debug('Active Status is.....: '+ accRecord.Active__c);
                System.debug('-----------------------------------------');
            }
        }
    }

    // Fetch All the Lead Records from the Lead Object, and represent the records on the Debug Log File.

    public static void GetAllLeadRecords(){
        for(Lead ldRecord : [Select ID, FirstName, LastName, Email, Company, Title, Phone, Fax, Industry, AnnualRevenue, Status from Lead ]){
             System.debug('Lead Record Id is......: '+ ldRecord.id);
                System.debug('Lead Person Name is.....: '+ ldRecord.FirstName + ' '+ ldRecord.LastName);
                System.debug('Lead Company Name is.....: '+ ldRecord.Company);
                System.debug('Lead Status is.........: '+ ldRecord.Status);
                System.debug('Current Designation is.....: '+ ldRecord.Title);
                System.debug('Lead Contact Number is.....: '+ ldRecord.Phone);
                System.debug('Lead Fax Number is.......: '+ ldRecord.Fax);
                System.debug('Lead Email Address is......: '+ ldRecord.Email);
                System.debug('Current Annual Revenue.......: '+ ldRecord.AnnualRevenue);
                System.debug('---------------------------------------------');
        }
        System.debug('Number of Records Returned.......: '+ System.Limits.getQueryRows());
    }

    public static void GetAllContacts(){
        Map<ID, Contact> mapContacts = new Map<ID, Contact>([Select ID, Name, Email, Phone, Fax, Department, Title, AccountId, OwnerId, Birthdate from Contact]); 
        System.debug('Number of Record Returned.....' + mapContacts.size()) ; 

        // get values from map
        if(!mapContacts.isEmpty()){
            for(Contact conRecord : mapContacts.values()){
                System.debug('Contact Record is.....: '+ conRecord);
            }
        }
    }

    // Write an Apex Program, to Fetch All the Opportunity Records from the Object,
	// and represent on the Debug Log File.

    public void GetAllOpportunity(){

        List<Opportunity> lstOpprtunity = new List<Opportunity>([Select ID, Name, Amount, StageName, CloseDate, OwnerID, AccountID, Type from Opportunity where Amount > 10000 Order By Amount Desc Limit 100 Offset 50 all rows]);

        System.debug('Number of Opportunities Returned.....: '+ lstOpprtunity.size());

        for(Opportunity oppRecord : lstOpprtunity){
            System.debug('Opportunity Record is.....: '+ oppRecord);
        }
    }

    // 	2. Write an Apex Program, to fetch All the Case Records from the Object, store
	// them to a Map Collection. And represent the records on the Debug Log File.

    public static void GetCaseRecords(){

        Map<ID, Case> mapCaseRecords = new Map<ID, Case>([Select ID, CaseNumber, Subject, Priority, Status, AccountId, ContactId, Description, OwnerId from Case ALL ROWS]);
        System.debug('Number of Case Records Returned.....:' + mapCaseRecords.size() ) ;

        if(!mapCaseRecords.isEmpty()){
            for(Case caseRecord : mapCaseRecords.values()){
                System.debug('Case Record is.....: '+ caseRecord);
            }   
        }
    }

    //	Write an Apex Program, to Fetch All the Case Records from the Object based on the specified Status at runtime.

    public static void GetCaseRecordsByStatus(String caseStatus){
        if(caseStatus != Null && caseStatus != ''){
            List<Case> lstCaseRecords = new List<Case>([Select ID, CaseNumber, Subject, Priority, Status, AccountId, ContactId, Description, OwnerId 
                                                                FROM Case 
                                                                    WHERE Status =: caseStatus]);
            System.debug('Number of Case Records Returned.....:' + lstCaseRecords.size());
            if(!lstCaseRecords.isEmpty()){
                for(Case caseRecord : lstCaseRecords){
                    System.debug('Case Record is.....: '+ caseRecord);
                }
            }
        }
    }

    //	Write an Apex Program, to Fetch All the Case Records from the Case Object, based on the Sepecified Industry Name at runtime.
    public static void GetCasesByIndustry(String industryName){
        if(industryName != Null && industryName != ''){
            // Get the Account Records based on the Industry Name...
            Map<Id, Account> mapAccounts = new Map<Id, Account>([Select Id, Name, Rating, Industry, AnnualRevenue
                                                                		from Account
                                                                			Where Industry =: industryName]);
            if(!mapAccounts.isEmpty()){
                List<Case> lstCases = [Select Id, CaseNumber, Status, Priority, Origin, AccountID, Subject
                                            FROM Case
                                                WHERE AccountID IN : mapAccounts.keyset()] ;

                System.debug('Number of Case Records Returned....'+ lstCases.size());

                if(! lstCases.isEmpty()){
                    for(Case csRecord : lstCases){
                    	System.debug('Case Record Details are.......: '+ csRecord);
                    }
                }
            }   
        }
    }


    // 	Write an Apex Program, to fetch the Specified Number of Records from the ResultSet by Skipping the specified number of records from the resultset.
    public static void GetRecordsByLimit(Integer limitValue, Integer offsetValue){
        if(limitValue > 0){
            List<Account> lstAccount = [Select ID, Name, Industry, Rating, AnnualRevenue, Phone, Fax, Active__c, SLA__c
                                       		FROM Account
                                       			ORDER BY Name 
                                       				LIMIT : limitValue
                                       				OFFSET : offsetValue] ;
            
            if(!lstAccount.isEmpty()){
                for(Account acc: lstAccount){
                    System.debug('Account record.....'+ acc);
                }
            }
            
        }
    }
    
    
    //Write an Apex Program, to Fetch All the Account Records from the Object, based on the specified "Industry Name" at runtime.
    public static void GetAccountsByIndustry(String industryName){
        
        if(industryName != Null && industryName != ''){
         	
            String accountsQuery = 'Select Id, Name, Industry, Rating, AnnualRevenue, '+ 
                			'Phone, Fax, SLA__c, Active__c'+
                			 ' FROM Account WHERE Industry =: industryName';
            
            List<Account> lstAccount = Database.Query(accountsQuery);
            
            System.debug('Number of Records Returned.....: '+ lstAccount.Size());
            
            if(!lstAccount.isEmpty()){
                for(Account accRecord: lstAccount){
             		System.debug('Account Record is.....: '+ accRecord);       
                }
            }
        }
    }

}

// DatabaseHelperUtility.GetAllLeadRecords();
// DatabaseHelperUtility.GetAllAccounts();
// DatabaseHelperUtility.GetCaseRecordsByStatus('Closed');
// DatabaseHelperUtility.GetRecordsByLimit(10, 2);
// DatabaseHelperUtility.GetAccountsByIndustry('Energy');