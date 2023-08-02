package Pack.Service.Implement;

import java.util.List;


import Pack.Dao.VideoDao;
import Pack.Dao.Implement.VideoDaoImpl;
import Pack.Entity.Video;
import Pack.Service.VideoService;

public class VideoServiceImpl implements VideoService {
	
	private VideoDao dao;

	public VideoServiceImpl() {
		dao = new VideoDaoImpl();
	}

	@Override
	public Video findById(Integer id) {
		return dao.findById(id);
	}

	@Override
	public Video findByHref(String href) {
		return dao.findByHref(href);

	}

	@Override
	public List<Video> findAll() {
		return dao.findAll();
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public Video create(Video entity) {
		entity.setIsActive(Boolean.TRUE);
		entity.setView(0);
		entity.setShares(0);
		return dao.create(entity);
	}

	@Override
	public Video update(Video entity) {
		return dao.update(entity);
	}

	@Override
	public Video delete(String href) {
		Video entity = findByHref(href);
		entity.setIsActive(Boolean.FALSE);
		return dao.update(entity);
	}
	
	@Override 
	public Video updateVideoEdition(Integer id, String title, String href, String mota, String poster, boolean status) {
				
		Video chkid = findById(id);

		if (chkid != null) {
			chkid.setTitle(title);
			chkid.setHref(href);
			chkid.setDescription(mota);
			chkid.setPoster(poster);
			chkid.setIsActive(status);
			return dao.update(chkid);
		}
		return null;
	}

	@Override
	public Video createNewVideo(String addTitle, String addHref, String addMota, String addPoster, boolean addStatus) {
		
		Video chkHref = findByHref(addHref);
		if (chkHref == null) {
			chkHref = new Video();
			
			chkHref.setTitle(addTitle);
			chkHref.setHref(addHref);
			chkHref.setDescription(addMota);
			chkHref.setPoster(addPoster);
			chkHref.setIsActive(addStatus);	
			chkHref.setShares(0);
			chkHref.setView(0);
			return dao.create(chkHref);
			
	}
		return chkHref;
	}
}
