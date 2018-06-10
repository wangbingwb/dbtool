<div id="module">
    <el-container>
        <el-aside style="background-color:#545c64">
            <div class="nav"></div>
            <el-menu
                    default-active="1-1"
                    class="el-menu-vertical-demo"
                    @open="handleOpen"
                    @close="handleClose"
                    @select="handleSelect"
                    background-color="#545c64"
                    text-color="#fff"
                    active-text-color="#ffd04b">
                <el-submenu index="1">
                    <template slot="title">
                        <i class="el-icon-document"></i>
                        <span>Freemarker使用</span>
                    </template>
                    <el-menu-item-group>
                        <template slot="title">基础部分</template>
                        <el-menu-item index="1-1">介绍说明</el-menu-item>
                        <el-menu-item index="1-2">占位输出</el-menu-item>
                        <el-menu-item index="1-3">条件输出</el-menu-item>
                        <el-menu-item index="1-4">遍历集合</el-menu-item>
                    </el-menu-item-group>
                    <el-menu-item-group title="进阶部分">
                        <el-menu-item index="1-5">宏指令</el-menu-item>
                        <el-menu-item index="1-6">import指令</el-menu-item>
                        <el-menu-item index="1-7">include指令</el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-submenu index="2">

                    <template slot="title">
                        <i class="el-icon-document"></i>
                        <span slot="title">Vue.js</span>
                    </template>

                    <el-menu-item-group>
                        <template slot="title">基础部分</template>
                        <el-menu-item index="2-1">入门介绍</el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-submenu index="3">
                    <template slot="title">
                        <i class="el-icon-document"></i>
                        <span slot="title">ElementUI</span>
                    </template>

                    <el-menu-item-group>
                        <template slot="title">基础部分</template>
                        <el-menu-item index="3-1">入门介绍</el-menu-item>
                    </el-menu-item-group>
                </el-submenu>
                <el-menu-item index="4" disabled>
                    <i class="el-icon-menu"></i>
                    <span slot="title">禁用菜单</span>
                </el-menu-item>
                <el-menu-item index="5">
                    <i class="el-icon-setting"></i>
                    <span slot="title">设置</span>
                </el-menu-item>
            </el-menu>
        </el-aside>

        <el-main>
            <transition name="wb-zoom-in-top">
                <div class="view" v-show="menu_index == '1-1'">
                    <h1>介绍说明</h1>

                    <p> Freemarker 是一款模板引擎，是一种基于模版生成静态文件的通用
                        工具，它是为Java程序员提供的一个开发包，或者说是一个类库，它不是面向最终用户的，而是为程序员提供了一款可以嵌入他们开发产品的应用程序。</p>

                    <p> Freemarker 是使用纯java编写的，为了提高页面的访问速度，需要把页面静态化， 那么Freemarker就是被用来生成html页面。</p>


                    <h1>前提条件</h1>

                    <p>本工程使用的Freemarker整合了Spring MVC， 与你需要了解或熟悉Spring MVC框架。如果你熟悉EL表达，将有助于该工程Freemarker的使用。</p>

                </div>
            </transition>
            <transition name="wb-zoom-in-top">
                <div class="view" v-show="menu_index == '1-2'">
                    <h1>正常输出</h1>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <p>${r'${hello}'}</p>
                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        ${hello}
                        </div>
                    </el-card>

                    <h1>输出HTML标签</h1>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                        ${r"${'&lta>a标签&lt/a>'?html}"}
                        </div>
                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        ${'<a>a标签</a>'?html}
                        </div>
                    </el-card>


                    <h1>输出带$表达式</h1>

                    <el-card shadow="never">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                        ${r"${r'${hello}'}"}
                        </div>
                    </el-card>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        ${r'${hello}'}
                        </div>
                    </el-card>
                </div>
            </transition>
            <transition name="wb-zoom-in-top">
                <div class="view" v-show="menu_index == '1-3'">
                    <h1>if else 组合</h1>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <p>${'<#if status == 0>'}</p>

                        <p class="text-indent">status is 0</p>

                        <p>${'<#else>'}</p>

                        <p class="text-indent">status is not 0</p>

                        <p>${'&lt/#if>'}</p>
                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        <#if status == 0>
                            status is 0
                        <#else>
                            status is not 0
                        </#if>
                        </div>
                    </el-card>

                    <h1>if elseif else 组合</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <p>${'<#if status == 0>'}</p>

                        <p class="text-indent">status is 0</p>

                        <p>${'<#elseif status ==1>'}</p>

                        <p class="text-indent">status = 1</p>

                        <p>${'<#else>'}</p>

                        <p class="text-indent">status != 0 && status !=1</p>

                        <p>${'&lt/#if>'}</p>
                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        <#if status ==0 >
                            status = 0
                        <#elseif status ==1>
                            status = 1
                        <#else>
                            status != 0 && status !=1
                        </#if>
                        </div>
                    </el-card>
                </div>
            </transition>


            <transition name="wb-zoom-in-top">
                <div class="view" v-show="menu_index == '1-4'">
                    <h1>遍历集合Foreach</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <p>${'<#list citys as city>'}</p>

                        <p class="text-indent">${r'${city}'}</p>

                        <p>${'&lt/#list>'}</p>
                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        <#list citys as city>
                            ${city}
                        </#list>
                        </div>
                    </el-card>

                    <h1>Foreach获得索引</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <p>${'<#list citys as city>'}</p>

                        <p class="text-indent">${r' ${city_index} --> ${city}'}</p>

                        <p>${'&lt/#list>'}</p>
                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        <#list citys as city>
                        ${city_index} --> ${city}
                        </#list>
                        </div>
                    </el-card>
                </div>
            </transition>

            <transition name="wb-zoom-in-top">
                <div class="view" v-show="menu_index == '1-5'">
                    <h1>定义宏方法及用法</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【定义】
                        </div>
                        <p>${'<#macro sayHello name1 name2>'}</p>

                        <p class="text-indent">${r'hello, ${name1} and ${name2}'}</p>

                        <p>${r'&lt/#macro>'}</p>

                        <p>-----------------</p>

                        <p>${r'<@sayHello name1="zhangsan" name2="lisi"/>'}</p>

                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <p>hello, zhangsan and lisi</p>

                    </el-card>

                    <h1> nested 指令</h1>

                    <p>代替调用宏指令时标签对之间包裹的内容</p>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【定义及用法】
                        </div>
                        <p>${r'<#macro hw>'}</p>

                        <p class="text-indent">${r'hello,<#nested>'}</p>

                        <p>${r'&lt/#macro>'}</p>

                        <p></p>

                        <p>${r'<@hw>zhangsan,lisi,wangwu,zhaoliu<&lt@hw>'}</p>

                    </el-card>

                    <h1>定义宏完整示意</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【定义】
                        </div>
                        <p>${'<#macro print items >'}</p>

                        <p class="text-indent">${r'<#nested>:'}</p>

                        <p class="text-indent">${r'<#list items as item>'}</p>

                        <p class="text-indent">${'<a>'?html}${r'${item}'?html}${'</a>'?html}</p>

                        <p class="text-indent">${'&lt/#list>'}</p>

                        <p>${'&lt/#macro>'}</p>
                    </el-card>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                            <p>${'<@print items=["A","B","C"]>'}</p>

                            <p>items is </p>

                            <p>${'&lt/@print>'}</p>
                        </div>
                    </el-card>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【效果】
                        </div>
                        <div>
                        <@print items=["A","B","C"]>
                            items is
                        </@print>
                        </div>
                    </el-card>
                </div>
            </transition>
            <transition name="wb-zoom-in-top">
                <div class="view" v-show="menu_index == '1-6'">

                    <h1>import指令</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                            <p>
                            ${r'<#import "/control/macro.ftl"/>'}
                            </p>
                        </div>
                    </el-card>

                    <h1>引入命名空间</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                            <p>
                            ${r'<#import "/control/macro.ftl" as macro/>'}
                            </p>
                        </div>
                    </el-card>

                    <h1>调用变量</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                            <p>
                            ${r'${macro.fileName}'}
                            </p>
                        </div>
                    </el-card>

                    <h1>调用方法</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                            <p>
                            ${r'<@macro.printEmp employee/>'}
                            </p>
                        </div>
                    </el-card>

                    <h1>修改变量</h1>
                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                            <p>
                            ${r'<#assign fileName = "command.ftl" in util />'}
                            </p>
                        </div>
                    </el-card>
                </div>
            </transition>

            <transition name="wb-zoom-in-top">
                <div class="view" v-show="menu_index == '1-7'">

                    <h1>include 嵌入文件</h1>

                    <el-card shadow="hover">
                        <div slot="header" class="clearfix">
                            【用法】
                        </div>
                        <div>
                            <p>
                            ${r'<#include "/control/footer.ftl" />'}
                            </p>
                        </div>
                    </el-card>
                </div>
            </transition>




            <#--$(function(){-->
            <#--$.services.example({}).then(function(data){-->
            <#--if (data.errors.length > 0) {-->
            <#--toast.e(data.errors[0].message, 1000);-->
            <#--} else {-->
            <#--toast.i("Ajax调用成功!", 1000);-->
            <#--}-->
            <#--})-->
            <#--})-->


        <#--<div style="padding-left: 20px;margin: 20px">-->

        <#--<h3>此部分为Vue.js + Element 用法及DEMO部分</h3>-->

        <#--<div id="module">-->
        <#--<h3>常见组件用法(详细请参考attach)</h3>-->


        <#--<el-row>-->
        <#--<el-col :span="5">输入框</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-input v-model="value"></el-input>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->


        <#--<el-row>-->
        <#--<el-col :span="5">普通按钮</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-button @click="message()">普通按钮</el-button>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-button @click="nextPage()">下一页</el-button>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->

        <#--<el-row>-->
        <#--<el-col :span="5">选择框</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-select v-model="value" placeholder="请选择">-->
        <#--<el-option-->
        <#--v-for="item in options"-->
        <#--:key="item.value"-->
        <#--:label="item.label"-->
        <#--:value="item.value">-->
        <#--</el-option>-->
        <#--</el-select>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->


        <#--<el-row>-->
        <#--<el-col :span="5">多选框</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-checkbox v-model="checked1">备选项1</el-checkbox>-->
        <#--<el-checkbox v-model="checked2">备选项</el-checkbox>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->


        <#--<el-row>-->
        <#--<el-col :span="5">开关</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-switch-->
        <#--v-model="value2"-->
        <#--active-color="#13ce66"-->
        <#--inactive-color="#ff4949">-->
        <#--</el-switch>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->


        <#--<el-row>-->
        <#--<el-col :span="5">日期选择器</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-date-picker-->
        <#--v-model="date"-->
        <#--type="datetime"-->
        <#--placeholder="选择日期时间">-->
        <#--</el-date-picker>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->
        <#--<el-row>-->
        <#--<el-col :span="5">分页</el-col>-->
        <#--<el-col :span="5">-->
        <#--<template>-->
        <#--<el-pagination-->
        <#--small-->
        <#--layout="prev, pager, next"-->
        <#--:total="50">-->
        <#--</el-pagination>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->
        <#--<el-row>-->
        <#--<el-col :span="5">弹出框</el-col>-->
        <#--<el-col :span="3">-->
        <#--<template>-->
        <#--<el-popover-->
        <#--placement="top-start"-->
        <#--title="标题"-->
        <#--width="200"-->
        <#--trigger="hover"-->
        <#--content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">-->
        <#--<el-button slot="reference">hover 激活</el-button>-->
        <#--</el-popover>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--<el-col :span="3">-->
        <#--<template>-->
        <#--<el-popover-->
        <#--placement="bottom"-->
        <#--title="标题"-->
        <#--width="200"-->
        <#--trigger="click"-->
        <#--content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">-->
        <#--<el-button slot="reference">click 激活</el-button>-->
        <#--</el-popover>-->

        <#--</template>-->
        <#--</el-col>-->
        <#--<el-col :span="3">-->
        <#--<template>-->
        <#--<el-popover-->
        <#--ref="popover"-->
        <#--placement="right"-->
        <#--title="标题"-->
        <#--width="200"-->
        <#--trigger="focus"-->
        <#--content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">-->
        <#--</el-popover>-->
        <#--<el-button v-popover:popover>focus 激活</el-button>-->
        <#--</template>-->
        <#--</el-col>-->
        <#--</el-row>-->
        <#--</div>-->
        <#--</div>-->

        </el-main>
    </el-container>
