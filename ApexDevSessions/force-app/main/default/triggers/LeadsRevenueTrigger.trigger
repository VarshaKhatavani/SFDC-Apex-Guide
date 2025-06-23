/**
 * Create a Trigger on Lead Object, to Auto-Populate the AnnualRevenue value based on the Lead 
 * Industry Name at runtime as below.
	
                Industry Name			Annual Revenue
				---------------------------------------
				  Banking					65,00,000
				  Finance					50,00,000
				  Insurance				    71,00,000
				  Manufacturing			    42,00,000  
				  Consulting				50,00,000
				  Education				    81,00,000
				  Technology				75,00,000
					
Object Name : Lead Object
Event Name  : Before Insert, Before Update.
 * 
 */

trigger LeadsRevenueTrigger on Lead (before insert, before update) {

    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Lead ldRecord: Trigger.New){
            if(ldRecord.Industry == 'Banking'){
                ldRecord.AnnualRevenue = 65000000;
            }else if(ldRecord.Industry == 'Finance'){
                ldRecord.AnnualRevenue = 5000000;
            }else if(ldRecord.Industry == 'Insurance'){
                ldRecord.AnnualRevenue = 7100000;
            }else if(ldRecord.Industry == 'Manufacturing'){
                ldRecord.AnnualRevenue = 42;
            }else if(ldRecord.Industry == 'Consulting'){
                ldRecord.AnnualRevenue = 5000000;
            }else if(ldRecord.Industry == 'Education'){
                ldRecord.AnnualRevenue = 8100000;
            }else if(ldRecord.Industry == 'Technology'){
                ldRecord.AnnualRevenue = 7500000;
            }
            
        }
    }
    
}