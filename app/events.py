from flask_socketio import emit, join_room
from flask_login import current_user
from .extensions import socketio, db
from datetime import datetime
from .models import Notification
from flask import current_app
from sqlalchemy.exc import SQLAlchemyError

@socketio.on('connect')
def handle_connect():
    if current_user.is_authenticated:
        try:
            # Join a room specific to this user
            room = f'user_{current_user.id}'
            join_room(room)
            current_app.logger.info(f"User {current_user.username} connected to Socket.IO and joined room {room}")
        except Exception as e:
            current_app.logger.error(f"Error in socket connection: {str(e)}")
            return False
    return True

def send_notification(user_id, message, notification_type='default', link=None):
    """
    Send a notification to a specific user.
    
    Args:
        user_id (int): The ID of the user to send the notification to
        message (str): The notification message
        notification_type (str): The type of notification
        link (str, optional): A link to include with the notification
        
    Returns:
        bool: True if notification was sent successfully, False otherwise
    """
    try:
        current_app.logger.info(f"Preparing notification for user {user_id}")
        current_app.logger.info(f"Message: {message}")
        current_app.logger.info(f"Type: {notification_type}")
        current_app.logger.info(f"Link: {link}")
        
        # Validate user exists
        from .models import User
        user = User.query.get(user_id)
        if not user:
            current_app.logger.error(f"User {user_id} not found")
            return False
        
        # Create notification in database
        notification = Notification(
            user_id=user_id,
            message=message,
            notification_type=notification_type,
            link=link,
            timestamp=datetime.utcnow()
        )
        
        try:
            db.session.add(notification)
            db.session.commit()
            
            notification_data = notification.to_dict()
            
            room = f'user_{user_id}'
            current_app.logger.info(f"Emitting notification to room: {room}")
            current_app.logger.info(f"Notification data: {notification_data}")
            
            # Emit to the user's specific room
            emit('new_notification', notification_data, room=room)
            current_app.logger.info(f"Notification sent to room {room}")
            return True
            
        except SQLAlchemyError as e:
            db.session.rollback()
            current_app.logger.error(f"Database error creating notification: {str(e)}")
            return False
            
    except Exception as e:
        current_app.logger.error(f"Error sending notification: {str(e)}")
        return False 