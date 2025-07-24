/**
 * Script to populate Portfolio_Project__c with sample project data
 * This will create the projects that were previously hardcoded
 */

// Delete existing project data
delete [SELECT Id FROM Portfolio_Project__c];

// Create Portfolio Project records
List<Portfolio_Project__c> projects = new List<Portfolio_Project__c>();

// Voice Assisted Reporting Project
Portfolio_Project__c voiceProject = new Portfolio_Project__c(
    Name = 'Voice Assisted Reporting',
    Description__c = 'Developed a Google Assistant Chatbot to display incoming customer complaints, enhancing user experience through voice interaction.',
    Features__c = 'Created a Rest Service interface in Salesforce for receiving input from Google Assistant\nFacilitating seamless communication\nUtilizes advanced web component to display the report as a chart',
    Icon_Name__c = 'utility:volume_high',
    Display_Order__c = 1
);

// WhatsApp Case Creation Project
Portfolio_Project__c whatsappProject = new Portfolio_Project__c(
    Name = 'Case Creation via WhatsApp',
    Description__c = 'Developed a proof of concept to integrate WhatsApp with Salesforce using the Twilio API, enabling efficient case management.',
    Features__c = 'Allows customers to report issues via WhatsApp messages\nMessages are converted into cases in Salesforce, streamlining the process\nEnabled communication between agents and customers via WhatsApp case comments',
    Icon_Name__c = 'utility:chat',
    Display_Order__c = 2
);

// Weather Chatbot Project
Portfolio_Project__c weatherProject = new Portfolio_Project__c(
    Name = 'Weather Chatbot',
    Description__c = 'This is an Einstein chatbot which tells you the weather of your desired city.',
    Features__c = 'The chatbot uses IBM weather API to get the weather\nDisplay it on the chat window\nIntegrated with Salesforce Einstein Bot platform',
    Icon_Name__c = 'utility:dayview',
    Display_Order__c = 3
);

projects.add(voiceProject);
projects.add(whatsappProject);
projects.add(weatherProject);

// Insert the project records
insert projects;

System.debug('Portfolio projects created successfully!');
System.debug('Created ' + projects.size() + ' project records');
System.debug('Projects: ');
for (Portfolio_Project__c p : projects) {
    System.debug('- ' + p.Name + ' (Order: ' + p.Display_Order__c + ')');
} 