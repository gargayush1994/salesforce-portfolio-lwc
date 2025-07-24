/**
 * Working portfolio data script - uses available fields only
 * Achievement names trigger detailed descriptions in PortfolioDataService
 */

// Delete existing data
delete [SELECT Id FROM Portfolio_Achievement__c];
delete [SELECT Id FROM Portfolio_Experience__c];
delete [SELECT Id FROM Portfolio_Skill__c];

// Create Portfolio Experience records
List<Portfolio_Experience__c> experiences = new List<Portfolio_Experience__c>();

Portfolio_Experience__c uber = new Portfolio_Experience__c(
    Name = 'Uber Senior Engineer',
    Job_Title__c = 'Senior Salesforce Engineer (L4)',
    Company__c = 'Uber',
    Start_Date__c = Date.newInstance(2024, 10, 1),
    Display_Order__c = 1
);

Portfolio_Experience__c walmart = new Portfolio_Experience__c(
    Name = 'Walmart Lead Developer',
    Job_Title__c = 'Senior Data Engineer / Lead Salesforce Developer',
    Company__c = 'Walmart Global Tech India',
    Start_Date__c = Date.newInstance(2021, 3, 1),
    Display_Order__c = 2
);

Portfolio_Experience__c preqin = new Portfolio_Experience__c(
    Name = 'Preqin Senior Developer',
    Job_Title__c = 'Senior Salesforce Developer',
    Company__c = 'Preqin',
    Start_Date__c = Date.newInstance(2020, 9, 1),
    Display_Order__c = 3
);

Portfolio_Experience__c deloitte = new Portfolio_Experience__c(
    Name = 'Deloitte Senior Developer',
    Job_Title__c = 'Senior Salesforce Developer',
    Company__c = 'Deloitte',
    Start_Date__c = Date.newInstance(2019, 4, 1),
    Display_Order__c = 4
);

Portfolio_Experience__c wipro = new Portfolio_Experience__c(
    Name = 'Wipro Developer',
    Job_Title__c = 'Salesforce Developer',
    Company__c = 'Wipro',
    Start_Date__c = Date.newInstance(2016, 6, 1),
    Display_Order__c = 5
);

experiences.add(uber);
experiences.add(walmart);
experiences.add(preqin);
experiences.add(deloitte);
experiences.add(wipro);

insert experiences;

// Create Portfolio Achievement records with strategic names
// These names trigger detailed descriptions in PortfolioDataService
List<Portfolio_Achievement__c> achievements = new List<Portfolio_Achievement__c>();

// Uber achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Approval Matrix Framework',
    Portfolio_Experience__c = uber.Id,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'BRN Validation Framework',
    Portfolio_Experience__c = uber.Id,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Approver Stamping & Routing',
    Portfolio_Experience__c = uber.Id,
    Display_Order__c = 3
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Pricing Push Incident Resolution',
    Portfolio_Experience__c = uber.Id,
    Display_Order__c = 4
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'UI/UX Enhancements',
    Portfolio_Experience__c = uber.Id,
    Display_Order__c = 5
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Error Reduction Initiative',
    Portfolio_Experience__c = uber.Id,
    Display_Order__c = 6
));

// Walmart achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Salesforce Case Portal',
    Portfolio_Experience__c = walmart.Id,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Advertiser Onboarding Automation',
    Portfolio_Experience__c = walmart.Id,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Single Sign-On Integration',
    Portfolio_Experience__c = walmart.Id,
    Display_Order__c = 3
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Sandbox Refresh Automation',
    Portfolio_Experience__c = walmart.Id,
    Display_Order__c = 4
));

// Preqin achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Platform Development',
    Portfolio_Experience__c = preqin.Id,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Identity Server SSO',
    Portfolio_Experience__c = preqin.Id,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'ETL Pipeline Creation',
    Portfolio_Experience__c = preqin.Id,
    Display_Order__c = 3
));

