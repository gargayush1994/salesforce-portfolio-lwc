/**
 * Sample data creation script for Portfolio objects
 * Run this in Developer Console or VS Code to populate your portfolio with data
 */

// Delete existing data (if any)
delete [SELECT Id FROM Portfolio_Achievement__c];
delete [SELECT Id FROM Portfolio_Experience__c];
delete [SELECT Id FROM Portfolio_Skill__c];
delete [SELECT Id FROM Portfolio_Project__c];

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

// Create Portfolio Achievement records
List<Portfolio_Achievement__c> achievements = new List<Portfolio_Achievement__c>();

// Uber achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Approval Matrix Framework',
    Portfolio_Experience__c = uber.Id,
    Description__c = 'Approval Matrix Framework: Built a dynamic, custom object-based approval logic engine for CPQ pricing workflows. Enabled threshold management via configuration—no code changes required.',
    Metric__c = null,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'BRN Validation Framework',
    Portfolio_Experience__c = uber.Id,
    Description__c = 'BRN Validation Framework: Developed a country-agnostic, metadata-driven engine for validating Business Registration Numbers.',
    Metric__c = 'Reduced new-country setup time by 70%',
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Pricing Push Resolution',
    Portfolio_Experience__c = uber.Id,
    Description__c = 'Pricing Push Incident Resolution: Resolved a critical CPQ integration failure impacting the EMEA rollout. Publicly recognized by leadership for ownership and turnaround.',
    Metric__c = null,
    Display_Order__c = 3
));

// Walmart achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Case Portal',
    Portfolio_Experience__c = walmart.Id,
    Description__c = 'Salesforce Case Portal: Designed and launched a comprehensive portal, streamlining global support case management across multiple teams and regions.',
    Metric__c = null,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Advertiser Onboarding',
    Portfolio_Experience__c = walmart.Id,
    Description__c = 'Advertiser Onboarding Automation: Intelligent workflow automation and data validation for advertiser onboarding process.',
    Metric__c = 'Reduced processing time from 38 minutes to 8 minutes (30 minutes saved per account)',
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Sandbox Automation',
    Portfolio_Experience__c = walmart.Id,
    Description__c = 'Sandbox Refresh Automation: Piloted automated sandbox refresh processes, improving development efficiency.',
    Metric__c = 'Reduced manual admin work by 70%',
    Display_Order__c = 3
));

// Add achievements for other companies
achievements.add(new Portfolio_Achievement__c(
    Name = 'Platform Development',
    Portfolio_Experience__c = preqin.Id,
    Description__c = 'Platform Development: Developed Apex services and LWC components for internal applications, maximizing product functionality and user experience.',
    Metric__c = null,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Identity Server SSO',
    Portfolio_Experience__c = preqin.Id,
    Description__c = 'Identity Server SSO: Implemented Identity Server-based Single Sign-On, enhancing login security and user experience across the platform.',
    Metric__c = null,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Digital Banking Platform',
    Portfolio_Experience__c = deloitte.Id,
    Description__c = 'Digital Banking Platform: Built a comprehensive platform using Community Cloud to centralize service access for banking customers.',
    Metric__c = null,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Einstein AI Integration',
    Portfolio_Experience__c = deloitte.Id,
    Description__c = 'Einstein AI Integration: Integrated Einstein Intent & Sentiment Analysis to auto-categorize support cases, reducing manual triage and improving response times.',
    Metric__c = null,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Core Platform Development',
    Portfolio_Experience__c = wipro.Id,
    Description__c = 'Core Platform Development: Developed Apex classes, complex SOQL queries, and reusable Lightning components (e.g., Global Search) for enhanced user experience.',
    Metric__c = null,
    Display_Order__c = 1
));

insert achievements;

// Create Portfolio Skills
List<Portfolio_Skill__c> skills = new List<Portfolio_Skill__c>();

