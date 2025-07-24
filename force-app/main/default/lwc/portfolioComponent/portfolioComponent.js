/**
 * Portfolio Component v3.1 - Domain Updated Version
 * Cache Buster: 2024-12-19-cache-clear-v2
 */
import { LightningElement, track, wire } from 'lwc';
import { loadStyle } from 'lightning/platformResourceLoader';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import PORTFOLIO_RESOURCES from '@salesforce/resourceUrl/PortfolioResources';
import submitContactForm from '@salesforce/apex/PortfolioContactController.submitContactForm';
import getExperienceData from '@salesforce/apex/PortfolioDataService.getExperienceData';
import getSkillsData from '@salesforce/apex/PortfolioDataService.getSkillsData';
import getProjectsData from '@salesforce/apex/PortfolioDataService.getProjectsData';

export default class PortfolioComponent extends LightningElement {
    @track navMenuClass = 'nav-menu';
    @track showSuccessMessage = false;
    @track showErrorMessage = false;
    @track contactForm = {
        name: '',
        email: '',
        subject: '',
        message: ''
    };

    // Data properties
    @track experienceData = [];
    @track skillCategories = [];
    @track projectsData = [];
    @track isLoading = true;
    @track hasError = false;
    @track errorMessage = '';

    // Profile photo URL from static resources
    get profilePhotoUrl() {
        return PORTFOLIO_RESOURCES + '/profile-photo.jpg';
    }

    // Load data imperatively to avoid caching issues
    connectedCallback() {
        this.loadAllData();
    }
    
    async loadAllData() {
        console.log('Loading all portfolio data...');
        
        try {
            // Load experience data
            const experienceData = await getExperienceData();
            console.log('Experience Data Loaded:', experienceData.length, 'records');
            this.experienceData = experienceData;
            
            // Load skills data  
            const skillsData = await getSkillsData();
            console.log('Skills Data Loaded:', skillsData.length, 'categories');
            this.skillCategories = skillsData;
            
            // Load projects data
            const projectsData = await getProjectsData();
            console.log('Projects Data Loaded:', projectsData.length, 'projects');
            this.projectsData = projectsData.map(project => ({
                ...project,
                displayIcon: this.getDisplayIcon(project.icon)
            }));
            
            this.checkLoadingComplete();
            
        } catch (error) {
            console.error('Error loading portfolio data:', error);
            this.handleError('Error loading portfolio data', error);
        }
    }



    // Map Lightning icon names to Unicode symbols
    getDisplayIcon(iconName) {
        const iconMap = {
            'utility:volume_high': '🎤',
            'utility:chat': '💬',
            'utility:dayview': '🌤️',
            'utility:apps': '📱',
            'utility:database': '🗄️',
            'utility:code': '💻',
            'utility:integration': '🔗',
            'utility:settings': '⚙️'
        };
        return iconMap[iconName] || '📁'; // Default folder icon
    }

    // Helper methods
    checkLoadingComplete() {
        // Check if main data has been loaded (projects not required for now)
        if (this.experienceData.length > 0 && this.skillCategories.length > 0) {
            this.isLoading = false;
        }
    }

