package cn.zhou.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class Album {

	private Integer aid;
	private String school;
	private String clzz;
	private String albumName;
	private String albumSort;
	private String albumDesc;
	private String atime;
	private String aname;
	private String aPhotoAddress;
	
	public String getaPhotoAddress() {
		return aPhotoAddress;
	}
	public void setaPhotoAddress(String aPhotoAddress) {
		this.aPhotoAddress = aPhotoAddress;
	}
	private Set<Photo> photo = new TreeSet<Photo>();

	public Set<Photo> getPhoto() {
		return photo;
	}
	public void setPhoto(Set<Photo> photo) {
		this.photo = photo;
	}
	public String getAtime() {
		return atime;
	}
	public void setAtime(String atime) {
		this.atime = atime;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
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
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getAlbumSort() {
		return albumSort;
	}
	public void setAlbumSort(String albumSort) {
		this.albumSort = albumSort;
	}
	public String getAlbumDesc() {
		return albumDesc;
	}
	public void setAlbumDesc(String albumDesc) {
		this.albumDesc = albumDesc;
	}
	@Override
	public String toString() {
		return "Album [aid=" + aid + ", school=" + school + ", clzz=" + clzz
				+ ", albumName=" + albumName + ", albumSort=" + albumSort
				+ ", albumDesc=" + albumDesc + ", time=" + atime + ", uname="
				+ aname + ", photo=" + photo + "]";
	}
	
	
	
}
