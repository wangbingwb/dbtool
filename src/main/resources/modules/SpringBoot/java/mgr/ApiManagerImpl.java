package ${basePackage}.${moduleName}.mgr;

import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.${moduleName}.rsp.*;
import ${basePackage}.framework.base.Token;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * ADMIN - 管理用户
 *
 * @author wangbing
 * @version 0.0.1
 * @since 2018-10-23
 */
@Transactional
@Service
public class ApiManagerImpl implements ApiManager {

    /**
     * Api#example
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    @Override
    public ApiExampleResponse example(ApiExampleRequest request, Token token) {
        return new ApiExampleResponse();
    }
}
