package Pack.Dao;

import java.util.List;

import Pack.Entity.Favourite;

public interface FavouriteDao {

	List<Favourite> findByUser(String username);
	
	List<Favourite> findByUserAndIsLiked(String username);
	
	Favourite findByUserIdAndVideoId(Integer userId, Integer videoId);
	
	Favourite create (Favourite entity);
	
	Favourite update (Favourite entity);

	Favourite delete(Favourite entity);
	
}
