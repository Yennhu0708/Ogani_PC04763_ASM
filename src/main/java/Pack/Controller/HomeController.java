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

import Pack.Entity.Video;
import Pack.Service.VideoService;
import Pack.Service.Implement.VideoServiceImpl;
import Pack.Contanst.SessionAttr;
import Pack.Entity.Favourite;
import Pack.Entity.User;
import Pack.Service.FavouriteService;
import Pack.Service.Implement.FavouriteServiceImpl;
/**
 * Servlet implementation class HomeController
 */
@WebServlet({"/Index", "/Favourite"})
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1517115637537021552L;
    
	private VideoService videoService = new VideoServiceImpl();
	private FavouriteService favouriteService = new FavouriteServiceImpl();
	private static final int MAX_VIDEO = 9;
	
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String path = request.getServletPath();// localhost:8080/.../login -> path = login

		switch (path) {
		
		case "/Index":
			doGetIndex(request, response);
			break;

		case "/Favourite":
			doGetFavourite(session, request, response);
			break;			

		}
		

	} 

	protected void doGetIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<Video> countVideo = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) MAX_VIDEO);
		request.setAttribute("maxPage", maxPage);

		String pageNumber = request.getParameter("page");

		List<Video> videos;
		if (pageNumber == null || Integer.valueOf(pageNumber) > maxPage) {
			videos = videoService.findAll(1, MAX_VIDEO);
			request.setAttribute("currentPage", 1);
		} else {
			videos = videoService.findAll(Integer.valueOf(pageNumber), MAX_VIDEO);
			request.setAttribute("currentPage", Integer.valueOf(pageNumber));
		}

		request.setAttribute("videos", videos);
		
//		List<Video> videos = videoService.findAll();
//		request.setAttribute("videos", videos);
		
		request.getRequestDispatcher("/view/user/index.jsp").forward(request, response);
	}
	
	protected void doGetFavourite(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    User currentUser = (User) session.getAttribute(SessionAttr.Current_user);

	    // Lấy danh sách các video yêu thích của người dùng hiện tại
	    List<Favourite> favourite = favouriteService.findByUserAndIsLiked(currentUser.getUsername());
    
	    List<Video> favouriteVideos = new ArrayList<>();// Tạo một danh sách mới để lưu trữ các video yêu thích

	    // Duyệt qua danh sách các đối tượng Favourite và lấy ra các Video yêu thích
	    for (Favourite fav : favourite) {
	        favouriteVideos.add(fav.getVideo());
	    }
	    
	    request.setAttribute("videos", favouriteVideos);
	    
	    request.getRequestDispatcher("/view/user/favourite.jsp").forward(request, response);
	}


	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
