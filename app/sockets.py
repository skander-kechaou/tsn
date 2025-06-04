from flask_socketio import emit, join_room, leave_room
from flask_login import current_user
from datetime import datetime
from . import socketio, db
from .models import Message, User
from .events import send_notification

@socketio.on('connect')
def handle_connect():
    if current_user.is_authenticated:
        room = f'user_{current_user.id}'
        join_room(room)
        print(f"User {current_user.username} connected and joined room {room}")

@socketio.on('disconnect')
def handle_disconnect():
    if current_user.is_authenticated:
        room = f'user_{current_user.id}'
        leave_room(room)
        print(f"User {current_user.username} disconnected from room {room}")

@socketio.on('message')
def handle_message(data):
    if not current_user.is_authenticated:
        return
    
    recipient_id = data.get('recipient_id')
    content = data.get('content')
    timestamp = data.get('timestamp')
    
    if not recipient_id or not content:
        return
    
    # Create and save the message
    message = Message(
        sender_id=current_user.id,
        recipient_id=recipient_id,
        content=content,
        timestamp=datetime.fromisoformat(timestamp),
        is_read=False
    )
    db.session.add(message)
    
    try:
        db.session.commit()
        message_data = {
            'message_id': message.id,
            'content': content,
            'sender_id': current_user.id,
            'timestamp': timestamp,
            'is_read': False
        }
        # Emit to recipient's room
        recipient_room = f'user_{recipient_id}'
        emit('message', message_data, room=recipient_room)
        print(f"Sent message to room {recipient_room}")
        
        # Send notification to recipient
        sender = User.query.get(current_user.id)
        notification_message = f'New message from {sender.username}: {content[:30]}'
        notification_link = f'/messages?user={current_user.id}'
        print(f"Sending notification to user {recipient_id}: {notification_message}")
        send_notification(
            user_id=recipient_id,
            message=notification_message,
            notification_type='message',
            link=notification_link
        )
        
        # Also emit to sender's room so they see their own message
        sender_room = f'user_{current_user.id}'
        emit('message', message_data, room=sender_room)
        print(f"Sent message to sender's room {sender_room}")
        
    except Exception as e:
        print(f"Error sending message: {str(e)}")
        db.session.rollback()
        emit('error', {'message': 'Failed to send message'}, room=f'user_{current_user.id}')

@socketio.on('typing')
def handle_typing(data):
    if not current_user.is_authenticated:
        return
    
    recipient_id = data.get('recipient_id')
    if not recipient_id:
        return
    
    emit('typing', {
        'sender_id': current_user.id
    }, room=f'user_{recipient_id}')

@socketio.on('stop_typing')
def handle_stop_typing(data):
    if not current_user.is_authenticated:
        return
    
    recipient_id = data.get('recipient_id')
    if not recipient_id:
        return
    
    emit('stop_typing', {
        'sender_id': current_user.id
    }, room=f'user_{recipient_id}')

def init_socketio_events(socketio_instance):
    pass