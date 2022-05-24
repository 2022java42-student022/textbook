package bean;

public class TextBean {

	private int text_id;
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


	public TextBean(int text_id, String ISBN, String title, int sort_id, String author, int price, String use) {
		this.text_id = text_id;
		this.ISBN = ISBN;
		this.title = title;
		this.sort_id = sort_id;
		this.author = author;
		this.price = price;
		this.use = use;
	}



	public TextBean() {
		
	}
	
	public int getText_id() {
		return text_id;
	}
	public void setText_id(int text_id) {
		this.text_id = text_id;
	}



	public TextBean(int user_id) {
		this.user_id = user_id;
	}


	public TextBean(String ISBN, String title, int sort_id, String author, int price) {


		// TODO 自動生成されたコンストラクター・スタブ
		this.ISBN = ISBN;
		this.title = title;
		this.sort_id = sort_id;
		this.author = author;
		this.price = price;
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


