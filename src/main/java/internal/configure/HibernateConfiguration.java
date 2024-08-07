package internal.configure;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import internal.entity.Book;

import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;

import java.util.Properties;

public class HibernateConfiguration {

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                // Create Configuration
                Configuration con = new Configuration();
                
                // Create Properties, set Hibernate properties
                Properties settings = new Properties();
                
                // Fixed typo in JDBC URL
                settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
                settings.put(Environment.URL, "jdbc:mysql://localhost:3306/bookmanagement");
                settings.put(Environment.USER, "root");
                settings.put(Environment.PASS, "root");

                // Hibernate settings
                settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
                settings.put(Environment.SHOW_SQL, "true");
                settings.put(Environment.HBM2DDL_AUTO, "update"); // Automatically create tables if they don't exist
                
                con.setProperties(settings);

                // Add annotated classes
                con.addAnnotatedClass(Book.class);
                
                // Create ServiceRegistry
                ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                        .applySettings(con.getProperties()).build();
                
                // Build SessionFactory
                sessionFactory = con.buildSessionFactory(serviceRegistry);

            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("There was an issue building the SessionFactory: " + e.getMessage());
            }
        }
        return sessionFactory;
    }
}
