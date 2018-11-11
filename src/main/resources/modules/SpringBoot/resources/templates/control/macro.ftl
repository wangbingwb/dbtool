<#macro print items >
<#nested>:
    <#list items as item>
        <a>${item}</a>
    </#list>
</#macro>
<#--
 参数说明：
    pageNumber：当前的页码
    pageSize：页码大小
    totalCount：总数
    showPages：显示的页码个数
    callback：回调函数
-->
<#macro page pageNumber pageSize totalCount showPages callback>
<div class="page_list">
    <#assign totalPage = 0/>
    <#assign totalPage = (totalCount/pageSize)?ceiling/>
    <#if pageNumber==1>
        <a href="javascript:;" class="top_page disabled">首页</a>
        <a href="javascript:;" class="page_prev disabled">上一页</a>
    </#if>
    <#if pageNumber!=1>
        <a href="javascript:${callback+'('+1+')'};" class="top_page">首页</a>
        <a href="javascript:${callback+'('+(pageNumber-1)+')'};" class="page_prev">上一页</a>
    </#if>
    <#if pageNumber-showPages/2 gt 0>
        <#assign start = pageNumber-(showPages-1)/2/>
        <#if showPages gt totalPage>
            <#assign start = 1/>
        </#if>
    <#else>
        <#assign start = 1/>
    </#if>
    <#if totalPage gt showPages>
        <#assign end = (start+showPages-1)/>
        <#if end gt totalPage>
            <#assign start = totalPage-showPages+1/>
            <#assign end = totalPage/>
        </#if>
    <#else>
        <#assign end = totalPage/>
    </#if>
    <#assign pages=start..end/>
    <#list pages as page>
        <#if page==pageNumber>
            <a href="javascript:${callback+'('+page+')'};" class="current">${page}</a>
        <#else>
            <a href="javascript:${callback+'('+page+')'};">${page}</a>
        </#if>
    </#list>
    <#if pageNumber==totalPage>
        <a href="javascript:;" class="page_next disabled">下一页</a>
        <a href="javascript:;" class="end_page disabled">尾页</a>
    </#if>
    <#if pageNumber!=totalPage>
        <a href="javascript:${callback+'('+(pageNumber+1)+')'};" class="page_next">下一页</a>
        <a href="javascript:${callback+'('+totalPage+')'};" class="end_page">尾页</a>
    </#if>
</div>
</#macro>