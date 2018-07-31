package com.wb.dbtool.web.framework.base;

/**
 * BaseSearchRequest - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class BaseSearchRequest extends BaseFindRequest {

    /**
    * 模糊查询的关键字。
    */
    private String keyword;

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
