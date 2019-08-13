package cn.zhou.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import cn.zhou.dao.PhotoDao;
import cn.zhou.dao.UserDao;
import cn.zhou.entity.Album;
import cn.zhou.entity.Comment;
import cn.zhou.entity.Photo;
import cn.zhou.entity.User;

import cn.zhou.entity.Praise;
import cn.zhou.entity.Trample;

@Transactional
public class PhotoService {

	//private UserDao userDao;
	
	private PhotoDao photoDao;
	public void setPhotoDao(PhotoDao photoDao) {
		this.photoDao = photoDao;
	}
	public void addPhoto(Photo photo) {
	
		photoDao.addPhoto(photo);
	}
	//通过aid查找全部相片
	public List<Photo> findPhotoAll(int aid) {
		// TODO Auto-generated method stub
		return photoDao.findPhotoAll(aid);
	}
	
	//通过id查找相片
		public Photo findPhotoById(Photo p) {
			List<Photo> photpList = photoDao.findPhotoById(p.getPid());
			return photpList.get(0);
		}
	
	//上一张
	public Photo beforePhoto(Photo p,int aid) {
		
		Photo photo = null;
		
		int pid = p.getPid();
		List<Photo> listPhotoAll = photoDao.findPhotoAll(aid);
		//获取第一张照片的id
		int lastPid = listPhotoAll.get(0).getPid();
		
		
		while(photo == null)
		{
			if(pid==lastPid)
			{
				photo=listPhotoAll.get(listPhotoAll.size()-1);
			}
			else{
				List<Photo> list=photoDao.findPhotoByIdAndAid(--pid,aid);
					if(list.size() !=0)
						photo=list.get(0);
			
			}
		}
		return photo;
	}
	
	//下一张
	public Photo nextPhoto(Photo p,int aid) {
		
		Photo photo = null;
		int pid = p.getPid();
		List<Photo> listPhotoAll = photoDao.findPhotoAll(aid);
		//获取最后一张照片的id
		int lastPid = listPhotoAll.get(listPhotoAll.size()-1).getPid();
		
		
		while(photo == null)
		{
			if(pid==lastPid)
			{
				photo=listPhotoAll.get(0);
			}
			else{
				List<Photo> list=photoDao.findPhotoByIdAndAid(++pid,aid);;
					if(list.size() !=0)
						photo=list.get(0);
			}
		}
		return photo;
		
	}
	
