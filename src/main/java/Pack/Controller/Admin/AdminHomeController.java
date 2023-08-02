package Pack.Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Pack.Contanst.SessionAttr;
import Pack.Dao.StatsDao;
import Pack.Dao.Implement.StatsDaoImpl;
import Pack.Dto.VideoLikedInfo;
import Pack.Entity.User;
import Pack.Service.StatsService;
import Pack.Service.Implement.StatsServiceImpl;
/**
 * Servlet implementation class AdminHomeController
 */
@WebServlet({ "/Admin", "/VideoList"})
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1517115637537021552L;

	private StatsService statsService = new StatsServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();

		switch (path) {
		case "/Admin":
			doGetAdmin(request, response);
			break;
		
		case "/VideoList":
			doGetVideoList(request, response);
			break;
		}
	}
	
	protected void doGetAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		User currentUser = (User) session.getAttribute(SessionAttr.Current_user);
		
		//System.out.println("Chuyển trang ADMIN" + currentUser.getIsAdmin());
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			
			request.getRequestDispatcher("/view/admin/index.jsp").forward(request, response);
		} else {
			response.sendRedirect("Index");
		}

	}
	
	protected void doGetVideoList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<VideoLikedInfo> videos = statsService.findVideoLikedInfo();
		request.setAttribute("videos", videos);
		
		System.out.println("Video List" + videos);
		//request.setAttribute("videolist", videos);
		request.getRequestDispatcher("/view/admin/videoList.jsp").forward(request, response);
	}

}
