<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${Url.setUrl('/static/img/favicon.ico')}" rel="Shortcut Icon" type="image/x-icon"/>
    <script src="${Url.setUrl('/static/dist/lib.min.js')}" type="text/javascript"></script>
    <link href="${Url.setUrl('/static/dist/lib.min.css')}" rel="stylesheet"/>
    <script src="${Url.setUrl('/static/js/axios.js')}" type="text/javascript"></script>
    <link href="${Url.setUrl('/static/css/base.css')}" rel="stylesheet"/>
</head>
<body>
<#include Layout.setControl("macro")/>
<#include Layout.setControl("nav")/>
<section class="el-container is-vertical layout">
    <header class="el-header">
    <#include Layout.setControl("header")/>
    </header>

    <section class="el-container">
        <aside class="el-aside" style="width: 0px">
        <#--<#include Layout.setControl("aside")/>-->
        </aside>
        <main class="el-main">
        <#include Layout.setScreen()/>
        </main>
    </section>
</section>
</body>
</html>
