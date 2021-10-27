package models;


public class User {
	protected String email;
	protected String pwd;
	protected boolean isAdmin;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public User(String email, String pwd, boolean isAdmin) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.isAdmin = isAdmin;
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
}
