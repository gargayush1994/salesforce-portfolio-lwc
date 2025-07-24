/**
 * Basic portfolio data creation script
 * Uses only the fields that are currently available
 */

// Delete existing data (if any)
delete [SELECT Id FROM Portfolio_Achievement__c];
delete [SELECT Id FROM Portfolio_Experience__c];
delete [SELECT Id FROM Portfolio_Skill__c];

// Create Portfolio Experience records with only available fields
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

experiences.add(uber);
experiences.add(walmart);
experiences.add(preqin);

insert experiences;

// Create basic Portfolio Achievement records with only available fields
List<Portfolio_Achievement__c> achievements = new List<Portfolio_Achievement__c>();

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
    Name = 'Case Portal Development',
    Portfolio_Experience__c = walmart.Id,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Advertiser Onboarding Automation',
    Portfolio_Experience__c = walmart.Id,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Platform Development',
    Portfolio_Experience__c = preqin.Id,
    Display_Order__c = 1
));

insert achievements;

// Create Portfolio Skills with available fields  
List<Portfolio_Skill__c> skills = new List<Portfolio_Skill__c>();

skills.add(new Portfolio_Skill__c(Name = 'Salesforce Platform', Category__c = 'Salesforce Platform', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Lightning Web Components', Category__c = 'Salesforce Platform', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Apex', Category__c = 'Development and APIs', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'JavaScript', Category__c = 'Development and APIs', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Process Builder', Category__c = 'Automation and Config', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Flow Builder', Category__c = 'Automation and Config', Display_Order__c = 2));

insert skills;

System.debug('Basic portfolio data created successfully!');
System.debug('Created ' + experiences.size() + ' experience records');
System.debug('Created ' + achievements.size() + ' achievement records');
System.debug('Created ' + skills.size() + ' skill records'); 