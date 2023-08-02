package Pack.Service;

import java.util.List;

import Pack.Dto.VideoLikedInfo;

public interface StatsService {
	
	List<VideoLikedInfo> findVideoLikedInfo();
}
