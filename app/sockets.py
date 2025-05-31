from flask_socketio import emit, join_room, leave_room
from flask_login import current_user
from datetime import datetime
from . import socketio, db
from .models import Message, User

@socketio.on('connect')
def handle_connect():
    if current_user.is_authenticated:
        join_room(f'user_{current_user.id}')
        print(f"User {current_user.username} connected")

@socketio.on('disconnect')
def handle_disconnect():
    if current_user.is_authenticated:
        leave_room(f'user_{current_user.id}')
        print(f"User {current_user.username} disconnected")

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
        emit('message', message_data, room=f'user_{recipient_id}')
        # Also emit to sender's room so they see their own message
        emit('message', message_data, room=f'user_{current_user.id}')
    except Exception as e:
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
    """Initialize all socket event handlers
    
    Args:
        socketio_instance: The SocketIO instance to initialize events for
    """
    # The event handlers are already registered via decorators
    # This function exists to provide a clear initialization point
    pass