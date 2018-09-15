<div id="header" v-cloak>
    <div class="table full">
        <div class="table-cell center">
            <div class="logo">
                <img src="${Uri.getUrl('/static/img/logo.png')}">
            </div>
        </div>
        <div class="table-cell v-right">
            <el-menu
                    :default-active="activeIndex"
                    mode="horizontal"
                    @select="handleSelect">
                <el-menu-item index="1">首页</el-menu-item>
                <el-submenu index="2">
                    <template slot="title">我的工作台</template>
                    <el-menu-item index="2-1">选项1</el-menu-item>
                    <el-menu-item index="2-2">选项2</el-menu-item>
                    <el-menu-item index="2-3">选项3</el-menu-item>
                    <el-submenu index="2-4">
                        <template slot="title">选项4</template>
                        <el-menu-item index="2-4-1">选项1</el-menu-item>
                        <el-menu-item index="2-4-2">选项2</el-menu-item>
                        <el-menu-item index="2-4-3">选项3</el-menu-item>
                    </el-submenu>
                </el-submenu>
                <el-menu-item index="3" disabled>消息中心</el-menu-item>
                <el-menu-item index="4">关于</el-menu-item>
            </el-menu>
        </div>
    </div>
</div>
<style>
    #header {
        height: 80px;
        line-height: 80px;
        overflow: hidden;
        width: 1140px;
        margin: 0px auto;

    }

    #header .logo {
        width: 45px;
        height: 45px;
        display: inline-block;
        vertical-align: middle;
        text-align: center;
    }

    #header .logo img {
        width: 100%;
        height: 100%;
    }
</style>
<script>
    var header = new Vue({
        el: "#header",
        data: {
            activeIndex: '1',
            contextPath: '${r"${contextPath}"}',
            homePath: '${r"${homePath}"}',
            loading: '',
        },
        methods: {
            handleSelect: function (key, keyPath) {
                console.log(key, keyPath);
            },
            toOpen: function (url) {
                var url = url.substring(0, 1) == "/" ? url.substring(1) : url;
                $("body").append($("<a id='wb-open' href='" + this.contextPath + "/" + url + "' target='_self' style='dispaly:none;'></a>"))
                document.getElementById("wb-open").click();
                $("#wb-open").remove();
            },
            toOpenNew: function (url) {
                var url = url.substring(0, 1) == "/" ? url.substring(1) : url;
                $("body").append($("<a id='wb-open' href='" + this.contextPath + "/" + url + "' target='_blank' style='dispaly:none;'></a>"))
                document.getElementById("wb-open").click();
                $("#wb-open").remove();
            },
            toHome: function () {
                location.href = this.contextPath + "/"
            },
            load: function () {
                if (this.loading) {
                    this.loading.close();
                    this.loading = ''
                } else {
                    this.loading = this.$loading({
                        lock: true,
                        text: 'Loading',
                        spinner: 'el-icon-loading',
                        background: 'rgba(0, 0, 0, 0.7)'
                    });
                }
            }
        },
    });
</script>