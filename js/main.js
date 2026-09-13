// Form submission
document.getElementById('reportForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const formData = {
        reportType: document.getElementById('reportType').value,
        severity: document.getElementById('severity').value,
        description: document.getElementById('description').value,
        location: document.getElementById('location').value,
        anonymous: document.getElementById('anonymous').checked,
        timestamp: new Date().toISOString()
    };
    
    console.log('Report submitted:', formData);
    
    // TODO: Send to backend API
    // fetch('/api/reports', {
    //     method: 'POST',
    //     headers: { 'Content-Type': 'application/json' },
    //     body: JSON.stringify(formData)
    // })
    
    alert('Thank you for your report! We will review it and take appropriate action.');
    this.reset();
});

// Login button
document.getElementById('loginBtn').addEventListener('click', function() {
    // TODO: Redirect to login page
    console.log('Login clicked');
    window.location.href = '/login';
});

// Signup button
document.getElementById('signupBtn').addEventListener('click', function() {
    // TODO: Redirect to signup page
    console.log('Signup clicked');
    window.location.href = '/signup';
});

// Smooth scrolling for nav links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href !== '#' && document.querySelector(href)) {
            e.preventDefault();
            document.querySelector(href).scrollIntoView({
                behavior: 'smooth'
            });
        }
    });
});