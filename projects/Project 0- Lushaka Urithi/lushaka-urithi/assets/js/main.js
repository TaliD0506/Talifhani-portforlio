document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle
    const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
    const mobileMenu = document.getElementById('mobile-menu');
    
    if (mobileMenuToggle && mobileMenu) {
        mobileMenuToggle.addEventListener('click', function() {
            mobileMenu.classList.toggle('active');
        });
    }
    
    // Enhanced Add to cart functionality with better error handling
    document.querySelectorAll('.btn-add-to-cart').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation(); // Prevent event bubbling
            
            const productId = this.dataset.productId;
            const originalText = this.innerHTML;
            
            // Disable button during request
            this.disabled = true;
            this.innerHTML = 'Adding...';
            
            // Get quantity if available
            const quantityInput = document.getElementById('quantity');
            const quantity = quantityInput ? quantityInput.value : 1;
            
            fetch('/lushaka-urithi/includes/add_to_cart.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `product_id=${productId}&quantity=${quantity}`
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    // Update cart count in header
                    const cartCount = document.getElementById('cart-count');
                    if (cartCount && data.cart_count) {
                        cartCount.textContent = data.cart_count;
                        cartCount.style.display = data.cart_count > 0 ? 'inline' : 'none';
                    }
                    
                    // Show success feedback
                    this.innerHTML = 'Added!';
                    this.style.backgroundColor = '#28a745';
                    this.style.color = 'white';
                    
                    // Show success message
                    showNotification('Product added to cart!', 'success');
                    
                    // Reset button after 2 seconds
                    setTimeout(() => {
                        this.innerHTML = originalText;
                        this.style.backgroundColor = '';
                        this.style.color = '';
                        this.disabled = false;
                    }, 2000);
                } else {
                    throw new Error(data.message || 'Failed to add product to cart.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification(error.message || 'An error occurred. Please try again.', 'error');
                
                // Reset button
                this.innerHTML = originalText;
                this.disabled = false;
            });
        });
    });
    
    // Add to wishlist functionality with improved feedback
    document.querySelectorAll('.btn-add-to-wishlist').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            const productId = this.dataset.productId;
            const heartIcon = this.querySelector('i');
            
            fetch('/lushaka-urithi/includes/add_to_wishlist.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `product_id=${productId}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    if (heartIcon) {
                        heartIcon.className = 'fas fa-heart'; // Change to filled heart
                    }
                    this.style.color = '#e74c3c';
                    this.title = 'Added to wishlist';
                    
                    showNotification('Added to wishlist!', 'success');
                } else {
                    showNotification(data.message || 'Failed to add product to wishlist.', 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showNotification('An error occurred. Please try again.', 'error');
            });
        });
    });
    
    // Remove from wishlist
    document.querySelectorAll('.btn-remove-wishlist').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            
            const productId = this.dataset.productId;
            const wishlistItem = this.closest('.wishlist-item, .product-card');
            
            if (confirm('Are you sure you want to remove this item from your wishlist?')) {
                fetch('/lushaka-urithi/includes/remove_from_wishlist.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `product_id=${productId}`
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        wishlistItem.style.opacity = '0.5';
                        wishlistItem.style.transform = 'scale(0.9)';
                        
                        setTimeout(() => {
                            wishlistItem.remove();
                        }, 300);
                        
                        showNotification('Removed from wishlist', 'success');
                    } else {
                        showNotification(data.message || 'Failed to remove product from wishlist.', 'error');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    showNotification('An error occurred. Please try again.', 'error');
                });
            }
        });
    });
    
    // Contact seller button
    document.querySelectorAll('.btn-contact-seller').forEach(button => {
        button.addEventListener('click', function() {
            const sellerId = this.dataset.sellerId;
            const productId = this.dataset.productId || '';
            
            const subject = productId ? `Regarding product #${productId}` : '';
            window.location.href = `/lushaka-urithi/message.php?seller_id=${sellerId}&product_id=${productId}&subject=${encodeURIComponent(subject)}`;
        });
    });
    
    // Enhanced Product image gallery
    document.querySelectorAll('.thumbnail').forEach(thumb => {
        thumb.addEventListener('click', function() {
            document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
            this.classList.add('active');
            
            const mainImage = document.getElementById('main-product-image');
            if (mainImage) {
                const newSrc = '/lushaka-urithi/assets/uploads/products/' + this.dataset.image;
                
                // Add loading effect
                mainImage.style.opacity = '0.5';
                mainImage.src = newSrc;
                
                mainImage.onload = function() {
                    this.style.opacity = '1';
                };
            }
        });
    });
    
    // Browse All Products button functionality
    document.querySelectorAll('a[href*="products.php"]').forEach(link => {
        if (link.textContent.includes('Browse All Products')) {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                
                // Clear all URL parameters to show all products
                window.location.href = '/lushaka-urithi/products.php';
            });
        }
    });
    
    // Clear filters functionality
    document.querySelectorAll('.clear-filters').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            window.location.href = '/lushaka-urithi/products.php';
        });
    });
    
    // Filter tag removal
    document.querySelectorAll('.filter-tag a').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            window.location.href = this.href;
        });
    });
    
    // Mark message as read
    document.querySelectorAll('.message.unread').forEach(message => {
        const messageId = message.dataset.messageId;
        
        if (messageId) {
            fetch('/lushaka-urithi/includes/mark_message_read.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: `message_id=${messageId}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    message.classList.remove('unread');
                    
                    // Update unread count in header if exists
                    const unreadCount = document.getElementById('unread-count');
                    if (unreadCount) {
                        const currentCount = parseInt(unreadCount.textContent);
                        if (currentCount > 0) {
                            const newCount = currentCount - 1;
                            unreadCount.textContent = newCount;
                            unreadCount.style.display = newCount > 0 ? 'inline' : 'none';
                        }
                    }
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    });
    
    // Enhanced Form validation with better UX
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function(e) {
            let valid = true;
            const errors = [];
            
            // Clear previous errors
            this.querySelectorAll('.error-message').forEach(error => error.remove());
            this.querySelectorAll('[style*="border-color"]').forEach(field => {
                field.style.borderColor = '';
            });
            
            // Check required fields
            this.querySelectorAll('[required]').forEach(field => {
                if (!field.value.trim()) {
                    valid = false;
                    field.style.borderColor = '#e74c3c';
                    
                    const errorMsg = document.createElement('span');
                    errorMsg.className = 'error-message';
                    errorMsg.textContent = 'This field is required';
                    errorMsg.style.cssText = 'color: #e74c3c; font-size: 14px; display: block; margin-top: 5px;';
                    field.parentNode.insertBefore(errorMsg, field.nextSibling);
                    
                    errors.push(field.placeholder || field.name || 'Required field');
                }
            });
            
            // Check email format
            const emailFields = this.querySelectorAll('input[type="email"]');
            emailFields.forEach(field => {
                if (field.value && !isValidEmail(field.value)) {
                    valid = false;
                    field.style.borderColor = '#e74c3c';
                    
                    const errorMsg = document.createElement('span');
                    errorMsg.className = 'error-message';
                    errorMsg.textContent = 'Please enter a valid email address';
                    errorMsg.style.cssText = 'color: #e74c3c; font-size: 14px; display: block; margin-top: 5px;';
                    field.parentNode.insertBefore(errorMsg, field.nextSibling);
                }
            });
            
            // Check password match
            const password = this.querySelector('#password');
            const confirmPassword = this.querySelector('#confirm_password');
            
            if (password && confirmPassword && password.value !== confirmPassword.value) {
                valid = false;
                confirmPassword.style.borderColor = '#e74c3c';
                
                const errorMsg = document.createElement('span');
                errorMsg.className = 'error-message';
                errorMsg.textContent = 'Passwords do not match';
                errorMsg.style.cssText = 'color: #e74c3c; font-size: 14px; display: block; margin-top: 5px;';
                confirmPassword.parentNode.insertBefore(errorMsg, confirmPassword.nextSibling);
            }
            
            if (!valid) {
                e.preventDefault();
                
                // Show summary of errors
                if (errors.length > 0) {
                    showNotification(`Please fix the following errors: ${errors.join(', ')}`, 'error');
                }
                
                // Scroll to first error
                const firstError = this.querySelector('[style*="border-color: rgb(231, 76, 60)"]');
                if (firstError) {
                    firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    firstError.focus();
                }
            }
        });
    });
    
    // Initialize any sliders
    if (typeof initializeSliders === 'function') {
        initializeSliders();
    }
    
    // Search functionality enhancement
    const searchForm = document.querySelector('form[action*="products.php"]');
    if (searchForm) {
        const searchInput = searchForm.querySelector('input[name="q"]');
        if (searchInput) {
            // Add search suggestions or autocomplete here if needed
            searchInput.addEventListener('keypress', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    searchForm.submit();
                }
            });
        }
    }
});

