package internal.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Book {
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int bid;
public Book() {
	super();
	
}
public Book( String title, String author, double price) {
	super();
	
	this.title = title;
	this.author = author;
	this.price = price;
}
@Override
public String toString() {
	return "Book [bid=" + bid + ", title=" + title + ", author=" + author + ", price=" + price + "]";
}
public int getBid() {
	return bid;
}
public void setBid(int bid) {
	this.bid = bid;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
@Column
	private String title;
@Column
	private String author;
@Column
	private double price;
	
	

}

