package ${basePackage}.${moduleName}.rsp;

import ${basePackage}.framework.base.BaseResponse;

/**
 * ${table.getCName()}CreateResponse - ${table.tableComment}
 *
 * @author ${author}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()}CreateResponse extends BaseResponse {

    /** ID */
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
