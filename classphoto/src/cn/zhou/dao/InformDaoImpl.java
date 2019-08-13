package cn.zhou.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import cn.zhou.entity.Inform;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.User;

public class InformDaoImpl extends HibernateDaoSupport implements InformDao {

	//添加通知
	@Override
	public Integer addInform(Inform inform) {
		Serializable id = this.getHibernateTemplate().save(inform);
			
		return (Integer) id;
		
	}
	
	public List<User> findUserAll(User user){
		
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where school = ? and clzz = ?", user.getSchool(),user.getClzz());
		return list;
	}

/*	@SuppressWarnings("unchecked")
	@Override
	public List<Inform> selectInform(String school, String clzz) {
		List<Inform> list = (List<Inform>) this.getHibernateTemplate().find("from Inform where school = ? and clzz = ?", school,clzz);
		return list;
	}*/

	@Override
	public Integer save(IsRead r) {
		Serializable id = this.getHibernateTemplate().save(r);
		/*this.getHibernateTemplate().flush();*/
		return (Integer) id;
	}

	@Override
	public void changeInformState(Integer rid,int state) {
		@SuppressWarnings("unchecked")
		List<IsRead> list = (List<IsRead>) this.getHibernateTemplate().find("from IsRead where rid = ? ", rid);
		IsRead read = list.get(0);
		read.setState(state);
		this.getHibernateTemplate().update(read);
		
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IsRead> selectIsRead(Integer uid,int state1,int state2) {
		
		return (List<IsRead>) this.getHibernateTemplate().find("from IsRead where uid = ? and (state=? OR state=?)",uid,state1,state2);
	}

	@Override
	public List<IsRead> noRead(Integer uid) {
		@SuppressWarnings("unchecked")
		List<IsRead> list = (List<IsRead>) this.getHibernateTemplate().find("from IsRead where uid=? and state=?",uid,1);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getTeacher(User user) {
		// TODO Auto-generated method stub
		return (List<User>)  this.getHibernateTemplate().find("from User where school = ? and clzz = ? and rank = ?", user.getSchool(),user.getClzz(),"辅导员");
	}
	
	//查询未读，回收站，已读
	@Override
	public List<IsRead> stateRead(Integer uid,int state) {
		@SuppressWarnings("unchecked")
		List<IsRead> list = (List<IsRead>) this.getHibernateTemplate().find("from IsRead where uid=? and state=?",uid,state);
		return list;
	}

	//删除他人通知
	public void deleteInform_other(String rid) {
		IsRead isread = this.getHibernateTemplate().get(IsRead.class, Integer.parseInt(rid));
		this.getHibernateTemplate().delete(isread);
		
	}

	@Override
	public void deleteInform_me(String informId) {
		Inform inform = this.getHibernateTemplate().get(Inform.class, Integer.parseInt(informId));
		this.getHibernateTemplate().delete(inform);
	}



}
