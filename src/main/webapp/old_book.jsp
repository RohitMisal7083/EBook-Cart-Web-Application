<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.BooksDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Old Book</title>
<%@include file="all_Component/allcss.jsp"%>

</head>
<body>

	<!-- For users old book  sell view cart -->

	<%@include file="all_Component/Navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp " />
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="conntainer p-5">

		<table class="table table-striped">
			<thead class="bg-primary tetx-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();

				BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());
				List<Book_Details> list = dao.getBookByOld(email, "Old");

				for (Book_Details b : list) {
				%>

				<tr>
					<th><%=b.getBookname()%></th>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>

				<%
				}
				%>


			</tbody>
		</table>
	</div>

</body>
</html>