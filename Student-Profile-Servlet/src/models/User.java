package models;


public class User {
	protected String email;
	protected String pwd;
	protected boolean isAdmin;
	protected String dept;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public User(String email, String pwd, boolean isAdmin,String dept) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.isAdmin = isAdmin;
		this.dept=dept;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
}
