package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.MemberBean2;

public class MemberDAO {
	private String url = "jdbc:postgresql:sample";
	private String user = "student";
	private String passwd = "himitu";

	public MemberDAO() throws DAOException {
		try {
			// JDBCドライバの登録
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException("JDBCドライバの登録に失敗しました。");
		}
	}

	public MemberBean2 SearchMember(String email) throws DAOException {

		String name = null;
		String pass = null;
		int user_id = 0;

		// SQL文の作成
		String sql = "SELECT * FROM member WHERE email =?";

		try (// データベースへの接続
				Connection con = DriverManager.getConnection(url, user, passwd);
				// PreparidStatementオブジェクトの取得
				PreparedStatement st = con.prepareStatement(sql);
				// SQLの実行
				ResultSet rs = st.executeQuery();) {
			if (rs.next()) {

				name = rs.getString("name");
				email = rs.getString("email");
				pass = rs.getString("pass");
				user_id = rs.getInt("user_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
		MemberBean2 bean = new MemberBean2(name, email, pass, user_id);
		return bean;
	}

	public MemberBean2 SearchMember2(String mail) throws DAOException {
		// SQL文の作成
		String sql = "SELECT * FROM member WHERE email =?";

		try (// データベースへの接続
				Connection con = DriverManager.getConnection(url, user, passwd);
				// PreparidStatementオブジェクトの取得
				PreparedStatement st = con.prepareStatement(sql);) {

			st.setString(1, mail);
			try (// SQLの実行)
					ResultSet rs = st.executeQuery();) {
				// 結果の取得
				MemberBean2 bean = null;
				while (rs.next()) {
					String name = rs.getString("name");
					String email = rs.getString("email");
					String pass = rs.getString("pass");
					int userid = rs.getInt("user_id");
					bean = new MemberBean2(name, email, pass, userid);
				}
				// 会員情報の有無を返す
				return bean;
			}

			catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}

			// いっちせんとあかん
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}

	}

	public void addMember(MemberBean2 bean2) throws DAOException {
		String sql = "INSERT INTO member(name, email, pass) VALUES(?, ?, ?)";

		try (Connection con = DriverManager.getConnection(url, user, passwd);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, bean2.getName());
			st.setString(2, bean2.getEmail());
			st.setString(3, bean2.getPass());

			st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		}

	}

	public String searchByEmail(String mail) throws DAOException {
		String email = null;
		String sql = "SELECT * FROM member WHERE email=?";
		try (Connection con = DriverManager.getConnection(url, user, passwd);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setString(1, email);
			try (ResultSet rs = st.executeQuery();) {
				while (rs.next()) {
					email = rs.getString(email);
				}
				return email;
			} catch (SQLException e) {
				e.printStackTrace();
				throw new DAOException("レコードの取得に失敗しました。");
			}

			// いっちせんとあかん
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}

	}

	// 削除メソッド
	public int deleteByPrimaryuser(int email) throws DAOException {
		// SQL文の作成
		String sql = "DELETE FROM member WHERE user_id = ?";

		try (// データベースへの接続)
				Connection con = DriverManager.getConnection(url, user, passwd);
				// PreparedStatementオブジェクトの取得
				PreparedStatement st = con.prepareStatement(sql);) {
			// 主キーの指定
			st.setInt(1, email);
			// SQLの実行
			int rows = st.executeUpdate();
			return rows;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}

	// 変更メソッド
	public int changeByPrimaryuser( String name, String email, String pass,int user_id) throws DAOException {
		// SQL文の作成
		String sql = "UPDATE mamber SET name = ?,email = ?,pass = ? WHERE user_id = ?";

		try (// データベースへの接続)
				Connection con = DriverManager.getConnection(url, user, passwd);
				// PreparedStatementオブジェクトの取得
				PreparedStatement st = con.prepareStatement(sql);) {
			// SQLの実行
			// 主キーの指定
			st.setString(1, name);
			st.setString(2, email);
			st.setString(3, pass);
			st.setInt(4, user_id);
			// SQLの実行
			int rows = st.executeUpdate(); {
				// 結果の取得
				
			}
			
			return rows;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException("レコードの取得に失敗しました。");
		}
	}
	
}
