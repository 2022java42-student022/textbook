package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SortDAO {

	private String url = "jdbc:postgresql:sample";
	private String user = "student";
	private String pass = "himitu";

	public SortDAO() throws DAOException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException("JDBC ドライバの登録に失敗しました。");
		}
	}

	public String findDep_name(int sort_id) throws DAOException {

		String dep_name = null;
		String sql = "SELECT * FROM sort WHERE sort_id = ?";

		try (Connection con = DriverManager.getConnection(url, user, pass);
				PreparedStatement st = con.prepareStatement(sql);) {
			st.setInt(1, sort_id);

			try (ResultSet rs = st.executeQuery();) {
				if (rs.next()) {
					dep_name = rs.getString("dep_name");
					return dep_name;
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
