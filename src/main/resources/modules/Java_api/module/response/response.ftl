package ${domain}.${module}.response;

<#list importList as i>
${i}
</#list>
<#if hasList>
import ${domain}.ApiFindResponse;
<#else>
import ${domain}.ApiResponse;
</#if>

<#list annotation as i>
${i}
</#list>
public class ${className}Response extends<#if hasList> ApiFindResponse<${Tclass}> <#else> ApiResponse</#if>{
<#list body as i>
${i}
</#list>
}
