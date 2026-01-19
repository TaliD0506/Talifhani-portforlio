ArcaneEdge Website
A modern, responsive marketing website I built from scratch for ArcaneEdge - a digital marketing agency specializing in AI-powered solutions.
This project showcases my frontend development skills with a focus on animations, responsive design, and clean code.

> What I Built
A complete single-page website with:
Futuristic dark theme with cyan accent colors
Interactive animations (including a cool logo construction animation)
Fully responsive design that works on all devices
Contact form that actually sends emails
Clean, maintainable code structure

Tech Stack
Frontend:
-HTML5 (semantic markup)
-CSS (Grid, Flexbox, CSS Variables, Keyframe Animations)
-JavaScript (no frameworks - pure JS)

Backend:
-PHP (for email processing)

External Resources:
-Font Awesome 6.4.0 (icons)
-Google Fonts (Inter & JetBrains Mono)

 Key Features I Implemented
Interactions
-Smooth Scroll Navigation: One-page navigation with active state highlighting
-Hover Effects: Interactive cards and buttons with smooth transitions
-Scroll Animations: Elements fade in as you scroll

  Responsive Design
-Mobile-first approach
-Hamburger menu for mobile
-Flexible grid layouts that adapt to screen size
-Optimized animations for mobile performance
-Tested on Chrome, Firefox, Safari, and Edge

 Complete Sections
-Hero Section - With animated logo construction
-About Section - Stats and company info
-Services - Three core services with detailed features
-Founder Section - Spotlight on Kamogelo Selepe
-Digital Doppelganger Platform - Showcasing their AI technology
-Testimonials - Client reviews with star ratings
-Contact Form - Fully functional with email integration

 Working Contact Form
-Sends emails to info@arcaneedge.co.za
-Form validation and user feedback
-Loading states and error handling
-Structured HTML emails with company branding

Project Structure

text
index.html          # Main website file
send-email.php      # Backend for contact form
(no build process needed )

-How to Run Locally
Simple Method (just view the site):
Download the files
Open home.html in your browser

With Email Functionality (requires PHP):
Install XAMPP/WAMP or any PHP server
Place files in your server directory (htdocs for XAMPP)
Update email address in send-email.php (line 5)

Access via http://localhost/home.html/

Design Decisions I Made
 -Color Scheme
I chose a dark futuristic theme (#0A0E17) with cyan accents (#00F0FF) to match the tech/AI focus. The gradient from cyan to blue adds depth without being overwhelming.
 -Typography
Inter for body text - clean and readable
JetBrains Mono for technical elements - gives that "code" feel
Good contrast ratios for accessibility

 Performance
-No heavy frameworks = faster load times
-CSS animations instead of JavaScript where possible
-Optimized images (using CDN in this case)
-Minimal external dependencies

Challenges I Overcame
-Logo Animation: Building the step-by-step construction with proper timing and sequencing
-Email Integration: Making the PHP backend work seamlessly with the frontend
-Responsive Animations: Ensuring animations work well on mobile devices
-Cross-browser Compatibility: Testing and fixing for all major browsers

What I Learned
-Intersection Observer API for scroll animations
-PHP mail configuration and HTML email templates
-Mobile-first responsive design patterns
-Performance optimization for animations

Future Improvements I'd Make:

-Add a dark/light mode toggle
-Implement a blog section
-Add more interactive elements to the Digital Doppelganger demo
-Create a dashboard for the AI platform (separate project)
-Add a portfolio/showcase section
