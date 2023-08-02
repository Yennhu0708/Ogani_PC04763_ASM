package Pack.Service.Implement;

import java.util.List;

import Pack.Dao.StatsDao;
import Pack.Dao.Implement.StatsDaoImpl;
import Pack.Dto.VideoLikedInfo;
import Pack.Service.StatsService;

public class StatsServiceImpl implements StatsService{
	
	private StatsDao statsDao;
	
	public StatsServiceImpl() {
		statsDao = new StatsDaoImpl();
	}

	@Override
	public List<VideoLikedInfo> findVideoLikedInfo() {
		return statsDao.findVideoLikedInfo();
	}

}
