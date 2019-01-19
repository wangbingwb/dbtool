<div id="header">
    <div class="logo">
        <img @click="this.nav.toHome()" src="${Uri.getUrl('/static/img/logo.png')}">
    </div>

    <a class="home" href="${Uri.getUrl('/')}">Home</a>

    <div class="menu">
        <ul>
            <li>
                <a href="${Uri.getUrl('/1')}">首页</a>
            </li>
            <li>
                <a href="${Uri.getUrl('/2')}">工作台</a>
            </li>
            <li>
                <a href="${Uri.getUrl('/3')}">消息中心</a>
            </li>
            <li>
                <a href="${Uri.getUrl('/4')}">关于我</a>
            </li>
        </ul>
    </div>
</div>
<style>
    #header {
        width: 100%;
        height: 50px;
        line-height: 50px;
        overflow: hidden;
        background: #2a2a2a;
        box-shadow: 0px 2px 8px 0px;
    }

    #header .logo {
        display: inline-block;
        height: 50px;
        width: 50px;
        margin-left: 10px;
        text-align: center;
    }

    #header .logo img {
        width: 50%;
        height: 50%;
        vertical-align: middle;
    }

    .home {
        display: inline-block;
        color: #ffffff;
        font-weight: bold;
        transition: all 0.3s;
    }

    .home:hover {
        color: #ffffff;
        transform: translate(2px);
    }

    #header .menu {
        display: inline-block;
        float: right;
    }

    #header .menu ul {
        display: inline-block;
    }

    #header .menu ul li {
        display: inline-block;
        vertical-align: top;
    }

    #header .menu ul li a {
        color: #ffffff;
        display: inline-block;
        text-align: center;
        position: relative;
        margin: 0px 15px;
        height: 50px;
    }

    #header .menu ul li a:after {
        content: "";
        display: inline-block;
        background: #ffffff;
        width: 0%;
        height: 2px;
        position: absolute;
        bottom: 2px;
        left: 50%;
        transition: all 0.3s;
    }

    #header .menu ul li a img {
        margin-top: 8px;
        height: 32px;
    }

    #header .menu ul li a:hover:after {
        width: 100%;
        left: 0%;
    }

    #header .tx {
        display: inline-block;
        float: right;
        height: 50px;
        width: 50px;
        margin-left: 20px;
    }

    #header .tx img {
        width: 50%;
        height: 50%;
        vertical-align: middle;
    }
</style>