// Salesforce Platform Skills
skills.add(new Portfolio_Skill__c(Name = 'Salesforce / Force.com', Category__c = 'Salesforce Platform', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Lightning Web Components (LWC)', Category__c = 'Salesforce Platform', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Aura Framework', Category__c = 'Salesforce Platform', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'Salesforce Digital Experiences', Category__c = 'Salesforce Platform', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'Custom Metadata Types', Category__c = 'Salesforce Platform', Display_Order__c = 5));
skills.add(new Portfolio_Skill__c(Name = 'Platform Events', Category__c = 'Salesforce Platform', Display_Order__c = 6));

// Development & APIs Skills
skills.add(new Portfolio_Skill__c(Name = 'Apex', Category__c = 'Development and APIs', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Apex Triggers', Category__c = 'Development and APIs', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Batch Apex', Category__c = 'Development and APIs', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'SOQL/SOSL', Category__c = 'Development and APIs', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'JavaScript', Category__c = 'Development and APIs', Display_Order__c = 5));
skills.add(new Portfolio_Skill__c(Name = 'REST APIs', Category__c = 'Development and APIs', Display_Order__c = 6));
skills.add(new Portfolio_Skill__c(Name = 'Git', Category__c = 'Development and APIs', Display_Order__c = 7));

// Automation & Config Skills
skills.add(new Portfolio_Skill__c(Name = 'Process Builder', Category__c = 'Automation and Config', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Flow Builder', Category__c = 'Automation and Config', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Reports & Dashboards', Category__c = 'Automation and Config', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'Data Loader', Category__c = 'Automation and Config', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'Single Sign-On (SSO)', Category__c = 'Automation and Config', Display_Order__c = 5));

// AI & Integration Skills
skills.add(new Portfolio_Skill__c(Name = 'Einstein Chatbots', Category__c = 'AI and Integration', Display_Order__c = 1));
skills.add(new Portfolio_Skill__c(Name = 'Einstein Intent Analysis', Category__c = 'AI and Integration', Display_Order__c = 2));
skills.add(new Portfolio_Skill__c(Name = 'Einstein Sentiment Analysis', Category__c = 'AI and Integration', Display_Order__c = 3));
skills.add(new Portfolio_Skill__c(Name = 'REST Integrations', Category__c = 'AI and Integration', Display_Order__c = 4));
skills.add(new Portfolio_Skill__c(Name = 'JSON/XML', Category__c = 'AI and Integration', Display_Order__c = 5));

insert skills;

// Create Portfolio Projects
List<Portfolio_Project__c> projects = new List<Portfolio_Project__c>();

projects.add(new Portfolio_Project__c(
    Name = 'Voice Assisted Reporting',
    Description__c = 'Developed a Google Assistant Chatbot to display incoming customer complaints, enhancing user experience through voice interaction.',
    Features__c = 'Created a Rest Service interface in Salesforce for receiving input from Google Assistant\nFacilitating seamless communication\nUtilizes advanced web component to display the report as a chart',
    Icon_Name__c = 'utility:volume_high',
    Display_Order__c = 1
));

projects.add(new Portfolio_Project__c(
    Name = 'Case Creation via WhatsApp',
    Description__c = 'Developed a proof of concept to integrate WhatsApp with Salesforce using the Twilio API, enabling efficient case management.',
    Features__c = 'Allows customers to report issues via WhatsApp messages\nMessages are converted into cases in Salesforce, streamlining the process\nEnabled communication between agents and customers via WhatsApp case comments',
    Icon_Name__c = 'utility:chat',
    Display_Order__c = 2
));

projects.add(new Portfolio_Project__c(
    Name = 'Weather Chatbot',
    Description__c = 'This is an Einstein chatbot which tells you the weather of your desired city.',
    Features__c = 'The chatbot uses IBM weather API to get the weather\nDisplay it on the chat window\nIntegrated with Salesforce Einstein Bot platform',
    Icon_Name__c = 'utility:dayview',
    Display_Order__c = 3
));

insert projects;

System.debug('Portfolio data created successfully!');
System.debug('Created ' + experiences.size() + ' experience records');
System.debug('Created ' + achievements.size() + ' achievement records');
System.debug('Created ' + skills.size() + ' skill records');
System.debug('Created ' + projects.size() + ' project records'); 