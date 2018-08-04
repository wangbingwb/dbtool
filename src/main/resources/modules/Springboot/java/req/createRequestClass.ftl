package ${basePackage}.${moduleName}.req;

import ${basePackage}.framework.base.BaseRequest;
<#if table.has('Date')>
import java.util.Date;
</#if>
import javax.validation.constraints.NotNull;
import javax.validation.constraints.NotEmpty;
import org.hibernate.validator.constraints.Length;

/**
 * ${table.tableName}CreateRequest - ${table.tableComment}
 *
 * @author ${author}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()}CreateRequest extends BaseRequest{

<#list table.fields as field>
<#if !field.isSystem>
    /** ${field.fieldComment?default("")} */
<#if field.fieldType?contains("String")>
<#if field.fieldType != 'String_super'>
    @Length(min = 0, max = ${field.fieldLenght}, message = "${field.fieldComment?default("")}长度不合法(0-${field.fieldLenght})")
</#if>
<#if field.isMust>
    @NotEmpty(message = "${field.fieldComment?default("")}不能为空字符")
    @NotNull(message = "${field.fieldComment?default("")}不能为NULL")
</#if>
<#else>
<#if field.isMust>
    @NotNull(message = "${field.fieldComment?default("")}不能为NULL")
</#if>
</#if>
    private ${field.fieldType.javaType()} ${field.getFName()};

</#if>
</#list>
<#list table.fields as field>
<#if !field.isSystem>
    public ${field.fieldType.javaType()} ${field.getterName()}(){
        return this.${field.getFName()};
    }

    public void ${field.setterName()}(${field.fieldType.javaType()} ${field.getFName()}){
        this.${field.getFName()} = ${field.getFName()};
    }

</#if>
</#list>
}
