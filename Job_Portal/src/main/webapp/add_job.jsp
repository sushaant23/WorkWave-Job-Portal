<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Jobs</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<c:if test="${usesrobj.role ne 'admin' }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fa fa-user-friend fa-3x"></i>

						<c:if test="${not empty succMsg}">
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>

						<h5>Add Jobs</h5>
						<form action="add_job" method="post">
							<div class="form-group">
								<label>Enter Title</label><input type="text" name="title"
									required class="form-control" />
							</div>
							<div class="form-row">
								<div class="form-group col-md-4">
									<label>Location</label> <select name="Location"
										class="custom-select" id="inlineFormCustomSelectPref">
										<option selected>Choose</option>
										<option value="Maharashtra">Maharashtra</option>
										<option value="Delhi">Delhi</option>
										<option value="Chennai">Chennai</option>
										<option value="Karnataka">Karnataka</option>
										<option value="Hydrabad">Hydrabad</option>
										<option value="Gujurat">Gujurat</option>
										<option value="Gurgaon">Gurgaon</option>
										<option value="Mumbai">Mumbai</option>
									</select>
								</div>
								<div class="form-group col-md-4">
									<label>Category</label> <select class="custom-select"
										id="inlineFormCustomSelectPref" name="category">
										<option selected="Choose">Choose</option>
										<option value="Cloud Engineer">Cloud Engineer</option>
										<option value="Data Analyst">Data Analyst</option>
										<option value="Intern">Intern</option>
										<option value="Software Enginner">Software Enginner</option>
										<option value="DevOps">DevOps</option>
									</select>
								</div>
								<div class="form-group col-md-4">
									<label>Status</label> <select class="form-control"
										name="status">
										<option class="Active" value="Active">Active</option>
										<option class="Inactive" value="Inactive">Inactive</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label>Enter Description</label>
								<textarea required rows="6" cols="" name="desc"
									class="form-control"></textarea>
							</div>
							<button class="bt btn-success badge-pill">Publish Job</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>