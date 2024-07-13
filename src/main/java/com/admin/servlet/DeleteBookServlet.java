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

@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int id = Integer.parseInt(req.getParameter("id"));
			BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());

			boolean f = dao.deleteBooks(id);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("succMsg", "Book Deleted Successfully..!");
				resp.sendRedirect("admin/all_books.jsp");
			} else {

				session.setAttribute("failedMsg", "Something Wrong on Server..!");
				resp.sendRedirect("admin/all_books.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
