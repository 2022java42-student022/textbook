package bean;

import java.text.ParseException;
import java.util.HashSet;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

public class AppCartBean {
	private Set<Integer> app_cart = new HashSet<Integer>();

	public AppCartBean() {

	}

	public Set<Integer> getApp_cart() {
		return app_cart;
	}

	public boolean addApp_cart(Integer app_text_id) {
		return app_cart.add(app_text_id);
	}

	public void removeApp_cart(Integer app_text_id) {
		app_cart.remove(app_text_id);
	}

	public void removeApp_cartTimerTask(CartBean cart) throws ParseException {
		Timer timer = new Timer(false);
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				for (TextBean text : cart.getTexts()) {
					app_cart.remove(Integer.valueOf(text.getText_id()));
					break;
				}
				timer.cancel();
			}
		};
		timer.schedule(task, 1800000);
	}

}
