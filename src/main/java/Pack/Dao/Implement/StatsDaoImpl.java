package Pack.Dao.Implement;

import java.util.ArrayList;
import java.util.List;

import Pack.Dao.AbstractDao;
import Pack.Dao.StatsDao;
import Pack.Dto.VideoLikedInfo;

public class StatsDaoImpl extends AbstractDao<Object[]> implements StatsDao{

	@Override
	public List<VideoLikedInfo> findVideoLikedInfo() {

		String sql = "SELECT v.id,v.title, v.href, v.isActive, SUM(CAST(f.isLiked as INT)) as TotalLike "
				+ "FROM VIDEO v "
				+ "LEFT JOIN FAVOURITE f ON v.id=f.videoId "
				//+ "WHERE v.isActive = 1 "
				+ "GROUP BY v.id,v.title, v.href, v.isActive "
				+ "ORDER BY SUM(CAST(f.isLiked as INT)) DESC";
		List<Object[]> objects = super.findManyByNativeQuery(sql);
		List<VideoLikedInfo> result = new ArrayList<>();
		objects.forEach(object -> {
			VideoLikedInfo videoLikeInfo = setDataVideoLikedInfo(object);
			
			result.add(videoLikeInfo);
		});
		return result;
	}
	
	private VideoLikedInfo setDataVideoLikedInfo(Object[] object) {
		VideoLikedInfo videoLikedInfo = new VideoLikedInfo();
		videoLikedInfo.setVideoId((Integer)object[0]);
		videoLikedInfo.setTitle((String)object[1]);
		videoLikedInfo.setHref((String)object[2]);
		videoLikedInfo.setTotalLike(object[4] == null ? 0 :(Integer) object[4]);
		videoLikedInfo.setIsActive((Boolean)object[3]);
		return videoLikedInfo;
		
	}
}
