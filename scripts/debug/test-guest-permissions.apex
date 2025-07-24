/**
 * Test Guest User Permissions for New Domain
 * Run this script to check if guest users can access portfolio data
 */

System.debug('=== TESTING GUEST USER PERMISSIONS ===');

// Test Portfolio Experience access
try {
    List<Portfolio_Experience__c> experiences = [SELECT Id, Name, Job_Title__c, Company__c FROM Portfolio_Experience__c LIMIT 5];
    System.debug('✅ Portfolio_Experience__c: ' + experiences.size() + ' records accessible');
    for (Portfolio_Experience__c exp : experiences) {
        System.debug('  - ' + exp.Name + ' at ' + exp.Company__c);
    }
} catch (Exception e) {
    System.debug('❌ Portfolio_Experience__c ERROR: ' + e.getMessage());
}

// Test Portfolio Skills access
try {
    List<Portfolio_Skill__c> skills = [SELECT Id, Name, Category__c FROM Portfolio_Skill__c LIMIT 5];
    System.debug('✅ Portfolio_Skill__c: ' + skills.size() + ' records accessible');
} catch (Exception e) {
    System.debug('❌ Portfolio_Skill__c ERROR: ' + e.getMessage());
}

// Test Portfolio Projects access
try {
    List<Portfolio_Project__c> projects = [SELECT Id, Name, Description__c FROM Portfolio_Project__c LIMIT 5];
    System.debug('✅ Portfolio_Project__c: ' + projects.size() + ' records accessible');
    for (Portfolio_Project__c proj : projects) {
        System.debug('  - ' + proj.Name);
    }
} catch (Exception e) {
    System.debug('❌ Portfolio_Project__c ERROR: ' + e.getMessage());
}

// Test Portfolio Achievements access
try {
    List<Portfolio_Achievement__c> achievements = [SELECT Id, Name FROM Portfolio_Achievement__c LIMIT 5];
    System.debug('✅ Portfolio_Achievement__c: ' + achievements.size() + ' records accessible');
} catch (Exception e) {
    System.debug('❌ Portfolio_Achievement__c ERROR: ' + e.getMessage());
}

// Test Apex Class Access
try {
    List<Map<String, Object>> testData = PortfolioDataService.getExperienceData();
    System.debug('✅ PortfolioDataService.getExperienceData(): ' + testData.size() + ' records');
} catch (Exception e) {
    System.debug('❌ PortfolioDataService.getExperienceData() ERROR: ' + e.getMessage());
}

try {
    List<Map<String, Object>> skillsData = PortfolioDataService.getSkillsData();
    System.debug('✅ PortfolioDataService.getSkillsData(): ' + skillsData.size() + ' categories');
} catch (Exception e) {
    System.debug('❌ PortfolioDataService.getSkillsData() ERROR: ' + e.getMessage());
}

try {
    List<Map<String, Object>> projectsData = PortfolioDataService.getProjectsData();
    System.debug('✅ PortfolioDataService.getProjectsData(): ' + projectsData.size() + ' projects');
} catch (Exception e) {
    System.debug('❌ PortfolioDataService.getProjectsData() ERROR: ' + e.getMessage());
}

System.debug('=== GUEST PERMISSIONS TEST COMPLETE ===');
System.debug('If any errors above, guest user needs permissions for those objects/classes.'); 