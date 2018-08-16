package ${basePackage}.${moduleName}.rsp;

import ${basePackage}.${moduleName}.ent.${table.getCName()};
import ${basePackage}.framework.base.BaseResponse;

/**
 * ${table.getCName()}GetResponse - ${table.tableComment}
 *
 * @author ${author?default("")}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()}GetResponse extends BaseResponse {

    /** ${table.tableComment} */
    private ${table.getCName()} ${table.getFName()};

    public ${table.getCName()} get${table.getCName()}(){
        return this.${table.getFName()};
    }

    public void set${table.getCName()}(${table.getCName()} ${table.getFName()}){
        this.${table.getFName()} = ${table.getFName()};
    }
}
