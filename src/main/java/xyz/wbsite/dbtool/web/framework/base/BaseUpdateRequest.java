package xyz.wbsite.dbtool.web.framework.base;

/**
 * BaseUpdateRequest - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class BaseUpdateRequest extends BaseRequest{

    /**
    * 版本戳
    */
    private long rowVersion;

    public long getRowVersion() {
        return rowVersion;
    }

    public void setRowVersion(long rowVersion) {
        this.rowVersion = rowVersion;
    }
}