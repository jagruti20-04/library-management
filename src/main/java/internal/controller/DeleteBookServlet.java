package internal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import internal.Dao.BookDao;

/**
 * Servlet implementation class DeleteBookServlet
 */
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
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
		String bookIdParam = request.getParameter("bookId");

        if (bookIdParam != null && !bookIdParam.isEmpty()) {
            try {
                // Parse the book ID as an integer
                int bookId = Integer.parseInt(bookIdParam);

                // Use the BookDao to delete the book
                BookDao bookDao = new BookDao();
                boolean isDeleted = bookDao.deleteBookById(bookId);

                // Check if deletion was successful
                if (isDeleted) {
                    // Redirect back to the book list page with a success message
                    response.sendRedirect("Booklist.jsp?message=Book+deleted+successfully");
                } else {
                    // Redirect back to the book list page with a failure message
                    response.sendRedirect("Booklist.jsp?message=Failed+to+delete+the+book");
                }
            } catch (NumberFormatException e) {
                // Log the error and redirect with an error message
                e.printStackTrace();
                response.sendRedirect("Booklist.jsp?message=Invalid+book+ID");
            }
        } else {
            // Redirect back with an error message if book ID is missing
            response.sendRedirect("Booklist.jsp?message=Book+ID+is+required");
        }
    }
}
