package ${basePackage}.${moduleName}.req;

import ${basePackage}.framework.base.BaseSearchRequest;
<#if table.has('Date')>
import java.util.Date;
</#if>

/**
 * ${table.getCName()}Request -  ${table.tableComment?default("")}
 *
 * @author ${author?default("")}
 * @version 0.0.1
 * @since ${date?string("yyyy-MM-dd")}
 */
public class ${table.getCName()}SearchRequest extends BaseSearchRequest{
}
