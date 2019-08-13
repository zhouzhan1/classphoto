package cn.zhou.dao;

import java.util.List;

import cn.zhou.entity.Album;
import cn.zhou.entity.Comment;
import cn.zhou.entity.Photo;
import cn.zhou.entity.Praise;
import cn.zhou.entity.Trample;

public interface PhotoDao {

	void addPhoto(Photo photo);

	void deletePhoto(int pid);

	List<Photo> findPhotoById(int pid);

	List<Photo> findPhotoAll(int aid);

	List<Photo> findPhotoByIdAndAid(int pid, int aid);

	List<Photo> selectPhoto(String uname);

	Photo removePhoto(String pid, String aid);

	Praise selectPraise(String uid, String pid);

	void givePraise(String uid, String pid);

	Photo selectPhoto(int parseInt);

	void updatePhoto(Photo photo);

	void deletePraise(String uid, String pid);

	Trample selectTrample(int uid, int parseInt);

	void saveTraample(int uid, int parseInt);

	void deleteTrample(int uid, int parseInt);

	void addComment(Comment comment);

	void deleteComment(int cid);

	List<Album> showAlbum(String school, String clzz);


}
