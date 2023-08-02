package Pack.Controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Pack.Contanst.SessionAttr;
import Pack.Dao.UserDao;
import Pack.Dao.Implement.UserDaoImpl;
import Pack.Entity.User;
import Pack.Entity.Video;
import Pack.Service.UserService;
import Pack.Service.VideoService;
import Pack.Service.Implement.UserServiceImpl;
import Pack.Service.Implement.VideoServiceImpl;

@WebServlet({ "/Signin", "/Signup", "/Signout", "/ForgotPassword", "/EditProfile", "/ChangePassword", "/VerifyCode"})
public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1517115637537021552L;

	private UserService userService = new UserServiceImpl();
	private VideoService videoService = new VideoServiceImpl();
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String path = request.getServletPath();// localhost:8080/.../login -> path = login

		switch (path) {
		case "/Signin":
			doGetSignin(request, response);
			break;

		case "/Signup":
			doGetSignup(request, response);
			break;
			
		case "/Signout":
			doGetSignout(session, request, response);
			break;
			
		case "/ForgotPassword":
			doGetForgot(session, request, response);
			break;
			
		case "/VerifyCode":
			doGetVerifyCode(session, request, response);
			break;
		
		case "/ChangePassword":
			doGetChangePassword(session, request, response);
			break;
			
		case "/EditProfile":
			doGetEditProfile(session, request, response);
			break;
			
		}		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String path = request.getServletPath();// localhost:8080/.../login -> path = login

		switch (path) {
		case "/Signin":
			doPostSignin(session, request, response);
			break;

		case "/Signup":
			doPostSignup(session, request, response);
			break;
			
		case "/ForgotPassword":
			doPostForgot(session, request, response);
			break;
			
		case "/VerifyCode":
			doPostVerifyCode(session, request, response);
			break;
			
		case "/ChangePassword":
			doPostChangePassword(session, request, response);
			break;
			
		case "/EditProfile":
			doPostEditProfile(session, request, response);
			break;
			
		}
	}

	// DO-GET CHO ĐĂNG NHẬP
	private void doGetSignin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/view/user/signin.jsp").forward(request, response);

	}

	// DO-POST CHO ĐĂNG NHẬP
	private void doPostSignin(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = userService.login(username, password);

		if (user != null) {
			session.setAttribute(SessionAttr.Current_user, user);
			System.out.println("Chuyển trang ADMIN" + user.getIsAdmin());
			response.sendRedirect("Index");
		} else {
			response.sendRedirect("Signin");
		}
	}

	// DO-GET CHO ĐĂNG KÝ
	private void doGetSignup(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/view/user/signup.jsp").forward(request, response);

	}

	// DO-POST CHO ĐĂNG KÝ
	private void doPostSignup(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		
		

		if (userService.findByUsername(username) != null) {
			// Nếu đã tồn tại, xử lý lỗi hoặc thông báo cho người dùng biết
			response.sendRedirect("Signup?error=UsernameAlreadyExists");
			return;
		}

		if (userService.findByEmail(email) != null) {
			// Nếu đã tồn tại, xử lý lỗi hoặc thông báo cho người dùng biết
			response.sendRedirect("Signup?error=EmailAlreadyExists");
			return;
		}

		User user = userService.create(username, password, fullname, email);

		if (user != null) {
			
			String signupSubject = "Hashira - Online Entertainment: SIGN UP SUCCESSFUL";
			String signupContent = "Chúc mừng " + user.getFullname() + " đã trở thành thành viên mới của Ogani Entertainment!";
			sendNotificationEmail(user.getEmail(), signupSubject, signupContent);
			//sendRegistrationEmail(user.getEmail(), user.getFullname());
			session.setAttribute(SessionAttr.Current_user, user);
			response.sendRedirect("Index");
			
		} else {
			
			response.sendRedirect("Signup");
			
		}
	}

		// DO-GET CHO ĐĂNG XUẤT
	private void doGetSignout(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session.removeAttribute(SessionAttr.Current_user);
		response.sendRedirect("Index");

	}

	// DO-GET CHO QUÊN MẬT KHẨU
	private void doGetForgot(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/view/user/forgotpassword.jsp").forward(request, response);
	}

	// DO-POST CHO QUÊN MẬT KHẨU
	private void doPostForgot(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		
		User user = userService.findByUsernameandEmail(username, email);
		
		if (user != null) {				
			
	        String verificationCode = generateVerificationCode();
	        
	        // Lưu mã xác nhận vào session để sử dụng trong bước xác nhận sau này
	        session.setAttribute("verificationCode", verificationCode);
	        session.setAttribute("username", username);
	        session.setAttribute("email", email);
	        
	        sendVerificationCodeEmail(email, verificationCode);		        
	        
	        // Chuyển hướng người dùng đến trang nhập mã xác nhận để tiếp tục quá trình
	        response.sendRedirect("VerifyCode");
			
		} else {
			response.sendRedirect("ForgotPassword?error=AccountNotExists");
			return;
		}
		
	}
	
	//DO-GET CHO FORM XÁC NHẬN CODE QUÊN MẬT KHẨU
	private void doGetVerifyCode(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/view/user/password/verifycode.jsp").forward(request, response);

	}
	
	// HÀM TẠO MÃ XÁC NHẬN (verification code) ngẫu nhiên gồm 6 chữ số
    private String generateVerificationCode() {
        Random random = new Random();
        int codeInt = 100000 + random.nextInt(900000); // Tạo số ngẫu nhiên trong khoảng từ 100000 đến 999999
        return String.valueOf(codeInt);
    }

    // HÀM GỬI MÃ XÁC NHẬN (verification code) đến email người dùng
    private void sendVerificationCodeEmail(String toEmail, String verificationCode) {
        // Tương tự như hàm gửi email đã thực hiện trong UserServiceImpl
        // Gửi mã xác nhận đến email người dùng ở đây
    	final String email = "thuynhdpc04763@fpt.edu.vn";
		final String password = "eybvvxebzstadvai";

		Properties prop = new Properties();

		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Hashira - Online Entertainment: VERIFICATION CODE");
			message.setText("Code của bạn: " + verificationCode);

			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
    
    //DO-POST CHO FORM XÁC NHẬN CODE QUÊN MẬT KHẨU
    private void doPostVerifyCode(HttpSession session, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        String userVerificationCode = request.getParameter("verifycode");
        String sentVerificationCode = (String) session.getAttribute("verificationCode");
        String newSendPass = generateRandomPass();

        if (userVerificationCode != null && userVerificationCode.equals(sentVerificationCode)) {
           	
        	String email = (String) session.getAttribute("email");
        	String username = (String) session.getAttribute("username");
        	
        	User user = userService.findByUsernameandEmail(username, email);

            if (user != null) {
                // Cập nhật mật khẩu mới cho người dùng
                //user.setPassword(newSendPass);
                
                userService.updatePassword(user, newSendPass);
                
                // Gửi mật khẩu mới đến email người dùng
                sendNewPassEmail(email, newSendPass);

                // Chuyển hướng đến trang chủ hoặc trang xác nhận thành công
                request.setAttribute("mailSentSuccess", true);
                
                request.getRequestDispatcher("/view/user/signin.jsp").forward(request, response);
                
            } else {
            	System.out.println("Người dùng không tồn tại trong CSDL, xử lý lỗi!!");	              
            }       	
        	        	
      
        } else {	        	
            // Mã code nhập vào không đúng, thông báo lỗi và chuyển hướng đến trang nhập lại mã code	        	
            request.setAttribute("errorMessage", "Mã xác nhận sai, mời người dùng nhập lại!");
            request.getRequestDispatcher("/view/user/password/verifycode.jsp").forward(request, response);
        }
    }

    //HÀM TẠO PASS MỚI
    public static String generateRandomPass() {
        Random random = new Random();
        StringBuilder code = new StringBuilder();

        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

        // Thêm các ký tự ngẫu nhiên vào mã
        for (int i = 0; i < 8; i++) {
            code.append(chars.charAt(random.nextInt(chars.length())));
        }

        return code.toString();
    }

    // HÀM GỬI MẬT KHẨU MỚI ĐẾN EMAIL NGƯỜI DÙNG
    private void sendNewPassEmail(String toEmail, String newSendPass) {
        // Tương tự như hàm gửi email đã thực hiện trong UserServiceImpl
        // Gửi mã xác nhận đến email người dùng ở đây
    	final String email = "thuynhdpc04763@fpt.edu.vn";
		final String password = "eybvvxebzstadvai";

		Properties prop = new Properties();

		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Hashira - Online Entertainment: NEW PASSWORD");
			message.setText("Mật khẩu mới của bạn: " + newSendPass);

			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
        
	// DO-GET CHO ĐỔI MẬT KHẨU
	private void doGetChangePassword(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/view/user/changepassword.jsp").forward(request, response);

	}
	
	// DO-POST CHO ĐỔI MẬT KHẨU
	private void doPostChangePassword(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = (User) session.getAttribute(SessionAttr.Current_user);
		
		String sqlPass = user.getPassword();
		String nowPass = request.getParameter("nowPass");
		String newPass = request.getParameter("newPass");
		String confirmPass = request.getParameter("confirmPass");	
		
		if(!sqlPass.equals(nowPass)) {
			response.sendRedirect("ChangePassword?error=NowPassNotCorrect");
			return;
		}
		if(!newPass.equals(confirmPass)) {
			response.sendRedirect("ChangePassword?error=ConfirmFailed");
			return;
		}
		if(sqlPass.equals(nowPass) && newPass.equals(confirmPass)) {
			
			User change = userService.updatePassword(user, newPass);

			if (change != null) {	
				
				session.removeAttribute(SessionAttr.Current_user);
				
				response.sendRedirect("Signin");
			} else {
				response.sendRedirect("ChangePassword");
			}
		} else {
			response.sendRedirect("ChangePassword");
		}

	}

	// DO-GET CHO CHỈNH SỬA THÔNG TIN
	private void doGetEditProfile(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user = (User) session.getAttribute(SessionAttr.Current_user);
		System.out.println(user);
		
		String username = user.getUsername();
		String email = user.getEmail();
		String fullname = user.getFullname();
		
		request.setAttribute("username", username);
		request.setAttribute("email", email);
		request.setAttribute("fullname", fullname);		
		
		request.getRequestDispatcher("/view/user/editprofile.jsp").forward(request, response);

	}

	private void doPostEditProfile(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		
		if (userService.findByEmail(email) != null) {
			// Nếu đã tồn tại, xử lý lỗi hoặc thông báo cho người dùng biết
			response.sendRedirect("EditProfile?error=EmailAlreadyExists");
			return;
		}
		if (email != null && fullname != null) {
			
			User user = userService.editProfile(username, email, fullname);
			
			System.out.println("thành công edit profile");
			if (user != null) {
				session.removeAttribute(SessionAttr.Current_user);
				response.sendRedirect("Signin");
			}
		}
		
	}	
	
	private void sendNotificationEmail(String toEmail, String subject, String content) {
        // Tương tự như hàm gửi email đã thực hiện trong UserServiceImpl
        // Gửi mã xác nhận đến email người dùng ở đây
    	final String email = "thuynhdpc04763@fpt.edu.vn";
		final String password = "eybvvxebzstadvai";

		Properties prop = new Properties();

		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, password);
			}
		});

		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(email));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject(subject);
			message.setText(content);

			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }
    
}
