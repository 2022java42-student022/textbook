package bean;

import java.util.ArrayList;
import java.util.List;

public class CartBean {
	private List<TextBean> text = new ArrayList<TextBean>();
	private int total;
	
	public List<TextBean> getText() {
		return text;
	}
	public void setText(List<TextBean> text) {
		this.text = text;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	

}