// Utility functions
function showNotification(message, type = 'info') {
    // Remove existing notifications
    const existingNotifications = document.querySelectorAll('.notification');
    existingNotifications.forEach(notif => notif.remove());
    
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    // Style the notification
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 15px 20px;
        border-radius: 5px;
        color: white;
        font-weight: bold;
        z-index: 10000;
        max-width: 300px;
        word-wrap: break-word;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        transition: opacity 0.3s ease;
    `;
    
    // Set background color based on type
    switch(type) {
        case 'success':
            notification.style.backgroundColor = '#28a745';
            break;
        case 'error':
            notification.style.backgroundColor = '#dc3545';
            break;
        case 'warning':
            notification.style.backgroundColor = '#ffc107';
            notification.style.color = '#212529';
            break;
        default:
            notification.style.backgroundColor = '#17a2b8';
    }
    
    document.body.appendChild(notification);
    
    // Auto remove after 5 seconds
    setTimeout(() => {
        notification.style.opacity = '0';
        setTimeout(() => {
            if (notification.parentNode) {
                notification.remove();
            }
        }, 300);
    }, 5000);
    
    // Allow manual dismissal by clicking
    notification.addEventListener('click', function() {
        this.style.opacity = '0';
        setTimeout(() => {
            if (this.parentNode) {
                this.remove();
            }
        }, 300);
    });
}

function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Function to initialize testimonial slider
function initializeSliders() {
    const testimonialSlider = document.querySelector('.testimonial-slider');
    if (testimonialSlider) {
        console.log('Initializing testimonial slider...');
        // Add actual slider initialization code here
    }
}

// Function to handle AJAX form submissions
function submitForm(form, callback) {
    const formData = new FormData(form);
    
    fetch(form.action, {
        method: form.method,
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        if (typeof callback === 'function') {
            callback(data);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showNotification('An error occurred. Please try again.', 'error');
    });
}

// Handle back button navigation
window.addEventListener('popstate', function(e) {
    // Refresh the page when user uses back/forward buttons
    // This ensures the correct products are displayed
    if (window.location.pathname.includes('products.php')) {
        window.location.reload();
    }
});
