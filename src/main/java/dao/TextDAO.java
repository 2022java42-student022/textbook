package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import bean.TextBean;


public class TextDAO {
	private String url = "jdbc:postgresql:sample";
	private String user = "student";
	private String pass = "himitu";
	
	public TextDAO() throws DAOException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException("JDBC ドライバの登録に失敗しました。");
		}
	}
	
	public List<TextBean> findAllCategory(TextBean bean) throws DAOException {
		String sql ="INSERT INTO text(ISBN,title,sort_id,author,price,use) VALUES(?,?,?,?,?,?)";
		
		try(
				Connection con = DriverManager.getConnection(url,user,pass);
				PreparedStatement st = con.prepareStatement(sql);) {
				st.setString(1,bean.getISBN());
				st.setString(2,bean.getTitle());
				st.setInt(3,bean.getSort_id());
				st.setString(4,bean.getAuthor());
				st.setInt(5,bean.getPrice());
				st.setString(6,bean.getUse());

				st.executeUpdate(); 
		} 
			catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}
}
