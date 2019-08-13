package cn.zhou.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.zhou.entity.Album;
import cn.zhou.entity.Inform;
import cn.zhou.entity.IsRead;
import cn.zhou.entity.User;
import cn.zhou.service.InformService;

import com.opensymphony.xwork2.ModelDriven;


public class InformAction {

	
	//获取用户信息
	User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
	
	public InformService informService;
	public void setInformService(InformService informService) {
		this.informService = informService;
	}

	public String title;
	public String content;
	
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	//通知id
	String informId;
	public String getInformId() {
		return informId;
	}
	public void setInformId(String informId) {
		this.informId = informId;
	}
	
	//rid
	String rid;


	public String getRid() {
		return rid;
	}


	public void setRid(String rid) {
		this.rid = rid;
	}
	
	Integer uid;


	public Integer getUid() {
		return uid;
	}


	public void setUid(Integer uid) {
		this.uid = uid;
	}

	String uname;
	

	public String getUname() {
		return uname;
	}


	public void setUname(String uname) {
		this.uname = uname;
	}


	//阅读通知
	public void readInform(){
		
		informService.changeInformState(Integer.parseInt(rid),2);
		/*List<Inform> informAll= informService.selectInform(user.getSchool(),user.getClzz());
		ServletActionContext.getRequest().setAttribute("informAll", informAll);*/
		List<IsRead> list = informService.stateRead(user.getUid(),1);
		ServletActionContext.getRequest().getSession().setAttribute("noReadCount", list.size());
	}
	
	
	//添加通知
	public String addInform()
	{
		Inform inform = new Inform();
		
		inform.setContent(content);
		inform.setClzz(user.getClzz());
		inform.setSchool(user.getSchool());
		inform.setTitle(title);
		
		//获取系统当前时间
		Date date = new Date();
				
		//将时间格式化
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		inform.setItime(time);
		inform.setUname(user.getUsername());
		
		informService.addInform(inform,user);
		
		
		List<IsRead> list = informService.selectIsRead(user.getUid(),1,2);
		ServletActionContext.getRequest().setAttribute("isReadAll", list);
		ServletActionContext.getRequest().setAttribute("whatInform", 1);
		return "addInform";
	}
	
	//显示全部通知
	public String showInform()
	{
		
		List<IsRead> list = informService.selectIsRead(user.getUid(),1,2);
		ServletActionContext.getRequest().setAttribute("isReadAll", list);
		ServletActionContext.getRequest().setAttribute("whatInform", 1);
		return "addInform";
	}
	
	//未读通知
	public String noReadInform()
	{
		
		List<IsRead> list = informService.noReadInform(user.getUid());
		ServletActionContext.getRequest().setAttribute("isReadAll", list);
		ServletActionContext.getRequest().setAttribute("whatInform", 2);
		return "addInform";
	}
	
	//辅导员通知
	
	public String teacherInform()
	{
		
		List<IsRead> list = informService.teacherInform(user);
		ServletActionContext.getRequest().setAttribute("isReadAll", list);
		ServletActionContext.getRequest().setAttribute("whatInform", 3);
		return "addInform";
	}
	
	//我发布的通知
	
	public String myInform()
	{
		
		List<IsRead> list = informService.myInform(user);
		ServletActionContext.getRequest().setAttribute("isReadAll", list);
		ServletActionContext.getRequest().setAttribute("whatInform", 4);
		return "addInform";
	}
	
	//加入回收站
	public void addBackInform()
	{
		informService.changeInformState(Integer.parseInt(rid),3);
		List<IsRead> list = informService.stateRead(user.getUid(),1);
		ServletActionContext.getRequest().getSession().setAttribute("noReadCount", list.size());
		
	}
	//查看回收站
	
	public String backInform()
	{
		List<IsRead> list = informService.selectIsRead(user.getUid(),3,0);
		ServletActionContext.getRequest().setAttribute("isReadAll", list);
		
		return "bInform";
		
	}
	
	//删除他人通知
	public void deleteInform_other(){
		
		informService.deleteInform_other(rid);
		List<IsRead> list = informService.stateRead(user.getUid(),1);
		ServletActionContext.getRequest().getSession().setAttribute("noReadCount", list.size());
	}
	
	//删除我的通知
	public void deleteInform_me(){
		
		informService.deleteInform_me(informId);
		System.out.println(informId);
	}
	
	//还原
	public void quitInform(){
		
		if(uname.equals(user.getUsername())){
			informService.changeInformState(Integer.parseInt(rid), 2);
		}else{
			informService.changeInformState(Integer.parseInt(rid), 1);
		}
		
		
		List<IsRead> list = informService.stateRead(user.getUid(),1);
		ServletActionContext.getRequest().getSession().setAttribute("noReadCount", list.size());
	}
	
	
	
	
	
	
	
	
	
	
	
}
