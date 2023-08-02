package Pack.Service;

import java.util.List;

import Pack.Entity.User;

public interface UserService {

	User findById(Integer id);
	
	User findByEmail(String email);
	
	User findByUsername(String username);
	
	User login(String username, String password);
	
	User resetPassword(String email);
	
	List<User> findAll();
	
	List<User> findAll(int pageNumber, int pageSize);
	
	User create (String username, String password, String fullname, String email);
	
	User update (User entity);
	
	User delete (String username);
	
	User findByUsernameandEmail(String username, String email);

	User updatePassword(User user, String newPassword);

	User editProfile(String username, String email, String fullname);
	
	List<User> findAllReal();

	User updateUserAdmin(String chkusername, String newfullname, boolean newRole, boolean newStatus);
}
