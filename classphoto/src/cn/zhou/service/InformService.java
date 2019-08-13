package cn.zhou.service;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.zhou.dao.InformDao;
import cn.zhou.entity.Inform;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.User;
@Transactional
public class InformService {

	public InformDao informDao;

	public void setInformDao(InformDao informDao) {
		this.informDao = informDao;
	}

	public void addInform(Inform inform,User user) {
		
		Integer i = informDao.addInform(inform);
		Inform in = new Inform();
		in.setInformId(i);
		List<User> list = informDao.findUserAll(user);
		
		for(User u : list){
			IsRead r = new IsRead();
			r.setInform(inform);
			r.setInformId(i);
			if(u.getUid()==user.getUid())
			{
				r.setState(2);
			}else{
				r.setState(1);
			}
			
			r.setUid(u.getUid());
			informDao.save(r);
			
		}
	}

/*
	public List<Inform> selectInform(String school, String clzz) {
		List<Inform> informs = informDao.selectInform(school,clzz);
	
		Collections.reverse(informs);
		return informs;
	}*/

	

	public void changeInformState(int rid,int state) {
		// TODO Auto-generated method stub
		informDao.changeInformState(rid, state);
	}

	public List<IsRead> selectIsRead(Integer uid, int state1, int state2) {
		List<IsRead> list = informDao.selectIsRead(uid,state1,state2);
		Collections.reverse(list);
		return list;
	}

	public List<IsRead> noReadInform(Integer uid) {
		List<IsRead> list = informDao.noRead(uid);
		Collections.reverse(list);
		return list;
	}
//辅导员通知
	public List<IsRead> teacherInform(User user) {
		List<IsRead> list = informDao.selectIsRead(user.getUid(),1,2);
		List<IsRead> l = new LinkedList<IsRead>();
		List<User> u = informDao.getTeacher(user);
		String teacherName = u.get(0).getUsername();
		for(IsRead r:list){
			String name = r.getInform().getUname();
			if(teacherName.equals(name)){
				l.add(r);
				
			}
		}
		Collections.reverse(l);
		return l;
	}
//我发布的通知
	public List<IsRead> myInform(User user) {
		List<IsRead> list = informDao.selectIsRead(user.getUid(),1,2);
		List<IsRead> l = new LinkedList<IsRead>();
		
		String myName = user.getUsername();
		for(IsRead r:list){
			String name = r.getInform().getUname();
			if(myName.equals(name)){
				l.add(r);
				
			}
		}
		Collections.reverse(l);
		return l;
	}

	public List<IsRead> stateRead(Integer uid, int i) {
		
		return informDao.stateRead(uid, i);
	}

	public void deleteInform_other(String rid) {
		
		informDao.deleteInform_other(rid);
	}

	public void deleteInform_me(String informId) {
		
		informDao.deleteInform_me(informId);
	}

	
}
