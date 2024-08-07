package internal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import internal.Dao.BookDao;
import internal.entity.Book;

/**
 * Servlet implementation class UpdateBookServlet
 */
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		 String bookId = request.getParameter("bookId");
	        String title = request.getParameter("title");
	        String author = request.getParameter("author");
	        String priceStr = request.getParameter("price");

	        try {
	            double price = Double.parseDouble(priceStr);
	            BookDao bookDao = new BookDao();
	            Book book = bookDao.getBookById(bookId);

	            if (book != null) {
	                book.setTitle(title);
	                book.setAuthor(author);
	                book.setPrice(price);
	                bookDao.updateBook(book);
	                response.sendRedirect("Booklist.jsp"); // Redirect to book list after update
	            } else {
	                request.setAttribute("errorMessage", "Book not found.");
	                request.getRequestDispatcher("update.jsp").forward(request, response);
	            }
	        } catch (NumberFormatException e) {
	            request.setAttribute("errorMessage", "Invalid price format.");
	            request.getRequestDispatcher("update.jsp").forward(request, response);
	        }
	    }
	}