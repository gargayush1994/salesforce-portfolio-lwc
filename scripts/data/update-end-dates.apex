/**
 * Update End_Date__c field on Portfolio_Experience__c records
 * Only current job (Uber) should have null End_Date__c (shows as "Present")
 */

// Query existing experience records
List<Portfolio_Experience__c> experiences = [
    SELECT Id, Company__c, Start_Date__c, End_Date__c, Display_Order__c 
    FROM Portfolio_Experience__c 
    ORDER BY Display_Order__c
];

List<Portfolio_Experience__c> toUpdate = new List<Portfolio_Experience__c>();

for (Portfolio_Experience__c exp : experiences) {
    // Only update records that don't have end dates and aren't the current job
    if (exp.End_Date__c == null && exp.Display_Order__c != 1) {
        
        Portfolio_Experience__c updateRecord = new Portfolio_Experience__c();
        updateRecord.Id = exp.Id;
        
        // Set end dates based on job timeline
        if (exp.Company__c == 'Walmart Global Tech India') {
            updateRecord.End_Date__c = Date.newInstance(2024, 10, 1); // Ended when started Uber
        } else if (exp.Company__c == 'Preqin') {
            updateRecord.End_Date__c = Date.newInstance(2021, 3, 1); // Ended when started Walmart
        } else if (exp.Company__c == 'Deloitte') {
            updateRecord.End_Date__c = Date.newInstance(2020, 9, 1); // Ended when started Preqin
        } else if (exp.Company__c == 'Wipro') {
            updateRecord.End_Date__c = Date.newInstance(2019, 4, 1); // Ended when started Deloitte
        }
        
        if (updateRecord.End_Date__c != null) {
            toUpdate.add(updateRecord);
        }
    }
}

if (!toUpdate.isEmpty()) {
    update toUpdate;
    System.debug('Updated ' + toUpdate.size() + ' experience records with end dates');
    
    for (Portfolio_Experience__c exp : toUpdate) {
        System.debug('Updated: ' + exp.Id + ' with end date: ' + exp.End_Date__c);
    }
} else {
    System.debug('No records to update');
}

System.debug('End date update complete!'); 