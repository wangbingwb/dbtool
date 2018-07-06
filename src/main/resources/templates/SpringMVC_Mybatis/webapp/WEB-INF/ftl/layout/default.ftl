<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="${Url.setUrl('/static/js/jquery-3.2.1.js')}" type="text/javascript"></script>
    <script src="${Url.setUrl('/static/js/services.js')}" type="text/javascript"></script>
    <link href="${Url.setUrl('/static/css/base.css')}" rel="stylesheet"/>
    <link href="${Url.setUrl('/static/img/favicon.ico')}" rel="Shortcut Icon" type="image/x-icon"/>
    <script src="${Url.setUrl('/static/lib/element/vue.min.js')}"></script>
    <script src="${Url.setUrl('/static/lib/element/index.js')}"></script>
    <link href="${Url.setUrl('/static/lib/element/index.css')}" rel="stylesheet"/>
    <#--<script src="https://unpkg.com/element-ui/lib/index.js"></script>-->
    <#--<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">-->
</head>
<body>
<#include Layout.setControl("macro")/>
<#include Layout.setControl("header")/>
<#include Layout.setScreen()/>
<#--<#include Layout.setControl("footer")/>-->
</body>
</html>
