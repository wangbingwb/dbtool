package ${basePackage}.${moduleName}.mgr;

import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.${moduleName}.rsp.*;
import ${basePackage}.framework.base.Token;

/**
 * Api接口
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2018-10-23
 */
public interface ApiManager {

    /**
     * Api#example
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    ApiExampleResponse example(ApiExampleRequest request, Token token);

}
