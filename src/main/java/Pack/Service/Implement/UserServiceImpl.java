package Pack.Service.Implement;

import java.util.List;

import Pack.Dao.UserDao;
import Pack.Dao.Implement.UserDaoImpl;
import Pack.Entity.User;
import Pack.Service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao dao;

	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}

	@Override
	public User findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public User findByEmail(String email) {
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	@Override
	public User login(String username, String password) {
		return dao.findByUsernameandPassword(username, password);
	}

	@Override
	public User resetPassword(String email) {
		return null;
	}

	@Override
	public List<User> findAll() {
		return dao.findAll();
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public User create(String username, String password, String fullname, String email) {
		User newUser = new User();
		newUser.setUsername(username);
		newUser.setPassword(password); 
		newUser.setFullname(fullname);
		newUser.setEmail(email);
		newUser.setIsAdmin(Boolean.FALSE);
		newUser.setIsActive(Boolean.TRUE);
		return dao.create(newUser);
	}

	@Override
	public User update(User entity) {
		return update(entity);
	}

	@Override
	public User delete(String username) {
		User user = dao.findByUsername(username);
		user.setIsActive(Boolean.FALSE);
		return dao.update(user);
	}
	
	@Override
	public User findByUsernameandEmail(String username, String email) {
		return dao.findByUsernameandEmail(username,email);
	}
	
	@Override
    public User updatePassword(User user, String newPassword) {
       return dao.updatePassword(user,newPassword);
    }
	
	@Override
	public User editProfile(String username, String email, String fullname) {
		User chkExist = findByUsername(username);
		if (chkExist != null) {
			chkExist.setEmail(email);
			chkExist.setFullname(fullname);
			return dao.update(chkExist);
		}
		return null;
	}
	
	@Override
	public List<User> findAllReal() {
		return dao.findAllReal();
	}
	
	@Override
	public User updateUserAdmin(String chkusername, String newfullname, boolean newRole, boolean newStatus) {
		User user = findByUsername(chkusername);
		user.setFullname(newfullname);
		user.setIsAdmin(newRole);
		user.setIsActive(newStatus);
		return dao.update(user);
	}
}
