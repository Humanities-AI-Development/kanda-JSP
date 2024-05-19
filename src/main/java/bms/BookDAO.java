package bms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


/**
 * 書籍管理システムDB版で使用するデータベース関連の処理をまとめたクラス
 *
 * @author KandaITSchool
 *
 */
public class BookDAO {

	/**
	 * JDBCドライバ内部のDriverクラスパス
	 */
	private static final String RDB_DRIVE = "org.mariadb.jdbc.Driver";
	/**
	 * 接続するMySQLデータベースパス
	 */
	private static final String URL = "jdbc:mariadb://localhost/mybookdb";
	/**
	 * データベースのユーザー名
	 */
	private static final String USER = "root";
	/**
	 * データベースのパスワード
	 */
	private static final String PASSWD = "NEW_PASSWORD";

	/**
	 * フィールド変数の情報を基に、DB接続をおこなうメソッド
	 *
	 * @return データベース接続情報
	 * @throws IllegalStateException メソッド内部で例外が発生した場合
	 */
	private static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(RDB_DRIVE);//ドライバ読み込み
			con = DriverManager.getConnection(URL, USER, PASSWD);//データベース接続を確立
			return con;
		} catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}

	/**
	 * DBの書籍情報を格納するbookinfoテーブルから全書籍情報を取得するメソッド
	 *
	 * @return 全書籍情報のリスト
	 * @throws IllegalStateException メソッド内部で例外が発生した場合
	 */
	public ArrayList<Book> selectAll() {//全件検索
		Connection con = null;
		Statement smt = null;
		ArrayList<Book> bookList = new ArrayList<Book>();

		try {
			con = getConnection();//DB接続
			smt = con.createStatement();//SQLを使えるようにしてる

			String sql = "SELECT * FROM bookinfo ORDER BY isbn";
			ResultSet rs = smt.executeQuery(sql);

			while (rs.next()) {
				Book book = new Book();
				book.setIsbn(rs.getString("isbn"));
				book.setTitle(rs.getString("title"));
				book.setPrice(rs.getInt("price"));
				bookList.add(book);
			}

		} catch (Exception e) {
			throw new IllegalStateException(e);
		} finally {
			if (smt != null) {
				try {
					smt.close();
				} catch (SQLException ignore) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ignore) {
				}
			}
		}
		return bookList;
	}

	//DB登録メソッド----------------------------------------------------
	public int insert(Book book){

		Connection con = null;
		Statement smt = null;

		int count = 0;

		//登録するためのSQL文
		String sql = "insert into bookinfo values('"
				+book.getIsbn()+"','"
				+book.getTitle()+"','"
				+book.getPrice()+"')";		 
		try{
			con = getConnection();//DB接続
			smt = con.createStatement();//SQLを使えるようにしてる
			count = smt.executeUpdate(sql);//SQL実行


		}catch(Exception e){
			throw new IllegalStateException(e);
		}finally{
			if( smt != null ){
				try{smt.close();}catch(SQLException ignore){}
			}
			if( con != null ){
				try{con.close();}catch(SQLException ignore){}
			}
		}return count;
	}
	
	
	//詳細画面表示----------------------------------------------------
	public Book selectByIsbn(String isbn){
		 
		  Connection con = null;
		  Statement smt = null;
		 
		  Book book = new Book();
		  String sql = "select * from bookinfo where isbn='"+isbn+"'";
		 
		  try{
			  con = getConnection();//DB接続
			  smt = con.createStatement();//SQLを使えるようにしてる
			  ResultSet rs = smt.executeQuery(sql);//SQL実行
			  
			  if(rs.next()) {
				  book.setIsbn(rs.getString("isbn"));
				  book.setTitle(rs.getString("title"));
				  book.setPrice(Integer.parseInt(rs.getString("price")));
			  }			  
		  }catch(Exception e){
		      throw new IllegalStateException(e);
		  }finally{
		      if( smt != null ){
		        try{smt.close();}catch(SQLException ignore){}
		      }
		      if( con != null ){
		        try{con.close();}catch(SQLException ignore){}
		      }
		  }
		  return book;//1件のデータが格納されたBook型インスタンス
		}
	//削除処理----------------------------------------------------

	public void delete(String isbn){		
		  Connection con = null;
		  Statement smt = null;
		  Book book = new Book();
		  String sql = "delete from bookinfo where isbn='"+isbn+"'";//削除SQL
		  int count = 0;
		 
		  try{
			  con = getConnection();//DB接続
			  smt = con.createStatement();//SQLを使えるようにしてる
			  count = smt.executeUpdate(sql);//SQL実行
			  
		 
		  }catch(Exception e){
		     throw new IllegalStateException(e);
		  }finally{
		     if( smt != null ){
		        try{smt.close();}catch(SQLException ignore){}
		    }
		     if( con != null ){
		        try{con.close();}catch(SQLException ignore){}
		    }
		  }
		}
}
