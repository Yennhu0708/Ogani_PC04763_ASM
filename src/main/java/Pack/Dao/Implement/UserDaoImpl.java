package Pack.Dao.Implement;

import Pack.Dao.UserDao;
import Pack.Entity.User;

import java.util.List;

import Pack.Dao.AbstractDao;

public class UserDaoImpl extends AbstractDao<User> implements UserDao {

	@Override
	public User findById(Integer id) {

		return super.findById(User.class, id);
	}

	@Override
	public User findByEmail(String email) {
		String sql = "SELECT o FROM User o WHERE o.email = ?0";
		return super.findOne(User.class, sql, email);
	}

	@Override
	public User findByUsername(String username) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0";
		return super.findOne(User.class, sql, username);
	}

	@Override
	public User findByUsernameandPassword(String username, String password) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0 AND o.password = ?1";
		return super.findOne(User.class, sql, username, password);

	}

	@Override
	public List<User> findAll() {
		return super.findAll(User.class, true);
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		return super.findAll(User.class, true, pageNumber, pageSize);
	}
	
	@Override
	public User findByUsernameandEmail(String username, String email) {
		String sql = "SELECT o FROM User o WHERE o.username = ?0 AND o.email = ?1";
		return super.findOne(User.class, sql, username, email);

	}
	
	@Override
	public List<User> findAllReal() {
		return super.findAllReal(User.class);
	}
}
