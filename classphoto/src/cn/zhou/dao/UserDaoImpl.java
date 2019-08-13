package cn.zhou.dao;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.zhou.entity.Album;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.Photo;
import cn.zhou.entity.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	public User login(User user) {
		
		//得到模板。调用模板的方法查询用户
				HibernateTemplate ht = this.getHibernateTemplate();
				@SuppressWarnings("all")
				List<User> list = (List<User>) ht.find("from User where username=? and password=?", user.getUsername(),user.getPassword());
				if(list.size() ==0)
				{
					return null;
				}
				else {
				
					User u = list.get(0);
					return u;
				
	}
	}

	@Override
	public void regist(User user) {
		this.getHibernateTemplate().saveOrUpdate(user);
		
	}

	@Override
	public List<User> findUser(User u) {
		@SuppressWarnings("all")
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where username=? and school=? and clzz=?",u.getUsername(),u.getSchool(),u.getClzz());
		return list;
	}

	@Override
	public List<Album> findCountAlbum(String school, String clzz,
			String username) {
		@SuppressWarnings("all")
		List<Album> list = (List<Album>) this.getHibernateTemplate().find("from Album where aname=? and clzz=? and school=?",username,clzz,school);
		return list;
	}

	@Override
	public List<Photo> findCountPhoto(String username,String clzz,String school) {
		//List<Photo> list = (List<Photo>) this.getHibernateTemplate().find("from Photo where uname=?and clzz = ? and school = ?",username,clzz,school);
		String sql = "SELECT pid,address,ptime,pname,praise,trample,ap_id FROM ( SELECT pid,address,ptime,pname,ap_id,school,clzz,praise,trample  FROM zz_photo,zz_album WHERE aid=ap_id) AS tab WHERE pname='"+username+"' AND school='"+school+"' AND clzz='"+clzz+"';";
		Session session = this.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.addEntity(Photo.class);
		
		List list = sqlQuery.list();
		
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAllUser(String clzz, String school) {
		
		return (List<User>) this.getHibernateTemplate().find("from User where clzz=? and school=?",clzz,school);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Album> findAllAlbum(String clzz, String school) {
		
		return (List<Album>) this.getHibernateTemplate().find("from Album where clzz=? and school=?",clzz,school);
	}

	@Override
	public List<Photo> findAllPhoto(String clzz, String school) {
		
		String sql = "SELECT pid,address,ptime,pname,praise,trample,ap_id FROM ( SELECT pid,address,ptime,pname,praise,trample,ap_id,school,clzz  FROM zz_photo,zz_album WHERE aid=ap_id) AS tab WHERE school='"+school+"' AND clzz='"+clzz+"';";
		Session session = this.getSessionFactory().getCurrentSession();
		SQLQuery sqlQuery = session.createSQLQuery(sql);
		sqlQuery.addEntity(Photo.class);
		List list = sqlQuery.list();
		
		return list;
	}

	@Override
	public void deleteUser(User user) {
		this.getHibernateTemplate().delete(user);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findUserById(User u) {
		
		 return (List<User>) this.getHibernateTemplate().find("from User where uid=?",u.getUid());
	}

	@Override
	public List<User> findByRank(User u) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where rank=? and school=? and clzz=?",u.getRank(),u.getSchool(),u.getClzz());
		return list;
		
	}

	@Override
	public List<IsRead> noRead(Integer uid) {
		@SuppressWarnings("unchecked")
		List<IsRead> list = (List<IsRead>) this.getHibernateTemplate().find("from IsRead where uid=? and state=?",uid,1);
		return list;
	}

}
