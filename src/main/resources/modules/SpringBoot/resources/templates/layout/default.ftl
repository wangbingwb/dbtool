<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${Uri.getUrl('/static/img/favicon.ico')}" rel="Shortcut Icon" type="image/x-icon"/>
    <script src="${Uri.getUrl('/static/dist/lib.min.js')}" type="text/javascript"></script>
    <link href="${Uri.getUrl('/static/dist/lib.min.css')}" rel="stylesheet"/>
    <script src="${Uri.getUrl('/static/js/ajax.js')}" type="text/javascript"></script>
    <link href="${Uri.getUrl('/static/css/base.css')}" rel="stylesheet"/>
</head>
<body>
<#include Layout.setControl("macro")/>
<#include Layout.setControl("nav")/>
<div class="wb-layout-title-fix">
    <div class="wb-head">
    <#include Layout.setControl("header")/>
    </div>
    <div class="wb-body">
    <#include Layout.setScreen()/>
    </div>
</div>
</body>
</html>
