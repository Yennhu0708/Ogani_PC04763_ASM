package Pack.Service;

import java.util.List;

import Pack.Entity.Favourite;
import Pack.Entity.User;
import Pack.Entity.Video;

public interface FavouriteService {

	List<Favourite> findByUser(String username);
	
	List<Favourite> findByUserAndIsLiked(String username);
	
	Favourite findByUserIdAndVideoId(Integer userId, Integer videoId);
	
	Favourite create (User user, Video video);
	
	boolean updateLikeOrUnlike(User user, String videoHref);

	Favourite delete(User user, Video video);
	
//	Favourite findUserIdAndVideoId(Integer userId, Integer videoId);
	
}

// /video?action=like%href