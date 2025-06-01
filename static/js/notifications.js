document.addEventListener('DOMContentLoaded', function() {
    // Connect to Socket.IO
    const socket = io();

    // DOM Elements
    const notifBadge = document.getElementById('notif-badge');
    const notifContainer = document.getElementById('notifications-container');
    const notifEmpty = document.getElementById('notif-empty');
    const notifDropdown = document.getElementById('notificationsDropdown');

    // Keep track of notifications
    let notifications = [];

    // Handle incoming notifications
    socket.on('new_notification', function(data) {
        console.log('Received notification:', data);
        // Add notification to the list
        notifications.unshift(data);
        updateNotificationDisplay();
        
        // Play notification sound
        try {
            const audio = new Audio('/static/sounds/notification.mp3');
            audio.play();
        } catch (e) {
            console.log('Audio play failed:', e);
        }
    });

    // Update the notification dropdown content
    function updateNotificationDisplay() {
        console.log('Updating notifications display. Count:', notifications.length);
        
        // Update the badge count
        const unreadCount = notifications.length;
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
            notifContainer.innerHTML = notifications.map((notif, index) => `
                <a href="javascript:void(0)" class="dropdown-item notification-item" data-notification-id="${index}">
                    <div class="d-flex align-items-center">
                        <div class="notification-content">
                            <p class="mb-1">${notif.message}</p>
                            <small class="text-muted">${formatTimestamp(notif.timestamp || new Date())}</small>
                        </div>
                    </div>
                </a>
            `).join('');

            // Add click handlers to notification items
            document.querySelectorAll('.notification-item').forEach(item => {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    const index = parseInt(this.getAttribute('data-notification-id'));
                    const notification = notifications[index];
                    
                    if (notification) {
                        console.log('Clicking notification:', notification);
                        // Remove this notification
                        notifications.splice(index, 1);
                        updateNotificationDisplay();
                        
                        // Navigate to the chat
                        if (notification.link) {
                            window.location.href = notification.link;
                        }
                    }
                });
            });
        } else {
            notifContainer.innerHTML = '<span class="dropdown-item text-muted" id="notif-empty">No new notifications</span>';
        }
    }

    // Format timestamp to relative time
    function formatTimestamp(timestamp) {
        const date = new Date(timestamp);
        const now = new Date();
        const diff = now - date;
        
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

    // Initialize notifications
    updateNotificationDisplay();

    // Debug: Log socket connection status
    socket.on('connect', () => {
        console.log('Socket connected');
    });

    socket.on('disconnect', () => {
        console.log('Socket disconnected');
    });

    socket.on('error', (error) => {
        console.error('Socket error:', error);
    });
}); 