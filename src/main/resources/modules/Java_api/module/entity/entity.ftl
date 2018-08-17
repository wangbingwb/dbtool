package ${domain}.${module}.entity;

<#list importList as i>
${i}
</#list>
import ${domain}.ApiEntity;

<#list annotation as i>
${i}
</#list>
public class ${className} extends ApiEntity{
<#list body as i>
${i}
</#list>
}