package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DB.DBConnect;
import com.dao.BooksDaoImp;
import com.entity.Book_Details;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String bookName=req.getParameter("book_name");
			String author=req.getParameter("author_name");
			String price=req.getParameter("price");
			String categories=req.getParameter("categories");
			String status=req.getParameter("status");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
	
			Book_Details b=new Book_Details(bookName,author,price,categories,status,fileName,"admin@gmail.com");
			
			BooksDaoImp dao=new  BooksDaoImp(DBConnect.getConn());
			
			
			
			boolean f=dao.addBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				
				//getting path
				String path=getServletContext().getRealPath("")+"book";
				// Path- C:\Users\rohit\Servelet_R\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Ebook-App\book

				//uploat inside file using path
				File file=new File(path);
				
				//in part theres write method file.seprator used as /
				part.write(path+file.separator+fileName);
				
				session.setAttribute("succMsg", "Book Added Successfully...!");
				resp.sendRedirect("admin/add_books.jsp");
			}else {
				
				session.setAttribute("failedMsg", "Something Wrong on Server...!");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
}
