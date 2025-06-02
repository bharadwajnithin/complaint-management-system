# Complaint Management System

A web-based Complaint Management System built using Java Servlets and JSP that allows users to register, login, submit complaints, and track their status. The system also includes an admin interface for managing complaints.

## Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── complaint/
│   │           ├── servlets/    # Servlet classes
│   │           └── utils/       # Utility classes
│   └── webapp/
│       ├── WEB-INF/            # Web application configuration
│       ├── META-INF/           # Metadata
│       ├── index.jsp           # Landing page
│       ├── login.jsp           # User login page
│       ├── register.jsp        # User registration page
│       ├── submit_complaint.jsp # Complaint submission form
│       ├── user_dashboard.jsp  # User dashboard
│       ├── admin_dashboard.jsp # Admin dashboard
│       └── logout.jsp          # Logout functionality
```

## Features

- User Registration and Authentication
- User Dashboard
- Complaint Submission
- Complaint Status Tracking
- Admin Dashboard for Complaint Management
- Secure Session Management

## Technical Stack

- Java Servlets
- JSP (JavaServer Pages)
- HTML/CSS
- JavaScript
- Database (MySQL/PostgreSQL)

## Setup Instructions

1. Ensure you have Java JDK 8 or higher installed
2. Set up your preferred IDE (Eclipse/IntelliJ IDEA)
3. Configure your database connection in the appropriate configuration files
4. Deploy the application to a servlet container (e.g., Apache Tomcat)
5. Access the application through your web browser

## Usage

1. Register a new account or login with existing credentials
2. Submit complaints through the user dashboard
3. Track complaint status
4. Admins can manage and respond to complaints through the admin dashboard

## Security Features

- Secure session management
- Password encryption
- Input validation
- Access control for admin features

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 