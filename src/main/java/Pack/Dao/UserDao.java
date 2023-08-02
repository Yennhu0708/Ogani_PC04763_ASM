package Pack.Dao;

import java.util.List;

import Pack.Entity.User;

public interface UserDao {

	User findById(Integer id);
	
	User findByEmail(String email);
	
	User findByUsername(String username);
	
	User findByUsernameandPassword(String username, String password);
	
	List<User> findAll();
	
	List<User> findAll(int pageNumber, int pageSize);
	
	User create (User entity);
	
	User update (User entity);
	
	User delete (User entity);
	
	User findByUsernameandEmail(String username, String email);

	User updatePassword(User user, String newPassword);
	
	List<User> findAllReal();
	
}
