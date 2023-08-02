package Pack.Dao;

import java.util.List;

import Pack.Dto.VideoLikedInfo;

public interface StatsDao {
	
	List<VideoLikedInfo> findVideoLikedInfo();
}
