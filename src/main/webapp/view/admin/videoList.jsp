<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hashira | Video List</title>

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
                  <h4 class="card-title">VIDEO LIST</h4>
                  <p class="card-description">
                  </p>
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th>Youtube ID</th>
                          <th>Video Title</th>
                          <th>Like Count</th>
                          <th>Status</th>
                          <th class="text-center">Action</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${videos}" var="item" >
                        <tr>
                          	<td><a href = "video?action=watch&id=${item.href}" >${item.href}</a></td>
                    		<td>${item.title}</td>
                    		<td>${item.totalLike}</td>
                    		<td>
                    			<c:choose>
									<c:when test="${item.isActive}">Active</c:when>
									<c:otherwise>Inactive</c:otherwise>
								</c:choose>
                    		</td>
                          <td class="text-center">
                            <a href="VideoEdition?id=${item.videoId}" style="background-color: #4B49AC; color:white" class="btn mr-2 text-right">Edit</a>
                          </td>
                        </tr>
                      </c:forEach>
                      </tbody>
                      <tfoot>
                        <tr>
                            <td colspan="6" style="text-align: center;">
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