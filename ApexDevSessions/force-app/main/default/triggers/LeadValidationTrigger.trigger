// Create a Trigger on Lead Object, to make sure each Record should have "Phone, Email, Title and AnnualRevenue" 
// upon Creating / Editing the Lead Record.
	
//	Object Name : Lead
//	Event Name  : Before Insert, Before Update.

trigger LeadValidationTrigger on Lead (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Lead ldRecord: Trigger.New){
            if(ldRecord.Phone == Null || ldRecord.Phone == '')
                ldRecord.Phone.addError('Phone field is required');
            if(ldRecord.Email == Null || ldRecord.Email == '')
                ldRecord.Email.addError('Email field is required');
            if(ldRecord.Title == Null || ldRecord.Title == '')
                ldRecord.Title.addError('Title field is required'); 
            if(ldRecord.AnnualRevenue == Null)
                ldRecord.AnnualRevenue.addError('Annual Revenue field is required');
        }
    }
}