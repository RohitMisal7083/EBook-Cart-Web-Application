package com.user.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.BooksDaoImp;
import com.dao.CartDaoImp;
import com.entity.Book_Details;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());
			Book_Details b = dao.getBookById(bid);

			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookname());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));

			CartDaoImp dao2 = new CartDaoImp(DBConnect.getConn());
			boolean f = dao2.addCart(c);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("addCart", "Added to Cart");
				resp.sendRedirect("all_new_book.jsp");

			} else {

				session.setAttribute("failed", "Something Wrong on Server..!");
				resp.sendRedirect("all_new_book.jsp");			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
