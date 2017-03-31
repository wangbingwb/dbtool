package com.wb.dbtool.tool;

public class Info {
    static DBInfo orcle = new DBInfo();

    static {
        orcle.url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
        orcle.userName = "userName";
        orcle.password = "";
        orcle.driver = "oracle.jdbc.OracleDriver";
    }

}
class DBInfo{
    String url;
    String userName;
    String password;
    String driver;
}
