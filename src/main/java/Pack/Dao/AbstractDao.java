package Pack.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import Pack.Entity.User;
import Pack.Utils.JpaUtils;

public class AbstractDao <T> {
	
	public static final EntityManager emg = JpaUtils.getEntityManager();


	public T findById(Class<T> clazz, Integer id) {
		return emg.find(clazz, id);
	}

	public List<T> findAll(Class<T> clazz, boolean existIsActive) {

		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		// SELECT * FROM User WHERE isActive = 1;
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = emg.createQuery(sql.toString(), clazz);
		return query.getResultList();
	}

	public List<T> findAll(Class<T> clazz, boolean existIsActive, int pageNumber, int pageSize) {

		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		// SELECT * FROM User WHERE isActive = 1;
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = emg.createQuery(sql.toString(), clazz);
		query.setFirstResult((pageNumber - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	// SELECT * FROM User o WHERE o.username = ? and o.password = ?1;
	// Object... params có độ dài biến đổi bao nhiêu cũng được
	public T findOne(Class<T> clazz, String sql, Object... params) {
		TypedQuery<T> query = emg.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<T> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}
	
	public List<T> findAllReal(Class<T> clazz) {
	    String entityName = clazz.getSimpleName();
	    String sql = "SELECT o FROM " + entityName + " o";
	    TypedQuery<T> query = emg.createQuery(sql, clazz);
	    return query.getResultList();
	}
	
	public List<T> findMany(Class<T> clazz, String sql, Object... params) {
		TypedQuery<T> query = emg.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Object[]> findManyByNativeQuery(String sql, Object... params) {
		Query query = emg.createNativeQuery(sql);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}

	public T create(T entity) {
		try {
			emg.getTransaction().begin();
			emg.persist(entity);
			emg.getTransaction().commit();
			System.out.println("Tạo mới " + entity.getClass().getSimpleName() + " thành công");
			return entity;
		} catch (Exception e) {
			emg.getTransaction().rollback();
			System.out.println("Tạo mới " + entity.getClass().getSimpleName() + " thất bại đến SQL");
			throw new RuntimeException(e);
		}
	}

	public T update(T entity) {
		try {
			emg.getTransaction().begin();
			emg.merge(entity);
			emg.getTransaction().commit();
			System.out.println("Cập nhật " + entity.getClass().getSimpleName() + "thành công");
			return entity;
		} catch (Exception e) {
			emg.getTransaction().rollback();
			System.out.println("Không thể cập nhật " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}

	public T delete(T entity) {
		try {
			emg.getTransaction().begin();
			emg.remove(entity);
			emg.getTransaction().commit();
			System.out.println("Xóa thành công");
			return entity;
		} catch (Exception e) {
			emg.getTransaction().rollback();
			System.out.println("Không thể xóa " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
	
	public User updatePassword(User user, String newPassword) {
        try {
            emg.getTransaction().begin();

            // Cập nhật mật khẩu mới vào trường password của đối tượng User
            user.setPassword(newPassword);

            // Gọi merge() để cập nhật thông tin người dùng trong CSDL
            User updatedUser = emg.merge(user);

            emg.getTransaction().commit();
            System.out.println("Cập nhật mật khẩu cho " + user.getUsername() + " thành công");
            return updatedUser;
        } catch (Exception e) {
            emg.getTransaction().rollback();
            System.out.println("Không thể cập nhật mật khẩu cho " + user.getUsername());
            throw new RuntimeException(e);
        }
    }
}
