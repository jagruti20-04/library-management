package internal.Dao;

import internal.entity.Book;
import internal.configure.HibernateConfiguration;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class BookDao {

	 public Book getBookById(String bookId) {
	        SessionFactory sessionFactory = HibernateConfiguration.getSessionFactory();
	        Session session = sessionFactory.openSession();
	        Transaction transaction = session.beginTransaction();
	        Book book = null;
	        try {
	            // Convert bookId from String to Integer
	            Integer id = Integer.parseInt(bookId);
	            book = session.get(Book.class, id); // Fetch book by ID
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (session != null) {
	                session.close();
	            }
	        }

	        return book;
	    }
	
	


   
    public static boolean save(Book book) {
        SessionFactory sessionFactory = HibernateConfiguration.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        try {
            session.save(book);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true;
    }

  
    public List<Book> getAllBooks() {
        List<Book> books = null;
        SessionFactory sessionFactory = HibernateConfiguration.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        try {
            Query<Book> query = session.createQuery("FROM Book", Book.class);
            books = query.list();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

        return books;
    }
    public boolean deleteBookById(int bookId) {
    	SessionFactory sessionFactory = HibernateConfiguration.getSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        try {
        	 

            
            String hql = "DELETE FROM Book WHERE bid = :bookId";
            Query query = session.createQuery(hql);
            query.setParameter("bookId", bookId);

          
            int result = query.executeUpdate();
            transaction.commit();

            
            return result > 0; 
        } catch (Exception e) {
            if (transaction != null) {
           
                transaction.rollback();
            }
            e.printStackTrace();
            return false; 
        } finally {
            if (session != null) {
              
                session.close();
            }
        }
    }




    

        public boolean updateBook(Book book) {
            SessionFactory sessionFactory = HibernateConfiguration.getSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            boolean updated = false;

            try {
                session.update(book);
                transaction.commit();
                updated = true;
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                e.printStackTrace();
            } finally {
                session.close();
            }

            return updated;
        }
    }



