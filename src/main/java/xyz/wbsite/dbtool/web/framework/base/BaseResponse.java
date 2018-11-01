package xyz.wbsite.dbtool.web.framework.base;

import java.util.ArrayList;
import java.util.List;

/**
 * BaseResponse - 基类
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2017-01-01
 */
public class BaseResponse {
    private List<Error> errors = new ArrayList();

    public void addError(Error error){
        this.errors.add(error);
    }

    public void addError(ErrorType type,String message){
        this.errors.add(new Error(type,message));
    }

    public void addErrors(List<Error> errors){
        this.errors.addAll(errors);
    }

    public boolean hasError(){
        return this.errors.size() > 0;
    }

    /**
     * 获取全部的错误信息，返回的是副本
     */
    public List<Error> getErrors() {
        return new ArrayList<Error>(errors);
    }
}
