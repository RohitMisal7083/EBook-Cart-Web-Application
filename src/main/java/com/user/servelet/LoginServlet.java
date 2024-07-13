package com.user.servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDaoImp;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			UserDaoImp dao=new UserDaoImp(DBConnect.getConn());
			HttpSession session=req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			//validation for admin
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
				
			} 
			else {
				
				User us=dao.login(email, password);
				if(us!=null) {
					
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
					
				}
				else {
					
					session.setAttribute("faildMsg", "Email & Password Invalid..!");
					resp.sendRedirect("login.jsp");
				}
				
				
				resp.sendRedirect("home.jsp");
			}
			
			//System.out.println(email+" "+password);
		}
		catch (Exception e) {
			
			e.printStackTrace();
		}
		
	}
}
