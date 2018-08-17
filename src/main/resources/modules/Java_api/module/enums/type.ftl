package ${domain}.${module}.enums;

<#list annotation as i>
${i}
</#list>
public enum ${className} {
<#list body as i>
${i}
</#list>
}