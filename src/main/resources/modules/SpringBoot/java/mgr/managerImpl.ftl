package ${basePackage}.${moduleName}.mgr;

import ${basePackage}.framework.utils.IDgenerator;
import ${basePackage}.framework.utils.Message;
import ${basePackage}.framework.base.ErrorType;
import ${basePackage}.framework.base.Token;
import ${basePackage}.framework.utils.MapperUtil;
import ${basePackage}.framework.utils.ValidationUtil;
import ${basePackage}.${moduleName}.ent.${table.getCName()};
import ${basePackage}.${moduleName}.mpr.${table.getCName()}Mapper;
import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.${moduleName}.rsp.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * ${table.tableName} - ${table.tableComment}
 *
 * @author ${author?default("")}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
@Transactional
@Service
public class ${table.getCName()}ManagerImpl implements ${table.getCName()}Manager {

    @Autowired
    private ${table.getCName()}Mapper ${table.getFName()}Mapper;
<#if table.getCreate()>

    /**
     * 插入
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    public ${table.getCName()}CreateResponse create(${table.getCName()}CreateRequest request, Token token) {
        ${table.getCName()}CreateResponse response = new ${table.getCName()}CreateResponse();

        ValidationUtil.validate(request, response);
        if (response.hasError()) {
            return response;
        }

        long id = IDgenerator.nextId();

        ${table.getCName()} entity = MapperUtil.map(request, ${table.getCName()}.class);
        entity.setId(id);

        long result = ${table.getFName()}Mapper.insert(entity, token);
        if (1L != result) {
            response.addError(ErrorType.BUSINESS_ERROR, Message.CREATE_FAILURE);
            return response;
        }
        response.setId(id);

        return response;
    }
</#if>
<#if table.getDelete()>

    /**
     * 逻辑删除
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    public ${table.getCName()}DeleteResponse delete(${table.getCName()}DeleteRequest request, Token token) {
        ${table.getCName()}DeleteResponse response = new ${table.getCName()}DeleteResponse();

        ValidationUtil.validate(request, response);
        if (response.hasError()) {
            return response;
        }

        long result = ${table.getFName()}Mapper.delete(request, token);
        if (1L != result) {
            response.addError(ErrorType.BUSINESS_ERROR, Message.DELETE_FAILURE);
            return response;
        }
        response.setResult(result);

        return response;
    }
</#if>
<#if table.getUpdate()>

    /**
     * 更新
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    public ${table.getCName()}UpdateResponse update(${table.getCName()}UpdateRequest request, Token token) {
        ${table.getCName()}UpdateResponse response = new ${table.getCName()}UpdateResponse();

        ValidationUtil.validate(request, response);
        if (response.hasError()) {
            return response;
        }

        long result = ${table.getFName()}Mapper.update(request, token);
        if (1L != result) {
            response.addError(ErrorType.BUSINESS_ERROR, Message.UPDATE_FAILURE);
            return response;
        }
        response.setResult(result);

        return response;
    }
</#if>
<#if table.getFind()>

    /**
     * 查询
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    @Transactional(readOnly = true)
    public ${table.getCName()}FindResponse find(${table.getCName()}FindRequest request, Token token) {
        ${table.getCName()}FindResponse response = new ${table.getCName()}FindResponse();

        ValidationUtil.validate(request, response);
        if (response.hasError()) {
            return response;
        }

        PageHelper.startPage(request.getPageNumber(), request.getPageSize());
        if (StringUtil.isNotEmpty(request.getSortKey())) {
            PageHelper.orderBy(request.getSortKey() + " " + request.getSortType());
        }
        PageInfo<${table.getCName()}> pageInfo = new PageInfo<>(${table.getFName()}Mapper.find(request, token));

        response.setResult(pageInfo.getList());
        response.setTotalCount(pageInfo.getTotal());

        return response;
    }
</#if>
<#if table.getGet()>

    /**
     * 获得对象
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    @Transactional(readOnly = true)
    public ${table.getCName()}GetResponse get(${table.getCName()}GetRequest request, Token token) {
        ${table.getCName()}GetResponse response = new ${table.getCName()}GetResponse();

        ValidationUtil.validate(request, response);
        if (response.hasError()) {
            return response;
        }

        ${table.getCName()} po = ${table.getFName()}Mapper.get(request, token);

        if (po != null) {
            response.set${table.getCName()}(po);
        } else {
            response.addError(ErrorType.BUSINESS_ERROR, Message.GET_FAILURE);
        }

        return response;
    }
</#if>
<#if table.getSearch()>

    /**
     * 模糊查询
     *
     * @param request 请求对象
     * @param token   令牌
     * @return 响应
     */
    @Transactional(readOnly = true)
    public ${table.getCName()}SearchResponse search(${table.getCName()}SearchRequest request, Token token) {
	    ${table.getCName()}SearchResponse response = new ${table.getCName()}SearchResponse();

        ValidationUtil.validate(request, response);
        if (response.hasError()) {
            return response;
        }

        PageHelper.startPage(request.getPageNumber(), request.getPageSize());
        if (StringUtil.isNotEmpty(request.getSortKey())) {
            PageHelper.orderBy(request.getSortKey() + " " + request.getSortType());
        }
        PageInfo<${table.getCName()}> pageInfo = new PageInfo<>(${table.getFName()}Mapper.search(request, token));

        response.setResult(pageInfo.getList());
        response.setTotalCount(pageInfo.getTotal());

        return response;
    }
</#if>
<#if table.getGetAll()>

    /**
    * 查询所有
    *
    * @param request 请求对象
    * @param token   令牌
    * @return 响应
    */
    @Transactional(readOnly = true)
    public ${table.getCName()}GetAllResponse getAll(${table.getCName()}GetAllRequest request, Token token) {
        ${table.getCName()}GetAllResponse response = new ${table.getCName()}GetAllResponse();

        ValidationUtil.validate(request, response);
        if (response.hasError()) {
            return response;
        }

        PageHelper.startPage(1, 0);
        if (StringUtil.isNotEmpty(request.getSortKey())) {
            PageHelper.orderBy(request.getSortKey() + " " + request.getSortType());
        }
        PageInfo<${table.getCName()}> pageInfo = new PageInfo<>(${table.getFName()}Mapper.getAll(request, token));

        response.setResult(pageInfo.getList());
        response.setTotalCount(pageInfo.getTotal());

        return response;
    }
</#if>
}
