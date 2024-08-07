<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="internal.entity.Book" %>
<%@ page import="internal.Dao.BookDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Book List - Library Management</title>
    <style>
        /* Root Variables for Theme Colors */
        :root {
            --primary-color: #2c3e50; /* Navy Blue for text and header */
            --secondary-color: #f7f9fc; /* Light Gray for background */
            --accent-color: #00796b; /* Teal for buttons and table headers */
            --header-background: #00796b; /* Teal for table headers */
            --footer-background: #2c3e50; /* Navy Blue for Footer */
            --text-color: #333; /* Dark Gray for Text */
            --link-hover-color: #3498db; /* Light Blue for Link Hover */
            --button-background: #00796b; /* Teal for buttons */
            --button-hover: #004d40; /* Darker Teal for button hover */
            --table-row-hover: #f1f1f1; /* Light Gray for table row hover */
            --table-shadow: rgba(0, 0, 0, 0.1); /* Shadow for table */
            --table-border: #dddddd; /* Light Gray for table borders */
            --delete-button: #ff6b6b; /* Coral for delete button */
            --delete-hover: #c0392b; /* Darker Coral for delete hover */
        }

        /* Reset default styles */
        body, h2, table, th, td, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Body Style */
        body {
            background-color: var(--secondary-color);
            color: var(--text-color);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navigation Bar */
        nav {
            background-color: var(--primary-color);
            color: #ffffff;
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
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: var(--link-hover-color);
        }

        /* Main Content Container */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
            padding: 20px;
            flex-direction: column;
        }

        /* Page Title */
        h2 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
        }

        /* Table Style */
        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 2px 4px var(--table-shadow);
            border: 1px solid var(--table-border);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid var(--table-border);
            font-size: 16px;
        }

        th {
            background-color: var(--header-background);
            color: #ffffff;
        }

        tr:hover {
            background-color: var(--table-row-hover);
        }

        /* Centered Container */
        .center {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        /* Button Styles */
        a.button, .delete-btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        a.button {
            background-color: var(--button-background);
        }

        a.button:hover {
            background-color: var(--button-hover);
        }

        /* Delete Button Styles */
        .delete-btn {
            background-color: var(--delete-button);
            border: none;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: var(--delete-hover);
        }

        /* Footer */
        footer {
            background-color: var(--footer-background);
            color: #ffffff;
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
        <h2>Library Book List</h2>
       
        <table>
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Action</th> <!-- Column for Actions -->
                </tr>
            </thead>
            <tbody>
                <%
                    BookDao bookDao = new BookDao();
                    List<Book> books = bookDao.getAllBooks(); 
                    for (Book book : books) {
                %>
                <tr>
                    <td><%= book.getBid() %></td>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td>Rs <%= book.getPrice() %></td>
                    <td>
                        <!-- Edit Button -->
                        <a href="update.jsp?bookId=<%= book.getBid() %>" class="button">Edit</a>
                        <!-- Delete Button -->
                        <form action="DeleteBookServlet" method="post" style="display:inline;">
                            <input type="hidden" name="bookId" value="<%= book.getBid() %>">
                            <button type="submit" class="delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Library Management System. All rights reserved.</p>
    </footer>

</body>

</html>
