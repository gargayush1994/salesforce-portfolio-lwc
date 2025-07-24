# 🌟 Salesforce Portfolio - Lightning Web Component

> A modern, animated, and fully data-driven portfolio built on Salesforce Experience Cloud using Lightning Web Components (LWC). This professional portfolio showcases dynamic content management, advanced animations, and enterprise-grade architecture.

![Salesforce](https://img.shields.io/badge/Salesforce-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white)
![Lightning Web Components](https://img.shields.io/badge/LWC-1798C1?style=for-the-badge&logo=salesforce&logoColor=white)
![Apex](https://img.shields.io/badge/Apex-1798C1?style=for-the-badge&logo=salesforce&logoColor=white)
![Experience Cloud](https://img.shields.io/badge/Experience%20Cloud-00A1E0?style=for-the-badge&logo=salesforce&logoColor=white)

## 🚀 Live Demo

**[View Live Portfolio →](https://ayush-garg-dev-ed.my.site.com/pf/)**

## ✨ Features

### 🎨 **Modern Animated UI**
- **Scroll-triggered animations** using Intersection Observer API
- **Interactive hover effects** with smooth transitions
- **Sequential hero animations** for professional loading experience
- **Floating back-to-top button** with gradient design
- **Responsive design** optimized for all devices

### 🏗️ **Data-Driven Architecture**
- **No hardcoded content** - all data stored in Salesforce custom objects
- **Real-time updates** through the Portfolio Manager app
- **Scalable design** for easy content management
- **Professional data models** with proper relationships

### ⚡ **Enterprise-Grade Performance**
- **Cacheable Apex methods** for optimal performance
- **Optimized queries** with proper SOQL design
- **Guest user permissions** configured for public access
- **Lightning Design System** components for consistency

## 🏛️ Architecture

### **Custom Objects**
- `Portfolio_Experience__c` - Work experience and career history
- `Portfolio_Achievement__c` - Individual achievements linked to experiences
- `Portfolio_Skill__c` - Technical skills organized by category
- `Portfolio_Project__c` - Personal projects and portfolio pieces

### **Apex Classes**
- `PortfolioDataService.cls` - Service layer for data retrieval and processing
- `PortfolioContactController.cls` - Contact form submission handling

### **Lightning Web Components**
- `portfolioComponent` - Main portfolio component with full functionality

### **Experience Cloud Integration**
- Fully deployed on Salesforce Experience Cloud
- Guest user access configured
- Custom domain ready

## 🛠️ Technology Stack

- **Frontend**: Lightning Web Components (LWC), Lightning Design System (SLDS)
- **Backend**: Salesforce Apex, SOQL
- **Database**: Salesforce Custom Objects
- **Platform**: Salesforce Experience Cloud
- **Animations**: CSS3 Animations + Intersection Observer API
- **Deployment**: Salesforce CLI (SFDX)

## 📦 Installation & Setup

### Prerequisites
- Salesforce Developer Org or Experience Cloud license
- Salesforce CLI installed
- Git installed
- VSCode with Salesforce Extension Pack (recommended)

### 1. Clone the Repository
```bash
git clone https://github.com/[YOUR-USERNAME]/salesforce-portfolio-lwc.git
cd salesforce-portfolio-lwc
```

### 2. Authorize Your Salesforce Org
```bash
sf org login web --alias portfolio-org
sf config set target-org portfolio-org
```

### 3. Deploy the Metadata
```bash
# Deploy all components
sf project deploy start --source-dir force-app

# Create sample data
sf apex run --file scripts/data/working-portfolio-data.apex
```

### 4. Set Up Experience Cloud Site
1. **Setup** → **Digital Experiences** → **Sites** → **New**
2. Choose **LWR Template** (Lightning Web Runtime)
3. Configure site settings and publish
4. Add the Portfolio Component to your site pages

### 5. Configure Permissions
```bash
# Run permission check script
sf apex run --file scripts/debug/test-guest-permissions.apex
```

**Manual Permission Setup:**
1. **Setup** → **Profiles** → **[Site Guest User Profile]**
2. Grant **Read** access to all Portfolio objects
3. Set **Field-Level Security** to Visible for all Portfolio fields
4. Enable **Apex Class Access** for PortfolioDataService and PortfolioContactController

## 📊 Data Management

### Using the Portfolio Manager App
1. **App Launcher** → **Portfolio Manager**
2. Use the dedicated tabs to manage:
   - **Portfolio Experiences** - Add/edit work history
   - **Portfolio Achievements** - Manage individual accomplishments
   - **Portfolio Skills** - Organize technical capabilities
   - **Portfolio Projects** - Showcase personal work

### Data Import/Export
- Use **Data Loader** for bulk operations
- **Data Export Service** for backups
- See `DATA_MANAGEMENT_GUIDE.md` for detailed instructions

## 🎨 Customization

### Styling
- Modify `portfolioComponent.css` for visual customizations
- Update color schemes, fonts, and animations
- Responsive breakpoints configurable

### Content
- All content managed through Salesforce records
- No code deployment needed for content updates
- Dynamic data loading with proper error handling

### Animations
- Scroll-triggered animations using Intersection Observer
- Customizable timing and easing functions
- Hardware-accelerated transforms for 60fps performance

## 🔧 Development

### Local Development
```bash
# Start local development server (if using LWR local dev)
sf lightning generate lwc --name portfolioComponent
sf lightning dev site --name "Portfolio Site"
```

### Testing
```bash
# Run Apex tests
sf apex run test --test-level RunLocalTests

# Debug permissions
sf apex run --file scripts/debug/test-guest-permissions.apex
```

### Deployment
```bash
# Deploy to production
sf project deploy start --source-dir force-app --target-org production

# Deploy specific components
sf project deploy start --source-dir force-app/main/default/lwc/portfolioComponent
```

## 📁 Project Structure

```
salesforce-portfolio-lwc/
├── force-app/main/default/
│   ├── applications/           # Portfolio Manager App
│   ├── classes/               # Apex Classes
│   │   ├── PortfolioDataService.cls
│   │   └── PortfolioContactController.cls
│   ├── lwc/                   # Lightning Web Components
│   │   └── portfolioComponent/
│   ├── objects/               # Custom Objects
│   │   ├── Portfolio_Experience__c/
│   │   ├── Portfolio_Achievement__c/
│   │   ├── Portfolio_Skill__c/
│   │   └── Portfolio_Project__c/
│   ├── staticresources/       # Static Resources
│   └── tabs/                  # Custom Tabs
├── scripts/
│   ├── data/                  # Data Scripts
│   ├── debug/                 # Debug Scripts
│   └── admin/                 # Admin Scripts
├── DATA_MANAGEMENT_GUIDE.md   # Detailed data management guide
├── DEPLOYMENT_README.md       # Deployment instructions
└── README.md                  # This file
```

## 🚀 Performance Features

- **Cacheable Apex Methods** - `@AuraEnabled(cacheable=true)` for optimal loading
- **Lazy Loading** - Content loads as users scroll
- **Optimized Queries** - Efficient SOQL with proper indexing
- **Client-Side Caching** - Browser caching for static resources
- **Hardware Acceleration** - CSS transforms for smooth animations

## 🔐 Security

- **Guest User Access** - Properly configured public permissions
- **Field-Level Security** - Granular access control
- **CRUD Permissions** - Read-only access for portfolio data
- **Input Validation** - Server-side validation for contact forms
- **SOQL Injection Prevention** - Parameterized queries

## 🐛 Troubleshooting

### Common Issues

**Portfolio not loading for guests:**
```bash
# Check permissions
sf apex run --file scripts/debug/test-guest-permissions.apex
```

**Cache issues:**
1. Clear Experience Cloud site cache
2. Hard refresh browser (`Cmd+Shift+R`)
3. Publish site in Experience Builder

**Data not displaying:**
1. Check object permissions for guest profile
2. Verify field-level security settings
3. Ensure data exists in custom objects

## 🤝 Contributing

This is a personal portfolio project, but feel free to:
1. **Fork** the repository for your own portfolio
2. **Submit issues** for bugs or suggestions
3. **Share improvements** via pull requests

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Ayush Garg**
- 🌐 Portfolio: [Live Demo](https://your-experience-cloud-url.com)
- 💼 LinkedIn: [ayush-garg-6a1310123](https://linkedin.com/in/ayush-garg-6a1310123)
- 📧 Email: gargayush1994@gmail.com
- 🏢 Current: Senior Salesforce Engineer at Uber

## 🙏 Acknowledgments

- **Salesforce Trailblazer Community** for inspiration and best practices
- **Lightning Design System** for beautiful, accessible components
- **Experience Cloud** platform for hosting capabilities

---

⭐ **If this portfolio helped you, please consider giving it a star!** ⭐ 