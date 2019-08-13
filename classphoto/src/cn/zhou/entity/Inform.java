package cn.zhou.entity;

import java.util.Set;
import java.util.TreeSet;

public class Inform {

	private Integer informId;
	private String uname;
	private String title;
	private String content;
	private String school;
	private String clzz;
	private String itime;
	
	private Set<IsRead> read = new TreeSet<IsRead>();
	
	
	
	public Set<IsRead> getRead() {
		return read;
	}
	public void setRead(Set<IsRead> read) {
		this.read = read;
	}
	public Integer getInformId() {
		return informId;
	}
	public void setInformId(Integer informId) {
		this.informId = informId;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
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
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getClzz() {
		return clzz;
	}
	public void setClzz(String clzz) {
		this.clzz = clzz;
	}
	
	public String getItime() {
		return itime;
	}
	public void setItime(String itime) {
		this.itime = itime;
	}

	
	@Override
	public String toString() {
		return "Inform [informId=" + informId + ", uname=" + uname + ", title="
				+ title + ", content=" + content + ", school=" + school
				+ ", clzz=" + clzz + ", time=" + itime + "]";
	}
	
	
	
}
