import com.wb.dbtool.manger.DBManager;
import java.util.HashMap;

public class TestConnect {

    public static void main(String[] args) {

        HashMap<String, String> map = new HashMap();
        map.put("url","jdbc:oracle:thin:@127.0.0.1:1521:orcl");
        map.put("username","JCJ");
        map.put("password","JCJ");
        map.put("driverClassName","oracle.jdbc.driver.OracleDriver");
        boolean b = DBManager.testConnect(map);

        DBManager.loadDb(map);

        System.out.println(b);
    }

}
