from flask_socketio import emit, join_room, leave_room
from flask_login import current_user
from datetime import datetime
from . import socketio, db
from .models import Message, User, Notification
from .events import send_notification
from flask import current_app
from sqlalchemy.exc import SQLAlchemyError
import traceback

def init_socketio_events(socketio):
    @socketio.on('connect')
    def handle_connect():
        if not current_user.is_authenticated:
            return False
        current_app.logger.info(f"User {current_user.id} connected")
        join_room(f'user_{current_user.id}')
        return True

    @socketio.on('disconnect')
    def handle_disconnect():
        if current_user.is_authenticated:
            current_app.logger.info(f"User {current_user.id} disconnected")
            leave_room(f'user_{current_user.id}')

    @socketio.on('message')
    def handle_message(data):
        if not current_user.is_authenticated:
            current_app.logger.error("Message attempt without authentication")
            return {'error': 'Authentication required'}, False
        
        try:
            recipient_id = data.get('recipient_id')
            content = data.get('content')
            timestamp = data.get('timestamp')
            
            current_app.logger.info(f"Received message data: recipient_id={recipient_id}, content={content}, timestamp={timestamp}")
            current_app.logger.info(f"Current user ID: {current_user.id}")
            
            if not recipient_id or not content:
                current_app.logger.error("Missing required message data")
                return {'error': 'Missing required message data'}, False
            
            # Convert recipient_id to integer
            try:
                recipient_id = int(recipient_id)
            except (ValueError, TypeError) as e:
                current_app.logger.error(f"Invalid recipient_id format: {recipient_id}, error: {str(e)}")
                return {'error': 'Invalid recipient ID'}, False
            
            # Validate recipient exists
            recipient = User.query.get(recipient_id)
            if not recipient:
                current_app.logger.error(f"Recipient not found: {recipient_id}")
                return {'error': 'Recipient not found'}, False
            
            # Create and save the message
            try:
                # Parse timestamp if provided, otherwise use current time
                try:
                    message_timestamp = datetime.fromisoformat(timestamp) if timestamp else datetime.utcnow()
                    current_app.logger.info(f"Parsed timestamp: {message_timestamp}")
                except ValueError as e:
                    current_app.logger.error(f"Invalid timestamp format: {timestamp}, error: {str(e)}")
                    message_timestamp = datetime.utcnow()
                
                # Create message object
                message = Message(
                    sender_id=current_user.id,
                    recipient_id=recipient_id,
                    content=content,
                    timestamp=message_timestamp,
                    is_read=False
                )
                
                current_app.logger.info(f"Created message object: {message}")
                
                # Save message to database
                try:
                    # Start a new transaction
                    db.session.begin_nested()
                    
                    # Add message
                    db.session.add(message)
                    db.session.flush()  # Get the message ID without committing
                    current_app.logger.info(f"Message added to session with ID: {message.id}")
                    
                    # Create notification
                    notification = Notification(
                        user_id=recipient_id,
                        message=f"New message from {current_user.username}: {content[:30]}",
                        notification_type='message',
                        link=f"/messages?user={current_user.id}",
                        timestamp=datetime.utcnow()
                    )
                    db.session.add(notification)
                    
                    # Commit the nested transaction
                    db.session.commit()
                    current_app.logger.info(f"Successfully saved message with ID: {message.id} and notification")
                    
                except SQLAlchemyError as e:
                    db.session.rollback()
                    current_app.logger.error(f"Database error while saving message: {str(e)}")
                    current_app.logger.error(f"SQLAlchemy error details: {e.__class__.__name__}")
                    current_app.logger.error(f"Traceback: {traceback.format_exc()}")
                    return {'error': 'Failed to save message'}, False
                
                message_data = {
                    'message_id': message.id,
                    'content': content,
                    'sender_id': current_user.id,
                    'recipient_id': recipient_id,
                    'timestamp': message_timestamp.isoformat(),
                    'is_read': False
                }
                
                # Emit notification to recipient
                emit('new_notification', notification.to_dict(), room=f'user_{recipient_id}')
                
                # Emit to recipient's room
                recipient_room = f'user_{recipient_id}'
                emit('message', message_data, room=recipient_room)
                current_app.logger.info(f"Emitted message to recipient room: {recipient_room}")
                
                # Also emit to sender's room
                sender_room = f'user_{current_user.id}'
                emit('message', message_data, room=sender_room)
                current_app.logger.info(f"Emitted message to sender room: {sender_room}")
                
                return message_data, True
                
            except SQLAlchemyError as e:
                db.session.rollback()
                current_app.logger.error(f"Database error sending message: {str(e)}")
                current_app.logger.error(f"Message data: sender_id={current_user.id}, recipient_id={recipient_id}, content={content}")
                current_app.logger.error(f"SQLAlchemy error details: {e.__class__.__name__}")
                current_app.logger.error(f"Traceback: {traceback.format_exc()}")
                return {'error': 'Failed to save message'}, False
                
        except Exception as e:
            current_app.logger.error(f"Error sending message: {str(e)}")
            current_app.logger.error(f"Error type: {e.__class__.__name__}")
            current_app.logger.error(f"Error details: {str(e)}")
            current_app.logger.error(f"Traceback: {traceback.format_exc()}")
            return {'error': 'Failed to send message'}, False

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