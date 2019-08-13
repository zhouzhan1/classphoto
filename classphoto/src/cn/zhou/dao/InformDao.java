package cn.zhou.dao;

import java.util.List;

import cn.zhou.entity.Inform;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.User;

public interface InformDao {

	Integer addInform(Inform inform);

//	List<Inform> selectInform(String school, String clzz);
	
	List<User> findUserAll(User user);

	Integer save(IsRead r);

	List<IsRead> selectIsRead(Integer uid, int state1, int state2);

	List<IsRead> noRead(Integer uid);

	//List<IsRead> teacherInfoem(User user);

	List<User> getTeacher(User user);

	List<IsRead> stateRead(Integer uid, int state);


	void changeInformState(Integer rid, int state);

	void deleteInform_other(String rid);

	void deleteInform_me(String informId);

	

	



}