	//删除相片
	public int deletePhoto(int pid,int aid) {
		photoDao.deletePhoto(pid);
		List<Photo> list = photoDao.findPhotoAll(aid);
		int i = list.size();
		return i;
	}
	public List<Photo> selectPhoto(String uame) {
		List<Photo> list =  photoDao.selectPhoto(uame);
		return list;
	}
	public Photo removePhoto(String pid, String aid) {
		Photo photo = photoDao.removePhoto(pid,aid);
		return photo;
	}
/*	
	public List<Album> findAllAlbum(String clzz, String school) {
		System.out.println(userDao);
		List<Album> list = userDao.findAllAlbum(clzz,school);
		
	return list;
}*/
	public Photo givePraise(String uid, String pid) {
		Praise p = photoDao.selectPraise(uid,pid);
		Trample trample = photoDao.selectTrample(Integer.parseInt(uid),Integer.parseInt(pid));
		if(trample != null)
		{
			photoDao.deleteTrample(Integer.parseInt(uid),Integer.parseInt(pid));
			Photo photo = photoDao.selectPhoto(Integer.parseInt(pid));
			int t = photo.getTrample();
			 t = t-1;
			photo.setTrample(t);
			photoDao.updatePhoto(photo);
		}
		if(p==null)
		{
			photoDao.givePraise(uid,pid);
			Photo photo = photoDao.selectPhoto(Integer.parseInt(pid));
			Integer praise = photo.getPraise();
			praise = praise+1;
			photo.setPraise(praise);
			photoDao.updatePhoto(photo);
			return photo;
			
		}else
		{
			photoDao.deletePraise(uid,pid);
			Photo photo = photoDao.selectPhoto(Integer.parseInt(pid));
			int praise = photo.getPraise()-1;
			photo.setPraise(praise);
			photoDao.updatePhoto(photo);
			return photo;
		}
		
	}
	public Photo trample(int uid, int parseInt) {
		Trample trample = photoDao.selectTrample(uid,parseInt);
		Praise p = photoDao.selectPraise(String.valueOf(uid),String.valueOf(parseInt));
		
		if(p!=null)
		{
			photoDao.deletePraise(String.valueOf(uid),String.valueOf(parseInt));
			Photo photo = photoDao.selectPhoto(parseInt);
			int praise = photo.getPraise()-1;
			photo.setPraise(praise);
			photoDao.updatePhoto(photo);
			
		}
		
		if(trample==null)
		{
		
		
			photoDao.saveTraample(uid,parseInt);
			Photo photo = photoDao.selectPhoto(parseInt);
			
			Integer t = photo.getTrample();
			if(t==null)
				t=0;
			
			 t = t+1;
			photo.setTrample(t);
			photoDao.updatePhoto(photo);
			return photo;
			
		}else
		{
			photoDao.deleteTrample(uid,parseInt);
			Photo photo = photoDao.selectPhoto(parseInt);
			int t = photo.getTrample();
			 t = t-1;
			photo.setTrample(t);
			photoDao.updatePhoto(photo);
			return photo;
		}
	}
	public Photo selectPhoto(int parseInt) {
		// TODO Auto-generated method stub
		return photoDao.selectPhoto(parseInt);
	}
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		photoDao.addComment(comment);
		
	}
	public void deleteComment(int cid) {
		// TODO Auto-generated method stub
		photoDao.deleteComment(cid);
	}
	public List<Photo> getPhoto_Mask(String school, String clzz) {
		List<Album> album = photoDao.showAlbum(school,clzz);
		List<Photo> plist = new LinkedList<Photo>();
		for(Album al:album){
			
			Set<Photo> ph = al.getPhoto();
			for(Photo photo:ph){
				Set<Comment> c = photo.getComment();
				
				int mask = photo.getTrample()*4+photo.getPraise()*6+c.size()*5;
				photo.setMask(mask);
				plist.add(photo);
			}
			
		}
	
		
		
		Collections.sort(plist, new Comparator<Photo>(){
            /*
             * int compare(Person p1, Person p2) 返回一个基本类型的整型，
             * 返回负数表示：p1 小于p2，
             * 返回0 表示：p1和p2相等，
             * 返回正数表示：p1大于p2
             */
      
			@Override
			public int compare(Photo o1, Photo o2) {
				if(o1.getMask()<o2.getMask())
				{
					return 1;
				}
				if(o1.getMask()==o2.getMask())
				{
					return 0;
				}
				
					return -1;
				
			}
        });
		if(plist.size()>=10)
		{
			return plist.subList(0, 10);
		}else{
			return plist.subList(0, plist.size());
		}
	
		
		
	}
	public List<Photo> zhRankInPhoto(String school, String clzz) {
		List<Album> album = photoDao.showAlbum(school,clzz);
		List<Photo> plist = new LinkedList<Photo>();
		for(Album al:album){
			
			Set<Photo> ph = al.getPhoto();
			for(Photo photo:ph){
				Set<Comment> c = photo.getComment();
				
				int mask = photo.getPraise()*6+c.size()*4;
				photo.setMask(mask);
				plist.add(photo);
			}
			
		}
	
		
		
		Collections.sort(plist, new Comparator<Photo>(){
            /*
             * int compare(Person p1, Person p2) 返回一个基本类型的整型，
             * 返回负数表示：p1 小于p2，
             * 返回0 表示：p1和p2相等，
             * 返回正数表示：p1大于p2
             */
      
			@Override
			public int compare(Photo o1, Photo o2) {
				if(o1.getMask()<o2.getMask())
				{
					return 1;
				}
				if(o1.getMask()==o2.getMask())
				{
					return 0;
				}
				
					return -1;
				
			}
        });
		
	
		
		if(plist.size()>=10)
		{
			return plist.subList(0, 10);
		}else{
			return plist.subList(0, plist.size());
		}
	
	}
	
	public List<Photo> praisePhoto(String school, String clzz) {
		List<Album> album = photoDao.showAlbum(school,clzz);
		List<Photo> plist = new LinkedList<Photo>();
		for(Album al:album){
			
			Set<Photo> ph = al.getPhoto();
			for(Photo photo:ph){
				
				plist.add(photo);
			}
			
		}
	
		
		
		Collections.sort(plist, new Comparator<Photo>(){
            /*
             * int compare(Person p1, Person p2) 返回一个基本类型的整型，
             * 返回负数表示：p1 小于p2，
             * 返回0 表示：p1和p2相等，
             * 返回正数表示：p1大于p2
             */
      
			@Override
			public int compare(Photo o1, Photo o2) {
				if(o1.getPraise()<o2.getPraise())
				{
					return 1;
				}
				if(o1.getMask()==o2.getMask())
				{
					return 0;
				}
				
					return -1;
				
			}
        });
		
		if(plist.size()==0)
		{
			return null;
		}
	
		if(plist.size()>=10)
		{
			return plist.subList(0, 10);
		}else{
			return plist.subList(0, plist.size());
		}
	
	}
	

}
