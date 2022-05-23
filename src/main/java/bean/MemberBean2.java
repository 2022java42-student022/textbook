package bean;

public class MemberBean2 {
	private String name;
	private String email;
	private String pass;
	private int user_id;
	
	public MemberBean2 (String name,String email,String pass, int user_id) {
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.user_id = user_id;
	}
	public MemberBean2() {
		
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getUser_id() {
	return user_id;
	}
	public void setUser_id(int user_id) {
	this.user_id = user_id;
	}

}
