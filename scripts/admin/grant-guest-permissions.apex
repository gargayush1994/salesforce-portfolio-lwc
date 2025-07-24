/**
 * Script to grant guest user permissions for portfolio objects
 * Run this as System Administrator
 */

// Find the guest user profile (adjust the name as needed)
String siteGuestProfileName = '%Guest%'; // or exact name like 'Portfolio Site Guest User'
List<Profile> guestProfiles = [SELECT Id, Name FROM Profile WHERE Name LIKE :siteGuestProfileName];

if (guestProfiles.isEmpty()) {
    System.debug('❌ Guest user profile not found. Check profile name.');
    System.debug('Available profiles:');
    for (Profile p : [SELECT Name FROM Profile WHERE Name LIKE '%Guest%' OR Name LIKE '%Community%']) {
        System.debug('  - ' + p.Name);
    }
} else {
    System.debug('✅ Found guest profile: ' + guestProfiles[0].Name);
    System.debug('Manual permission setup required:');
    System.debug('1. Setup → Profiles → ' + guestProfiles[0].Name);
    System.debug('2. Object Settings → Grant Read access to all Portfolio objects');
    System.debug('3. Field-Level Security → Make all Portfolio fields visible');
    System.debug('4. Apex Class Access → Enable PortfolioDataService & PortfolioContactController');
}

// Check current OWD settings
System.debug('Current OWD settings needed:');
System.debug('Setup → Security → Sharing Settings:');
System.debug('- Portfolio Experience: Public Read Only');
System.debug('- Portfolio Achievement: Public Read Only');
System.debug('- Portfolio Skill: Public Read Only');
System.debug('- Portfolio Project: Public Read Only'); 