package cn.zhou.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class Photo implements Comparable<Photo> {
	
	public Integer pid;
	public String address;
	public String ptime;
	public String pname;
	public Album album;
	public Integer praise;
	public Integer trample;
	public Integer mask;
	
	public Integer getMask() {
		return mask;
	}
	public void setMask(Integer mask) {
		this.mask = mask;
	}
	private Set<Comment> comment = new TreeSet<Comment>();	
	
	
	
	public Set<Comment> getComment() {
		return comment;
	}
	public void setComment(Set<Comment> comment) {
		this.comment = comment;
	}
	public Integer getTrample() {
		return trample;
	}
	public void setTrample(Integer trample) {
		this.trample = trample;
	}
	public Integer getPraise() {
		return praise;
	}
	public void setPraise(Integer praise) {
		this.praise = praise;
	}
	
	public Album getAlbum() {
		return album;
	}
	public void setAlbum(Album album) {
		this.album = album;
	}

	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getPtime() {
		return ptime;
	}
	public void setPtime(String ptime) {
		this.ptime = ptime;
	}
	
	
	
	@Override
	public String toString() {
		return "Photo [pid=" + pid + ", address=" + address + ", time=" + ptime
				+ ", uname=" + pname + ", albumName="  +", praise="+praise+", mask="+mask+ "]";
	}
	@Override
	public int compareTo(Photo o) {
		// TODO Auto-generated method stub
		if(this.pid>o.getPid())
			return 1;
		return -1;
	}
	
	
	
	

}
