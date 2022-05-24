package bean;

import java.io.Serializable;

public class OrderCheckBean implements Serializable {
	private String name;
	private String address;
	private String tel;
	private String mail;
	private String pay;
	
	public OrderCheckBean(String name, String address, String tel, String mail, String pay) {
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.mail = mail;
		this.pay = pay;
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

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}
	
	
}
