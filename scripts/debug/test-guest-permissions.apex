/**
 * Script to test guest user permissions for portfolio objects
 * Run this as the guest user context to verify permissions
 */

System.debug('=== Testing Portfolio Object Permissions ===');

try {
    // Test Portfolio Experience access
    List<Portfolio_Experience__c> experiences = [
        SELECT Id, Name, Job_Title__c, Company__c, Start_Date__c, End_Date__c, Display_Order__c
        FROM Portfolio_Experience__c 
        LIMIT 1
    ];
    System.debug('✅ Portfolio_Experience__c: Access OK - Found ' + experiences.size() + ' records');
} catch (Exception e) {
    System.debug('❌ Portfolio_Experience__c: ' + e.getMessage());
}

try {
    // Test Portfolio Achievement access
    List<Portfolio_Achievement__c> achievements = [
        SELECT Id, Name, Portfolio_Experience__c, Display_Order__c
        FROM Portfolio_Achievement__c 
        LIMIT 1
    ];
    System.debug('✅ Portfolio_Achievement__c: Access OK - Found ' + achievements.size() + ' records');
} catch (Exception e) {
    System.debug('❌ Portfolio_Achievement__c: ' + e.getMessage());
}

try {
    // Test Portfolio Skill access
    List<Portfolio_Skill__c> skills = [
        SELECT Id, Name, Category__c, Display_Order__c
        FROM Portfolio_Skill__c 
        LIMIT 1
    ];
    System.debug('✅ Portfolio_Skill__c: Access OK - Found ' + skills.size() + ' records');
} catch (Exception e) {
    System.debug('❌ Portfolio_Skill__c: ' + e.getMessage());
}

try {
    // Test Portfolio Project access
    List<Portfolio_Project__c> projects = [
        SELECT Id, Name, Description__c, Features__c, Icon_Name__c, Display_Order__c
        FROM Portfolio_Project__c 
        LIMIT 1
    ];
    System.debug('✅ Portfolio_Project__c: Access OK - Found ' + projects.size() + ' records');
} catch (Exception e) {
    System.debug('❌ Portfolio_Project__c: ' + e.getMessage());
}

try {
    // Test the main Apex method
    List<Map<String, Object>> result = PortfolioDataService.getExperienceData();
    System.debug('✅ PortfolioDataService.getExperienceData(): Access OK - Returned ' + result.size() + ' records');
} catch (Exception e) {
    System.debug('❌ PortfolioDataService.getExperienceData(): ' + e.getMessage());
}

System.debug('=== Permission Test Complete ==='); 