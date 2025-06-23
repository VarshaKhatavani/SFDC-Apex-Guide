/* Write an Apex Program to Insert a Lead Record inside the object, and create a Related 
   Task Record. */

public with sharing class LeadRecordUtility {

    public void CreateLeadRecord() {

        Lead ldRecord = new Lead();

            ldRecord.FirstName = 'Varsha' ;
            ldRecord.LastName = 'Khatavani' ;
            ldRecord.company = 'Microsoft Corporation'; 
            ldRecord.Title = 'Senior Software Engineer'; 
            ldRecord.Industry = 'Technology';
            ldRecord.AnnualRevenue = 25000000 ;
            ldRecord.Phone = '9799896979' ;
            ldRecord.Email = 'Khatavani.varsha@outlook.com' ;
            ldRecord.city = 'Pune' ;
            ldRecord.State = 'Maharashtra';
            ldRecord.Country = 'India';
            ldRecord.Status = 'Working - Contacted';
        insert ldRecord ;

        if(ldRecord.id != Null){
            System.debug('Lead Record has been created Successfully... Record is..'+ ldRecord.id);

            Task tsk = new Task();

                tsk.Priority = 'High' ;
                tsk.Status = 'Not Started' ; 
                tsk.Subject = 'Regarding Lead Contact' ;
                tsk.Description = 'Please Contact the Lead Post - Lunch';
                tsk.ActivityDate = System.today();

                // Relate the task to Lead Record
                tsk.whoId = ldRecord.id;

            insert tsk ;
        }

    }
}