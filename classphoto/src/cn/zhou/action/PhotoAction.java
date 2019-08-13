package cn.zhou.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;



import cn.zhou.entity.Album;
import cn.zhou.entity.Comment;
import cn.zhou.entity.Photo;

import cn.zhou.entity.User;
import cn.zhou.service.AlbumService;
import cn.zhou.service.PhotoService;


public class PhotoAction {
	
	//注入photoService
	private PhotoService photoService;
	public void setPhotoService(PhotoService photoService) {
		this.photoService = photoService;
	}
	//注入AlbumService
	private AlbumService albumService;
	public void setAlbumService(AlbumService albumService) {
		this.albumService = albumService;
	}
	
	//获取用户信息
	User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");

	//所上传图片的信息
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	
	
	public String getUploadContentType() {
		return getUploadContentType();
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	
	//要显示图片的地址
	public String address;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	//相片所属的相册
	public String albumName;
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	
	//用户id
	public String uid;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	
	//相片id
	public String pid;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
	//相册id
	public String aid;
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	
	//时间
	public String ptime;
	public String getPtime() {
		return ptime;
	}
	public void setPtime(String ptime) {
		this.ptime = ptime;
	}
	
	//上传者
	public String uname;
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	//评论
	public String content;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	//评论id
	public String cid;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	//从onePhoto中删除照片
	public String deleteOnePhoto()
	{
			Album album = photoService.findPhotoAll(Integer.parseInt(aid)).get(0).getAlbum();
			Photo p = new Photo();
			p.setPid(Integer.parseInt(pid));
			Photo photo = photoService.nextPhoto(p,Integer.parseInt(aid));
			ServletActionContext.getRequest().setAttribute("photo", photo);
			int count = photoService.deletePhoto(Integer.parseInt(pid),Integer.parseInt(aid));
			if(count==0)
			{	
				ServletActionContext.getRequest().setAttribute("album", album);
		
				return "showPhoto";
			}
		
		return "onePhoto";
	}
	
	//从showPhoto中删除相片
	public String deletePhoto(){
		
		
			ServletActionContext.getRequest().setAttribute("meg", "删除成功");
			photoService.deletePhoto(Integer.parseInt(pid),Integer.parseInt(aid));
		
		
		
		return "deletePhoto";
	}
	
	//转到添加照片的页面
	public String forAddPhoto()
	{
		ServletActionContext.getRequest().setAttribute("albumName", albumName);
		ServletActionContext.getRequest().setAttribute("username", user.getUsername());
		return "forAddPhoto";
	}
	
	//显示照片
	public String showPhoto()
	{	
		Album album = albumService.findAlbumById(Integer.parseInt(aid));	
		ServletActionContext.getRequest().setAttribute("album", album);
		
		return "showPhoto";
	}
	
	//查看图片
	public String onePhoto()
	{
		Photo p = new Photo();
		p.setPid(Integer.parseInt(pid));
		Photo photo = photoService.findPhotoById(p);
		ServletActionContext.getRequest().setAttribute("photo", photo);
		
		return "onePhoto";
	}
	
	//上一张
	public String beforePhoto(){
		Photo p = new Photo();
		p.setPid(Integer.parseInt(pid));
		Photo photo = photoService.beforePhoto(p,Integer.parseInt(aid));
		ServletActionContext.getRequest().setAttribute("photo", photo);
		return "beforePhoto";
	}
	
	//下一张
	public String nextPhoto(){
		Photo p = new Photo();
		p.setPid(Integer.parseInt(pid));
		Photo photo = photoService.nextPhoto(p,Integer.parseInt(aid));
		ServletActionContext.getRequest().setAttribute("photo", photo);
		return "nextPhoto";
	}
	
	//显示原图
	public String bigPhoto()
	{
		ServletActionContext.getRequest().setAttribute("address", address);
		return "bigPhoto";
		
	}
	
	//添加照片
	public String addPhoto()
	{
		Properties p = new Properties();
		String photoAddress = null;
		//String address = null;

		
			try {
				p.load(PhotoAction.class.getResourceAsStream("/classphoto.properties"));
			} catch (IOException e1) {
				ServletActionContext.getRequest().setAttribute("meg", "配置文件读取失败");
				return "addPhoto";
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
				
				return "addPhoto";
			}
		}
		File serverFile = new File(filedir);
		try {
			
			FileUtils.copyFile(upload, serverFile);
			ServletActionContext.getRequest().setAttribute("meg", "添加成功，继续添加或返回");
		} catch (Exception e) {
			ServletActionContext.getRequest().setAttribute("username", user.getUsername());
			ServletActionContext.getRequest().setAttribute("meg", "请选择图片");
			return "addPhoto";
		}
		Photo photo = new Photo();

		
		//获取系统当前时间
		Date date = new Date();
		
		//将时间格式化
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		
		//设置Photo各种属性
		Album album = new Album();
		
		album.setAid(Integer.parseInt(aid));
		photo.setAlbum(album);
		
		photo.setAddress(dir);
		photo.setPname(user.getUsername());
		photo.setPtime(time);
		photo.setPraise(0);
		photo.setTrample(0);
		photoService.addPhoto(photo);
		ServletActionContext.getRequest().setAttribute("albumName", albumName);
		return "addPhoto";
	}
	
