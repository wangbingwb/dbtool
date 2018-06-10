<#macro print items >
<#nested>:
    <#list items as item>
        <a>${item}</a>
    </#list>
</#macro>