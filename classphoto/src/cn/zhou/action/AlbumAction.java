package cn.zhou.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.zhou.entity.Album;
import cn.zhou.entity.Photo;
import cn.zhou.entity.User;
import cn.zhou.service.AlbumService;
import cn.zhou.service.PhotoService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AlbumAction extends ActionSupport implements ModelDriven<Album>{

	//注入albumService
	private AlbumService albumService;
	public void setAlbumService(AlbumService albumService) {
		this.albumService = albumService;
	}
	
	
	
	//属性封装
	private Album album = new Album();
	public Album getModel() {
		return album;
	}
	
	//获取用户上传的封面信息
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	//获取用户
	User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
	
	//添加相册
	public String addAlbum()
	{
		Album alb = albumService.findAlbumByName(album.getAlbumName());
		
		Properties p = new Properties();
		String photoAddress = null;
		
			try {
				p.load(PhotoAction.class.getResourceAsStream("/classphoto.properties"));
			} catch (IOException e1) {
				ServletActionContext.getRequest().setAttribute("meg", "配置文件读取失败");
				return "addAlbum";
			}
			photoAddress=p.getProperty("address");
			String dir = "photo/"+System.currentTimeMillis()
					+"_"+ uploadFileName;
			String filedir = photoAddress+ dir;
			
			if(uploadContentType!=null)
			{
				if(!"image/png,image/jpeg,image/bmp".contains(uploadContentType))
				{
					ServletActionContext.getRequest().setAttribute("meg", "请上传图片类型的文件，支持jpg、png、bmp等格式");
					ServletActionContext.getRequest().setAttribute("username", user.getUsername());
					return "addAlbum";
				}
			}
			
			File serverFile = new File(filedir);
			try {
				
				FileUtils.copyFile(upload, serverFile);
				//ServletActionContext.getRequest().setAttribute("meg", "添加成功，继续添加或返回");
			} catch (Exception e) {
				ServletActionContext.getRequest().setAttribute("username", user.getUsername());
				ServletActionContext.getRequest().setAttribute("meg", "请选择封面图片");
				return "addAlbum";
			}
			
			
			
		
		if(album.getAlbumName().contains(" " )|| album.getAlbumName().length()<1)
		{
			ServletActionContext.getRequest().setAttribute("meg", "相册名称不能为空或包含空格");
			return "addAlbum";
		}
		else if(alb != null)
		{
			ServletActionContext.getRequest().setAttribute("meg", "该相册已存在");
			return "addAlbum";
		}
		else{
			//设置album中的其他属性
			album.setSchool(user.getSchool());
			album.setClzz(user.getClzz());
			album.setAname(user.getUsername());
			album.setaPhotoAddress(dir);
			
			//获取系统当前时间
			Date date = new Date();
			//将时间格式化
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = format.format(date);
			album.setAtime(time);
			
			albumService.addAlbum(album);
		
			ServletActionContext.getRequest().setAttribute("meg", "添加成功，继续添加或返回");
			
			List<Album> list = albumService.showAlbum(user.getSchool(), user.getClzz());
			ServletActionContext.getRequest().getSession().setAttribute("albumAll", list);
			return "addAlbum";
		}
	}
	
	//删除相册
	public String deleteAlbum()
	{
		if(!user.getRank().equals("成员"))
		{	
			
			albumService.deleteAlbum(album.getAid());
			ServletActionContext.getRequest().setAttribute("meg", "删除相册成功");
			List<Album> list = albumService.showAlbum(user.getSchool(), user.getClzz());
			ServletActionContext.getRequest().getSession().setAttribute("albumAll", list);
		}else
		{
			ServletActionContext.getRequest().setAttribute("meg", "无限权执行此操作，请联系辅导员或班长");
		}
		
		return "deleteAlbum";
	}
	
	//相册的显示，即查询
	public String showAlbum()
	{
		//通过用户的学校和班级查询出该班级的所有相册
		List<Album> listAlbum = albumService.showAlbum(user.getSchool(),user.getClzz());
		ServletActionContext.getRequest().setAttribute("listAlbum", listAlbum);
		//获取用户的rank，然后保存在域中
		
		return "showAlbum";
	}
	
	//相册分类查询
	public String sortAlbum()
	{	
		List<Album> listAlbum = albumService.sortAlbum(user.getSchool(),user.getClzz(),album.getAlbumSort());

		ServletActionContext.getRequest().setAttribute("listAlbum", listAlbum);
		return "sortAlbum";
	}
	
	//查询相相册
	public String selectAlbum()
	{	
		List<Album> listAlbum = albumService.selectAlbum(album.getAlbumName());
		ServletActionContext.getRequest().setAttribute("listAlbum", listAlbum);
		return "selectAlbum";
	}
	//通过id查询相册并返回修改页面
	public String toAddPage()
	{
		Album album1 = albumService.findAlbumById(album.getAid());
		
		ServletActionContext.getRequest().setAttribute("album", album1);
		return "toAddPage";
	}
	//修改相册信息
	public String updateAlbum()
	{
		Album alb = albumService.findAlbumByName(album.getAlbumName());
		if(alb != null)
		{
			ServletActionContext.getRequest().setAttribute("album", album);
			ServletActionContext.getRequest().setAttribute("meg", "该相册已存在");
			return "toAddPage";
		}
		else{
			albumService.updateAlbum(album);
			List<Album> list = albumService.showAlbum(user.getSchool(), user.getClzz());
			ServletActionContext.getRequest().getSession().setAttribute("albumAll", list);
		}
		
		//System.out.println(album.getAlbumDesc().length());
		
		return "updateAlbum";
	}
	
	
}
