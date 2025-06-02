from flask_socketio import emit
from flask_login import current_user
from app import socketio
from datetime import datetime

@socketio.on('connect')
def handle_connect():
    if current_user.is_authenticated:
        # Join a room specific to this user
        room = f'user_{current_user.id}'
        join_room(room)
        print(f"User {current_user.username} connected to Socket.IO and joined room {room}")

def send_notification(user_id, message, notification_type='default', link=None):
    """
    Send a notification to a specific user
    
    Args:
        user_id: The ID of the user to send the notification to
        message: The notification message
        notification_type: Type of notification (message, friend_request, etc.)
        link: Optional link to redirect to when clicking the notification
    """
    print(f"Preparing notification for user {user_id}")
    print(f"Message: {message}")
    print(f"Type: {notification_type}")
    print(f"Link: {link}")
    
    notification_data = {
        'message': message,
        'type': notification_type,
        'timestamp': datetime.utcnow().isoformat(),
        'link': link
    }
    
    room = f'user_{user_id}'
    print(f"Emitting notification to room: {room}")
    print(f"Notification data: {notification_data}")
    
    # Emit to the user's specific room
    emit('new_notification', notification_data, room=room)
    print(f"Notification sent to room {room}") 