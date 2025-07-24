/**
 * @description Service class for retrieving portfolio data from custom objects
 * @author Ayush Garg
 * @date 2025
 */
public without sharing class PortfolioDataService {
    
    /**
     * @description Retrieves all portfolio experience data with related achievements
     * @return List<Map<String, Object>> Experience data formatted for LWC
     */
    @AuraEnabled(cacheable=false)
    public static List<Map<String, Object>> getExperienceData() {
        try {
            List<Map<String, Object>> experienceList = new List<Map<String, Object>>();
            
            // Query Portfolio Experience records with achievements
            List<Portfolio_Experience__c> experiences = [
                SELECT Id, Name, Job_Title__c, Company__c, Start_Date__c, End_Date__c, Display_Order__c,
                       (SELECT Id, Name, Display_Order__c 
                        FROM Portfolio_Achievements__r 
                        ORDER BY Display_Order__c ASC)
                FROM Portfolio_Experience__c 
                ORDER BY Display_Order__c ASC
            ];
            
            for (Portfolio_Experience__c exp : experiences) {
                Map<String, Object> experienceMap = new Map<String, Object>();
                
                // Basic experience info
                experienceMap.put('id', exp.Id);
                experienceMap.put('title', exp.Job_Title__c);
                experienceMap.put('company', exp.Company__c);
                experienceMap.put('date', formatDateRange(exp.Start_Date__c, exp.End_Date__c));
                experienceMap.put('location', getLocationForCompany(exp.Company__c));
                experienceMap.put('summary', getSummaryForCompany(exp.Company__c));
                experienceMap.put('technologies', getTechnologiesForCompany(exp.Company__c));
                
                // Process achievements
                List<Map<String, Object>> achievementList = new List<Map<String, Object>>();
                for (Portfolio_Achievement__c achievement : exp.Portfolio_Achievements__r) {
                    Map<String, Object> achievementMap = new Map<String, Object>();
                    String achievementText = getDetailedAchievementText(achievement.Name);
                    String metric = getAchievementMetric(achievement.Name);
                    achievementMap.put('text', achievementText);
                    achievementMap.put('metric', metric);
                    achievementList.add(achievementMap);
                }
                
                experienceMap.put('achievements', achievementList);
                experienceList.add(experienceMap);
            }
            
            return experienceList;
            
        } catch (Exception e) {
            System.debug('Error in getExperienceData: ' + e.getMessage());
            throw new AuraHandledException('Error retrieving experience data: ' + e.getMessage());
        }
    }
    
    /**
     * @description Retrieves skills data grouped by category
     * @return List<Map<String, Object>> Skills data formatted for LWC
     */
    @AuraEnabled(cacheable=false)
    public static List<Map<String, Object>> getSkillsData() {
        try {
            Map<String, List<String>> skillsByCategory = new Map<String, List<String>>();
            
            // Query skills grouped by category
            List<Portfolio_Skill__c> skills = [
                SELECT Name, Category__c, Display_Order__c 
                FROM Portfolio_Skill__c 
                ORDER BY Category__c, Display_Order__c ASC
            ];
            
            // Group skills by category
            for (Portfolio_Skill__c skill : skills) {
                if (!skillsByCategory.containsKey(skill.Category__c)) {
                    skillsByCategory.put(skill.Category__c, new List<String>());
                }
                skillsByCategory.get(skill.Category__c).add(skill.Name);
            }
            
            // Format for LWC
            List<Map<String, Object>> skillCategories = new List<Map<String, Object>>();
            Integer categoryId = 1;
            
            for (String category : skillsByCategory.keySet()) {
                Map<String, Object> categoryMap = new Map<String, Object>();
                categoryMap.put('id', category.toLowerCase().replace(' ', '-').replace('&', 'and'));
                categoryMap.put('name', category);
                categoryMap.put('skills', skillsByCategory.get(category));
                skillCategories.add(categoryMap);
            }
            
            return skillCategories;
            
        } catch (Exception e) {
            System.debug('Error in getSkillsData: ' + e.getMessage());
            throw new AuraHandledException('Error retrieving skills data: ' + e.getMessage());
        }
    }
    
    /**
     * @description Retrieves project data from Portfolio_Project__c object
     * @return List<Map<String, Object>> Projects data formatted for LWC
     */
    @AuraEnabled(cacheable=false)
    public static List<Map<String, Object>> getProjectsData() {
        try {
            List<Portfolio_Project__c> projects = [
                SELECT Id, Name, Description__c, Features__c, Icon_Name__c, Display_Order__c
                FROM Portfolio_Project__c 
                ORDER BY Display_Order__c ASC
            ];
            
            List<Map<String, Object>> projectList = new List<Map<String, Object>>();
            
            for (Portfolio_Project__c project : projects) {
                Map<String, Object> projectMap = new Map<String, Object>();
                projectMap.put('id', project.Id);
                projectMap.put('title', project.Name);
                projectMap.put('description', project.Description__c);
                projectMap.put('icon', project.Icon_Name__c);
                
                // Parse features from text field (expecting line-separated values)
                List<String> featuresList = new List<String>();
                if (String.isNotBlank(project.Features__c)) {
                    featuresList = project.Features__c.split('\n');
                }
                projectMap.put('features', featuresList);
                
                projectList.add(projectMap);
            }
            
            return projectList;
            
        } catch (Exception e) {
            System.debug('Error in getProjectsData: ' + e.getMessage());
            throw new AuraHandledException('Error retrieving projects data: ' + e.getMessage());
        }
    }
    
    /**
     * @description Formats a date range for display
     * @param startDate Start date
     * @param endDate End date (can be null for current position)
     * @return String Formatted date range
     */
    private static String formatDateRange(Date startDate, Date endDate) {
        String startMonth = getMonthName(startDate.month());
        String startYear = String.valueOf(startDate.year());
        
        String endMonth = endDate != null ? getMonthName(endDate.month()) : 'Present';
        String endYear = endDate != null ? String.valueOf(endDate.year()) : '';
        
        return startMonth + ' ' + startYear + ' - ' + endMonth + (String.isNotBlank(endYear) ? ' ' + endYear : '');
    }
    
    /**
     * @description Gets month name from month number
     * @param monthNum Month number (1-12)
     * @return String Month name
     */
    private static String getMonthName(Integer monthNum) {
        List<String> months = new List<String>{
            'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
        };
        return months[monthNum - 1];
    }
    
    /**
     * @description Gets location for a company
     * @param company Company name
     * @return String Location
     */
    private static String getLocationForCompany(String company) {
        Map<String, String> companyLocations = new Map<String, String>{
            'Uber' => 'Bangalore, India',
            'Walmart Global Tech India' => 'Bangalore, India',
            'Preqin' => 'Bangalore, India',
            'Deloitte' => 'Pune, India',
            'Wipro' => 'Pune, India'
        };
        return companyLocations.containsKey(company) ? companyLocations.get(company) : 'India';
    }
    
    /**
     * @description Gets summary for a company
     * @param company Company name
     * @return String Summary
     */
    private static String getSummaryForCompany(String company) {
        Map<String, String> companySummaries = new Map<String, String>{
            'Uber' => 'Focus on enhancing the CPQ (Configure Price Quote) platform to support global pricing and approval workflows through scalable, automation-first solutions.',
            'Walmart Global Tech India' => 'Led key Salesforce engineering initiatives across support automation and advertiser onboarding in a global retail environment.',
            'Preqin' => 'Worked on Salesforce platform enhancements and cross-system integrations for a global fintech firm.',
            'Deloitte' => 'Delivered intelligent and integrated Salesforce solutions for global financial services clients.',
            'Wipro' => 'Contributed to large-scale Salesforce implementations across industries.'
        };
        return companySummaries.containsKey(company) ? companySummaries.get(company) : 'Salesforce development and platform enhancement.';
    }
    
    /**
     * @description Gets technologies for a company
     * @param company Company name
     * @return String Technologies
     */
    private static String getTechnologiesForCompany(String company) {
        Map<String, String> companyTechnologies = new Map<String, String>{
            'Uber' => 'Apex, LWC, Custom Metadata, DML/SOQL, Platform Events, Salesforce CPQ, REST Integrations',
            'Walmart Global Tech India' => 'Apex, LWC, REST APIs, SSO (SAML/OAuth), Data Loader, Batch Jobs',
            'Preqin' => 'Apex, LWC, Talend, Identity Server, SOQL, SQL Server',
            'Deloitte' => 'Apex, Community Cloud, Einstein AI, LWC, REST Integrations, Ping, Finacle, Microsoft APIs',
            'Wipro' => 'Apex, Aura Components, SOQL/SOSL, REST APIs, Lightning Design System'
        };
        return companyTechnologies.containsKey(company) ? companyTechnologies.get(company) : 'Salesforce, Apex, LWC';
    }
    
    /**
     * @description Gets detailed achievement text based on achievement name
     * @param achievementName Achievement name
     * @return String Detailed achievement text
     */
    private static String getDetailedAchievementText(String achievementName) {
        Map<String, String> achievementDetails = new Map<String, String>{
            'Approval Matrix Framework' => 'Approval Matrix Framework: Built a dynamic, custom object-based approval logic engine for CPQ pricing workflows. Enabled threshold management via configuration—no code changes required.',
            'BRN Validation Framework' => 'BRN Validation Framework: Developed a country-agnostic, metadata-driven engine for validating Business Registration Numbers.',
            'Approver Stamping & Routing' => 'Approver Stamping & Routing: Automated L1/L2/Deal Desk approver population with intelligent fallback logic for inactive users.',
            'Pricing Push Incident Resolution' => 'Pricing Push Incident Resolution: Resolved a critical CPQ integration failure impacting the EMEA rollout. Publicly recognized by leadership for ownership and turnaround.',
            'UI/UX Enhancements' => 'UI/UX Enhancements: Added profitability toggle and submission comment capture to improve transparency in quote approvals.',
            'Error Reduction Initiative' => 'Error Reduction Initiative: Analyzed system logs to surface high-frequency errors and worked with platform teams to fix them proactively.',
            'Salesforce Case Portal' => 'Salesforce Case Portal: Designed and launched a comprehensive portal, streamlining global support case management across multiple teams and regions.',
            'Case Portal Development' => 'Case Portal Development: Designed and launched a comprehensive portal, streamlining global support case management across multiple teams and regions.',
            'Advertiser Onboarding Automation' => 'Advertiser Onboarding Automation: Intelligent workflow automation and data validation for advertiser onboarding process.',
            'Single Sign-On Integration' => 'Single Sign-On Integration: Integrated SSO into the portal, improving user experience and security posture across the platform.',
            'Sandbox Refresh Automation' => 'Sandbox Refresh Automation: Piloted automated sandbox refresh processes, improving development efficiency.',
            'Platform Development' => 'Platform Development: Developed Apex services and LWC components for internal applications, maximizing product functionality and user experience.',
            'Identity Server SSO' => 'Identity Server SSO: Implemented Identity Server-based Single Sign-On, enhancing login security and user experience across the platform.',
            'ETL Pipeline Creation' => 'ETL Pipeline Creation: Created Talend ETL pipelines to sync data between SQL Server and Salesforce, improving data availability and consistency.',
            'Digital Banking Platform' => 'Digital Banking Platform: Built a comprehensive platform using Community Cloud to centralize service access for banking customers.',
            'Einstein AI Integration' => 'Einstein AI Integration: Integrated Einstein Intent & Sentiment Analysis to auto-categorize support cases, reducing manual triage and improving response times.',
            'Einstein Chatbots' => 'Einstein Chatbots: Developed intelligent chatbots tailored for different business units, enhancing customer self-service capabilities.',
            'Enterprise Integrations' => 'Enterprise Integrations: Integrated Salesforce with third-party systems including IBM API Connect, Ping Federate, Finacle, and Bing News API.',
            'Core Platform Development' => 'Core Platform Development: Developed Apex classes, complex SOQL queries, and reusable Lightning components (e.g., Global Search) for enhanced user experience.',
            'REST API Integration' => 'REST API Integration: Integrated with SmartPath using REST APIs to streamline business workflows and improve data synchronization.',
            'Multi-Client Collaboration' => 'Multi-Client Collaboration: Collaborated on core platform enhancements across multiple client orgs, ensuring consistency and best practices.'
        };
        return achievementDetails.containsKey(achievementName) ? achievementDetails.get(achievementName) : achievementName;
    }
    
    /**
     * @description Gets achievement metric based on achievement name
     * @param achievementName Achievement name
     * @return String Achievement metric or null
     */
    private static String getAchievementMetric(String achievementName) {
        Map<String, String> achievementMetrics = new Map<String, String>{
            'BRN Validation Framework' => 'Reduced new-country setup time by 70%',
            'Advertiser Onboarding Automation' => 'Reduced processing time from 38 minutes to 8 minutes (30 minutes saved per account)',
            'Sandbox Refresh Automation' => 'Reduced manual admin work by 70%'
        };
        return achievementMetrics.get(achievementName);
    }
} 