	//查询照片
	public String selectPhoto()
	{
		List<Photo> list= photoService.selectPhoto(uname);
		ServletActionContext.getRequest().setAttribute("photo", list);
		return "showSelectPhoto";
	}
	
	//移动照片
	public String removePhoto()
	{
		 Photo photo =  photoService.removePhoto(pid,aid);
		 ServletActionContext.getRequest().setAttribute("photo", photo);
		 ServletActionContext.getRequest().setAttribute("meg", "移动成功");
		return "removePhoto";
	}
	
	//点赞
	public String givePraise()
	{
		Photo p = photoService.givePraise(user.getUid().toString(),pid);
		
		 ServletActionContext.getRequest().setAttribute("photo", p);
		
		return "onePhoto";
	}
	//踩
	public String trample()
	{
		Photo p = photoService.trample(user.getUid(),Integer.parseInt(pid));
		ServletActionContext.getRequest().setAttribute("photo", p);
		return "onePhoto";
	}
	
	//转到评论页面
	public String toCommentPage()
	{
		Photo photo = photoService.selectPhoto(Integer.parseInt(pid));
		ServletActionContext.getRequest().setAttribute("photo", photo);
		return "toCommentPage";
	}
	
	//添加评论
	public String addComment(){
		//System.out.println(content+pid);
		Comment comment = new Comment();
		Photo photo1 = new Photo();
		photo1.setPid(Integer.parseInt(pid));
		comment.setContent(content);
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(d);
		comment.setCtime(time);
		comment.setUname(user.getUsername());
		comment.setPhoto(photo1);
		photoService.addComment(comment);
		Photo photo = photoService.selectPhoto(Integer.parseInt(pid));
		ServletActionContext.getRequest().setAttribute("photo", photo);
		return "toCommentPage";
	}
	//删除评论
	public String deleteComment(){
		photoService.deleteComment(Integer.parseInt(cid));
		Photo photo = photoService.selectPhoto(Integer.parseInt(pid));
		ServletActionContext.getRequest().setAttribute("photo", photo);
		return "toCommentPage";
	}
	
	//热门图片
	public String hotPhoto(){
		
		List<Photo> list = photoService.getPhoto_Mask(user.getSchool(),user.getClzz());
		
		ServletActionContext.getRequest().setAttribute("photo", list);
		return "hotPhoto";
	}
	
	//综合排行
	public String zhRankInPhoto(){
		List<Photo> list = photoService.zhRankInPhoto(user.getSchool(),user.getClzz());
	
		ServletActionContext.getRequest().setAttribute("photo", list);
		return "zhRankInPhoto";
	}
	
	//点赞排行
		public String praisePhoto(){
			List<Photo> list = photoService.praisePhoto(user.getSchool(),user.getClzz());
			
			ServletActionContext.getRequest().setAttribute("photo", list);
			return "praisePhoto";
		}

		//查看图片
		public String rankPhoto()
		{
			Photo p = new Photo();
			p.setPid(Integer.parseInt(pid));
			Photo photo = photoService.findPhotoById(p);
			ServletActionContext.getRequest().setAttribute("photo", photo);
			
			return "rankPhoto";
		}

}
