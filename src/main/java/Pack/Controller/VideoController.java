package Pack.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Pack.Contanst.SessionAttr;
import Pack.Entity.Favourite;
import Pack.Entity.User;
import Pack.Entity.Video;
import Pack.Service.FavouriteService;
import Pack.Service.VideoService;
import Pack.Service.Implement.FavouriteServiceImpl;
import Pack.Service.Implement.VideoServiceImpl;

/**
 * Servlet implementation class VideoController
 */
@WebServlet("/video")
public class VideoController extends HttpServlet {

	private static final long serialVersionUID = 1517115637537021552L;

	private VideoService videoService = new VideoServiceImpl();
	private FavouriteService favouriteService = new FavouriteServiceImpl();
	
	// private VideoService videoService = new VideoServiceImpl();
	public VideoController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String actionParam = request.getParameter("action");
		String href = request.getParameter("id");
		HttpSession session = request.getSession();

		switch (actionParam) {
		case "watch":
			doGetWatch(session, href, request, response);
			break;
		case "like":
			doGetLike(session, href, request, response);
			break;	
		case "remove":
			doGetRemove(session, href, request, response);
			break;
			
		}

	}

	protected void doGetWatch(HttpSession session, String href, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Video video = videoService.findByHref(href);
		request.setAttribute("video", video);
		
		User currentUser = (User) session.getAttribute(SessionAttr.Current_user);
		
		if(currentUser != null) {
			Favourite favourite = favouriteService.create(currentUser, video);
			request.setAttribute("likeTag", favourite.getIsLiked());
		}
		
		List<Video> watchedVideos = null;
	    if (currentUser != null) {
	        watchedVideos = new ArrayList<>();
	        List<Favourite> favourites = favouriteService.findByUser(currentUser.getUsername());
	        for (Favourite fav : favourites) {
	            watchedVideos.add(fav.getVideo());
	        }
	    }
	    request.setAttribute("watchedVideos", watchedVideos);
		
		request.getRequestDispatcher("/view/user/detailvideo.jsp").forward(request, response);	
		
	}
	
	protected void doGetLike(HttpSession session, String href, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionAttr.Current_user);
		
		boolean result = favouriteService.updateLikeOrUnlike(currentUser, href);
		
		if(result == true) {
			response.setStatus(204);
		}else {
			response.setStatus(400); //localhost:8080/Ogani_PC04763_ASM/video?action=like&id={href}
		}	
		
	}

	protected void doGetRemove(HttpSession session, String href, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		
	    User currentUser = (User) session.getAttribute(SessionAttr.Current_user);
	    Video video = videoService.findByHref(href);
		
		if(currentUser != null) {
			Favourite favourite = favouriteService.delete(currentUser, video);
			
		}	    
//		response.sendRedirect("Favourite");
		
		request.getRequestDispatcher("/video?action=watch&id=" + href).forward(request, response);
	}
}
