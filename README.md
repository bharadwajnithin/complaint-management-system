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
- Database (MySQL)

## Setup Instructions

1. Ensure you have Java JDK 8 or higher installed
2. Set up your preferred IDE (Eclipse/IntelliJ IDEA)
3. Configure your database connection in the appropriate configuration files
4. Deploy the application to a servlet container (e.g., Apache Tomcat)
5. Access the application through your web browser

## Database Configuration

### Database Schema
```sql
CREATE DATABASE complaint_management;
USE complaint_management;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(20) DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE complaints (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    subject VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
```

### Database Connection Properties
Add the following properties to `src/main/resources/database.properties`:
```properties
db.url=jdbc:mysql://localhost:3306/complaint_management
db.username=your_username
db.password=your_password
db.driver=com.mysql.cj.jdbc.Driver
```

## Admin Credentials
Default admin credentials for first-time setup:
- Username: admin
- Password: admin123

**Important**: Please change the default admin password after first login for security purposes.

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
