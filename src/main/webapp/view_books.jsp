<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BooksDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_Component/allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_Component/Navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());
	Book_Details b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhoto()%>"
					style="height: 150px; width: 120px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Categories: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname()%></h2>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>

				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getUserEmail()%></h5>


				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill fa-2x"></i>
						<p>Cash On Delivary</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Delivery</p>
					</div>


				</div>

				<%
				if ("Old".equals(b.getBookCategory())) {
				%>

				<div class="text-center p-3">
					<a href="index.jsp" class=" btn btn-success"><i
						class="fa-solid fa-cart-shopping"></i> Continue Shopping</a> <a
						class=" btn btn-primary"><%=b.getPrice()%> <i
						class="fa-solid fa-indian-rupee-sign"></i></a>
				</div>

				<%
				} else {
				%>

				<div class="text-center p-3">
					<a href="" class=" btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a
						class=" btn btn-primary"><%=b.getPrice()%> <i
						class="fa-solid fa-indian-rupee-sign"></i></a>
				</div>

				<%
				}
				%>


			</div>

		</div>
	</div>
</body>
</html>