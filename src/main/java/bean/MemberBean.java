package bean;

import java.io.Serializable;

public class MemberBean implements Serializable {
	private String name;
	private String email;
	private String pass;
	private String address;
	private String tel;
	private String pay;

	private int user_id;
  
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


	public int getTel_no() {
		return tel_no;
	}

	public void setTel_no(int tel_no) {
		this.tel_no = tel_no;

	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getUser_id() {
		return name;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}