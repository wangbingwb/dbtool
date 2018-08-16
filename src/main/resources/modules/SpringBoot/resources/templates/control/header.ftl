<div id="header" v-cloak>

    <div class="table full">
        <div class="table-cell v-center">
            <div class="logo">
                <img src="${Url.setUrl('/static/img/logo.png')}">
            </div>
        </div>
        <div class="table-cell v-right">
            <el-menu
                    :default-active="activeIndex2"
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
<script>
    $(function () {
        var header = new Vue({
            el: '#header',
            data: {
                activeIndex: '1',
                activeIndex2: '1'
            },
            methods: {
                handleSelect: function (key, keyPath) {
                    console.log(key, keyPath);
                }
            }
        })
    })
</script>