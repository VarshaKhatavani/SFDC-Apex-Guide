/* Prevent Name Change for Existing Accounts */
trigger PreventAccountNameChange on Account (before update) {
    for(Account acc: Trigger.New){
        System.debug('acc....new...'+acc);        
        Account oldAcc = Trigger.oldMap.get(acc.Id);       
        System.debug('acc...old...'+oldAcc);
        if(acc.FirstName != oldAcc.FirstName || acc.LastName != oldAcc.LastName ){
            acc.addError('You can not change the Account Name');
        }
    }
}