package ${basePackage}.${moduleName}.req;

import ${basePackage}.framework.base.BaseRequest;
import javax.validation.constraints.NotNull;

/**
 * ${table.getCName()}GetRequest - ${table.tableComment}
 *
 * @author ${author?default("")}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()}GetRequest extends BaseRequest {

    /**
     * 主键
     */
    @NotNull(message = "主键不能为空")
    private long id;

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
