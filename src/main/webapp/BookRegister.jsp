<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book - Library Management</title>
    <style>
        /* Root Variables for Theme Colors */
        :root {
            --primary-color: #2c3e50; /* Navy Blue for text */
            --secondary-color: #ecf0f1; /* Light Gray for background */
            --accent-color: #2c3e50; /* Navy Blue for buttons */
            --form-background: #ffffff; /* White for form background */
            --border-color: #dcdcdc; /* Light Gray for borders */
            --button-hover: #1a242f; /* Darker Navy Blue for button hover */
            --input-focus: #3498db; /* Light Blue for input focus */
            --footer-background: #2c3e50; /* Navy Blue for Footer */
            --text-color: #ffffff; /* White for Text */
            --link-hover-color: #3498db; /* Light Blue for Link Hover */
        }

        /* Reset some default styles */
        body,
        h2,
        form,
        input,
        a,
        nav,
        footer {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Body Style */
        body {
            background-color: var(--secondary-color);
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
            align-items: center;
            flex-grow: 1;
            padding: 20px;
            flex-wrap: wrap;
        }

        /* Form Container */
        .form-container {
            background-color: var(--form-background);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px 40px;
            width: 400px;
            text-align: center;
            border: 1px solid var(--border-color);
        }

        /* Form Title */
        h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        /* Form Inputs */
        form input[type="text"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        /* Focus Effect for Inputs */
        form input[type="text"]:focus {
            border-color: var(--input-focus);
            outline: none;
        }

        /* Form Buttons */
        form input[type="submit"],
        form input[type="reset"] {
            width: 80%; /* Shortened width */
            padding: 10px;
            margin: 15px 0;
            border: none;
            border-radius: 5px;
            background-color: var(--accent-color);
            color: #ffffff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Hover Effect for Buttons */
        form input[type="submit"]:hover,
        form input[type="reset"]:hover {
            background-color: var(--button-hover);
        }

        /* Link to Book List */
        a {
            color: var(--primary-color);
            font-size: 16px;
            text-decoration: none;
            display: block;
            margin-top: 20px;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        a:hover {
            color: var(--link-hover-color);
            text-decoration: underline;
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
        <div class="form-container">
            <h2>Add a New Book</h2>
            <form action="AddBookServlet" method="post">
                <input type="text" name="title" placeholder="Title" required>
                <input type="text" name="author" placeholder="Author" required>
                <input type="text" name="price" placeholder="Price" required>
                <input type="submit" value="Add Book">
                <input type="reset" value="Cancel">
            </form>
            <a href="Booklist.jsp">View Book List</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Library Management System. All rights reserved.</p>
    </footer>

</body>

</html>
