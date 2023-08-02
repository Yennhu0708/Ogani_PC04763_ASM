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
import Pack.Entity.User;

import Pack.Service.UserService;
import Pack.Service.VideoService;
import Pack.Service.Implement.UserServiceImpl;
import Pack.Service.Implement.VideoServiceImpl;
/**
 * Servlet implementation class AdminUserController
 */
@WebServlet({ "/UserList","/UserEdition" })
public class AdminUserController extends HttpServlet {

	private static final long serialVersionUID = 1517115637537021552L;
	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();

		switch (path) {
		case "/UserList":
			doGetUserList(request, response);
			break;
			
		case "/UserEdition":
			doGetUserEdition(request, response);
			break;
	
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();

		switch (path) {
		case "/UserEdition":
			doPostUserEdition(request, response);
			break;
		}
	}
	
	protected void doGetUserList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<User> countVideo = userService.findAllReal();
		
		List<User> users;
		
		System.out.println(countVideo);
		request.setAttribute("users", countVideo);
		request.getRequestDispatcher("/view/admin/userList.jsp").forward(request, response);	

	}
	
	protected void doGetUserEdition(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userIdParam = request.getParameter("id");

	    if (userIdParam != null && !userIdParam.isEmpty()) {
	        try {
	            int userId = Integer.parseInt(userIdParam);
	            User user = userService.findById(userId);

	            if (user != null) {
	                request.setAttribute("user", user);
	                request.getRequestDispatcher("/view/admin/userEdition.jsp").forward(request, response);
	            } else {
	                // Xử lý trường hợp không tìm thấy người dùng với định danh được cung cấp
	                response.getWriter().write("Not Exist!");
	            }
	        } catch (NumberFormatException e) {
	            // Xử lý trường hợp định danh người dùng không hợp lệ (không phải số)
	            response.getWriter().write("Invalid!");
	        }
	    } else {
	        // Xử lý trường hợp không tìm thấy thông tin định danh người dùng trong request
	        response.getWriter().write("Thiếu định danh người dùng!");
	    }

	}
	
	protected void doPostUserEdition(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String chkusername = request.getParameter("username");
		String newfullname = request.getParameter("fullname");
		
		String getRole = request.getParameter("role");
		
	    boolean newRole = Boolean.parseBoolean(getRole);
		
	    String getStatus = request.getParameter("status");
		
	    boolean newStatus = Boolean.parseBoolean(getStatus); 
		
		User user = userService.updateUserAdmin(chkusername, newfullname, newRole, newStatus);

		if (user != null) {
			response.sendRedirect("UserList");
		}
		
	}
}