    handleError(message, error) {
        this.hasError = true;
        this.isLoading = false;
        this.errorMessage = message;
        console.error(message, error);
        
        // Show toast notification
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: message,
                variant: 'error'
            })
        );
    }

    // Lifecycle hooks
    renderedCallback() {
        // Smooth scrolling for navigation
        this.template.addEventListener('click', this.handleSmoothScroll.bind(this));
        
        // Setup scroll animations if not already done
        if (!this.animationsInitialized) {
            this.setupScrollAnimations();
            this.animationsInitialized = true;
        }
    }

    setupScrollAnimations() {
        // Use setTimeout to ensure DOM is ready
        setTimeout(() => {
            this.initializeScrollObserver();
        }, 500);
    }

    initializeScrollObserver() {
        const animateElements = this.template.querySelectorAll('.animate-on-scroll');
        
        if (animateElements.length === 0) return;

        const observer = new IntersectionObserver((entries) => {
            entries.forEach((entry) => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                    observer.unobserve(entry.target); // Animate only once
                }
            });
        }, {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        });

        animateElements.forEach((element) => {
            observer.observe(element);
        });

        // Initialize back-to-top button
        this.initializeBackToTop();
    }

    initializeBackToTop() {
        const backToTopButton = this.template.querySelector('.back-to-top');
        if (backToTopButton) {
            window.addEventListener('scroll', () => {
                if (window.pageYOffset > 300) {
                    backToTopButton.classList.add('visible');
                } else {
                    backToTopButton.classList.remove('visible');
                }
            });
        }
    }

    scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    // Event handlers
    handleNavClick(event) {
        event.preventDefault();
        const section = event.currentTarget.dataset.section;
        this.scrollToSection(section);
        
        // Close mobile menu if open
        this.navMenuClass = 'nav-menu';
    }

    handleSmoothScroll(event) {
        const target = event.target;
        if (target.tagName === 'A' && target.getAttribute('href').startsWith('#')) {
            event.preventDefault();
            const sectionId = target.getAttribute('href').substring(1);
            this.scrollToSection(sectionId);
        }
    }

    scrollToSection(sectionId) {
        console.log('Scrolling to section:', sectionId);
        
        // Try multiple selector approaches for Shadow DOM compatibility
        let element = this.template.querySelector(`#${sectionId}`) ||
                     this.template.querySelector(`[id="${sectionId}"]`) ||
                     this.template.querySelector(`section.${sectionId}`) ||
                     this.template.querySelector(`section[data-section="${sectionId}"]`);
        
        console.log('Found element:', element);
        
        if (element) {
            // Add small delay to ensure DOM is ready
            setTimeout(() => {
                element.scrollIntoView({ 
                    behavior: 'smooth',
                    block: 'start',
                    inline: 'nearest'
                });
            }, 100);
        } else {
            console.warn('Section not found:', sectionId, '- trying manual scroll');
            // Fallback: scroll to approximate position based on section order
            const sectionOrder = ['home', 'about', 'experience', 'skills', 'projects', 'contact'];
            const index = sectionOrder.indexOf(sectionId);
            if (index > -1) {
                const approximatePosition = index * window.innerHeight * 0.8;
                window.scrollTo({
                    top: approximatePosition,
                    behavior: 'smooth'
                });
            }
        }
    }

    handleContactClick() {
        this.scrollToSection('contact');
    }

    handleExperienceClick() {
        this.scrollToSection('experience');
    }

    handleLinkedInClick(event) {
        event.preventDefault();
        const url = event.currentTarget.dataset.url || event.target.dataset.url;
        if (url) {
            console.log('Opening LinkedIn URL:', url);
            // Use window.open for external links in Experience Cloud
            window.open(url, '_blank', 'noopener,noreferrer');
        }
    }

    toggleMobileMenu() {
        this.navMenuClass = this.navMenuClass === 'nav-menu' ? 'nav-menu active' : 'nav-menu';
    }

    handleInputChange(event) {
        const field = event.target.name;
        this.contactForm = {
            ...this.contactForm,
            [field]: event.target.value
        };
    }

    async handleContactSubmit(event) {
        event.preventDefault();
        
        // Reset messages
        this.showSuccessMessage = false;
        this.showErrorMessage = false;

        try {
            // Call Apex method to submit contact form
            const result = await submitContactForm({
                name: this.contactForm.name,
                email: this.contactForm.email,
                subject: this.contactForm.subject,
                message: this.contactForm.message
            });

            if (result === 'SUCCESS') {
                this.showSuccessMessage = true;
                
                // Show toast notification
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Your message has been sent successfully!',
                        variant: 'success'
                    })
                );
                
                // Reset form
                this.contactForm = {
                    name: '',
                    email: '',
                    subject: '',
                    message: ''
                };

                // Hide success message after 5 seconds
                setTimeout(() => {
                    this.showSuccessMessage = false;
                }, 5000);
            }

        } catch (error) {
            this.showErrorMessage = true;
            console.error('Contact form error:', error);
            
            // Show error toast
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: error.body?.message || 'There was an error sending your message. Please try again.',
                    variant: 'error'
                })
            );
            
            // Hide error message after 5 seconds
            setTimeout(() => {
                this.showErrorMessage = false;
            }, 5000);
        }
    }
} 