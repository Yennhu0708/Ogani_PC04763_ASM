package Pack.Dao.Implement;

import java.util.List;

import Pack.Dao.AbstractDao;
import Pack.Dao.FavouriteDao;
import Pack.Entity.Favourite;

public class FavouriteDaoImpl extends AbstractDao<Favourite> implements FavouriteDao {

	@Override
	public List<Favourite> findByUser(String username) {
		String sql = "SELECT o FROM Favourite o WHERE o.user.username = ?0 AND o.video.isActive = 1"
				+ " ORDER BY o.viewedDate DESC";
		return super.findMany(Favourite.class, sql, username);
	}

	@Override
	public List<Favourite> findByUserAndIsLiked(String username) {
		String sql = "SELECT o FROM Favourite o WHERE o.user.username = ?0 AND o.isLiked = 1"
				+ "  AND  o.video.isActive = 1" + " ORDER BY o.viewedDate DESC";
		return super.findMany(Favourite.class, sql, username);
	}

	@Override
	public Favourite findByUserIdAndVideoId(Integer userId, Integer videoId) {
		String sql = "SELECT o FROM Favourite o WHERE o.user.id = ?0 AND o.video.id = ?1"
				+ "  AND o.video.isActive = 1";
		return super.findOne(Favourite.class,sql, userId, videoId);
	}
}
