package ${basePackage}.${moduleName}.ent;

<#if table.has('Date')>
import java.util.Date;
</#if>
import ${basePackage}.framework.base.BaseEntity;

/**
 * ${table.tableName} - ${table.tableComment}
 *
 * @author ${author}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()} extends BaseEntity{

<#list table.fields as field>
<#if !field.isSystem || field.fieldName == 'ID'>
    /** ${field.fieldName} - ${field.fieldComment} */
    private ${field.fieldType.javaType()} ${field.getFName()};

</#if>
</#list>
<#list table.fields as field>
<#if !field.isSystem || field.fieldName == 'ID'>
    public ${field.fieldType.javaType()} ${field.getterName()}(){
        return this.${field.getFName()};
    }

    public void ${field.setterName()}(${field.fieldType.javaType()} ${field.getFName()}){
        this.${field.getFName()} = ${field.getFName()};
    }

</#if>
</#list>
}