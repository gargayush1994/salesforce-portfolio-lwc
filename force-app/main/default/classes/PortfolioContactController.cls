/**
 * @description Controller class for handling contact form submissions from the Portfolio LWC
 * @author Ayush Garg
 * @date 2025
 */
public with sharing class PortfolioContactController {
    
    /**
     * @description Sends contact form submission via email
     * @param name Contact name
     * @param email Contact email
     * @param subject Email subject
     * @param message Email message
     * @return String Success or error message
     */
    @AuraEnabled
    public static String submitContactForm(String name, String email, String subject, String message) {
        try {
            // Validate input parameters
            if (String.isBlank(name) || String.isBlank(email) || String.isBlank(subject) || String.isBlank(message)) {
                throw new AuraHandledException('All fields are required.');
            }
            
            // Validate email format
            if (!isValidEmail(email)) {
                throw new AuraHandledException('Please enter a valid email address.');
            }
            
            // Create email
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            
            // Set email recipients - replace with your actual email
            String[] toAddresses = new String[] { 'gargayush1994@gmail.com' };
            emailMsg.setToAddresses(toAddresses);
            
            // Set reply-to as the contact's email
            emailMsg.setReplyTo(email);
            
            // Set email subject
            emailMsg.setSubject('Portfolio Contact Form: ' + subject);
            
            // Create email body
            String emailBody = buildEmailBody(name, email, subject, message);
            emailMsg.setHtmlBody(emailBody);
            
            // Send email
            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { emailMsg });
            
            // Optionally, create a Lead or Contact record for follow-up
            createLeadRecord(name, email, subject, message);
            
            return 'SUCCESS';
            
        } catch (Exception e) {
            System.debug('Error in submitContactForm: ' + e.getMessage());
            throw new AuraHandledException('There was an error sending your message. Please try again later.');
        }
    }
    
    /**
     * @description Validates email format
     * @param email Email to validate
     * @return Boolean True if valid email format
     */
    private static Boolean isValidEmail(String email) {
        String emailRegex = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
        Pattern emailPattern = Pattern.compile(emailRegex);
        return emailPattern.matcher(email).matches();
    }
    
    /**
     * @description Builds the email body HTML
     * @param name Contact name
     * @param email Contact email
     * @param subject Email subject
     * @param message Email message
     * @return String HTML email body
     */
    private static String buildEmailBody(String name, String email, String subject, String message) {
        String emailBody = '';
        emailBody += '<html><body>';
        emailBody += '<h2 style="color: #2563eb;">New Contact Form Submission</h2>';
        emailBody += '<hr style="border: 1px solid #e5e7eb;">';
        emailBody += '<p><strong>Name:</strong> ' + String.escapeSingleQuotes(name) + '</p>';
        emailBody += '<p><strong>Email:</strong> ' + String.escapeSingleQuotes(email) + '</p>';
        emailBody += '<p><strong>Subject:</strong> ' + String.escapeSingleQuotes(subject) + '</p>';
        emailBody += '<p><strong>Message:</strong></p>';
        emailBody += '<div style="background: #f9fafb; padding: 15px; border-left: 4px solid #2563eb; margin: 10px 0;">';
        emailBody += String.escapeSingleQuotes(message).replace('\n', '<br>');
        emailBody += '</div>';
        emailBody += '<hr style="border: 1px solid #e5e7eb;">';
        emailBody += '<p style="color: #6b7280; font-size: 12px;">This message was sent from the Portfolio website contact form.</p>';
        emailBody += '</body></html>';
        
        return emailBody;
    }
    
    /**
     * @description Creates a Lead record for follow-up (optional)
     * @param name Contact name
     * @param email Contact email
     * @param subject Email subject
     * @param message Email message
     */
    private static void createLeadRecord(String name, String email, String subject, String message) {
        try {
            // Split name into first and last name
            String firstName = name;
            String lastName = 'Portfolio Contact';
            
            if (name.contains(' ')) {
                List<String> nameParts = name.split(' ');
                firstName = nameParts[0];
                List<String> lastNameParts = new List<String>();
                for (Integer i = 1; i < nameParts.size(); i++) {
                    lastNameParts.add(nameParts[i]);
                }
                lastName = String.join(lastNameParts, ' ');
            }
            
            // Create Lead record
            Lead portfolioLead = new Lead();
            portfolioLead.FirstName = firstName;
            portfolioLead.LastName = lastName;
            portfolioLead.Email = email;
            portfolioLead.Company = 'Portfolio Website Contact';
            portfolioLead.LeadSource = 'Website';
            portfolioLead.Status = 'Open - Not Contacted';
            portfolioLead.Description = 'Subject: ' + subject + '\n\nMessage: ' + message;
            
            insert portfolioLead;
            
        } catch (Exception e) {
            // Log error but don't fail the main process
            System.debug('Error creating Lead record: ' + e.getMessage());
        }
    }
} 