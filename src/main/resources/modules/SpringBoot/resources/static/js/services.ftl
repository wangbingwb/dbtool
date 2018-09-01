/**
 * Created by ${author} on ${date?string("yyyy-MM-dd")}.
 */
$(function(){
    $.services = {};
    $.url = "/ajax";
    $.uploadUrl = "/upload";
    $.extend($.services,{
        example:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.example",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
        fileUpload:function(file){
            var fd = new FormData();
            fd.append("file", file);
            return $.ajax({
                type: 'POST',
                url: $.uploadUrl,
                data: fd,
                processData: false,
                contentType: false,
                dataType: "json"
            })
        },
<#list db.tables as table>
<#if table.getCreate()>
        ${table.getFName()}Create:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.${table.getLName()}.create",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
</#if>
<#if table.getDelete()>
        ${table.getFName()}Delete:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.${table.getLName()}.delete",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
</#if>
<#if table.getUpdate()>
        ${table.getFName()}Update:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.${table.getLName()}.update",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
</#if>
<#if table.getFind()>
        ${table.getFName()}Find:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.${table.getLName()}.find",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
</#if>
<#if table.getGet()>
        ${table.getFName()}Get:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.${table.getLName()}.get",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
</#if>
<#if table.getSearch()>
        ${table.getFName()}Search:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.${table.getLName()}.search",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
</#if>
<#if table.getGetAll()>
        ${table.getFName()}GetAll:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.${moduleName}.${table.getLName()}.get.all",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
</#if>
</#list>
    })
})