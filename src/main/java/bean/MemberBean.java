package bean;

import java.io.Serializable;

public class MemberBean implements Serializable {
	private String name;
	private String email;
	private String pass;
	private String address;
	private String tel;
	private String pay;
	
	public MemberBean(String name, String email, String pass, String address, String tel, String pay) {
		this.name = name;
		this.email = email;
		this.pass = pass;
		this.address = address;
		this.tel = tel;
		this.pay = pay;
	}
	
	public MemberBean() {
		
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	
}