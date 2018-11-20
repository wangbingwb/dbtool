package ${basePackage}.${moduleName}.mgr;

import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.${moduleName}.rsp.*;
import ${basePackage}.framework.base.Token;

/**
 * ${table.tableComment}
 *
 * @author ${author?default("")}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public interface ${table.getCName()}Manager {
<#if table.getCreate()>

    /**
     * 插入
     *
     * @param request 请求对象
     * @param token   令牌
     * @return
     */
    ${table.getCName()}CreateResponse create(${table.getCName()}CreateRequest request, Token token);
</#if>
<#if table.getDelete()>

    /**
     * 逻辑删除
     *
     * @param request 请求对象
     * @param token   令牌
     * @return
     */
    ${table.getCName()}DeleteResponse delete(${table.getCName()}DeleteRequest request, Token token);
</#if>
<#if table.getUpdate()>

    /**
     * 更新
     *
     * @param request 请求对象
     * @param token   令牌
     * @return
     */
    ${table.getCName()}UpdateResponse update(${table.getCName()}UpdateRequest request, Token token);
</#if>
<#if table.getFind()>

    /**
     * 查询
     *
     * @param request 请求对象
     * @param token   令牌
     * @return
     */
    ${table.getCName()}FindResponse find(${table.getCName()}FindRequest request, Token token);
</#if>
<#if table.getGet()>

    /**
     * 获得对象
     *
     * @param request 请求对象
     * @param token   令牌
     * @return
     */
    ${table.getCName()}GetResponse get(${table.getCName()}GetRequest request, Token token);
</#if>
<#if table.getSearch()>

    /**
     * 模糊查询
     *
     * @param request 请求对象
     * @param token   令牌
     * @return
     */
    ${table.getCName()}SearchResponse search(${table.getCName()}SearchRequest request, Token token);
</#if>
<#if table.getGetAll()>

    /**
     * 查询所有
     *
     * @param request 请求对象
     * @param token   令牌
     * @return
     */
    ${table.getCName()}GetAllResponse getAll(${table.getCName()}GetAllRequest request, Token token);
</#if>
}
