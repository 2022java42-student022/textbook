package bean;

import java.io.Serializable;

public class OrderCheckBean implements Serializable {
	private String name;
	private String address;
	private String tel;
	private String email;
	private String pay;
	private int user_id;
	
	public OrderCheckBean(String name, String address, String tel, String email, String pay, int user_id) {
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.pay = pay;
		this.user_id = user_id;
	}
	
	public OrderCheckBean() {
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
}
