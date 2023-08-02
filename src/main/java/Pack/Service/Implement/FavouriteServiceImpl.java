package Pack.Service.Implement;

import java.sql.Timestamp;
import java.util.List;

import Pack.Dao.FavouriteDao;
import Pack.Dao.Implement.FavouriteDaoImpl;
import Pack.Entity.Favourite;
import Pack.Entity.User;
import Pack.Entity.Video;
import Pack.Service.FavouriteService;
import Pack.Service.VideoService;

public class FavouriteServiceImpl implements FavouriteService {

	private FavouriteDao dao;
	private VideoService videoService = new VideoServiceImpl();

	public FavouriteServiceImpl() {
		dao = new FavouriteDaoImpl();
	}

	@Override
	public List<Favourite> findByUser(String username) {
		return dao.findByUser(username);
	}

	@Override
	public List<Favourite> findByUserAndIsLiked(String username) {
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public Favourite findByUserIdAndVideoId(Integer userId, Integer videoId) {
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public Favourite create(User user, Video video) {
		Favourite chkExist = findByUserIdAndVideoId(user.getId(), video.getId());
		if (chkExist == null) {
			chkExist = new Favourite();
			chkExist.setUser(user);
			chkExist.setVideo(video);
			chkExist.setIsLiked(Boolean.FALSE);
			chkExist.setViewedDate(new Timestamp(System.currentTimeMillis()));
			return dao.create(chkExist);
		}

		return chkExist;
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoHref) {
		Video video = videoService.findByHref(videoHref);
		Favourite chkLike = findByUserIdAndVideoId(user.getId(), video.getId());

		if (chkLike.getIsLiked() == Boolean.FALSE) {
			chkLike.setIsLiked(Boolean.TRUE);
			chkLike.setLikedDate(new Timestamp(System.currentTimeMillis()));
		} else {
			chkLike.setIsLiked(Boolean.FALSE);
			chkLike.setLikedDate(null);
		}

		Favourite updateLike = dao.update(chkLike);
		return updateLike != null ? true : false;
	}

	//@Override
//	public Favourite findUserIdAndVideoId(Integer userId, Integer videoId) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	public Favourite delete(User user, Video video) {
		Favourite chkExist = findByUserIdAndVideoId(user.getId(), video.getId());
		if (chkExist != null) {
			
			return dao.delete(chkExist);
		}

		return chkExist;
	}

}
