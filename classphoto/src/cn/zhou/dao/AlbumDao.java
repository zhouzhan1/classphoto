package cn.zhou.dao;

import java.util.List;

import cn.zhou.entity.Album;
import cn.zhou.entity.Photo;

public interface AlbumDao {

	void addAlbum(Album album);

	List<Album> showAlbum(String school, String clzz);

	List<Album> sortAlbum(String school, String clzz, String albumSort);

	void deleteAlbum(int aid);

	List<Album> findAlbumByName(String albumName);

	List<Album> findAlbumById(int aid);

	List<Album> selectAlbum(String albumName);

	void updateAlbum(Album album);

	




//	List<Photo> showPhoto(String albumName);

}
