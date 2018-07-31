package com.wb.dbtool.web.framework.base;

import java.util.List;

/**
 * BaseFindResponse - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class BaseFindResponse<T> extends BaseResponse{

    private List<T> result;

    private Long totalCount;

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }
}
