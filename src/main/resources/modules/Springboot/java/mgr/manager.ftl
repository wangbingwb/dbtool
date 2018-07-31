package ${basePackage}.${moduleName}.mgr;

import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.${moduleName}.rsp.*;
import ${basePackage}.framework.base.Token;

/**
 * ${table.tableComment}
 *
 * @author ${author}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public interface ${table.getCName()}Manager {

    /**
    * 插入
    *
    * @param request 请求对象
    * @param token 令牌
    * @return 返回数量
    */
    ${table.getCName()}CreateResponse create(${table.getCName()}CreateRequest request, Token token);

    /**
    * 逻辑删除
    *
    * @param request 请求对象
    * @param token 令牌
    * @return 返回数量
    */
    ${table.getCName()}DeleteResponse delete(${table.getCName()}DeleteRequest request, Token token);

    /**
    * 更新
    *
    * @param request 请求对象
    * @param token 令牌
    * @return
    */
    ${table.getCName()}UpdateResponse update(${table.getCName()}UpdateRequest request, Token token);

    /**
    * 查询
    *
    * @param request 请求对象
    * @param token 令牌
    * @return
    */
    ${table.getCName()}FindResponse find(${table.getCName()}FindRequest request, Token token);

    /**
    * 模糊查询
    *
    * @param request 请求对象
    * @param token 令牌
    * @return
    */
    ${table.getCName()}SearchResponse search(${table.getCName()}SearchRequest request, Token token);

    /**
    * 查询所有
    *
    * @param request 请求对象
    * @param token 令牌
    * @return
    */
    ${table.getCName()}GetAllResponse getAll(${table.getCName()}GetAllRequest request, Token token);

    /**
    * 获得对象
    *
    * @param request 请求对象
    * @param token 令牌
    * @return
    */
    ${table.getCName()}GetResponse get(${table.getCName()}GetRequest request, Token token);
}
