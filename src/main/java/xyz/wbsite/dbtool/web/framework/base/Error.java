package xyz.wbsite.dbtool.web.framework.base;

/**
 * Error - 错误基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class Error {

    /*错误类型*/
    private ErrorType type;

    /*错误内容*/
    private String message;

    public Error(ErrorType type, String message) {
        this.type = type;
        this.message = message;
    }

    public ErrorType getType() {
        return type;
    }

    public void setType(ErrorType type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