</div>


<script>
    $(function () {
        var module = new Vue({
            el: '#module',
            data: {
                menu_index: "1-1",
                vm: {
                    pageNumber: 1,
                    pageSize: 10,
                    totalCount: 15,
                    loading: false,
                },
                options: [{
                    value: '选项1',
                    label: '黄金糕'
                }, {
                    value: '选项2',
                    label: '双皮奶'
                }],
                value: '',
                input: '',
                checked1: false,
                checked2: true,
                value1: true,
                value2: true,
                date: '',
            },
            methods: {
                message: function () {
                    toast.i("我是Vue+Element弹出的消息")
                },
                nextPage: function () {
                    //module实例对象获取data
                    module.$data.value = "new Value";
                },
                handleOpen: function (key, keyPath) {
                    console.log(key, keyPath);
                },
                handleClose: function (key, keyPath) {
                    console.log(key, keyPath);
                },
                handleSelect: function (key, keyPath) {
                    console.log(key, keyPath);
                    this.menu_index = key;
                    Util.toTop();
                }
            },
            watch: {
                'value': function (val, oldVal) {//属性监听
                    toast.i("value=" + val);
                },
                'vm.pageNumber': function (val, oldVal) {//对象属性监听
                    toast.i("pageNumber=" + val);
                }
            }
        });
    })

</script>
