def init_socketio_events(socketio):

    @socketio.on('connect')
    def handle_connect():
        print("Client connected")

    @socketio.on('disconnect')
    def handle_disconnect():
        print("Client disconnected")

    # @socketio.on('send_message')
    # def handle_send_message(data):
    #     # Broadcast the received message to all connected clients
    #     message = data.get('message')
    #     socketio.emit('receive_message', {'message': message})

    def handle_send_message(data):
        # Now we correctly expect a dictionary
        username = data.get('username', 'Anonymous')
        message = data.get('message')
        print(f"Message from {username}: {message}")

        # Broadcast it under the correct event
        socketio.emit('chat', {'username': username, 'message': message})