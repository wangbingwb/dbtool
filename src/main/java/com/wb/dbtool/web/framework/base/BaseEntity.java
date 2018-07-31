package com.wb.dbtool.web.framework.base;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.Date;

/**
 * Base - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */

public class BaseEntity {

    /**
     * 行版本
     */
    private long rowVersion;

    /**
     * 创建用户
     */
    private long createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 最后更新用户
     */
    private long lastUpdateBy;

    /**
     * 最后更新时间
     */
    private Date lastUpdateTime;

    /**
    * 是否删除
    */
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private boolean isDeleted;

    public boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public long getRowVersion() {
        return rowVersion;
    }

    public void setRowVersion(long rowVersion) {
        this.rowVersion = rowVersion;
    }

    public long getCreateBy() {
        return createBy;
    }

    public void setCreateBy(long createBy) {
        this.createBy = createBy;
    }

    public long getLastUpdateBy() {
        return lastUpdateBy;
    }

    public void setLastUpdateBy(long lastUpdateBy) {
        this.lastUpdateBy = lastUpdateBy;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }
}
