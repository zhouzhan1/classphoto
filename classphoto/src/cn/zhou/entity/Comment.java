package cn.zhou.entity;

public class Comment implements Comparable<Comment> {
	private Integer cid;
	private String content;
	private String ctime;
	private String uname;
	private Photo photo;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Photo getPhoto() {
		return photo;
	}
	public void setPhoto(Photo photo) {
		this.photo = photo;
	}
	@Override
	public int compareTo(Comment o) {
		if(this.cid<o.cid)
			return 1;
		
		return -1;
	}
	
	
	
	

}
