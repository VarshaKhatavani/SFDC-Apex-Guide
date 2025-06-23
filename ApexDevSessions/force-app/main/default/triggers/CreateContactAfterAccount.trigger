/* After Account Creation, create a default contact */

trigger CreateContactAfterAccount on Account (after insert) {   
    
    List<Contact> contactToInsertList = new List<Contact>(); 
    
    for(Account acc: Trigger.New){
        contactToInsertList.add( new Contact(
            LastName = acc.FirstName + ' Contact',
            Email = acc.FirstName+'@gmail.com',
            Phone = '7975923198',
            Title = 'Software Engineer', 
            AccountId = acc.Id 
        ));
    }
    insert contactToInsertList ;
}