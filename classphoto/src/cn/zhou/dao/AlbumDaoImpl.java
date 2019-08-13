package cn.zhou.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.zhou.entity.Album;
import cn.zhou.entity.Photo;

public class AlbumDaoImpl extends HibernateDaoSupport implements AlbumDao {

	@Override
	public void addAlbum(Album album) {
		
		this.getHibernateTemplate().saveOrUpdate(album);
		
		
	}

	@Override
	public List<Album> showAlbum(String school,String clzz) {
		@SuppressWarnings("unchecked")
		List<Album> list=(List<Album>) this.getHibernateTemplate().find("from Album where school = ? and clzz = ?", school,clzz);
		return list;
	}

	@Override
	public List<Album> sortAlbum(String school, String clzz, String albumSort) {
		@SuppressWarnings("unchecked")
		List<Album> list=(List<Album>) this.getHibernateTemplate().find("from Album where school = ? and clzz = ? and albumSort = ?", school,clzz,albumSort);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public void deleteAlbum(int aid) {
		
		List<Album> album =(List<Album>) this.getHibernateTemplate().find("from Album where aid =?",aid);
		System.out.println(album.size());
		this.getHibernateTemplate().delete(album.get(0));
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Album> findAlbumByName(String albumName) {
		List<Album> album =(List<Album>) this.getHibernateTemplate().find("from Album where albumName =?",albumName);
		return album;
	}

	@Override
	public List<Album> findAlbumById(int aid) {
		@SuppressWarnings("unchecked")
		List<Album> album =(List<Album>) this.getHibernateTemplate().find("from Album where aid =?",aid);
		return album;
	}

	@Override
	public List<Album> selectAlbum(String albumName) {
		List<Album> album =(List<Album>) this.getHibernateTemplate().find("from Album where albumName like ?","%"+albumName+"%");
		
		return album;
	}

	@Override
	public void updateAlbum(Album album) {
		//System.out.println(album);
		// TODO Auto-generated method stub
		Album a = this.getHibernateTemplate().get(Album.class, album.getAid());
		if(album.getAlbumName()!=null)
		{
			a.setAlbumName(album.getAlbumName());
		}
		if(album.getAlbumDesc()!=null)
		{
			a.setAlbumDesc(album.getAlbumDesc());
		} 
		if(album.getAlbumSort()!=null)
		{
			a.setAlbumSort(album.getAlbumSort());
		}
		this.getHibernateTemplate().update(a);
	}

	


	
}
