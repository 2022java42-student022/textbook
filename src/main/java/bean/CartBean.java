package bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CartBean implements Serializable {
	private List<TextBean> texts = new ArrayList<TextBean>();
	private int total;

	public CartBean() {

	}

	public List<TextBean> getItems() {
		return texts;
	}

	public void addCart(TextBean bean) {
		texts.add(bean);
		recalcTotal();
	}

	public void deleteCart(int text_id) {
		for (TextBean text : texts) {
			if (text.getCode() == text_id) {
				texts.remove(text);
				break;
			}
		}
		recalcTotal();
	}

	public int getTotal() {
		return total;
	}

	public void recalcTotal() {
		total = 0;
		for (TextBean text : texts) {
			total += text.getPrice();
		}
	}
}
