<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Mint UI</title>

</head>
<body>
<div id="app">
    <router-link to="/">首页</router-link>
    <router-link to="/next">next</router-link>
    <transition name="wb-zoom-in-top">
        <router-view></router-view>
    </transition>
</div>

<template id="home"><div>home</div></template>
<template id="next"><div>next</div></template>
<script src="${Uri.getUrl('/static/lib/vue/vue.min.js')}" type="text/javascript"></script>
<script src="${Uri.getUrl('/static/lib/vue/vue-router.min.js')}" type="text/javascript"></script>
<script src="${Uri.getUrl('/static/lib/fastclick.js')}" type="text/javascript"></script>

<script>
    var router = new VueRouter({
        routes:[
            {
                path: '/',
                name: 'home',
                component:Vue.extend({template: '#home'})
            },
            {
                path: '/next',
                name: 'next',
                component:Vue.extend({template: '#next'})
            }
        ]
    });
    var app = new Vue({
        el: '#app',
        router:router
    })
</script>
</html>
