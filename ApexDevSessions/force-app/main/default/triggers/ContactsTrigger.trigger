// 	Create a Trigger on Contact Object, to make sure Contact Record should have "Phone, Title and Email" field values.
	
//	Object Name : Contact.
//	Event Name  : Before Insert.

trigger ContactsTrigger on Contact (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Contact conRecord : Trigger.New ){
            if(conRecord.Phone == Null || conRecord.Phone == ''){
                conRecord.Phone.addError('Phone field is required'); 
            }
            if(conRecord.Title == Null || conRecord.Title == '') {
                conRecord.Title.addError('Title field is required'); 
            }
            if(conRecord.Email == Null || conRecord.Email == ''){
                conRecord.Email.addError('Phone field is required'); 
            }
        }
    }
}