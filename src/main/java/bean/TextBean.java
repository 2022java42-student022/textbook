package bean;

public class TextBean {

	private String ISBN;
	private String title;
	private int sort_id;
	private String author;
	private int price;
	private String use;
	private String dep_name;
	private int user_id;
	
	

	public TextBean(int sort_id, String title) {
		this.sort_id = sort_id;
		this.title = title;
	}

	public TextBean() {
		// TODO 自動生成されたコンストラクター・スタブ
	}



	public TextBean(int user_id) {
		this.user_id = user_id;
	}
	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getSort_id() {
		return sort_id;
	}

	public void setSort_id(int sort_id) {
		this.sort_id = sort_id;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public String getDep_name() {
		return dep_name;
	}

	public void setDep_name(String dep_name) {
		this.dep_name = dep_name;
	}

	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}

