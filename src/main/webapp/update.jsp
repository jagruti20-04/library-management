<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="internal.entity.Book" %>
<%@ page import="internal.Dao.BookDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #004d40;
            text-align: center;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group button {
            background-color: #00796b;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .form-group button:hover {
            background-color: #004d40;
        }

        .form-group a {
            color: #00796b;
            text-decoration: none;
            font-size: 16px;
        }

        .form-group a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Update Book Details</h2>

    <div class="form-container">
        <%
            // Retrieve the book ID from the request parameter
            String bookId = request.getParameter("bookId");
            BookDao bookDao = new BookDao();
            Book book = null;

            if (bookId == null || bookId.isEmpty()) {
                out.println("<p class='error-message'>Book ID is missing in the request.</p>");
            } else {
                try {
                    book = bookDao.getBookById(bookId);
                } catch (Exception e) {
                    out.println("<p class='error-message'>An error occurred while retrieving the book details.</p>");
                    e.printStackTrace();
                }

                if (book == null) {
                    out.println("<p class='error-message'>Book not found with ID: " + bookId + "</p>");
                } else {
                    // Display the book details in the form
        %>

        <form action="UpdateBookServlet" method="post">
            <input type="hidden" name="bookId" value="<%= book.getBid() %>">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<%= book.getTitle() %>" required>
            </div>
            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" id="author" name="author" value="<%= book.getAuthor() %>" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" value="<%= book.getPrice() %>" step="0.01" required>
            </div>
            <div class="form-group">
                <button type="submit">Update Book</button>
            </div>
        </form>
        <div class="form-group">
            <a href="Booklist.jsp">Back to Book List</a>
        </div>

        <%
                }
            }
        %>
    </div>
</body>
</html>
