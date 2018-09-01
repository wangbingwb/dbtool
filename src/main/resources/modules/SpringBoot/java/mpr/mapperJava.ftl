package ${basePackage}.${moduleName}.mpr;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

import ${basePackage}.${moduleName}.ent.${table.getCName()};
import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.framework.base.Token;

/**
 * ${table.tableName} - ${table.tableComment}
 *
 * @author ${author?default("")}
 * @date ${date?string("yyyy-MM-dd")}
 */
@Mapper
public interface ${table.getCName()}Mapper {
<#if table.getCreate()>

    /**
     * 插入
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 返回数量
     */
    long insert(@Param("request") ${table.getCName()} request, @Param("token") Token token);
</#if>
<#if table.getDelete()>

    /**
     * 逻辑删除
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 返回数量
     */
    long delete(@Param("request") ${table.getCName()}DeleteRequest request, @Param("token") Token token);
</#if>
<#if table.getUpdate()>

    /**
     * 更新
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 返回数量
     */
    long update(@Param("request") ${table.getCName()}UpdateRequest request, @Param("token") Token token);
</#if>
<#if table.getFind()>

    /**
     * 查询
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 返回对象
     */
    List<${table.getCName()}> find(@Param("request") ${table.getCName()}FindRequest request, @Param("token") Token token);
</#if>
<#if table.getGet()>

    /**
     * 获得对象
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 返回对象
     */
    ${table.getCName()} get(@Param("request") ${table.getCName()}GetRequest request, @Param("token") Token token);
</#if>
<#if table.getSearch()>

    /**
     * 模糊查询
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 返回对象
     */
    List<${table.getCName()}> search(@Param("request") ${table.getCName()}SearchRequest request, @Param("token") Token token);
</#if>
<#if table.getGetAll()>

    /**
     * 获得所有
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 返回对象
     */
    List<${table.getCName()}> getAll(@Param("request") ${table.getCName()}GetAllRequest request, @Param("token") Token token);
</#if>
}
