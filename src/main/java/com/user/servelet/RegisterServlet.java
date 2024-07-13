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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String mobileno=req.getParameter("mobileno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name +" "+email+" "+mobileno+" "+password+" "+check);
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setMobileno(mobileno);
			us.setPassword(password);
			
			//use session for printing and forwording
			HttpSession session=req.getSession();
			
			if(check!=null) {
				
				UserDaoImp dao=new UserDaoImp(DBConnect.getConn());
				boolean f2=dao.checkuser(email);
				
				if(f2) {
					
					boolean f=dao.userRegister(us);
					
					
					
					if(f) {
						//System.out.println("User Inserted Sucssesfully......");
						
						session.setAttribute("succMsg", "Registration Success..");
						resp.sendRedirect("register.jsp");
					}
					else {
						//System.out.println("Something went wrong on server");
						session.setAttribute("failedMsg", "Something wrong on server");
						resp.sendRedirect("register.jsp");
					}
					
				}
				else {
					session.setAttribute("failedMsg", "User Already Exists try another email...!");
					resp.sendRedirect("register.jsp");
					
				}
				
			} else {
				//System.out.println("please Check agree terms and Condition");
				session.setAttribute("failedMsg", "Please Agree Terms & Conditions");
				resp.sendRedirect("register.jsp");
			}
			
			//use jstl code to register
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
	}

	
}
