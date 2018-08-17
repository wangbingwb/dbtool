package ${domain}.${module}.request;

<#list importList as i>
${i}
</#list>
import ${domain}.${module}.response.${className}Response;
<#if findOrSearchflag == '0'>
import ${domain}.ApiRequest;
<#elseif findOrSearchflag=='1'>
import ${domain}.ApiFindRequest;
<#elseif findOrSearchflag=='2'>
import ${domain}.ApiSearchRequest;
</#if>

<#list annotation as i>
${i}
</#list>
public class ${className}Request <#if findOrSearchflag == '0'>implements ApiRequest<#elseif findOrSearchflag=='1'>extends ApiFindRequest<#elseif findOrSearchflag=='2'>extends ApiSearchRequest</#if><${className}Response> {
<#list body as i>
${i}
</#list>
    public void check() {

    }

    public String apiMethod() {
        return "api.${module}.${tool.camelToPoint(className)}";
    }

    public Class<${className}Response> responseClass() {
        return ${className}Response.class;
    }

}
