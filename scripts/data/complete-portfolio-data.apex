/**
 * Complete portfolio data creation script
 * Creates detailed experience data with rich achievements, descriptions, and metrics
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

// Create detailed Portfolio Achievement records
List<Portfolio_Achievement__c> achievements = new List<Portfolio_Achievement__c>();

// Uber achievements with detailed descriptions and metrics
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
    Name = 'Approver Stamping & Routing',
    Portfolio_Experience__c = uber.Id,
    Description__c = 'Approver Stamping & Routing: Automated L1/L2/Deal Desk approver population with intelligent fallback logic for inactive users.',
    Metric__c = null,
    Display_Order__c = 3
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Pricing Push Incident Resolution',
    Portfolio_Experience__c = uber.Id,
    Description__c = 'Pricing Push Incident Resolution: Resolved a critical CPQ integration failure impacting the EMEA rollout. Publicly recognized by leadership for ownership and turnaround.',
    Metric__c = null,
    Display_Order__c = 4
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'UI/UX Enhancements',
    Portfolio_Experience__c = uber.Id,
    Description__c = 'UI/UX Enhancements: Added profitability toggle and submission comment capture to improve transparency in quote approvals.',
    Metric__c = null,
    Display_Order__c = 5
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Error Reduction Initiative',
    Portfolio_Experience__c = uber.Id,
    Description__c = 'Error Reduction Initiative: Analyzed system logs to surface high-frequency errors and worked with platform teams to fix them proactively.',
    Metric__c = null,
    Display_Order__c = 6
));

// Walmart achievements with detailed descriptions and metrics
achievements.add(new Portfolio_Achievement__c(
    Name = 'Salesforce Case Portal',
    Portfolio_Experience__c = walmart.Id,
    Description__c = 'Salesforce Case Portal: Designed and launched a comprehensive portal, streamlining global support case management across multiple teams and regions.',
    Metric__c = null,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Advertiser Onboarding Automation',
    Portfolio_Experience__c = walmart.Id,
    Description__c = 'Advertiser Onboarding Automation: Intelligent workflow automation and data validation for advertiser onboarding process.',
    Metric__c = 'Reduced processing time from 38 minutes to 8 minutes (30 minutes saved per account)',
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Single Sign-On Integration',
    Portfolio_Experience__c = walmart.Id,
    Description__c = 'Single Sign-On Integration: Integrated SSO into the portal, improving user experience and security posture across the platform.',
    Metric__c = null,
    Display_Order__c = 3
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Sandbox Refresh Automation',
    Portfolio_Experience__c = walmart.Id,
    Description__c = 'Sandbox Refresh Automation: Piloted automated sandbox refresh processes, improving development efficiency.',
    Metric__c = 'Reduced manual admin work by 70%',
    Display_Order__c = 4
));

// Preqin achievements
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
    Name = 'ETL Pipeline Creation',
    Portfolio_Experience__c = preqin.Id,
    Description__c = 'ETL Pipeline Creation: Created Talend ETL pipelines to sync data between SQL Server and Salesforce, improving data availability and consistency.',
    Metric__c = null,
    Display_Order__c = 3
));

// Deloitte achievements
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
    Name = 'Einstein Chatbots',
    Portfolio_Experience__c = deloitte.Id,
    Description__c = 'Einstein Chatbots: Developed intelligent chatbots tailored for different business units, enhancing customer self-service capabilities.',
    Metric__c = null,
    Display_Order__c = 3
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Enterprise Integrations',
    Portfolio_Experience__c = deloitte.Id,
    Description__c = 'Enterprise Integrations: Integrated Salesforce with third-party systems including IBM API Connect, Ping Federate, Finacle, and Bing News API.',
    Metric__c = null,
    Display_Order__c = 4
));

// Wipro achievements
achievements.add(new Portfolio_Achievement__c(
    Name = 'Core Platform Development',
    Portfolio_Experience__c = wipro.Id,
    Description__c = 'Core Platform Development: Developed Apex classes, complex SOQL queries, and reusable Lightning components (e.g., Global Search) for enhanced user experience.',
    Metric__c = null,
    Display_Order__c = 1
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'REST API Integration',
    Portfolio_Experience__c = wipro.Id,
    Description__c = 'REST API Integration: Integrated with SmartPath using REST APIs to streamline business workflows and improve data synchronization.',
    Metric__c = null,
    Display_Order__c = 2
));

achievements.add(new Portfolio_Achievement__c(
    Name = 'Multi-Client Collaboration',
    Portfolio_Experience__c = wipro.Id,
    Description__c = 'Multi-Client Collaboration: Collaborated on core platform enhancements across multiple client orgs, ensuring consistency and best practices.',
    Metric__c = null,
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

System.debug('Complete portfolio data created successfully!');
System.debug('Created ' + experiences.size() + ' experience records');
System.debug('Created ' + achievements.size() + ' achievement records');
System.debug('Created ' + skills.size() + ' skill records'); 