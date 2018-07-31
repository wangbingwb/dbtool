package com.wb.dbtool.javafx.tool;

public class Info {
    static DBInfo orcle = new DBInfo();
    static DBInfo mysql = new DBInfo();

    static {
        orcle.url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
        orcle.userName = "userName";
        orcle.password = "";
        orcle.driver = "oracle.jdbc.OracleDriver";
        mysql.url = "jdbc:mysql://119.23.203.111:3306/test";
        mysql.userName = "userName";
        mysql.password = "";
        mysql.driver = "com.mysql.jdbc.Driver";
    }

}
class DBInfo{
    String url;
    String userName;
    String password;
    String driver;
}