// Deloitte achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Digital Banking Platform',
    Portfolio_Experience__c = deloitte.Id,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Einstein AI Integration',
    Portfolio_Experience__c = deloitte.Id,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Einstein Chatbots',
    Portfolio_Experience__c = deloitte.Id,
    Display_Order__c = 3
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Enterprise Integrations',
    Portfolio_Experience__c = deloitte.Id,
    Display_Order__c = 4
));

// Wipro achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Core Platform Development',
    Portfolio_Experience__c = wipro.Id,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'REST API Integration',
    Portfolio_Experience__c = wipro.Id,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Multi-Client Collaboration',
    Portfolio_Experience__c = wipro.Id,
    Display_Order__c = 3
));

insert achievements;

// Create comprehensive Portfolio Skills
List<Portfolio_Skill__c> skills = new List<Portfolio_Skill__c>();

// Salesforce Platform Skills
skills.add(new Portfolio_Skill__c(Name = 'Salesforce / Force.com', Category__c = 'Salesforce Platform', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Lightning Web Components (LWC)', Category__c = 'Salesforce Platform', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Aura Framework', Category__c = 'Salesforce Platform', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'Salesforce Digital Experiences', Category__c = 'Salesforce Platform', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'Custom Metadata Types', Category__c = 'Salesforce Platform', Display_Order__c = 5));
skills.add(new Portfolio_Skill__c(Name = 'Platform Events', Category__c = 'Salesforce Platform', Display_Order__c = 6));
skills.add(new Portfolio_Skill__c(Name = 'Salesforce Administration', Category__c = 'Salesforce Platform', Display_Order__c = 7));

// Development & APIs Skills
skills.add(new Portfolio_Skill__c(Name = 'Apex', Category__c = 'Development and APIs', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Apex Triggers', Category__c = 'Development and APIs', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Batch Apex', Category__c = 'Development and APIs', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'SOQL/SOSL', Category__c = 'Development and APIs', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'JavaScript', Category__c = 'Development and APIs', Display_Order__c = 5));
skills.add(new Portfolio_Skill__c(Name = 'HTML/CSS', Category__c = 'Development and APIs', Display_Order__c = 6));
skills.add(new Portfolio_Skill__c(Name = 'REST APIs', Category__c = 'Development and APIs', Display_Order__c = 7));
skills.add(new Portfolio_Skill__c(Name = 'SOAP APIs', Category__c = 'Development and APIs', Display_Order__c = 8));
skills.add(new Portfolio_Skill__c(Name = 'Git', Category__c = 'Development and APIs', Display_Order__c = 9));

// Automation & Config Skills
skills.add(new Portfolio_Skill__c(Name = 'Process Builder', Category__c = 'Automation and Config', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Flow Builder', Category__c = 'Automation and Config', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Reports & Dashboards', Category__c = 'Automation and Config', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'Data Loader', Category__c = 'Automation and Config', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'Single Sign-On (SSO)', Category__c = 'Automation and Config', Display_Order__c = 5));
skills.add(new Portfolio_Skill__c(Name = 'SAML/OAuth', Category__c = 'Automation and Config', Display_Order__c = 6));

// AI & Integration Skills
skills.add(new Portfolio_Skill__c(Name = 'Einstein Chatbots', Category__c = 'AI and Integration', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Einstein Intent Analysis', Category__c = 'AI and Integration', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Einstein Sentiment Analysis', Category__c = 'AI and Integration', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'Einstein Language APIs', Category__c = 'AI and Integration', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'Google DialogFlow', Category__c = 'AI and Integration', Display_Order__c = 5));
skills.add(new Portfolio_Skill__c(Name = 'REST Integrations', Category__c = 'AI and Integration', Display_Order__c = 6));
skills.add(new Portfolio_Skill__c(Name = 'JSON/XML', Category__c = 'AI and Integration', Display_Order__c = 7));

insert skills;

System.debug('Complete working portfolio data created successfully!');
System.debug('Created ' + experiences.size() + ' experience records');
System.debug('Created ' + achievements.size() + ' achievement records with detailed descriptions');
System.debug('Created ' + skills.size() + ' skill records');
System.debug('Achievement names trigger detailed descriptions in PortfolioDataService!'); 