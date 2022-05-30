package bean;

import java.io.Serializable;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class CartBean implements Serializable {
	private List<TextBean> texts = new ArrayList<TextBean>();
	private int total;

	public CartBean() {

	}

	public List<TextBean> getTexts() { // getItems→getTextsに変更
		return texts;
	}

	public void addCart(TextBean bean) {
		texts.add(bean);
		recalcTotal();
	}

	public void deleteCart(int text_id) {
		for (TextBean text : texts) {
			if (text.getText_id() == text_id) {
				texts.remove(text);
				break;
			}
		}
		recalcTotal();
	}

	public void removeCartTimerTask(CartBean cart) throws ParseException {
		Timer timer = new Timer(false);
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				for (TextBean text : cart.getTexts()) {
					texts.remove(text);
					break;
				}
				recalcTotal();
				timer.cancel();
			}
		};
		timer.schedule(task, 1800000);// 30分=1800000
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
