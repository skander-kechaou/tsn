# Nest
# TSN - Tailored Network Management System

<div align="center">
  <img src="static/images/logo.png" alt="TSN Logo" width="200"/>
</div>

A Flask-based web application for managing and monitoring time-sensitive networks, featuring real-time event handling, user authentication, and administrative controls.

## Features

- 🔐 Secure user authentication and authorization
- 📊 Real-time monitoring and management
- 👥 User profile management
- 🔄 WebSocket support for real-time updates and messaging
- 📱 SMS notifications integration
- 👮‍♂️ Administrative dashboard
- 🔌 Network connection management
- 📈 Event tracking and analytics

## Tech Stack

- **Backend Framework:** Flask 3.1.1
- **Database:** PostgreSQL with SQLAlchemy ORM
- **Authentication:** Flask-Security-Too
- **Real-time Communication:** Flask-SocketIO
- **Frontend:** HTML, CSS, JavaScript
- **Additional Features:**
  - Flask-Mail for email notifications
  - Flask-Dance for OAuth integration
  - Flask-Migrate for database migrations
  - Twilio for SMS notifications

## Prerequisites

- Python 3.8 or higher
- PostgreSQL database
- Virtual environment (recommended)

## Installation

1. Clone the repository:
```bash
git clone [your-repository-url]
cd tsn
```

2. Create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Set up environment variables:
Create a `.flaskenv` file in the root directory with the following variables:
```
FLASK_APP=app
FLASK_ENV=development
DATABASE_URL=postgresql://username:password@localhost/tsn_db
```

5. Initialize the database:
```bash
flask db upgrade
python populate_db.py
```

## Project Structure

```
tsn/
├── app/
│   ├── admin/         # Administrative interface
│   ├── auth/          # Authentication related code
│   ├── connections/   # Network connection management
│   ├── event/         # Event handling
│   ├── main/          # Main application routes
│   ├── profile/       # User profile management
│   ├── models.py      # Database models
│   ├── config.py      # Configuration settings
│   └── extensions.py  # Flask extensions
├── migrations/        # Database migrations
├── static/           # Static files (CSS, JS, images)
├── templates/        # HTML templates
├── requirements.txt  # Project dependencies
└── app.py           # Application entry point
```

## Database

The project uses PostgreSQL with several database files:
- `tsn_db.sql`: Main database schema
- `tsn_db_architecture.sql`: Database architecture
- `tsn_db_enriched.sql`: Enriched database schema with fake seeds
- `tsn_db_final_architecture.sql`: Final database architecture

## Running the Application

1. Start the Flask development server:
```bash
flask run
```

2. Access the application at `http://localhost:5000`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

[Your License Here]

## Contact

[Your Contact Information] 