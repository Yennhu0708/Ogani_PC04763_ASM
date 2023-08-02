package Pack.Controller.Admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import Pack.Dto.VideoLikedInfo;
import Pack.Entity.User;
import Pack.Entity.Video;
import Pack.Service.StatsService;
import Pack.Service.VideoService;
import Pack.Service.Implement.StatsServiceImpl;
import Pack.Service.Implement.VideoServiceImpl;

/**
 * Servlet implementation class AdminVideoController
 */
@WebServlet({ "/VideoEdition", "/VideoNew"})
public class AdminVideoController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	private VideoService videoService = new VideoServiceImpl();
	private StatsService statsService = new StatsServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = request.getServletPath();
		
		switch (path) {
		case "/VideoEdition":
			doGetVideoEdition(request, response);
			break;
			
		case "/VideoNew":
			doGetVideoNew(request, response);
			break;
			
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();

		switch (path) {
		case "/VideoEdition":
			doPostVideoEdition(request, response);
			break;
			
		case "/VideoNew":
			doPostVideoNew(request, response);
			break;
			
		}
	}
	
	protected void doGetVideoEdition(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String videoIdParam = request.getParameter("id");
		
//		List<VideoLikedInfo> videolike = statsService.findVideoLikedInfo();
//		request.setAttribute("videos", videolike);
		
	    if (videoIdParam != null && !videoIdParam.isEmpty()) {
	        try {
	            int videoId = Integer.parseInt(videoIdParam);
	            Video video = videoService.findById(videoId);          

	            if (video != null) {
	                request.setAttribute("video", video);
	                System.out.println(video.getDescription());
	                request.getRequestDispatcher("/view/admin/videoEdition.jsp").forward(request, response);
	            } else {
	                System.out.println("Not Exist!");
		        	request.getRequestDispatcher("/view/admin/videoEdition.jsp").forward(request, response);
	            }
	        } catch (NumberFormatException e) {
	        	System.out.println("Invalid!");
	        	request.getRequestDispatcher("/view/admin/videoEdition.jsp").forward(request, response);
	        }
	    } else {
	    	System.out.println("Not found ID!");
	        request.getRequestDispatcher("/view/admin/videoEdition.jsp").forward(request, response);
	    }

	}
	
	
	protected void doPostVideoEdition(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Integer chkId = Integer.parseInt(request.getParameter("id"));
		String newTitle = request.getParameter("title");
		String newHref = request.getParameter("href");		
		String newMota = request.getParameter("description");
		String newPoster = request.getParameter("poster");
		
		String getStatus = request.getParameter("status");
		
	    boolean newStatus = Boolean.parseBoolean(getStatus);
	    
	    System.out.println(chkId+" "+newTitle+" "+newHref+" "+newMota+" "+newPoster+" "+newStatus);
	    	    

		if (newTitle != null && newHref != null && newMota != null && newPoster != null) {
			Video videoEdit = videoService.updateVideoEdition(chkId, newTitle, newHref, newMota, newPoster, newStatus);
			if (videoEdit != null) {
				response.sendRedirect("VideoList");
			}else {
				request.getRequestDispatcher("VideoEdition");
			}
		}
		
	}
	
	protected void doGetVideoNew(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	        request.getRequestDispatcher("/view/admin/videoCreate.jsp").forward(request, response);
	 
	}
	
	protected void doPostVideoNew(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String addTitle = request.getParameter("title");
		String addHref = request.getParameter("href");		
		String addMota = request.getParameter("description");
		String addPoster = request.getParameter("poster");
		
		String getStatus = request.getParameter("status");
		
	    boolean addStatus = Boolean.parseBoolean(getStatus);
	    
	    System.out.println(addTitle+" "+addHref+" "+addMota+" "+addPoster+" "+addStatus);
	    

		if (addTitle != null && addHref != null && addMota != null && addPoster != null && getStatus != null ) {
			
			Video videosHref = videoService.findByHref(addHref);

			if (videosHref == null) {
				Video videosCreate = videoService.createNewVideo(addTitle, addHref, addMota, addPoster, addStatus);
				if (videosCreate != null) {
					response.sendRedirect("VideoList");
					
				}
			} else {
				response.sendRedirect("VideoEdition");				
			}
		}
		
	}
	
}
