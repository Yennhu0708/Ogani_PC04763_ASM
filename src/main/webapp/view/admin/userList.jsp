<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hashira | User List</title>

<!-- Head -->
<%@ include file="/view/admin/same/head.jsp"%>

</head>

<body>

	<!-- Up Header -->
    <%@ include file="/view/admin/same/upheader.jsp"%>
    
    <div class="container-fluid page-body-wrapper">
     
    <!-- Header -->
    <%@ include file="/view/admin/same/header.jsp"%>
    
    <!-- Video Edition -->  
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">

            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">USER LIST</h4>
                  <p class="card-description">
                  </p>
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Username</th>
                          <th>Password</th>
                          <th>Fullname</th>
                          <th>Email</th>
                          <th>Role</th>
                          <th>Status</th>
                          <th class="text-center">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${users}" var="item" >
                        <tr>
                          <td>${item.id}</td>
                          <td>${item.username}</td>
                          <td>**************</td>
                          <td>${item.fullname}</td>
                          <td>${item.email}</td>
                          <td>
                          	<c:choose>
									<c:when test="${item.isAdmin}">Admin</c:when>
									<c:otherwise>User</c:otherwise>
							</c:choose>
						  </td>
						  <td>
                          	<c:choose>
									<c:when test="${item.isActive}">Active</c:when>
									<c:otherwise>In-Active</c:otherwise>
							</c:choose>
						  </td>
                          <td class="text-center">
                            <a href="UserEdition?id=${item.id}" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">Edit</a>
                          </td>
                        </tr>
                        </c:forEach>
                      </tbody>
                      <tfoot>
                        <tr>
                            <td colspan="8" style="text-align: center;">
                              <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">F</a>
                              <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">P</a>
                              <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">N</a>
                              <a type="" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">L</a>
                            </td>
                      </tfoot>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          
          </div>
        </div>
      </div>      
      <!-- main-panel ends -->
    </div>   
  
  <!-- Footer -->
  <%@ include file="/view/admin/same/footer.jsp"%>

</body>

</html>