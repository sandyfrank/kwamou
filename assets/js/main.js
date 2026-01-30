// Main JavaScript file
document.addEventListener('DOMContentLoaded', function() {
    console.log('Website loaded successfully');
    
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    // Add active class to current page in navigation
    const currentPage = window.location.pathname.split('/').pop() || 'index.html';
    document.querySelectorAll('nav ul li a').forEach(link => {
        if (link.getAttribute('href').includes(currentPage)) {
            link.classList.add('active');
        }
    });
    
    // Add fade-in animation on scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    document.querySelectorAll('section').forEach(section => {
        section.style.opacity = '0';
        section.style.transform = 'translateY(20px)';
        section.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
        observer.observe(section);
    });
    
    // Language preference storage
    const savedLanguage = localStorage.getItem('preferredLanguage');
    if (savedLanguage) {
        setLanguage(savedLanguage);
    }
});

// Enhanced language switcher with localStorage and navigation translation
function setLanguage(lang) {
    const contentFr = document.getElementById('content-fr');
    const contentEn = document.getElementById('content-en');
    
    // Switch content sections
    if (contentFr && contentEn) {
        if (lang === 'fr') {
            contentFr.style.display = 'block';
            contentEn.style.display = 'none';
        } else if (lang === 'en') {
            contentFr.style.display = 'none';
            contentEn.style.display = 'block';
        }
    }
    
    // Translate navigation menu
    const navLinks = document.querySelectorAll('nav ul li a');
    navLinks.forEach(link => {
        const translation = link.getAttribute('data-' + lang);
        if (translation) {
            link.textContent = translation;
        }
    });
    
    // Save preference
    localStorage.setItem('preferredLanguage', lang);
}

// Add smooth hover effect to images
document.addEventListener('DOMContentLoaded', function() {
    const images = document.querySelectorAll('img');
    images.forEach(img => {
        img.style.transition = 'transform 0.3s ease';
    });
});

