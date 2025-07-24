/**
 * Test Guest User Context - Run as System Admin to simulate guest user
 */

System.debug('=== TESTING AS GUEST USER CONTEXT ===');

// Find the guest user profile
List<Profile> guestProfiles = [SELECT Id, Name FROM Profile WHERE Name LIKE '%Guest%' OR Name LIKE '%Portfolio%'];
System.debug('Found ' + guestProfiles.size() + ' potential guest profiles:');
for (Profile p : guestProfiles) {
    System.debug('  - ' + p.Name + ' (' + p.Id + ')');
}

// Test field accessibility for guest user
System.debug('\n--- TESTING FIELD ACCESSIBILITY ---');

// Test if guest can access key fields
try {
    // Test the exact query from PortfolioDataService
    List<Portfolio_Experience__c> experiences = [
        SELECT Id, Name, Job_Title__c, Company__c, Start_Date__c, End_Date__c, Display_Order__c
        FROM Portfolio_Experience__c 
        LIMIT 1
    ];
    System.debug('✅ Can access Portfolio_Experience__c fields: ' + experiences.size());
} catch (Exception e) {
    System.debug('❌ Portfolio_Experience__c field access error: ' + e.getMessage());
}

// Check specific field permissions
Schema.DescribeFieldResult jobTitleDescribe = Portfolio_Experience__c.Job_Title__c.getDescribe();
System.debug('Job_Title__c accessible: ' + jobTitleDescribe.isAccessible());

Schema.DescribeFieldResult companyDescribe = Portfolio_Experience__c.Company__c.getDescribe();
System.debug('Company__c accessible: ' + companyDescribe.isAccessible());

// Test Achievement subquery access
try {
    List<Portfolio_Experience__c> expWithAchievements = [
        SELECT Id, Name,
               (SELECT Id, Name, Display_Order__c 
                FROM Portfolio_Achievements__r 
                ORDER BY Display_Order__c ASC)
        FROM Portfolio_Experience__c 
        LIMIT 1
    ];
    System.debug('✅ Can access Portfolio_Achievement__c relationship: ' + expWithAchievements.size());
} catch (Exception e) {
    System.debug('❌ Portfolio_Achievement__c relationship error: ' + e.getMessage());
}

System.debug('\n--- TESTING OBJECT ACCESSIBILITY ---');
// Test object accessibility
System.debug('Portfolio_Experience__c object accessible: ' + Schema.getGlobalDescribe().get('Portfolio_Experience__c').getDescribe().isAccessible());
System.debug('Portfolio_Skill__c object accessible: ' + Schema.getGlobalDescribe().get('Portfolio_Skill__c').getDescribe().isAccessible());
System.debug('Portfolio_Project__c object accessible: ' + Schema.getGlobalDescribe().get('Portfolio_Project__c').getDescribe().isAccessible());
System.debug('Portfolio_Achievement__c object accessible: ' + Schema.getGlobalDescribe().get('Portfolio_Achievement__c').getDescribe().isAccessible());

System.debug('\n=== GUEST USER CONTEXT TEST COMPLETE ==='); 