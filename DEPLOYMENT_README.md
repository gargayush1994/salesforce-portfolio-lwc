# Portfolio LWC Deployment Guide

This guide will help you deploy and set up the Portfolio Lightning Web Component (LWC) in your Salesforce org for use in Experience Cloud or other Lightning contexts.

## 📋 Prerequisites

- Salesforce org with Lightning Experience enabled
- Development environment setup (VS Code with Salesforce Extensions)
- Experience Cloud site (for community deployment)
- System Administrator access

## 📁 Project Structure

```
force-app/main/default/
├── lwc/portfolioComponent/
│   ├── portfolioComponent.html          # LWC Template
│   ├── portfolioComponent.js            # LWC JavaScript Controller
│   ├── portfolioComponent.css           # LWC Styles
│   └── portfolioComponent.js-meta.xml   # LWC Metadata
├── classes/
│   ├── PortfolioContactController.cls          # Apex Class for Contact Form
│   └── PortfolioContactController.cls-meta.xml # Apex Metadata
└── staticresources/
    └── PortfolioResources/              # Static Resources (to be created)
        └── profile-photo.jpg            # Your profile photo
```

## 🚀 Deployment Steps

### Step 1: Prepare Static Resources

1. **Create a Static Resource for your profile photo:**
   ```bash
   # Create directory for static resources
   mkdir -p force-app/main/default/staticresources/PortfolioResources
   ```

2. **Add your profile photo:**
   - Copy your profile photo (`profile-photo.jpg`) to the `PortfolioResources` folder
   - Ensure the image is optimized (recommended size: 400x400px, max 350KB)

3. **Create the static resource metadata:**
   Create `force-app/main/default/staticresources/PortfolioResources.resource-meta.xml`:
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <StaticResource xmlns="http://soap.sforce.com/2006/04/metadata">
       <cacheControl>Public</cacheControl>
       <contentType>application/zip</contentType>
       <description>Portfolio resources including profile photo and assets</description>
   </StaticResource>
   ```

### Step 2: Deploy to Salesforce

1. **Authenticate with your org:**
   ```bash
   sf org login web --set-default --alias portfolio-org
   ```

2. **Deploy the components:**
   ```bash
   sf project deploy start --source-dir force-app/main/default
   ```

3. **Verify deployment:**
   ```bash
   sf project deploy start --source-dir force-app/main/default --dry-run
   ```

### Step 3: Configure Email Settings (for Contact Form)

1. **Enable Email Deliverability:**
   - Setup → Email → Email Administration → Deliverability
   - Set "Access Level" to "All email" (for production) or "System email only" (for testing)

2. **Update the recipient email:**
   - In `PortfolioContactController.cls`, update line 25:
   ```apex
   String[] toAddresses = new String[] { 'your-email@domain.com' };
   ```

### Step 4: Set Up in Experience Cloud

#### Option A: Add to Experience Builder

1. **Open Experience Builder:**
   - Setup → Digital Experiences → All Sites
   - Click "Builder" next to your site

2. **Add the Component:**
   - Go to the page where you want to add the portfolio
   - In the Components panel, find "Portfolio Component" under Custom Components
   - Drag and drop onto your page

3. **Configure the Component:**
   - The component is self-contained and requires no additional configuration
   - Save and publish your site

#### Option B: Add to Lightning Page

1. **Create a new Lightning Page:**
   - Setup → Lightning Pages → New
   - Choose "App Page" or "Record Page"

2. **Add the Portfolio Component:**
   - Drag "Portfolio Component" from the Custom Components section
   - Configure as needed

## 🎨 Customization Options

### Updating Personal Information

To customize the portfolio with your information, modify the following in `portfolioComponent.js`:

1. **Personal Details (lines 40-50):**
   ```javascript
   // Update name, title, description in the hero section template
   ```

2. **Contact Information:**
   ```javascript
   // Update email, phone, location, LinkedIn in template
   ```

3. **Experience Data (starting line 20):**
   ```javascript
   get experienceData() {
       return [
           {
               id: 'your-company',
               title: 'Your Job Title',
               company: 'Your Company',
               // ... update with your experience
           }
       ];
   }
   ```

### Styling Customization

The component uses custom CSS that can be modified in `portfolioComponent.css`. Key areas to customize:

- **Color Scheme:** Update color variables (search for `#2563eb` for primary blue)
- **Fonts:** Modify the font-family in `:host` selector
- **Spacing:** Adjust padding and margins throughout
- **Responsive Breakpoints:** Update media queries as needed

## 🔧 Advanced Configuration

### Adding Real Email Integration

For production use, consider integrating with:

1. **Salesforce Email-to-Case:**
   - Setup → Feature Settings → Service → Email-to-Case
   - Create routing rules for portfolio submissions

2. **Third-party Email Services:**
   - SendGrid, Mailgun, or similar
   - Update the Apex controller to use REST callouts

### Security Considerations

1. **Guest User Permissions:**
   - If using in Experience Cloud, ensure guest users have appropriate permissions
   - Test form submission as an unauthenticated user

2. **CSRF Protection:**
   - The component includes built-in CSRF protection via @AuraEnabled methods

## 📱 Testing Checklist

- [ ] Component renders correctly on desktop
- [ ] Mobile responsiveness works properly
- [ ] Navigation smooth scrolling functions
- [ ] Contact form submits successfully
- [ ] Email notifications are received
- [ ] Lead records are created (if enabled)
- [ ] All sections display correct content
- [ ] Profile photo loads from static resource

## 🚨 Troubleshooting

### Common Issues

1. **Profile photo not loading:**
   - Verify static resource is deployed correctly
   - Check file path in `portfolioComponent.js`
   - Ensure image file is in correct format (JPG/PNG)

2. **Contact form not working:**
   - Check Apex class deployment
   - Verify email deliverability settings
   - Check debug logs for errors

3. **Styling issues:**
   - Clear browser cache
   - Check for CSS conflicts with community theme
   - Verify Lightning Design System compatibility

4. **Component not visible in Experience Builder:**
   - Check metadata file targets
   - Ensure component is exposed (`isExposed=true`)
   - Refresh the Builder page

### Debug Commands

```bash
# Check deployment status
sf project deploy report

# View debug logs
sf data query --query "SELECT Id, DeveloperName FROM ApexClass WHERE Name = 'PortfolioContactController'"

# Test Apex method
sf apex run --file test-contact-form.apex
```

## 📞 Support

For additional support or customization requests:
- Email: gargayush1994@gmail.com
- LinkedIn: [linkedin.com/in/ayush-garg-6a1310123](https://linkedin.com/in/ayush-garg-6a1310123)

## 📄 License

This portfolio component is provided as-is for educational and professional purposes. Feel free to customize and use for your own portfolio needs.

---

**Note:** Remember to update all personal information, contact details, and experience data to reflect your own professional background before deployment. 