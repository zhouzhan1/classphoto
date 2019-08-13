package cn.zhou.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.zhou.dao.AlbumDao;
import cn.zhou.entity.Album;
import cn.zhou.entity.Photo;

@Transactional
public class AlbumService {

	private AlbumDao albumDao;
	public void setAlbumDao(AlbumDao albumDao) {
		this.albumDao = albumDao;
	}
	
	//添加相册
	public void addAlbum(Album album) {
		
		albumDao.addAlbum(album);
		
	}
	
	//显示所有相册
	public List<Album> showAlbum(String school, String clzz) {
		
		return albumDao.showAlbum(school,clzz);
	}
	
	//显示分类相册
	public List<Album> sortAlbum(String school, String clzz, String albumSort) {

		return albumDao.sortAlbum(school,clzz,albumSort);
	}
	
	//删除相册
	public void deleteAlbum(int aid) {
		albumDao.deleteAlbum(aid);
		
	}
	
	//通过名字查询相册
	public Album findAlbumByName(String albumName) {
		List<Album> list = albumDao.findAlbumByName(albumName);
		if(list.size()==0)
		return null;
		else
			return list.get(0);
	}
	
	//通过id查询相册
	public Album findAlbumById(int aid){
		
		List<Album> list = albumDao.findAlbumById(aid);
		return list.get(0);
	}

	public List<Album> selectAlbum(String albumName) {
		List<Album> list = albumDao.selectAlbum(albumName);
		return list;
	}

	public void updateAlbum(Album album) {
		if(album.getAlbumDesc().length()==0)
		{
			album.setAlbumDesc(null);
		}
		if(album.getAlbumName().length()==0 || album.getAlbumName().contains(" "))
		{
			album.setAlbumName(null);
			
		}
		albumDao.updateAlbum(album);
		
	}
	


	

	
	
}
