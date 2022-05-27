import java.util.ArrayList;

import bean.TextBean;

public class sample {

	
	ArrayList<String> text_id = new ArrayList<String>;
	for (TextBean text : cart) {
		int a = dao.checkSoldOut(text);
		if (a == null) {
			text_id.add(String.valueOf(text.getText_id()));
		}
	}
	
	if (text_id.size() != 0) {
		String msg = "No." + String.join("," ,text_id) + "のテキストは売り切れています。";
		request.setAttribute("message", msg);
		gotoPage();
		return;
	}
}
