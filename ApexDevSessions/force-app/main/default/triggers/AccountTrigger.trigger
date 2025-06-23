/* Populate a Custom_Field__c on Account with "New Customer" during insert  */

trigger AccountTrigger on Account (before insert) {
    for(Account acc: Trigger.New){
        acc.Name = acc.FirstName + ' ' + acc.LastName;
        acc.Custom_Field__c = 'New Customer' ; 
    }
}