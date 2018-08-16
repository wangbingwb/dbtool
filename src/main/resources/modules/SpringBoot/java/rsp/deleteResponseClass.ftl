package ${basePackage}.${moduleName}.rsp;

import ${basePackage}.framework.base.BaseResponse;

/**
 * ${table.getCName()}DeleteResponse - ${table.tableComment}
 *
 * @author ${author?default("")}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()}DeleteResponse extends BaseResponse {

    /** 删除数目 */
    private Long result;

    public Long getResult() {
        return this.result;
    }

    public void setResult(Long result) {
        this.result = result;
    }
}
