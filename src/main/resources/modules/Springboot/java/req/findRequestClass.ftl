package ${basePackage}.${moduleName}.req;

import ${basePackage}.framework.base.BaseFindRequest;
<#if table.has('Date')>
import java.util.Date;
</#if>

/**
 * ${table.getCName()}Request -  ${table.tableComment}
 *
 * @author ${author}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()}FindRequest extends BaseFindRequest{

<#list table.fields as field>
<#if field.isQuery>
    /** ${field.fieldComment?default("")} */
    private ${field.fieldType.javaType()} ${field.getFName()};

</#if>
</#list>
<#list table.fields as field>
<#if field.isQuery>
    public ${field.fieldType.javaType()} ${field.getterName()}(){
        return this.${field.getFName()};
    }

    public void ${field.setterName()}(${field.fieldType.javaType()} ${field.getFName()}){
        this.${field.getFName()} = ${field.getFName()};
    }

</#if>
</#list>
}
