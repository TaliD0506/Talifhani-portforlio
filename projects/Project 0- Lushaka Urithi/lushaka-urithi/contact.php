<?php
require_once 'templates/header.php';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $subject = trim($_POST['subject']);
    $message = trim($_POST['message']);
    
    // Basic validation
    $errors = [];
    
    if (empty($name)) {
        $errors[] = 'Please enter your name';
    }
    
    if (empty($email) || !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Please enter a valid email address';
    }
    
    if (empty($subject)) {
        $errors[] = 'Please enter a subject';
    }
    
    if (empty($message)) {
        $errors[] = 'Please enter your message';
    }
    
    if (empty($errors)) {
        // Send email (in a real implementation, you would use a mail library)
        $to = 'info@lushaka-urithi.co.za';
        $headers = "From: $email\r\n";
        $headers .= "Reply-To: $email\r\n";
        $headers .= "Content-Type: text/plain; charset=UTF-8\r\n";
        
        $email_body = "Name: $name\n";
        $email_body .= "Email: $email\n\n";
        $email_body .= "Message:\n$message";
        
        // In production, use a proper mailer like PHPMailer
        // mail($to, $subject, $email_body, $headers);
        
        $success = true;
    }
}
?>

<section class="contact-page">
    <div class="container">
        <h1>Contact Us</h1>
        
        <div class="contact-container">
            <div class="contact-info">
                <h2>Get in Touch</h2>
                <p>Have questions about our platform, products, or cultural items? We'd love to hear from you!</p>
                
                <div class="contact-method">
                    <i class="fas fa-envelope"></i>
                    <h3>Email</h3>
                    <p>info@lushaka-urithi.co.za</p>
                </div>
                
                <div class="contact-method">
                    <i class="fas fa-phone"></i>
                    <h3>Phone</h3>
                    <p>+27 12 345 6789</p>
                </div>
                
                <div class="contact-method">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3>Address</h3>
                    <p>123 Cultural Village<br>Pretoria, 0001<br>South Africa</p>
                </div>
                
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-pinterest"></i></a>
                </div>
            </div>
            
            <div class="contact-form">
                <h2>Send Us a Message</h2>
                
                <?php if (!empty($errors)): ?>
                    <div class="alert alert-danger">
                        <ul>
                            <?php foreach ($errors as $error): ?>
                                <li><?= $error ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                <?php endif; ?>
                
                <?php if (isset($success) && $success): ?>
                    <div class="alert alert-success">
                        Thank you for your message! We'll get back to you soon.
                    </div>
                <?php endif; ?>
                
                <form action="/lushaka-urithi/contact.php" method="post">
                    <div class="form-group">
                        <label for="name">Your Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" name="subject" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" rows="5" required></textarea>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Send Message</button>
                </form>
            </div>
        </div>
        
        <div class="business-hours">
            <h2>Business Hours</h2>
            <table>
                <tr>
                    <td>Monday - Friday</td>
                    <td>8:00 AM - 5:00 PM</td>
                </tr>
                <tr>
                    <td>Saturday</td>
                    <td>9:00 AM - 2:00 PM</td>
                </tr>
                <tr>
                    <td>Sunday</td>
                    <td>Closed</td>
                </tr>
            </table>
        </div>
    </div>
</section>

<?php require_once 'templates/footer.php'; ?>