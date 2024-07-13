package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Details;

public class BooksDaoImp implements BooksDao {

	Connection conn;

	public BooksDaoImp(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBooks(Book_Details b) {

		boolean f = false;
		try {

			String sql = "insert into book_details(bookname,author,price,bookCategory,status,photo,userEmail) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getUserEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<Book_Details> getAllBooks() {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			String sql = "select * from book_details";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public Book_Details getBookById(int id) {

		Book_Details b = null;

		try {

			String sql = "select * from book_details where bookId=? ";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateEditBooks(Book_Details b) {

		boolean f = false;

		try {

			String sql = "update book_details set bookname=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteBooks(int id) {

		boolean f = false;

		try {

			String sql = "delete from book_details where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<Book_Details> getNewBook() {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			// use order by id desc function to get recent books it select book from
			// downside of database
			String sql = "select * from book_details where bookCategory=?  and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			// write condition to display only 4 books at home page
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			// get this in user index home page

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Details> getReceBook_Details() {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			// use order by id desc function to get recent books it select book from
			// downside of database
			String sql = "select * from book_details where status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			// write condition to display only 4 books at home page
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			// get this in user index home page

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Details> getOldBook_Details() {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			String sql = "select * from book_details where bookCategory=?  and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			// write condition to display only 4 books at home page
			int i = 1;
			while (rs.next() && i <= 4) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			// get this in user index home page

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Details> getAllRecentBooks() {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			// use order by id desc function to get recent books it select book from
			// downside of database
			String sql = "select * from book_details where status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Details> getAllNewBooks() {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			// use order by id desc function to get recent books it select book from
			// downside of database
			String sql = "select * from book_details where bookCategory=?  and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Details> getAllOldBooks() {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			String sql = "select * from book_details where bookCategory=?  and status=? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Book_Details> getBookByOld(String email, String cate) {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			String sql = "select * from book_details where bookCategory=? and userEmail=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat, int id) {

		boolean f = false;

		try {

			String sql = "delete from book_details where bookCategory=? and userEmail=? and bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<Book_Details> getBookBySearch(String ch) {

		List<Book_Details> list = new ArrayList<>();
		Book_Details b = null;

		try {

			String sql = "select * from book_details where bookname like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");


			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				b = new Book_Details();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

}
