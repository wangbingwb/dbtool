import com.wb.dbtool.po.Table;
import java.util.ArrayList;

public class TestTool {

    public static void main(String[] args) {
        String s = "INSERT INTO DPT_RY_JBXX (\"RYBH\", \"GMSFHM\", \"XM\", \"XMPY\", \"CYM\", \"CYMPY\", \"YWX\", \"YWM\", \"ZJZL\", \"ZJHM\", \"BMCH\", \"BMCHPY\", \"XB\", \"MZ\", \"CSRQ\", \"CSSJ\", \"CSZMBH\", \"CSDQ\", \"CSQX\", \"CSXZ\", \"JGDQ\", \"JGQX\", \"JGXZ\", \"ZJXY\", \"ZZMM\", \"WHCD\", \"HYZK\", \"BYZK\", \"SG\", \"XX\", \"SF\", \"ZC\", \"ZW\", \"ZY\", \"ZYLB\", \"FWCS\", \"LXDH\", \"ZWSP\", \"SWRQ\", \"SWZMBH\", \"GJDQ\", \"HJQH\", \"HJZRQ\", \"HJXZ\", \"XXJB\", \"RYLB\", \"RYSX\", \"RYZZBH\", \"ZWBH\", \"DNABH\", \"DJR\", \"DJSJ\", \"DJDW\", \"XZZZRQ\", \"XZZQH\", \"XZZXZ\", \"DJDWMC\", \"DJRXM\", \"XGSJ\", \"XGR\", \"XGDW\", \"XGRXM\", \"XGDWMC\", \"HJQHMC\", \"XZZQHMC\", \"RYTBBS\", \"RYCJFS\", \"SJLY\", \"TZ\") VALUES ('R32059421702060001', 'null', 'null', NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '126614', '2017-01-23 13:00:59', 'null', NULL, NULL, NULL, 'null', '王月干', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)";

        System.out.println(s.replaceAll("'null'","NULL"));


//        ArrayList<Table> tables = new ArrayList<>();
//        {
//            Table table = new Table();
//            table.setTableName("NEW TABLE");
//            tables.add(table);
//        }
//        {
//            Table table = new Table();
//            table.setTableName("NEW TABLE(1)");
//            tables.add(table);
//        }
//        {
//            Table table = new Table();
//            table.setTableName("NEW TABLE2");
//            tables.add(table);
//        }



    }

}
