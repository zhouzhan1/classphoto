package cn.zhou.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.zhou.dao.UserDao;
import cn.zhou.entity.Album;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.User;
import cn.zhou.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//模型驱动注入
	User u = new User();
	public User getModel() {
		
		return u;
	}
	

	
	//旧密码
	private String oldPassword;
	
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	//第二次输入密码
	private String password1;
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	
	
	//获取用户信息
	User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
	
	//修改密码
	public String setPassword()
	{
		User u1 = new User();
		u1.setUsername(user.getUsername());
		u1.setPassword(oldPassword);
		User user = userService.login(u1);
		if(user == null)
		{	
			ServletActionContext.getRequest().setAttribute("meg", "修改失败，密码错误");
			return "setPassword";
		}
		else if(u.getPassword().length()<6)
		{
			ServletActionContext.getRequest().setAttribute("meg", "密码长度需为六位");
			return "setPassword";
		}
		else
		{
			
			user.setPassword(u.getPassword());
			userService.regist(user);
			ServletActionContext.getRequest().setAttribute("meg", "修改密码成功，请重新登陆");
			return "exit";
		}
			
		
		
		
	}
	
	//修改班级
	public String setClzz()
	{
		User u1 = new User();
		u1.setUsername(user.getUsername());
		u1.setPassword(u.getPassword());
		User user = userService.login(u1);
		if(user == null)
		{
			
			ServletActionContext.getRequest().setAttribute("meg", "修改失败，密码错误");
			return "setClzz";
		}
		else if(u.getClzz().length()<3 || u.getClzz().contains(" "))
		{
			ServletActionContext.getRequest().setAttribute("meg", "班级名称填写错误，不能包含空格且不少于3个字");
			return "setClzz";
		}
		else{
			
			user.setClzz(u.getClzz());
			userService.regist(user);
			ServletActionContext.getRequest().setAttribute("meg", "修改班级成功，请重新登陆");
			return "exit";
		}
		
	}
	
	//修改学校
	public String setSchool()
	{
		User u1 = new User();
		u1.setUsername(user.getUsername());
		u1.setPassword(u.getPassword());
		User u2 = userService.login(u1);
		if(u2 == null)
		{
			
			ServletActionContext.getRequest().setAttribute("meg", "修改失败，密码错误");
			return "setSchool";
		}
		else if(u.getSchool().length()<4 || u.getSchool().contains(" "))
		{
			ServletActionContext.getRequest().setAttribute("meg", "学校名称填写错误，不能包含空格且不少于4个字");
			return "setSchool";
		}
		else{
			
			u2.setSchool(u.getSchool());
			userService.regist(u2);
			ServletActionContext.getRequest().setAttribute("meg", "修改学校成功，请重新登陆");
			return "exit";
		}
		
	}
	
	//修改手机
	
	public String setPhone()
	{
		User u1 = new User();
		u1.setUsername(user.getUsername());
		u1.setPassword(u.getPassword());
		User u2 = userService.login(u1);
		if(u2 == null)
		{
			
			ServletActionContext.getRequest().setAttribute("meg", "修改失败，密码错误");
			return "setSchool";
		}
		else if(u.getPhone().length()!=11)
		{
			ServletActionContext.getRequest().setAttribute("meg", "请填写正确的手机号码");
			return "setPhoto";
		}
		else{
			
			u2.setPhone(u.getPhone());
			userService.regist(u2);
			ServletActionContext.getRequest().setAttribute("meg", "修改成功,请重新登录");
			return "exit";
		}
		
	}
	
	//退出班级
	public String logout()
	{
		User u1 = new User();
		u1.setUsername(user.getUsername());
		u1.setPassword(u.getPassword());
		User user = userService.login(u1);
		if(user == null)
		{
			
			ServletActionContext.getRequest().setAttribute("meg", "注销失败，密码错误");
			return "logout";
		}
		else{
			
			//user.setSchool(school);
			userService.deleteUser(user);
			ServletActionContext.getRequest().setAttribute("meg", "注销成功");
			return "exit";
		}
		
	}
	//辅导员移除成员
	public String removeUser()
	{
		if(!user.getRank().equals("辅导员"))
		{
			ServletActionContext.getRequest().setAttribute("e", "你无法执行此操作，请联系辅导员");
			return "removeUser";
		}
		else 
		{
			User user2 = userService.findUserById(u);
			if(user2.getRank().equals("辅导员"))
			{
				ServletActionContext.getRequest().setAttribute("e", "操作失败，不可移除辅导员");
			}
			else{
				User u1 = userService.findUserById(u);
				//通过学校名称和班级名称查询班级总人数；
				//List<User> u = userService.findAllUser(user.getClzz(),user.getSchool());
				ServletActionContext.getRequest().setAttribute("e", "成功移除“"+u1.getUsername()+"”同学");
				userService.deleteUser(u1);
			}
			
			
			return "removeUser";
		}
		
		
	}
	
	//返回主页
	public String goIndex()
	{
		return "goIndex";
		
	}
	
	//个人中心
	public String set()
	{
		
		
		//通过用户名学校班级名称查询相册总数
		int countAlbum = userService.findCountAlbum(user.getSchool(),user.getClzz(),user.getUsername());
		//通过学校班级用户名查询个人上传照片的总数，照片中没有学校班级的信息，先只用用户名查询
		int countPhoto = userService.findCountPhoto(user.getUsername(),user.getClzz(),user.getSchool());
		//通过学校名称和班级名称查询班级总人数；
		List<User> u = userService.findAllUser(user.getClzz(),user.getSchool());
		//通过学校名称和班级名称查询相册总数；
		List<Album> allAlbum = userService.findAllAlbum(user.getClzz(),user.getSchool());
		//通过学校名称班级名称查询照片总数
		int allPhoto = userService.findAllPhoto(user.getClzz(),user.getSchool());
		

		ServletActionContext.getRequest().getSession().setAttribute("countAlbum", countAlbum);
		ServletActionContext.getRequest().getSession().setAttribute("countPhoto", countPhoto);
		ServletActionContext.getRequest().getSession().setAttribute("allUserCount", u.size());
		ServletActionContext.getRequest().getSession().setAttribute("allUser", u);
		ServletActionContext.getRequest().getSession().setAttribute("allAlbum", allAlbum.size());
		ServletActionContext.getRequest().getSession().setAttribute("allPhoto", allPhoto);
		ServletActionContext.getRequest().getSession().setAttribute("albumAll", allAlbum);
		return "set";
	}
	
	//注册
	public String regist()
	{
		User user1 = userService.findUser(u);
		String school = u.getSchool();
		String clzz = u.getClzz();
		
		
		//表单校验
		if(u.getUsername().contains(" ")||u.getUsername().length()==0)
		{
			ServletActionContext.getRequest().setAttribute("meg", "用户名填写错误，不能不填或包含空格");
			ServletActionContext.getRequest().setAttribute("u", u);
			return "registNo";
		}
		
		else if(u.getPassword().length()<6)
		{
			ServletActionContext.getRequest().setAttribute("meg", "密码不少于六位");
			ServletActionContext.getRequest().setAttribute("u", u);
			return "registNo";
		}
		
		else if(!u.getPassword().equals(password1))
		{
			ServletActionContext.getRequest().setAttribute("meg", "密码不同");
			ServletActionContext.getRequest().setAttribute("u", u);
			return "registNo";
		}
		else if(u.getSchool().length()<4 || u.getSchool().contains(" "))
		{
			ServletActionContext.getRequest().setAttribute("meg", "学校名称填写错误，不能包含空格且不少于4个字");
			ServletActionContext.getRequest().setAttribute("u", u);
			return "registNo";
		}
		else if(u.getClzz().length()<3 || u.getClzz().contains(" "))
		{
			ServletActionContext.getRequest().setAttribute("meg", "班级名称填写错误，不能包含空格且不少于3个字");
			ServletActionContext.getRequest().setAttribute("u", u);
			return "registNo";
		}else if(u.getPhone().length() != 11){
			ServletActionContext.getRequest().setAttribute("meg", "请输入正确的手机号码");
			ServletActionContext.getRequest().setAttribute("u", u);
			return "registNo";
		}
		else if(user1!=null)
		{
			ServletActionContext.getRequest().setAttribute("meg", "用户名已存在");
			ServletActionContext.getRequest().setAttribute("u", u);
			return "registNo";
		}
		else if("辅导员班长".contains(u.getRank()))
		{
			boolean tf = userService.findUserByRank(u);
			
			if(tf==true)
			{
				ServletActionContext.getRequest().setAttribute("meg", "每个班级只能有一个班长与一个辅导员");
				ServletActionContext.getRequest().setAttribute("u", u);
				return "registNo";
			}
			
		
		else
		{
			userService.regist(u);
			ServletActionContext.getRequest().setAttribute("meg", "注册成功，请登陆！");
			return "regist";
		}
		
			
		}
		else{
			userService.regist(u);
			ServletActionContext.getRequest().setAttribute("meg", "注册成功，请登陆！");
			return "regist";
		}
	
		
	}
	
	
	
	//登陆
	public String login()
	{
		
		//调用service的登陆方法
		User user = userService.login(u);
		//判断是否有该用户
		if(user != null)
		{
			
			ServletActionContext.getRequest().getSession().setAttribute("user", user);
			List<Album> allAlbum = userService.findAllAlbum(user.getClzz(),user.getSchool());
			ServletActionContext.getRequest().getSession().setAttribute("albumAll", allAlbum);
			//未读消息
			
			//ServletActionContext.getRequest().getSession().setAttribute("noIsRead", list);
			List<IsRead> list = userService.noRead(user.getUid());
			ServletActionContext.getRequest().getSession().setAttribute("noReadCount", list.size());
			return "loginYes";
		}
		else{
			ServletActionContext.getRequest().setAttribute("meg", "用户名或密码错误");
			return "loginNo";
		}
		
	}
	
	//所有相册的信息
	public void updateInform(){
		List<Album> allAlbum = userService.findAllAlbum(user.getClzz(),user.getSchool());
		ServletActionContext.getRequest().getSession().setAttribute("albumAll", allAlbum);
		List<IsRead> list = userService.noRead(user.getUid());
		ServletActionContext.getRequest().getSession().setAttribute("noReadCount", list.size());
	}
	
	//退出登陆
	public String exit()
	{
		ServletActionContext.getRequest().getSession().removeAttribute("user");
		return "exit";
	}


}
