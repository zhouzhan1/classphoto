package cn.zhou.entity;

public class IsRead implements Comparable<IsRead>{

	private Integer rid;
	private Integer informId;
	private Integer uid;
	private Integer state;
	
	private Inform inform;
	
	public Inform getInform() {
		return inform;
	}
	public void setInform(Inform inform) {
		this.inform = inform;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getInformId() {
		return informId;
	}
	public void setInformId(Integer informId) {
		this.informId = informId;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	
	@Override
	public int compareTo(IsRead o) {
		if(this.rid<o.rid)
			return 1;
		
		return -1;
	}
	
}
