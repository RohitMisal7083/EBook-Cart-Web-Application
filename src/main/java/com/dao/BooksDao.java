package com.dao;

import java.util.List;

import com.entity.Book_Details;

public interface BooksDao {

	public boolean addBooks(Book_Details b);
	
	public List<Book_Details> getAllBooks();
	
	public Book_Details getBookById(int id);
	
	public boolean updateEditBooks(Book_Details b);
	
	public boolean deleteBooks(int id);
	
	public List<Book_Details> getNewBook();
	
	public List<Book_Details> getReceBook_Details();
	
	public List<Book_Details> getOldBook_Details();
	
	public List<Book_Details> getAllRecentBooks();
	
	public List<Book_Details> getAllNewBooks();
	
	public List<Book_Details> getAllOldBooks();
	
	public List<Book_Details> getBookByOld(String email,String cate);
	
	public boolean oldBookDelete(String email,String cat, int id);
	
	public List<Book_Details> getBookBySearch(String ch);
 	
	
}
