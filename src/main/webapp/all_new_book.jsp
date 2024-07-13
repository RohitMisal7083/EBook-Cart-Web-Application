<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Details"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BooksDaoImp"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@include file="all_Component/allcss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #d6d3d2;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>



</head>
<body>

	<c:if test="${not empty addCart }">

		<div id="toast">${ addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

		<c:remove var="addCart" scope="session" />

	</c:if>

	<%@include file="all_Component/Navbar.jsp"%>
	
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container-fluid">
		<div class="row p-3">

			<%
			BooksDaoImp dao = new BooksDaoImp(DBConnect.getConn());
			List<Book_Details> list = dao.getAllNewBooks();

			for (Book_Details b : list) {
			%>
			<!-- col-md-3 is used to get deta in row -->

			<div class="col-md-3 ">
				<div class="card crd-ho p-3">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhoto()%>"
							style="width: 120px; height: 150px;" class="ing-thu mblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row ">

							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add
								Cart</a>


							<%
							} else {
							%>
							<!-- use cartServlet used to store user in database -->
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add Cart</a>


							<%
							}
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>

</body>
</html>