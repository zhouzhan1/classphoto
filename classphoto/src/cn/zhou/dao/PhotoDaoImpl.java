package cn.zhou.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.zhou.entity.Album;
import cn.zhou.entity.Comment;
import cn.zhou.entity.Photo;
import cn.zhou.entity.Praise;
import cn.zhou.entity.Trample;

public class PhotoDaoImpl extends HibernateDaoSupport implements PhotoDao {

	//
	@Override
	public void addPhoto(Photo photo) {
		
		this.getHibernateTemplate().save(photo);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deletePhoto(int pid) {
		List<Photo> list=(List<Photo>) this.getHibernateTemplate().find("from Photo where pid =?",pid);
		 this.getHibernateTemplate().delete(list.get(0));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Photo> findPhotoById(int pid) {
		
		List<Photo> list=(List<Photo>) this.getHibernateTemplate().find("from Photo where id =?",pid);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Photo> findPhotoAll(int aid) {
		List<Photo> list=(List<Photo>) this.getHibernateTemplate().find("from Photo where ap_id =?",aid);
		return list;
	}

	//查找相册中的一张照片
	public List<Photo> findPhotoByIdAndAid(int pid, int aid) {
		@SuppressWarnings("unchecked")
		List<Photo> list=(List<Photo>) this.getHibernateTemplate().find("from Photo where pid = ? and ap_id =?",pid,aid);
		return list;
	}

	@Override
	public List<Photo> selectPhoto(String uame) {
		
		List<Photo> list =(List<Photo>) this.getHibernateTemplate().find("from Photo where pname like ?","%"+uame+"%");
		return list;
	
	}

	@Override
	public Photo removePhoto(String pid, String aid) {
		
		Album al = new Album();
		al.setAid(Integer.parseInt(aid));
		Photo photo = this.getHibernateTemplate().get(Photo.class,Integer.parseInt(pid));
		photo.setAlbum(al);
		this.getHibernateTemplate().update(photo);
		return photo;
	}

	//查询点击记录
	@Override
	public Praise selectPraise(String uid, String pid) {
		@SuppressWarnings("unchecked")
		List<Praise> list=(List<Praise>) this.getHibernateTemplate().find("from Praise where photoId = ? and userId =?",Integer.parseInt(pid),Integer.parseInt(uid));
		if(list.size()!=0)
		{
			return list.get(0);
		}else{
			return null;
		}
		
	}

	@Override
	public void givePraise(String uid, String pid) {
		Praise p = new Praise();
		p.setPhotoId(Integer.parseInt(pid));
		p.setUserId(Integer.parseInt(uid));
		
		this.getHibernateTemplate().save(p);
		
	}

	@Override
	public Photo selectPhoto(int parseInt) {
		@SuppressWarnings("unchecked")
		List<Photo> list =(List<Photo>) this.getHibernateTemplate().find("from Photo where pid = ?",parseInt);
		return list.get(0);
	}

	@Override
	public void updatePhoto(Photo photo) {
		
		this.getHibernateTemplate().update(photo);
	}

	@Override
	public void deletePraise(String uid, String pid) {
		@SuppressWarnings("unchecked")
		List<Photo> list =(List<Photo>) this.getHibernateTemplate().find("from Praise where photoId = ? and userId = ?",Integer.parseInt(pid),Integer.parseInt(uid));
		
		
		this.getHibernateTemplate().delete(list.get(0));
	}
	
	
	//查询点击记录
	@Override
	public Trample selectTrample(int uid, int pid) {
		@SuppressWarnings("unchecked")
		List<Trample> list=(List<Trample>) this.getHibernateTemplate().find("from Trample where photoId = ? and userId =?",pid,uid);
		if(list.size()!=0)
		{
			return list.get(0);
		}else{
			return null;
		}
		
	}

	@Override
	public void saveTraample(int uid, int parseInt) {
		Trample t = new Trample();
		t.setPhotoId(parseInt);
		t.setUserId(uid);
		
		this.getHibernateTemplate().save(t);
		
	}

	@Override
	public void deleteTrample(int uid, int parseInt) {
		@SuppressWarnings("unchecked")
		List<Photo> list =(List<Photo>) this.getHibernateTemplate().find("from Trample where photoId = ? and userId = ?",parseInt,uid);
		
		
		this.getHibernateTemplate().delete(list.get(0));
		
	}
	//添加评论
	@Override
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(comment);
	}

	@Override
	public void deleteComment(int cid) {
		
		@SuppressWarnings("unchecked")
		List<Comment> list =(List<Comment>) this.getHibernateTemplate().find("from Comment where cid = ? ",cid);
		this.getHibernateTemplate().delete(list.get(0));
	}
	
	
	@Override
	public List<Album> showAlbum(String school,String clzz) {
		@SuppressWarnings("unchecked")
		List<Album> list=(List<Album>) this.getHibernateTemplate().find("from Album where school = ? and clzz = ?", school,clzz);
		return list;
	}
	

}
