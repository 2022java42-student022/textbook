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
		String sql = "INSERT INTO text(ISBN,sort_id,title,author,price,use,user_id) VALUES(?,?,?,?,?,?,?)";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, bean.getISBN());
			st.setInt(2, bean.getSort_id());
			st.setString(3, bean.getTitle());
			st.setString(4, bean.getAuthor());
			st.setInt(5, bean.getPrice());
			st.setString(6, bean.getUse());
			st.setInt(7, bean.getUser_id());
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findAllMember() throws DAOException {
		String sql = "SELECT * FROM text EXCEPT SELECT * FROM text WHERE soldout = 1";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery();) {
			List<TextBean> list = new ArrayList<TextBean>();
			while (rs.next()) {
				int text_id = rs.getInt("text_id");
				int ISBN = rs.getInt("ISBN");
				String title = rs.getString("title");
				int sort_id = rs.getInt("sort_id");
				SortDAO sortDAO = new SortDAO();
				String dep_name = sortDAO.findDep_name(sort_id);
				String author = rs.getString("author");
				int price = rs.getInt("price");
				String use = rs.getString("use");
				TextBean bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
				list.add(bean);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findAllMg() throws DAOException {
		String sql = "SELECT * FROM text";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery();) {
			List<TextBean> list = new ArrayList<TextBean>();
			while (rs.next()) {
				int text_id = rs.getInt("text_id");
				int ISBN = rs.getInt("ISBN");
				String title = rs.getString("title");
				int sort_id = rs.getInt("sort_id");
				SortDAO sortDAO = new SortDAO();
				String dep_name = sortDAO.findDep_name(sort_id);
				String author = rs.getString("author");
				int price = rs.getInt("price");
				String use = rs.getString("use");
				TextBean bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
				list.add(bean);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findByTitleMember(String text_title) throws DAOException {
		String sql = "SELECT * FROM text WHERE title = ? EXCEPT SELECT * FROM text WHERE soldout = 1";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, text_title);
			try (ResultSet rs = st.executeQuery();) {
				List<TextBean> list = new ArrayList<TextBean>();
				while (rs.next()) {
					int text_id = rs.getInt("text_id");
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					TextBean bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
					list.add(bean);
				}
				return list;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");

			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findByTitleMg(String text_title) throws DAOException {
		String sql = "SELECT * FROM text WHERE title = ?";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, text_title);
			try (ResultSet rs = st.executeQuery();) {
				List<TextBean> list = new ArrayList<TextBean>();
				while (rs.next()) {
					int text_id = rs.getInt("text_id");
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					TextBean bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
					list.add(bean);
				}
				return list;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");

			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findBySort_idMember(int text_sort_id) throws DAOException {
		String sql = "SELECT * FROM text WHERE sort_id = ? EXCEPT SELECT * FROM text WHERE soldout = 1";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, text_sort_id);
			try (ResultSet rs = st.executeQuery();) {
				List<TextBean> list = new ArrayList<TextBean>();
				while (rs.next()) {
					int text_id = rs.getInt("text_id");
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					TextBean bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
					list.add(bean);
				}
				return list;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");

			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findBySort_idMg(int text_sort_id) throws DAOException {
		String sql = "SELECT * FROM text WHERE sort_id = ?";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, text_sort_id);
			try (ResultSet rs = st.executeQuery();) {
				List<TextBean> list = new ArrayList<TextBean>();
				while (rs.next()) {
					int text_id = rs.getInt("text_id");
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					TextBean bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
					list.add(bean);
				}
				return list;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");

			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	public List<TextBean> findByUser_id(int user_id) throws DAOException {
		String sql = "SElECT * FROM text WHERE user_id = ? EXCEPT SELECT * FROM text WHERE soldout = 1";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, user_id);
			try (ResultSet rs = st.executeQuery();) {
				List<TextBean> list = new ArrayList<TextBean>();
				while (rs.next()) {
					int text_id = rs.getInt("text_id");
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					TextBean bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
					list.add(bean);
				}
				return list;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");

		}
	}

	public TextBean preChange(TextBean bean, int text_id) throws DAOException {
		String sql = "SElECT * FROM text WHERE text_id = ?";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, text_id);
			try (ResultSet rs = st.executeQuery();) {
				while (rs.next()) {
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
				}
				return bean;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");

		}
	}

	public int changeText(TextBean bean) throws DAOException {
		String sql = "UPDATE text SET ISBN = ?,title = ?,sort_id = ?,author = ?,price = ?,use = ? WHERE text_id = ?";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, bean.getISBN());
			st.setString(2, bean.getTitle());
			st.setInt(3, bean.getSort_id());
			st.setString(4, bean.getAuthor());
			st.setInt(5, bean.getPrice());
			st.setString(6, bean.getUse());
			st.setInt(7, bean.getText_id());
			int rows = st.executeUpdate();
			return rows;

		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");

		}
	}

	public TextBean preDeleteByText_id(int text_id) throws DAOException {
		String sql = "SElECT * FROM text WHERE text_id = ?";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, text_id);
			try (ResultSet rs = st.executeQuery();) {
				TextBean bean = null;
				while (rs.next()) {
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					bean = new TextBean(text_id, ISBN, title, sort_id, dep_name, author, price, use);
				}
				return bean;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");

		}
	}

	public List<TextBean> deleteByText_id(int text_id) throws DAOException {
		String sql = "DELETE FROM text WHERE text_id = ?";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			List<TextBean> list = new ArrayList<TextBean>();
			st.setInt(1, text_id);
			st.executeUpdate();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");

		}

	}

	public TextBean findByTextID(int id) throws DAOException {
		String sql = "SELECT * FROM text WHERE text_id = ?";
		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, id);
			try (ResultSet rs = st.executeQuery();) {
				if (rs.next()) {
					int text_id = rs.getInt("text_id");
					int user_id = rs.getInt("user_id");
					int sort_id = rs.getInt("sort_id");
					SortDAO sortDAO = new SortDAO();
					String dep_name = sortDAO.findDep_name(sort_id);
					int ISBN = rs.getInt("ISBN");
					String title = rs.getString("title");
					String author = rs.getString("author");
					int price = rs.getInt("price");
					String use = rs.getString("use");
					TextBean bean = new TextBean(text_id, user_id, ISBN, title, sort_id, dep_name, author, price, use);
					return bean;

				} else {
					return null;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}
}
