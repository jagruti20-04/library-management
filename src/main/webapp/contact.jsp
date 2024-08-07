<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Library Management System</title>
    <style>
        /* Root Variables for Blue-Themed Colors */
        :root {
            --primary-color: #1a1f71; /* Navy Blue for Headers */
            --secondary-color: #f0f4fb; /* Light Blue for Background */
            --accent-color: #4a6fa5; /* Medium Blue for Buttons */
            --button-hover-color: #36588c; /* Darker Blue for Button Hover */
            --text-color: #ffffff; /* White for Text */
            --form-background: #ffffff; /* White for Form Background */
            --input-border: #dcdcdc; /* Light Gray for Input Borders */
            --input-focus: #3498db; /* Light Blue for Input Focus */
            --footer-background: #1a1f71; /* Navy Blue for Footer */
        }

        /* Reset some default styles */
        body, h1, h2, form, input, textarea, label, a, div {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Body Style */
        body {
            background-color: var(--secondary-color);
            color: var(--primary-color);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navigation Bar */
        nav {
            background-color: var(--primary-color);
            color: var(--text-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        nav h1 {
            font-size: 24px;
        }

        nav ul {
            list-style: none;
            display: flex;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul li a {
            color: var(--text-color);
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: var(--input-focus);
        }

        /* Main Container */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-grow: 1;
            padding: 20px;
            flex-wrap: wrap;
        }

        /* Contact Form Section */
        .contact-form {
            background-color: var(--form-background);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            margin: 20px;
            border: 1px solid var(--input-border);
        }

        .contact-form h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .contact-form label {
            display: block;
            margin-bottom: 5px;
            font-size: 16px;
            color: var(--primary-color);
        }

        .contact-form input[type="text"],
        .contact-form input[type="email"],
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid var(--input-border);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .contact-form input[type="text"]:focus,
        .contact-form input[type="email"]:focus,
        .contact-form textarea:focus {
            border-color: var(--input-focus);
            outline: none;
        }

        .contact-form textarea {
            resize: vertical;
            min-height: 100px;
            max-height: 200px;
        }

        .contact-form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: var(--accent-color);
            color: var(--text-color);
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .contact-form input[type="submit"]:hover {
            background-color: var(--button-hover-color);
        }

        /* Contact Information Section */
        .contact-info {
            background-color: var(--form-background);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            margin: 20px;
            border: 1px solid var(--input-border);
        }

        .contact-info h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .contact-info p {
            font-size: 16px;
            color: var(--primary-color);
            line-height: 1.5;
            margin-bottom: 10px;
        }

        .contact-info a {
            color: var(--link-color);
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .contact-info a:hover {
            color: var(--link-hover-color);
        }

        /* Map Section */
        .map-section {
            width: 100%;
            max-width: 840px;
            margin: 20px auto;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .map-section iframe {
            width: 100%;
            height: 300px;
            border: none;
        }

        /* Footer */
        footer {
            background-color: var(--footer-background);
            color: var(--text-color);
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->
    <nav>
        <h1>Library Management System</h1>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="BookRegister.jsp">Add Book</a></li>
            <li><a href="Booklist.jsp">View Books</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
    </nav>

    <!-- Main Content Container -->
    <div class="main-container">
        <!-- Contact Form -->
        <div class="contact-form">
            <h2>Contact Us</h2>
            <form action="ContactServlet" method="post">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Your Name" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Your Email" required>

                <label for="message">Message</label>
                <textarea id="message" name="message" placeholder="Write your message here..." required></textarea>

                <input type="submit" value="Send Message">
            </form>
        </div>

        <!-- Contact Information -->
        <div class="contact-info">
            <h2>Our Contact Information</h2>
            <p><strong>Library Management System</strong></p>
            <p>123 Library St., City, Country</p>
            <p><strong>Phone:</strong> 8530385126</p>
            <p><strong>Email:</strong> <a href="jagrutirajput101@gmail.com">info@librarysystem.com</a></p>
            <p><strong>Hours:</strong> Monday - Friday: 9:00 AM - 6:00 PM</p>
        </div>
    </div>

    <!-- Map Section -->
    <div class="map-section">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.8354345090727!2d144.953736            !3d-37.81627997975132!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d43f1f4b8fb%3A0x5045675218ce7e33!2zTWFybGVzIEZpbG1zIEFuZCBUZWF0cmUgLSBNZWxib3VybmUgViBTY291bnRyaW91c2U!5e0!3m2!1sen!2sus!4v1681234567890!5m2!1sen!2sus"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Library Management System. All rights reserved.</p>
    </footer>
</body>

</html>
            
