package cn.zhou.entity;

public class User {

	private Integer uid;
	private String username;
	private String password;
	private String phone;
	private String school;
	private String clzz;
	private String rank;
	
	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", school=" + school + ", clzz=" + clzz
				+ ", rank=" + rank + "]";
	}
	
	
	
	
}
