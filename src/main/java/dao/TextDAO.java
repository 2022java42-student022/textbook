package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

	public void RegisterAllCategory(TextBean bean) throws DAOException {
		String sql = "INSERT INTO text(ISBN,sort_id,title,author,price,use) VALUES(?,?,?,?,?,?)";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, bean.getISBN());
			st.setInt(3,bean.getSort_id());
			st.setString(2, bean.getTitle());
			st.setString(4, bean.getAuthor());
			st.setInt(5, bean.getPrice());
			st.setString(6, bean.getUse());

			st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findAll() throws DAOException {
		String sql ="SELECT * FROM text";

		try(
				Connection con = DriverManager.getConnection(url,user,pass);
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery();) {
			List<TextBean> list = new ArrayList<TextBean>();
			while(rs.next()) {
				int sort_id = rs.getInt("sort_id");
				String title = rs.getString("title");
				TextBean bean = new TextBean(sort_id,title);
				list.add(bean);
			} return list;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}
		
		
		public List<TextBean> findByTitle(String text_title) throws DAOException {
			String sql ="SELECT * FROM text WHERE title = ?";

			try(
					Connection con = DriverManager.getConnection(url,user,pass);
					PreparedStatement st = con.prepareStatement(sql);) {
						st.setString(1, text_title);
						try(
								ResultSet rs = st.executeQuery();) {
							List<TextBean> list = new ArrayList<TextBean>();
							while(rs.next()) {
								int sort_id = rs.getInt("sort_id");
								String title = rs.getString("title");
								TextBean bean = new TextBean(sort_id,title);
								list.add(bean);	
							} return list;
						} catch (SQLException e) {
							e.printStackTrace();
							throw new DAOException("レコードの取得に失敗しました。");

						}
					}catch (SQLException e) {
						e.printStackTrace();
						throw new DAOException("レコードの取得に失敗しました。");
					}
		}	
					
		public List<TextBean> findBySort_id(int text_sort_id) throws DAOException {
			String sql ="SELECT * FROM text WHERE sort_id = ?";
			
			try(
					Connection con = DriverManager.getConnection(url,user,pass);
					PreparedStatement st = con.prepareStatement(sql);) {
						st.setInt(1,text_sort_id);
						try(
								ResultSet rs = st.executeQuery();) {
							List<TextBean> list = new ArrayList<TextBean>();
							while(rs.next()) {
								int sort_id = rs.getInt("sort_id");
								String title = rs.getString("title");
								TextBean bean = new TextBean(sort_id,title);
								list.add(bean);	
							} return list;
						} catch (SQLException e) {
							e.printStackTrace();
							throw new DAOException("レコードの取得に失敗しました。");

						}
					}catch (SQLException e) {
						e.printStackTrace();
						throw new DAOException("レコードの取得に失敗しました。");
					}
		}
	}
