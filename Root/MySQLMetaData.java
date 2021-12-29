import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class MySQLMetaData {

  public static void main(String[] args) throws Exception {
    Connection conn = getMySqlConnection();
    System.out.println("Got Connection.");
    Statement st = conn.createStatement();
    /*st.executeUpdate("drop table survey;");
    st.executeUpdate("create table survey (id int,name varchar(30));");
    st.executeUpdate("insert into survey (id,name ) values (1,'nameValue')");*/

    ResultSet rsColumns = null;
    DatabaseMetaData meta = conn.getMetaData();
    rsColumns = meta.getColumns(null, null, "user_details", null);
    while (rsColumns.next()) {
      System.out.println(rsColumns.getString("TYPE_NAME"));
      System.out.println(rsColumns.getString("COLUMN_NAME"));
      System.out.println(rsColumns.getString(3));
      System.out.println(rsColumns.getString(7));
      System.out.println(rsColumns.getString(11));
      System.out.println(rsColumns.getString(18));
    }
    ResultSet result = meta.getPrimaryKeys(
    null, null, "user_details");

while(result.next()){
    String columnName = result.getString(4);
    System.out.println(columnName);
}
    st.close();
    conn.close();
  }

  private static Connection getHSQLConnection() throws Exception {
    Class.forName("org.hsqldb.jdbcDriver");
    System.out.println("Driver Loaded.");
    String url = "jdbc:hsqldb:data/tutorial";
    return DriverManager.getConnection(url, "sa", "");
  }

  public static Connection getMySqlConnection() throws Exception {
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/jdbc";
    String username = "root";
    String password = "rttcadmin";

    Class.forName(driver);
    Connection conn = DriverManager.getConnection(url, username, password);
    return conn;
  }

  public static Connection getOracleConnection() throws Exception {
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:caspian";
    String username = "mp";
    String password = "mp2";

    Class.forName(driver); // load Oracle driver
    Connection conn = DriverManager.getConnection(url, username, password);
    return conn;
  }

}
