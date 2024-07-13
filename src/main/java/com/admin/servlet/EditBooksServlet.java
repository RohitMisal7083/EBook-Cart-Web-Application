package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.BooksDaoImp;
import com.entity.Book_Details;

@WebServlet("/edit_books")
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName=req.getParameter("book_name");
			String author=req.getParameter("author_name");
			String price=req.getParameter("price");
			String status=req.getParameter("status");

			Book_Details b=new Book_Details();
			b.setBookId(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BooksDaoImp dao=new BooksDaoImp(DBConnect.getConn());
			
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();

			
			if(f) {
				
				session.setAttribute("succMsg", "Book Updated Successfully..!");
				resp.sendRedirect("admin/all_books.jsp");
			}
			else {
				
				session.setAttribute("failedMsg", "Something Wrong on Server..!");
				resp.sendRedirect("admin/all_books.jsp");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
