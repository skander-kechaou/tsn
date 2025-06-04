document.addEventListener('DOMContentLoaded', function() {
    // Connect to Socket.IO with error handling
    const socket = io({
        reconnection: true,
        reconnectionAttempts: 5,
        reconnectionDelay: 1000
    });

    // DOM Elements
    const notifBadge = document.getElementById('notif-badge');
    const notifContainer = document.getElementById('notifications-container');
    const notifEmpty = document.getElementById('notif-empty');
    const notifDropdown = document.getElementById('notificationsDropdown');

    // Keep track of notifications
    let notifications = [];
    let notificationSound = null;

    // Initialize notification sound
    try {
        notificationSound = new Audio('/static/sounds/notification.mp3');
        notificationSound.load(); // Preload the audio
    } catch (e) {
        console.log('Audio initialization failed:', e);
    }

    // Function to play notification sound
    function playNotificationSound() {
        if (notificationSound) {
            try {
                // Create a new promise to handle the play attempt
                const playPromise = notificationSound.play();
                
                if (playPromise !== undefined) {
                    playPromise.catch(error => {
                        // Only log if it's not an autoplay restriction
                        if (error.name !== 'NotAllowedError') {
                            console.log('Audio play failed:', error);
                        }
                    });
                }
            } catch (e) {
                console.log('Audio play failed:', e);
            }
        }
    }

    // Load existing notifications from server
    fetch('/api/notifications')
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => {
                    throw new Error(err.error || `HTTP error! status: ${response.status}`);
                });
            }
            return response.json();
        })
        .then(data => {
            console.log('Loaded notifications:', data);
            if (data.error) {
                throw new Error(data.error);
            }
            notifications = data;
            updateNotificationDisplay();
        })
        .catch(error => {
            console.error('Error loading notifications:', error);
            notifContainer.innerHTML = `
                <div class="dropdown-item text-danger">
                    <i class="fas fa-exclamation-circle me-2"></i>
                    ${error.message || 'Error loading notifications'}
                </div>`;
            notifBadge.style.display = 'none';
        });

    // Handle incoming notifications
    socket.on('new_notification', function(data) {
        console.log('Received notification:', data);
        // Add notification to the list
        notifications.unshift(data);
        updateNotificationDisplay();
        
        // Play notification sound
        playNotificationSound();

        // Show a toast notification
        showToast(data.message);
    });

    // Function to show toast notification
    function showToast(message) {
        // Create toast container if it doesn't exist
        let toastContainer = document.getElementById('toast-container');
        if (!toastContainer) {
            toastContainer = document.createElement('div');
            toastContainer.id = 'toast-container';
            toastContainer.style.position = 'fixed';
            toastContainer.style.top = '20px';
            toastContainer.style.right = '20px';
            toastContainer.style.zIndex = '9999';
            document.body.appendChild(toastContainer);
        }

        // Create toast element
        const toast = document.createElement('div');
        toast.className = 'toast show';
        toast.style.backgroundColor = 'white';
        toast.style.padding = '10px 20px';
        toast.style.marginBottom = '10px';
        toast.style.borderRadius = '4px';
        toast.style.boxShadow = '0 2px 5px rgba(0,0,0,0.2)';
        toast.style.display = 'block';
        toast.innerHTML = `
            <div class="toast-header">
                <strong class="me-auto">New Notification</strong>
                <button type="button" class="btn-close" onclick="this.parentElement.parentElement.remove()"></button>
            </div>
            <div class="toast-body">
                ${message}
            </div>
        `;

        // Add toast to container
        toastContainer.appendChild(toast);

        // Remove toast after 5 seconds
        setTimeout(() => {
            toast.remove();
        }, 5000);
    }

    // Format timestamp to relative time
    function formatTimestamp(timestamp) {
        if (!timestamp) return 'Just now';
        
        console.log('Raw timestamp:', timestamp);
        // Ensure the timestamp is treated as UTC
        const date = new Date(timestamp);
        console.log('Parsed date:', date);
        const now = new Date();
        console.log('Current time:', now);
        const diff = now - date;
        console.log('Time difference (ms):', diff);
        
        // Less than a minute
        if (diff < 60000) {
            return 'Just now';
        }
        // Less than an hour
        if (diff < 3600000) {
            const minutes = Math.floor(diff / 60000);
            return `${minutes}m ago`;
        }
        // Less than a day
        if (diff < 86400000) {
            const hours = Math.floor(diff / 3600000);
            return `${hours}h ago`;
        }
        // More than a day
        const days = Math.floor(diff / 86400000);
        return `${days}d ago`;
    }

    // Update the notification dropdown content
    function updateNotificationDisplay() {
        console.log('Updating notifications display. Count:', notifications.length);
        console.log('Notifications data:', notifications);
        
        // Update the badge count
        const unreadCount = notifications.filter(n => !n.is_read).length;
        if (unreadCount > 0) {
            notifBadge.style.display = 'block';
            notifBadge.textContent = unreadCount;
            notifEmpty.style.display = 'none';
        } else {
            notifBadge.style.display = 'none';
            notifEmpty.style.display = 'block';
        }

        // Update the dropdown content
        if (notifications.length > 0) {
            notifContainer.innerHTML = notifications.map((notif, index) => {
                console.log('Processing notification:', notif);
                return `
                <a href="javascript:void(0)" class="dropdown-item notification-item ${notif.is_read ? 'read' : 'unread'}" 
                   data-notification-id="${notif.id}">
                    <div class="d-flex align-items-center">
                        <div class="notification-content">
                            <p class="mb-1">${notif.message}</p>
                            <small class="text-muted">${formatTimestamp(notif.timestamp)}</small>
                        </div>
                    </div>
                </a>
            `}).join('');

            // Add click handlers to notification items
            document.querySelectorAll('.notification-item').forEach(item => {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    const notificationId = this.getAttribute('data-notification-id');
                    const notification = notifications.find(n => n.id == notificationId);
                    
                    if (notification) {
                        console.log('Clicking notification:', notification);
                        // Get CSRF token from meta tag
                        const csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute('content');
                        
                        // Mark as read in database
                        fetch(`/api/notifications/${notificationId}/read`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-Requested-With': 'XMLHttpRequest',
                                'X-CSRF-Token': csrfToken
                            },
                            credentials: 'same-origin'
                        })
                        .then(response => {
                            if (!response.ok) {
                                // Try to parse error response as JSON first
                                return response.text().then(text => {
                                    try {
                                        const error = JSON.parse(text);
                                        throw new Error(error.error || `HTTP error! status: ${response.status}`);
                                    } catch (e) {
                                        // If not JSON, use the text as error message
                                        throw new Error(`Server error: ${text.substring(0, 100)}`);
                                    }
                                });
                            }
                            return response.json();
                        })
                        .then(data => {
                            // Update local state
                            notification.is_read = true;
                            updateNotificationDisplay();
                            
                            // Navigate to the link if exists
                            if (notification.link) {
                                window.location.href = notification.link;
                            }
                        })
                        .catch(error => {
                            console.error('Error marking notification as read:', error);
                            alert('Failed to mark notification as read. Please try again.');
                        });
                    }
                });
            });
        } else {
            notifContainer.innerHTML = '<span class="dropdown-item text-muted" id="notif-empty">No new chimes</span>';
        }
    }

    // Initialize notifications
    updateNotificationDisplay();

    // Debug: Log socket connection status
    socket.on('connect', () => {
        console.log('Socket.IO connected successfully');
    });

    socket.on('connect_error', (error) => {
        console.error('Socket.IO connection error:', error);
    });

    socket.on('disconnect', (reason) => {
        console.log('Socket.IO disconnected:', reason);
    });

    socket.on('error', (error) => {
        console.error('Socket.IO error:', error);
    });
}); 