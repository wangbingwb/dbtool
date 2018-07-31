package ${basePackage}.${moduleName};

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import static org.junit.Assert.assertTrue;
import org.springframework.beans.factory.annotation.Autowired;
import ${basePackage}.${moduleName}.mgr.${table.getCName()}Manager;
import ${basePackage}.${moduleName}.req.*;
import ${basePackage}.${moduleName}.rsp.*;
import ${basePackage}.framework.base.Token;

/**
* ${table.getCName()}Test -  - ${table.tableComment}测试用例
*
* @author ${author?default("")}
* @version 0.0.1
* @since ${date?string("yyyy-MM-dd")}
*/
@RunWith(SpringRunner.class)
@SpringBootTest
public class ${table.getCName()}Test {

    @Autowired
    private Token token;

    @Autowired
    private ${table.getCName()}Manager ${table.getFName()}Manager;

    @Test
    public void testCreate() {
        ${table.getCName()}CreateRequest request = new ${table.getCName()}CreateRequest();
<#list table.fields as field>
<#if !field.isSystem>
<#if field.fieldType.javaType()?contains("String")>
        request.${field.setterName()}("${field.fieldComment}");
<#elseif field.fieldType.javaType()?contains("Date")>
        request.${field.setterName()}(new Date());
<#elseif field.fieldType.javaType()?contains("long")>
        request.${field.setterName()}(1L);
<#elseif field.fieldType.javaType()?contains("boolean")>
        request.${field.setterName()}(false);
</#if>
</#if>
</#list>

        ${table.getCName()}CreateResponse response = ${table.getFName()}Manager.create(request,token);

        assertTrue(!response.hasError());
    }

    @Test
    public void testDelete() {

        //创建数据
        ${table.getCName()}CreateRequest createRequest = new ${table.getCName()}CreateRequest();
<#list table.fields as field>
    <#if !field.isSystem>
        <#if field.fieldType.javaType()?contains("String")>
        createRequest.${field.setterName()}("${field.fieldComment}");
        <#elseif field.fieldType.javaType()?contains("Date")>
        createRequest.${field.setterName()}(new Date());
        <#elseif field.fieldType.javaType()?contains("long")>
        createRequest.${field.setterName()}(1L);
        <#elseif field.fieldType.javaType()?contains("boolean")>
        createRequest.${field.setterName()}(false);
        </#if>
    </#if>
</#list>

        ${table.getCName()}CreateResponse createResponse = ${table.getFName()}Manager.create(createRequest,token);

        assertTrue(!createResponse.hasError() && createResponse.getId() > 0);

        //删除数据
        ${table.getCName()}DeleteRequest request = new ${table.getCName()}DeleteRequest();
        request.setId(createResponse.getId());

        ${table.getCName()}DeleteResponse response = ${table.getFName()}Manager.delete(request,token);

        assertTrue(!response.hasError() && response.getResult() == 1L);
    }

    @Test
    public void testUpdate() {
        //创建数据
        ${table.getCName()}CreateRequest createRequest = new ${table.getCName()}CreateRequest();
<#list table.fields as field>
    <#if !field.isSystem>
        <#if field.fieldType.javaType()?contains("String")>
        createRequest.${field.setterName()}("${field.fieldComment}");
        <#elseif field.fieldType.javaType()?contains("Date")>
        createRequest.${field.setterName()}(new Date());
        <#elseif field.fieldType.javaType()?contains("long")>
        createRequest.${field.setterName()}(1L);
        <#elseif field.fieldType.javaType()?contains("boolean")>
        createRequest.${field.setterName()}(false);
        </#if>
    </#if>
</#list>

        ${table.getCName()}CreateResponse createResponse = ${table.getFName()}Manager.create(createRequest, token);

        //更新数据
        ${table.getCName()}UpdateRequest request = new ${table.getCName()}UpdateRequest();
        request.setId(createResponse.getId());
<#list table.fields as field>
    <#if !field.isSystem>
        <#if field.fieldType.javaType()?contains("String")>
        request.${field.setterName()}("${field.fieldComment}");
        <#elseif field.fieldType.javaType()?contains("Date")>
        request.${field.setterName()}(new Date());
        <#elseif field.fieldType.javaType()?contains("long")>
        request.${field.setterName()}(1L);
        <#elseif field.fieldType.javaType()?contains("boolean")>
        request.${field.setterName()}(false);
        </#if>
    </#if>
</#list>

        ${table.getCName()}UpdateResponse response = ${table.getFName()}Manager.update(request,token);

        assertTrue(!response.hasError() && response.getResult() == 1L);
    }

    @Test
    public void testFind() {
        ${table.getCName()}FindRequest request = new ${table.getCName()}FindRequest();
<#list table.fields as field>
    <#if !field.isSystem>
        <#if field.fieldType.javaType()?contains("String")>
        request.${field.setterName()}("${field.fieldComment}");
        <#elseif field.fieldType.javaType()?contains("Date")>
        request.${field.setterName()}(new Date());
        <#elseif field.fieldType.javaType()?contains("long")>
        request.${field.setterName()}(1L);
        <#elseif field.fieldType.javaType()?contains("boolean")>
        request.${field.setterName()}(false);
        </#if>
    </#if>
</#list>

        ${table.getCName()}FindResponse response = ${table.getFName()}Manager.find(request,token);

        assertTrue(!response.hasError());
    }
}
