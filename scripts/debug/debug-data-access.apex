/**
 * Debug Data Access Issues
 * Run this script to identify exactly why data isn't loading
 */

System.debug('=== DEBUGGING DATA ACCESS ===');

// First, check if data exists at all
System.debug('\n--- CHECKING IF DATA EXISTS ---');
List<Portfolio_Experience__c> allExperiences = [SELECT Id, Name FROM Portfolio_Experience__c];
System.debug('Total Portfolio_Experience__c records in org: ' + allExperiences.size());

List<Portfolio_Skill__c> allSkills = [SELECT Id, Name FROM Portfolio_Skill__c];
System.debug('Total Portfolio_Skill__c records in org: ' + allSkills.size());

List<Portfolio_Project__c> allProjects = [SELECT Id, Name FROM Portfolio_Project__c];
System.debug('Total Portfolio_Project__c records in org: ' + allProjects.size());

List<Portfolio_Achievement__c> allAchievements = [SELECT Id, Name FROM Portfolio_Achievement__c];
System.debug('Total Portfolio_Achievement__c records in org: ' + allAchievements.size());

// If no data exists, we need to create it
if (allExperiences.size() == 0 && allSkills.size() == 0 && allProjects.size() == 0) {
    System.debug('❌ NO DATA FOUND! You need to run the data creation scripts first.');
    return;
}

// Test the exact same query as PortfolioDataService
System.debug('\n--- TESTING PORTFOLIO DATA SERVICE QUERIES ---');

try {
    List<Portfolio_Experience__c> experiences = [
        SELECT Id, Name, Job_Title__c, Company__c, Start_Date__c, End_Date__c, Display_Order__c,
               (SELECT Id, Name, Display_Order__c 
                FROM Portfolio_Achievements__r 
                ORDER BY Display_Order__c ASC)
        FROM Portfolio_Experience__c 
        ORDER BY Display_Order__c ASC
    ];
    System.debug('✅ Experience query returned: ' + experiences.size() + ' records');
    for (Portfolio_Experience__c exp : experiences) {
        System.debug('  - ' + exp.Name + ' | ' + exp.Job_Title__c + ' | Achievements: ' + exp.Portfolio_Achievements__r.size());
    }
} catch (Exception e) {
    System.debug('❌ Experience query failed: ' + e.getMessage());
}

try {
    List<Portfolio_Skill__c> skills = [
        SELECT Id, Name, Category__c, Display_Order__c
        FROM Portfolio_Skill__c 
        ORDER BY Category__c, Display_Order__c ASC
    ];
    System.debug('✅ Skills query returned: ' + skills.size() + ' records');
} catch (Exception e) {
    System.debug('❌ Skills query failed: ' + e.getMessage());
}

try {
    List<Portfolio_Project__c> projects = [
        SELECT Id, Name, Description__c, Features__c, Icon_Name__c, Display_Order__c
        FROM Portfolio_Project__c
        ORDER BY Display_Order__c ASC
    ];
    System.debug('✅ Projects query returned: ' + projects.size() + ' records');
} catch (Exception e) {
    System.debug('❌ Projects query failed: ' + e.getMessage());
}

// Test the actual Apex methods
System.debug('\n--- TESTING APEX METHODS ---');
try {
    List<Map<String, Object>> expData = PortfolioDataService.getExperienceData();
    System.debug('✅ PortfolioDataService.getExperienceData(): ' + expData.size() + ' records');
} catch (Exception e) {
    System.debug('❌ PortfolioDataService.getExperienceData() failed: ' + e.getMessage());
}

try {
    List<Map<String, Object>> skillsData = PortfolioDataService.getSkillsData();
    System.debug('✅ PortfolioDataService.getSkillsData(): ' + skillsData.size() + ' records');
} catch (Exception e) {
    System.debug('❌ PortfolioDataService.getSkillsData() failed: ' + e.getMessage());
}

try {
    List<Map<String, Object>> projectsData = PortfolioDataService.getProjectsData();
    System.debug('✅ PortfolioDataService.getProjectsData(): ' + projectsData.size() + ' records');
} catch (Exception e) {
    System.debug('❌ PortfolioDataService.getProjectsData() failed: ' + e.getMessage());
}

System.debug('\n=== DEBUG COMPLETE ==='); 