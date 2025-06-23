/*
 * Create a Trigger on Account Object, to Prevent the Deletion of an Active Account Record, 
 * Whose SLA is "Platinum", and Annual Revenue is more than 75,00,000.
	Object Name: Account.
	Event Name : Before Delete.
*
*   Stop The Delete if certain condition specified
*/

trigger PreventAccountDeletion on Account (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        // Record is being deleted - so use Trigger.old - Not New 
        for(Account acc: Trigger.Old){
            if(acc.Active__c == 'Yes' && acc.SLA__c == 'Platinum' && acc.AnnualRevenue > 7500000 ){
                acc.AddError('You are Not Authorized to Delete an Active Account Record.');
            }
        }
    }
}