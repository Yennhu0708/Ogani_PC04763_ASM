<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/view/same/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hashira | Favourite Movies</title>
<%@ include file="/view/same/head.jsp"%>
</head>


<body>

		<div class="scrollable-div">
            <c:forEach items="${watchedVideos}" var="watchedvideo">                
	                <a class="video-title2" href="">${watchedvideo.title}</a>
	              <div class="video-container mb-3 mt-3">
	                <!-- Video 1 -->
	                <iframe src="https://www.youtube.com/embed/${watchedvideo.href}" title="INSIDIOUS: THE RED DOOR – Official Trailer (HD)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>                
	              </div>            
	              <!-- Thêm video khác nếu cần -->
	        </c:forEach>
            </div>
	
</body>
</html>