// Create a Trigger on Account Object, to make sure the Account Rating, Industry,
// Type and Phone should be required upon Creating a New Account Record inside the Object.
	
//		Object Name : Account.
//		Event Name  : Before Insert.

trigger AccountsValidationTrigger on Account (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc: Trigger.New){
            if(acc.Rating == Null || acc.Rating == '')
                acc.Rating.addError('Rating field is required');
            if(acc.Industry == Null || acc.Industry == '')
                acc.Industry.addError('Industry field is required');
            if(acc.Type == Null || acc.Type == '')
                acc.Type.addError('Type field is required');
            if(acc.Phone == Null || acc.Phone == '')
                acc.Phone.addError('Phone field is required');
        }
    }

}