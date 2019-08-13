package cn.zhou.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;


import cn.zhou.dao.UserDao;
import cn.zhou.entity.Album;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.Photo;
import cn.zhou.entity.User;

@Transactional
public class UserService {
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	public User login(User user) {
		return userDao.login(user);
	}


	public void regist(User user) {
		userDao.regist(user);
		
	}


	public User findUser(User u) {
		List<User> list = userDao.findUser(u);
		if(list.size()==0)
			return null;
		else
			return list.get(0);
	}


	public int findCountAlbum(String school, String clzz, String username) {
		List<Album> list = userDao.findCountAlbum(school,clzz,username);
		
		return list.size();
	}


	public int findCountPhoto(String username, String clzz, String school) {
		List<Photo> list = userDao.findCountPhoto(username,clzz,school);
		return list.size();
	}


	public List<User> findAllUser(String clzz, String school) {
		
		return userDao.findAllUser(clzz,school);
	}


	public List<Album> findAllAlbum(String clzz, String school) {
			List<Album> list = userDao.findAllAlbum(clzz,school);
		return list;
	}


	public int findAllPhoto(String clzz, String school) {
		List<Photo> list = userDao.findAllPhoto(clzz,school);
		return list.size();
	}


	public void deleteUser(User user) {
		userDao.deleteUser(user);
		
	}


	public User findUserById(User u) {
		List<User> list = userDao.findUserById(u);
		return list.get(0);
	}


	public boolean findUserByRank(User u) {
		List<User> list = userDao.findByRank(u);
		if(list.size()==0)
			return false;
		else
			return true;
	}


	public List<IsRead> noRead(Integer uid) {
		
		return userDao.noRead(uid);
	}

}
