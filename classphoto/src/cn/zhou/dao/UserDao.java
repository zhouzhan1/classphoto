package cn.zhou.dao;

import java.util.List;

import cn.zhou.entity.Album;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.Photo;
import cn.zhou.entity.User;

public interface UserDao {

	User login(User user);

	void regist(User user);

	List<User> findUser(User u);

	List<Album> findCountAlbum(String school, String clzz, String username);

	List<Photo> findCountPhoto(String username, String clzz, String school);

	List<User> findAllUser(String clzz, String school);

	List<Album> findAllAlbum(String clzz, String school);

	List<Photo> findAllPhoto(String clzz, String school);

	void deleteUser(User user);

	List<User> findUserById(User u);

	List<User> findByRank(User u);

	List<IsRead> noRead(Integer uid);

}
