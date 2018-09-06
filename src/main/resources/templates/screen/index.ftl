<div id="app" v-cloak>
    <el-container>
        <el-aside class="menu">
            <el-scrollbar style="height: 100%">
                <el-menu
                        :default-active="$route.path"
                        @open="handleOpen"
                        @close="handleClose"
                        @select="handleSelect"
                        active-text-color="#409eff">

                    <el-submenu index="1">

                        <template slot="title">
                            <i class="el-icon-document"></i>
                            <span slot="title">DEMO</span>
                        </template>

                        <el-menu-item index="/demo/ajax">Ajax接口调用</el-menu-item>
                        <el-menu-item index="/demo/toast">小吐司、通知</el-menu-item>
                    </el-submenu>

                    <el-submenu index="2">
                        <template slot="title">
                            <i class="el-icon-document"></i>
                            <span>Freemarker使用</span>
                        </template>
                        <el-menu-item-group>
                            <template slot="title">基础部分</template>
                            <el-menu-item index="/freemarker/introduce">介绍说明</el-menu-item>
                            <el-menu-item index="/freemarker/input">占位输出</el-menu-item>
                            <el-menu-item index="/freemarker/condition">条件输出</el-menu-item>
                            <el-menu-item index="/freemarker/foreach">遍历集合</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="进阶部分">
                            <el-menu-item index="/freemarker/macro">宏指令</el-menu-item>
                            <el-menu-item index="/freemarker/import">import指令</el-menu-item>
                            <el-menu-item index="/freemarker/include">include指令</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="3">
                        <template slot="title">
                            <i class="el-icon-document"></i>
                            <span slot="title">Vue.js</span>
                        </template>

                        <el-menu-item-group>
                            <template slot="title">基础部分</template>
                            <el-menu-item index="/vue/introduce">入门介绍</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group>
                            <template slot="title">Other</template>
                            <el-menu-item index="/vue/other">解决页面初始化前闪现源代码</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="4">
                        <template slot="title">
                            <i class="el-icon-document"></i>
                            <span slot="title">ElementUI</span>
                        </template>

                        <el-menu-item index="/elementui/introduce">入门介绍</el-menu-item>
                        <el-menu-item index="/elementui/animation">内置过渡动画</el-menu-item>
                        <el-menu-item index="/elementui/layout">Layout布局</el-menu-item>
                        <el-menu-item index="/elementui/container">Container 布局容器</el-menu-item>
                        <el-menu-item index="/elementui/color">Color 色彩</el-menu-item>
                        <el-menu-item index="/elementui/typography">Typography 字体</el-menu-item>
                        <el-menu-item index="/elementui/icon">Icon 图标</el-menu-item>
                        <el-menu-item-group title="常用控件">
                            <el-menu-item index="/elementui/button">Button 按钮</el-menu-item>
                            <el-menu-item index="/elementui/upload">Upload 上传</el-menu-item>
                            <el-menu-item index="/elementui/form">Form 表单</el-menu-item>
                            <el-menu-item index="/elementui/table">Table 表格</el-menu-item>
                            <el-menu-item index="/elementui/pagination">Pagination 分页</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="常用辅助组件">
                            <el-menu-item index="/elementui/tooltip">Tooltip 文字提示</el-menu-item>
                            <el-menu-item index="/elementui/popover">Popover 弹出框</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                </el-menu>
            </el-scrollbar>

        </el-aside>

        <el-main class="main">
            <el-scrollbar style="height: 100%" id="scrollbar">
                <transition :name="transitionName">
                    <router-view></router-view>
                </transition>
            </el-scrollbar>
        </el-main>
    </el-container>
</div>
<template id="freemarker_introduce">
    <div class="view">
        <h1>介绍说明</h1>

        <p> Freemarker 是一款模板引擎，是一种基于模版生成静态文件的通用
            工具，它是为Java程序员提供的一个开发包，或者说是一个类库，它不是面向最终用户的，而是为程序员提供了一款可以嵌入他们开发产品的应用程序。</p>

        <p> Freemarker 是使用纯java编写的，为了提高页面的访问速度，需要把页面静态化， 那么Freemarker就是被用来生成html页面。</p>

        <h1>前提条件</h1>

        <p>本工程使用的Freemarker整合了Spring MVC， 与你需要了解或熟悉Spring MVC框架。如果你熟悉EL表达，将有助于该工程Freemarker的使用。</p>
    </div>
</template>
<template id="freemarker_input">
    <div class="view">
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
</template>
<template id="freemarker_condition">
    <div class="view">
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
</template>
<template id="freemarker_foreach">
    <div class="view">
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
</template>
<template id="freemarker_macro">
    <div class="view">
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
            <#--<@print items=["A","B","C"]>-->
                                <#--items is-->
                            <#--</@print>-->
            </div>
        </el-card>
    </div>
</template>
<template id="freemarker_import">
    <div class="view">

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
</template>
<template id="freemarker_include">
    <div class="view">

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
</template>
<template id="vue_introduce">
    <div class="view">

        <h1>介绍说明</h1>

        <p>Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，
            Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或
            既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。</p>
    </div>
</template>
<template id="vue_other">
    <div class="view">

        <h1>解决办法</h1>
        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                【CSS中添加样式】
            </div>
            <div>
                <p>${'<style  type="text/css">'?html}

                <p>${'[v-cloak] {'?html}

                <p class="text-indent">${'display: none;'?html}

                <p>${'}'?html}

                <p>${'</style>'?html}
                </p>
            </div>
        </el-card>
        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                【视图中调用】
            </div>
            <div>
                <p>${'<div id="app" v-cloak>'?html}

                <p>${'...'?html}

                <p>${'</div>'?html}
                </p>
            </div>
        </el-card>
    </div>
</template>


<template id="elementui_introduce">
    <div class="view">

        <h1>设计原则</h1>

        <h3>一致性 Consistency</h3>

        <ul class="demo-ul">
            <li><strong>与现实生活一致：</strong>与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；</li>
            <li><strong>在界面中一致：</strong>所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。</li>
        </ul>
        <h3>反馈 Feedback</h3>
        <ul class="demo-ul">
            <li><strong>控制反馈：</strong>通过界面样式和交互动效让用户可以清晰的感知自己的操作；</li>
            <li><strong>页面反馈：</strong>操作后，通过页面元素的变化清晰地展现当前状态。</li>
        </ul>
        <h3>效率 Efficiency</h3>

        <ul class="demo-ul">
            <li><strong>简化流程：</strong>设计简洁直观的操作流程；</li>
            <li><strong>清晰明确：</strong>语言表达清晰且表意明确，让用户快速理解进而作出决策；</li>
            <li><strong>帮助用户识别：</strong>界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</li>
        </ul>

        <h3>可控 Controllability</h3>

        <ul class="demo-ul">
            <li><strong>用户决策：</strong>根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</li>
            <li><strong>结果可控：</strong>用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</li>
        </ul>

        <h1>本项目使用</h1>

        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                <b>CDN引入</b>
            </div>
            <div>
                <p>${'<!-- 引入样式 -->'?html}</p>

                <p>${'<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">'?html}</p>

                <p>${'<!-- 引入组件库 -->'?html}</p>

                <p> ${'<script src="https://unpkg.com/element-ui/lib/index.js"></script>'?html}</p>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <b>项目本地引入</b>
            </div>
            <div>
                <p>${'<!-- 引入样式 -->'?html}</p>

                <p>${'<link href="'?html}${r"${Url.setUrl('/static/lib/element/index.css')}"}${'" rel="stylesheet"/>'}</p>

                <p>${'<!-- 引入组件库 -->'?html}</p>

                <p>${'<script src="'?html}${r"${Url.setUrl('/static/lib/element/index.js')}"}${'">&lt;/script>'}</p>
            </div>
        </el-card>


        <h1>使用Demo</h1>

        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                <b>代码</b>
            </div>
            <div>
                <p>${"<div id='app'>"?html}</p>

                <p>${"..."?html}</p>

                <p>${"..."?html}</p>

                <p>${"</div>"?html}</p>

                <p>${'<script type="text/javascript">'?html}</p>

                <p>var app = new Vue({</p>

                <p class="text-indent">el: '#app',</p>

                <p class="text-indent">data: {</p>

                <p class="text-indent">...</p>

                <p class="text-indent">}</p>

                <p class="text-indent">methods: {</p>

                <p class="text-indent">...</p>

                <p class="text-indent">}</p>

                <p>}</p>

                <p>${"</script>"?html}</p>
            </div>
        </el-card>

    </div>
</template>
<template id="elementui_animation">
    <div class="view">

        <h1>内置过渡动画</h1>


        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                <b>fade 淡入淡出</b>
            </div>
            <div>
                <template>
                    <div>
                        <el-button @click="show = !show">Click Me</el-button>

                        <div style="display: flex; margin-top: 20px; height: 100px;">
                            <transition name="el-fade-in-linear">
                                <div v-show="show" class="transition-box">.el-fade-in-linear</div>
                            </transition>
                            <transition name="el-fade-in">
                                <div v-show="show" class="transition-box">.el-fade-in</div>
                            </transition>
                        </div>
                    </div>
                </template>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <b>zoom 缩放</b>
            </div>
            <div>
                <template>
                    <div>
                        <el-button @click="show2 = !show2">Click Me</el-button>

                        <div style="display: flex; margin-top: 20px; height: 100px;">
                            <transition name="el-zoom-in-center">
                                <div v-show="show2" class="transition-box">.el-zoom-in-center</div>
                            </transition>

                            <transition name="el-zoom-in-top">
                                <div v-show="show2" class="transition-box">.el-zoom-in-top</div>
                            </transition>

                            <transition name="el-zoom-in-bottom">
                                <div v-show="show2" class="transition-box">.el-zoom-in-bottom</div>
                            </transition>
                        </div>
                    </div>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <b>collapse 展开折叠</b>
            </div>
            <div>
                <template>
                    <div>
                        <el-button @click="show3 = !show3">Click Me</el-button>

                        <div style="margin-top: 20px; height: 200px;">
                            <el-collapse-transition>
                                <div v-show="show3">
                                    <div class="transition-box">el-collapse-transition</div>
                                    <div class="transition-box">el-collapse-transition</div>
                                </div>
                            </el-collapse-transition>
                        </div>
                    </div>
                </template>
            </div>
        </el-card>
    </div>
</template>
<template id="elementui_layout">
    <div class="view">

        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                【基础布局】
            </div>
            <div>
                <el-row>
                    <el-col :span="24">
                        <div class="grid-content bg-purple-dark"></div>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="12">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="12">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="8">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="8">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="8">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                </el-row>
                <el-row>
                    <el-col :span="4">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                </el-row>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                【分栏间隔】
            </div>
            <div>
                <el-row :gutter="20">
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                【混合布局】
            </div>
            <div>
                <el-row :gutter="20">
                    <el-col :span="16">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="8">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="8">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="8">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="4">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="16">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="4">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                【分栏偏移】
            </div>
            <div>
                <el-row :gutter="20">
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6" :offset="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="6" :offset="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6" :offset="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row :gutter="20">
                    <el-col :span="12" :offset="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                【对齐方式】
            </div>
            <div>
                <el-row type="flex" class="row-bg">
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="center">
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="end">
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="space-between">
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
                <el-row type="flex" class="row-bg" justify="space-around">
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :span="6">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                </el-row>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                【响应式布局】
            </div>
            <div>
                <el-row :gutter="10">
                    <el-col :xs="8" :sm="6" :md="4" :lg="3" :xl="1">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :xs="4" :sm="6" :md="8" :lg="9" :xl="11">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                    <el-col :xs="4" :sm="6" :md="8" :lg="9" :xl="11">
                        <div class="grid-content bg-purple"></div>
                    </el-col>
                    <el-col :xs="8" :sm="6" :md="4" :lg="3" :xl="1">
                        <div class="grid-content bg-purple-light"></div>
                    </el-col>
                </el-row>

            </div>
        </el-card>

        <h3>包含的类名及其含义为：</h3>

        <ul>
            <li><code>hidden-xs-only</code> - 当视口在 <code>xs</code> 尺寸时隐藏</li>
            <li><code>hidden-sm-only</code> - 当视口在 <code>sm</code> 尺寸时隐藏</li>
            <li><code>hidden-sm-and-down</code> - 当视口在 <code>sm</code> 及以下尺寸时隐藏</li>
            <li><code>hidden-sm-and-up</code> - 当视口在 <code>sm</code> 及以上尺寸时隐藏</li>
            <li><code>hidden-md-only</code> - 当视口在 <code>md</code> 尺寸时隐藏</li>
            <li><code>hidden-md-and-down</code> - 当视口在 <code>md</code> 及以下尺寸时隐藏</li>
            <li><code>hidden-md-and-up</code> - 当视口在 <code>md</code> 及以上尺寸时隐藏</li>
            <li><code>hidden-lg-only</code> - 当视口在 <code>lg</code> 尺寸时隐藏</li>
            <li><code>hidden-lg-and-down</code> - 当视口在 <code>lg</code> 及以下尺寸时隐藏</li>
            <li><code>hidden-lg-and-up</code> - 当视口在 <code>lg</code> 及以上尺寸时隐藏</li>
            <li><code>hidden-xl-only</code> - 当视口在 <code>xl</code> 尺寸时隐藏</li>
        </ul>

        <h3>Row Attributes</h3>

        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>gutter</td>
                <td>栅格间隔</td>
                <td>number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            <tr>
                <td>type</td>
                <td>布局模式，可选 flex，现代浏览器下有效</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>justify</td>
                <td>flex 布局下的水平排列方式</td>
                <td>string</td>
                <td>start/end/center/space-around/space-between</td>
                <td>start</td>
            </tr>
            <tr>
                <td>align</td>
                <td>flex 布局下的垂直排列方式</td>
                <td>string</td>
                <td>top/middle/bottom</td>
                <td>top</td>
            </tr>
            <tr>
                <td>tag</td>
                <td>自定义元素标签</td>
                <td>string</td>
                <td>*</td>
                <td>div</td>
            </tr>
            </tbody>
        </table>

        <h3> Col Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>span</td>
                <td>栅格占据的列数</td>
                <td>number</td>
                <td>—</td>
                <td>24</td>
            </tr>
            <tr>
                <td>offset</td>
                <td>栅格左侧的间隔格数</td>
                <td>number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            <tr>
                <td>push</td>
                <td>栅格向右移动格数</td>
                <td>number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            <tr>
                <td>pull</td>
                <td>栅格向左移动格数</td>
                <td>number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            <tr>
                <td>xs</td>
                <td><code>&lt;768px</code> 响应式栅格数或者栅格属性对象</td>
                <td>number/object (例如： {span: 4, offset: 4})</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>sm</td>
                <td><code>≥768px</code> 响应式栅格数或者栅格属性对象</td>
                <td>number/object (例如： {span: 4, offset: 4})</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>md</td>
                <td><code>≥992px</code> 响应式栅格数或者栅格属性对象</td>
                <td>number/object (例如： {span: 4, offset: 4})</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>lg</td>
                <td><code>≥1200px</code> 响应式栅格数或者栅格属性对象</td>
                <td>number/object (例如： {span: 4, offset: 4})</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>xl</td>
                <td><code>≥1920px</code> 响应式栅格数或者栅格属性对象</td>
                <td>number/object (例如： {span: 4, offset: 4})</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>tag</td>
                <td>自定义元素标签</td>
                <td>string</td>
                <td>*</td>
                <td>div</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>
<template id="elementui_container">
    <div class="view">

        <h1>Container 布局容器</h1>

        <p>用于布局的容器组件，方便快速搭建页面的基本结构：</p>

        <p><code>&lt;el-container&gt;</code>：外层容器。当子元素中包含 <code>&lt;el-header&gt;</code> 或
            <code>&lt;el-footer&gt;</code>
            时，全部子元素会垂直上下排列，否则会水平左右排列。</p>

        <p><code>&lt;el-header&gt;</code>：顶栏容器。</p>

        <p><code>&lt;el-aside&gt;</code>：侧边栏容器。</p>

        <p><code>&lt;el-main&gt;</code>：主要区域容器。</p>

        <p><code>&lt;el-footer&gt;</code>：底栏容器。</p>

        <el-card shadow="hover m-t-20">
            <div slot="header" class="clearfix">
                【常见页面布局】
            </div>
            <div>

                <el-container class="layout m-t-20">
                    <el-header class="header">Header</el-header>
                    <el-main class="main">Main</el-main>
                </el-container>

                <el-container class="layout m-t-20">
                    <el-header class="header">Header</el-header>
                    <el-main class="main">Main</el-main>
                    <el-footer class="footer">Footer</el-footer>
                </el-container>

                <el-container class="layout m-t-20">
                    <el-aside class="aside" width="200px">Aside</el-aside>
                    <el-main class="main">Main</el-main>
                </el-container>

                <el-container class="layout m-t-20">
                    <el-header class="header">Header</el-header>
                    <el-container>
                        <el-aside class="aside" width="200px">Aside</el-aside>
                        <el-main class="main">Main</el-main>
                    </el-container>
                </el-container>

                <el-container class="layout m-t-20">
                    <el-header class="header">Header</el-header>
                    <el-container>
                        <el-aside class="aside" width="200px" style="height: 260px;line-height: 260px">
                            Aside
                        </el-aside>
                        <el-container>
                            <el-main class="main">Main</el-main>
                            <el-footer class="footer">Footer</el-footer>
                        </el-container>
                    </el-container>
                </el-container>

                <el-container class="layout m-t-20">
                    <el-aside class="aside" width="200px" style="height: 260px;line-height: 260px">
                        Aside
                    </el-aside>
                    <el-container>
                        <el-header class="header">Header</el-header>
                        <el-main class="main">Main</el-main>
                    </el-container>
                </el-container>

                <el-container class="layout m-t-20">
                    <el-aside class="aside" width="200px" style="height: 320px; line-height: 320px;">
                        Aside
                    </el-aside>
                    <el-container>
                        <el-header class="header">Header</el-header>
                        <el-main class="main">Main</el-main>
                        <el-footer class="footer">Footer</el-footer>
                    </el-container>
                </el-container>
            </div>

            <h3>Container Attributes</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>参数</th>
                    <th>说明</th>
                    <th>类型</th>
                    <th>可选值</th>
                    <th>默认值</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>direction</td>
                    <td>子元素的排列方向</td>
                    <td>string</td>
                    <td>horizontal / vertical</td>
                    <td>子元素中有 <code>el-header</code> 或 <code>el-footer</code> 时为 vertical，否则为 horizontal
                    </td>
                </tr>
                </tbody>
            </table>

            <h3>Header Attributes</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>参数</th>
                    <th>说明</th>
                    <th>类型</th>
                    <th>可选值</th>
                    <th>默认值</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>height</td>
                    <td>顶栏高度</td>
                    <td>string</td>
                    <td>—</td>
                    <td>60px</td>
                </tr>
                </tbody>
            </table>


            <h3>Aside Attributes</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>参数</th>
                    <th>说明</th>
                    <th>类型</th>
                    <th>可选值</th>
                    <th>默认值</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>width</td>
                    <td>侧边栏宽度</td>
                    <td>string</td>
                    <td>—</td>
                    <td>300px</td>
                </tr>
                </tbody>
            </table>

            <h3>Footer Attributes</h3>
            <table class="table">
                <thead>
                <tr>
                    <th>参数</th>
                    <th>说明</th>
                    <th>类型</th>
                    <th>可选值</th>
                    <th>默认值</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>height</td>
                    <td>底栏高度</td>
                    <td>string</td>
                    <td>—</td>
                    <td>60px</td>
                </tr>
                </tbody>
            </table>

        </el-card>
    </div>
</template>
<template id="elementui_color">
    <div class="view">

        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                主色
                <p class="text-smaller text-color-secondary">Element 主要品牌颜色是鲜艳、友好的蓝色。</p>
            </div>
            <div>
                <el-row>
                    <el-col :span="5">
                        <div class="demo-color-box bg-blue">Blue
                            <div class="value">#409EFF</div>
                        </div>
                    </el-col>
                </el-row>
                bg-blue
            </div>

            <el-collapse class="m-t-20">
                <el-collapse-item>
                    <template slot="title">
                        代码<i class="header-icon el-icon-edit-outline"></i>
                    </template>
                    <p>CSS 样式:bg-blue</p>
                </el-collapse-item>
            </el-collapse>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                辅助色
                <p class="text-smaller text-color-secondary">除了主色外的场景色，需要在不同的场景中使用（例如危险色表示危险的操作）。</p>
            </div>
            <div>
                <el-row :gutter="20">
                    <el-col :span="5">
                        <div class="demo-color-box bg-success">Success
                            <div class="value">#67C23A</div>
                        </div>
                    </el-col>
                    <el-col :span="5">
                        <div class="demo-color-box bg-warning">Warning
                            <div class="value">#E6A23C</div>
                        </div>
                    </el-col>
                    <el-col :span="5">
                        <div class="demo-color-box bg-danger">Danger
                            <div class="value">#F56C6C</div>
                        </div>
                    </el-col>
                    <el-col :span="5">
                        <div class="demo-color-box bg-info">Info
                            <div class="value">#909399</div>
                        </div>
                    </el-col>
                </el-row>
            </div>

            <el-collapse class="m-t-20">
                <el-collapse-item>
                    <template slot="title">
                        代码<i class="header-icon el-icon-edit-outline"></i>
                    </template>
                    <p>CSS 样式:bg-success，bg-warning，bg-danger，bg-info</p>
                </el-collapse-item>
            </el-collapse>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                中性色
                <p class="text-smaller text-color-secondary">中性色用于文本、背景和边框颜色。通过运用不同的中性色，来表现层次结构。</p>
            </div>
            <div>
                <el-row>
                    <el-col :span="5">
                        <div class="demo-color-box-group">
                            <div class="demo-color-box bg-text-primary">主要文字
                                <div class="value">#303133</div>
                            </div>
                            <div class="demo-color-box bg-text-regular">常规文字
                                <div class="value">#606266</div>
                            </div>
                            <div class="demo-color-box bg-text-secondary">次要文字
                                <div class="value">#909399</div>
                            </div>
                            <div class="demo-color-box bg-text-placeholder">占位文字
                                <div class="value">#C0C4CC</div>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="1">
                        <div style="width: 20px;height: 10px"></div>
                    </el-col>
                    <el-col :span="5">
                        <div class="demo-color-box-group">
                            <div class="demo-color-box-2 bg-border-base">一级边框
                                <div class="value">#DCDFE6</div>
                            </div>
                            <div class="demo-color-box-2 bg-border-light">二级边框
                                <div class="value">#E4E7ED</div>
                            </div>
                            <div class="demo-color-box-2 bg-border-lighter">三级边框
                                <div class="value">#EBEEF5</div>
                            </div>
                            <div class="demo-color-box-2 bg-border-extra-light">四级边框
                                <div class="value">#F2F6FC</div>
                            </div>
                        </div>
                    </el-col>
                </el-row>
            </div>

            <el-collapse class="m-t-20">
                <el-collapse-item>
                    <template slot="title">
                        代码<i class="header-icon el-icon-edit-outline"></i>
                    </template>
                    <p>CSS 文字颜色:.text-color-primary
                        ，.text-color-regular，.text-color-secondary，.text-color-placeholder</p>

                    <p>CSS
                        边框颜色:.bg-border-base，.bg-border-light，.bg-border-lighter，.bg-border-extra-light</p>
                </el-collapse-item>
            </el-collapse>
        </el-card>
    </div>
</template>
<template id="elementui_typography">
    <div class="view">

        <h3> Typography 字体</h3>

        <p class="text-color-placeholder">我们对字体进行统一规范，力求在各个操作系统下都有最佳展示效果。</p>

        <h3>中文字体</h3>

        <div class="demo-typo-box typo-PingFang">
            和畅惠风
            <div class="name">PingFang SC</div>
        </div>
        <div class="demo-typo-box typo-Hiragino">
            和畅惠风
            <div class="name">Hiragino Sans GB</div>
        </div>
        <div class="demo-typo-box typo-Microsoft">
            和畅惠风
            <div class="name">Microsoft YaHei</div>
        </div>
        <h3> 英文／数字字体</h3>

        <div class="demo-typo-box typo-Helvetica-neue">
            RGag
            <div class="name">Helvetica Neue</div>
        </div>
        <div class="demo-typo-box typo-Helvetica">
            RGag
            <div class="name">Helvetica</div>
        </div>
        <div class="demo-typo-box typo-Arial">
            RGag
            <div class="name">Arial</div>
        </div>
        <h3 id="font-family-dai-ma">Font-family 代码</h3>

        <code class="hljs">
            <span>font-family</span>: "
            <span>Helvetica</span> <span class="hljs-selector-tag">Neue</span>",
            <span>Helvetica</span>,"
            <span>PingFang</span>
            <span>SC</span>","
            <span>Hiragino</span>
            <span>Sans</span>
            <span class="hljs-selector-tag">GB</span>","
            <span>Microsoft</span>
            <span class="hljs-selector-tag">YaHei</span>","微软雅黑",
            <span>Arial</span>,
            <span class="hljs-selector-tag">sans-serif</span>;
        </code>

        <h3>字体使用规范</h3>
        <table>
            <tbody>
            <tr>
                <td class="h1">主标题</td>
                <td class="h1">用 Element 快速搭建页面</td>
                <td class="color-dark-light">20px Extra large</td>
            </tr>
            <tr>
                <td class="h2">标题</td>
                <td class="h2">用 Element 快速搭建页面</td>
                <td class="color-dark-light">18px large</td>
            </tr>
            <tr>
                <td class="h3">小标题</td>
                <td class="h3">用 Element 快速搭建页面</td>
                <td class="color-dark-light">16px Medium</td>
            </tr>
            <tr>
                <td class="text-regular">正文</td>
                <td class="text-regular">用 Element 快速搭建页面</td>
                <td class="color-dark-light">14px Small</td>
            </tr>
            <tr>
                <td class="text-small">正文（小）</td>
                <td class="text-small">用 Element 快速搭建页面</td>
                <td class="color-dark-light">13px Extra Small</td>
            </tr>
            <tr>
                <td class="text-smaller">辅助文字</td>
                <td class="text-smaller">用 Element 快速搭建页面</td>
                <td class="color-dark-light">12px Extra Extra Small</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>
<template id="elementui_icon">
    <div class="view">

        <h2> Icon 图标</h2>

        <p class="text-color-placeholder">提供了一套常用的图标集合。</p>

        <h3>使用方法</h3>

        <p>直接通过设置类名为 <code>el-icon-iconName</code> 来使用即可。例如：</p>

        <el-card shadow="hover">
            <div slot="header" class="clearfix">
                【效果】
            </div>
            <div>
                <i class="el-icon-edit"></i>
                <i class="el-icon-share"></i>
                <i class="el-icon-delete"></i>
                <el-button type="primary" icon="el-icon-search">搜索</el-button>
            </div>
        </el-card>

        <h3> 图标集合</h3>

        <ul class="icon-list">
            <li><span><i class="el-icon-info"></i><span class="icon-name">el-icon-info</span></span>
            </li>
            <li><span><i class="el-icon-error"></i><span class="icon-name">el-icon-error</span></span>
            </li>
            <li><span><i class="el-icon-success"></i><span
                    class="icon-name">el-icon-success</span></span></li>
            <li><span><i class="el-icon-warning"></i><span
                    class="icon-name">el-icon-warning</span></span></li>
            <li><span><i class="el-icon-question"></i><span
                    class="icon-name">el-icon-question</span></span></li>
            <li><span><i class="el-icon-back"></i><span class="icon-name">el-icon-back</span></span>
            </li>
            <li><span><i class="el-icon-arrow-left"></i><span
                    class="icon-name">el-icon-arrow-left</span></span></li>
            <li><span><i class="el-icon-arrow-down"></i><span
                    class="icon-name">el-icon-arrow-down</span></span></li>
            <li><span><i class="el-icon-arrow-right"></i><span
                    class="icon-name">el-icon-arrow-right</span></span></li>
            <li><span><i class="el-icon-arrow-up"></i><span
                    class="icon-name">el-icon-arrow-up</span></span></li>
            <li><span><i class="el-icon-caret-left"></i><span
                    class="icon-name">el-icon-caret-left</span></span></li>
            <li><span><i class="el-icon-caret-bottom"></i><span
                    class="icon-name">el-icon-caret-bottom</span></span>
            </li>
            <li><span><i class="el-icon-caret-top"></i><span class="icon-name">el-icon-caret-top</span></span>
            </li>
            <li><span><i class="el-icon-caret-right"></i><span
                    class="icon-name">el-icon-caret-right</span></span></li>
            <li><span><i class="el-icon-d-arrow-left"></i><span
                    class="icon-name">el-icon-d-arrow-left</span></span>
            </li>
            <li><span><i class="el-icon-d-arrow-right"></i><span
                    class="icon-name">el-icon-d-arrow-right</span></span>
            </li>
            <li><span><i class="el-icon-minus"></i><span class="icon-name">el-icon-minus</span></span>
            </li>
            <li><span><i class="el-icon-plus"></i><span class="icon-name">el-icon-plus</span></span>
            </li>
            <li><span><i class="el-icon-remove"></i><span class="icon-name">el-icon-remove</span></span>
            </li>
            <li><span><i class="el-icon-circle-plus"></i><span
                    class="icon-name">el-icon-circle-plus</span></span></li>
            <li><span><i class="el-icon-remove-outline"></i><span class="icon-name">el-icon-remove-outline</span></span>
            </li>
            <li><span><i class="el-icon-circle-plus-outline"></i><span
                    class="icon-name">el-icon-circle-plus-outline</span></span></li>
            <li><span><i class="el-icon-close"></i><span class="icon-name">el-icon-close</span></span>
            </li>
            <li><span><i class="el-icon-check"></i><span class="icon-name">el-icon-check</span></span>
            </li>
            <li><span><i class="el-icon-circle-close"></i><span
                    class="icon-name">el-icon-circle-close</span></span>
            </li>
            <li><span><i class="el-icon-circle-check"></i><span
                    class="icon-name">el-icon-circle-check</span></span>
            </li>
            <li><span><i class="el-icon-circle-close-outline"></i><span
                    class="icon-name">el-icon-circle-close-outline</span></span></li>
            <li><span><i class="el-icon-circle-check-outline"></i><span
                    class="icon-name">el-icon-circle-check-outline</span></span></li>
            <li><span><i class="el-icon-zoom-out"></i><span
                    class="icon-name">el-icon-zoom-out</span></span></li>
            <li><span><i class="el-icon-zoom-in"></i><span
                    class="icon-name">el-icon-zoom-in</span></span></li>
            <li><span><i class="el-icon-d-caret"></i><span
                    class="icon-name">el-icon-d-caret</span></span></li>
            <li><span><i class="el-icon-sort"></i><span class="icon-name">el-icon-sort</span></span>
            </li>
            <li><span><i class="el-icon-sort-down"></i><span class="icon-name">el-icon-sort-down</span></span>
            </li>
            <li><span><i class="el-icon-sort-up"></i><span
                    class="icon-name">el-icon-sort-up</span></span></li>
            <li><span><i class="el-icon-tickets"></i><span
                    class="icon-name">el-icon-tickets</span></span></li>
            <li><span><i class="el-icon-document"></i><span
                    class="icon-name">el-icon-document</span></span></li>
            <li><span><i class="el-icon-goods"></i><span class="icon-name">el-icon-goods</span></span>
            </li>
            <li><span><i class="el-icon-sold-out"></i><span
                    class="icon-name">el-icon-sold-out</span></span></li>
            <li><span><i class="el-icon-news"></i><span class="icon-name">el-icon-news</span></span>
            </li>
            <li><span><i class="el-icon-message"></i><span
                    class="icon-name">el-icon-message</span></span></li>
            <li><span><i class="el-icon-date"></i><span class="icon-name">el-icon-date</span></span>
            </li>
            <li><span><i class="el-icon-printer"></i><span
                    class="icon-name">el-icon-printer</span></span></li>
            <li><span><i class="el-icon-time"></i><span class="icon-name">el-icon-time</span></span>
            </li>
            <li><span><i class="el-icon-bell"></i><span class="icon-name">el-icon-bell</span></span>
            </li>
            <li><span><i class="el-icon-mobile-phone"></i><span
                    class="icon-name">el-icon-mobile-phone</span></span>
            </li>
            <li><span><i class="el-icon-service"></i><span
                    class="icon-name">el-icon-service</span></span></li>
            <li><span><i class="el-icon-view"></i><span class="icon-name">el-icon-view</span></span>
            </li>
            <li><span><i class="el-icon-menu"></i><span class="icon-name">el-icon-menu</span></span>
            </li>
            <li><span><i class="el-icon-more"></i><span class="icon-name">el-icon-more</span></span>
            </li>
            <li><span><i class="el-icon-more-outline"></i><span
                    class="icon-name">el-icon-more-outline</span></span>
            </li>
            <li><span><i class="el-icon-star-on"></i><span
                    class="icon-name">el-icon-star-on</span></span></li>
            <li><span><i class="el-icon-star-off"></i><span
                    class="icon-name">el-icon-star-off</span></span></li>
            <li><span><i class="el-icon-location"></i><span
                    class="icon-name">el-icon-location</span></span></li>
            <li><span><i class="el-icon-location-outline"></i><span
                    class="icon-name">el-icon-location-outline</span></span></li>
            <li><span><i class="el-icon-phone"></i><span class="icon-name">el-icon-phone</span></span>
            </li>
            <li><span><i class="el-icon-phone-outline"></i><span
                    class="icon-name">el-icon-phone-outline</span></span>
            </li>
            <li><span><i class="el-icon-picture"></i><span
                    class="icon-name">el-icon-picture</span></span></li>
            <li><span><i class="el-icon-picture-outline"></i><span
                    class="icon-name">el-icon-picture-outline</span></span></li>
            <li><span><i class="el-icon-delete"></i><span class="icon-name">el-icon-delete</span></span>
            </li>
            <li><span><i class="el-icon-search"></i><span class="icon-name">el-icon-search</span></span>
            </li>
            <li><span><i class="el-icon-edit"></i><span class="icon-name">el-icon-edit</span></span>
            </li>
            <li><span><i class="el-icon-edit-outline"></i><span
                    class="icon-name">el-icon-edit-outline</span></span>
            </li>
            <li><span><i class="el-icon-rank"></i><span class="icon-name">el-icon-rank</span></span>
            </li>
            <li><span><i class="el-icon-refresh"></i><span
                    class="icon-name">el-icon-refresh</span></span></li>
            <li><span><i class="el-icon-share"></i><span class="icon-name">el-icon-share</span></span>
            </li>
            <li><span><i class="el-icon-setting"></i><span
                    class="icon-name">el-icon-setting</span></span></li>
            <li><span><i class="el-icon-upload"></i><span class="icon-name">el-icon-upload</span></span>
            </li>
            <li><span><i class="el-icon-upload2"></i><span
                    class="icon-name">el-icon-upload2</span></span></li>
            <li><span><i class="el-icon-download"></i><span
                    class="icon-name">el-icon-download</span></span></li>
            <li><span><i class="el-icon-loading"></i><span
                    class="icon-name">el-icon-loading</span></span></li>
        </ul>
    </div>
</template>
<template id="elementui_button">
    <div class="view">

        <h1>Button 按钮</h1>

        <a class="remarks">常用的操作按钮。</a>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                【基础用法】
            </div>
            <div>
                <el-row>
                    <el-button>默认按钮</el-button>
                    <el-button type="primary">主要按钮</el-button>
                    <el-button type="success">成功按钮</el-button>
                    <el-button type="info">信息按钮</el-button>
                    <el-button type="warning">警告按钮</el-button>
                    <el-button type="danger">危险按钮</el-button>
                </el-row>

                <el-row>
                    <el-button plain>朴素按钮</el-button>
                    <el-button type="primary" plain>主要按钮</el-button>
                    <el-button type="success" plain>成功按钮</el-button>
                    <el-button type="info" plain>信息按钮</el-button>
                    <el-button type="warning" plain>警告按钮</el-button>
                    <el-button type="danger" plain>危险按钮</el-button>
                </el-row>

                <el-row>
                    <el-button round>圆角按钮</el-button>
                    <el-button type="primary" round>主要按钮</el-button>
                    <el-button type="success" round>成功按钮</el-button>
                    <el-button type="info" round>信息按钮</el-button>
                    <el-button type="warning" round>警告按钮</el-button>
                    <el-button type="danger" round>危险按钮</el-button>
                </el-row>

                <el-row>
                    <el-button icon="el-icon-search" circle></el-button>
                    <el-button type="primary" icon="el-icon-edit" circle></el-button>
                    <el-button type="success" icon="el-icon-check" circle></el-button>
                    <el-button type="info" icon="el-icon-message" circle></el-button>
                    <el-button type="warning" icon="el-icon-star-off" circle></el-button>
                    <el-button type="danger" icon="el-icon-delete" circle></el-button>
                </el-row>
            </div>
        </el-card>


        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h1>禁用状态</h1>
                <a class="remarks">按钮不可用状态。</a>
            </div>
            <div>
                <el-row>
                    <el-button disabled>默认按钮</el-button>
                    <el-button type="primary" disabled>主要按钮</el-button>
                    <el-button type="success" disabled>成功按钮</el-button>
                    <el-button type="info" disabled>信息按钮</el-button>
                    <el-button type="warning" disabled>警告按钮</el-button>
                    <el-button type="danger" disabled>危险按钮</el-button>
                </el-row>

                <el-row>
                    <el-button plain disabled>朴素按钮</el-button>
                    <el-button type="primary" plain disabled>主要按钮</el-button>
                    <el-button type="success" plain disabled>成功按钮</el-button>
                    <el-button type="info" plain disabled>信息按钮</el-button>
                    <el-button type="warning" plain disabled>警告按钮</el-button>
                    <el-button type="danger" plain disabled>危险按钮</el-button>
                </el-row>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h1>文字按钮</h1>

                <a class="remarks">没有边框和背景色的按钮。</a>
            </div>
            <div>
                <el-button type="text">文字按钮</el-button>
                <el-button type="text" disabled>文字按钮</el-button>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h1>图标按钮</h1>

                <a class="remarks">带图标的按钮可增强辨识度（有文字）或节省空间（无文字）。</a>
            </div>
            <div>
                <el-button type="primary" icon="el-icon-edit"></el-button>
                <el-button type="primary" icon="el-icon-share"></el-button>
                <el-button type="primary" icon="el-icon-delete"></el-button>
                <el-button type="primary" icon="el-icon-search">搜索</el-button>
                <el-button type="primary">上传<i class="el-icon-upload el-icon--right"></i></el-button>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h1>按钮组</h1>

                <a class="remarks">以按钮组的方式出现，常用于多项类似操作。</a>
            </div>
            <div>
                <el-button-group>
                    <el-button type="primary" icon="el-icon-arrow-left">上一页</el-button>
                    <el-button type="primary">下一页<i class="el-icon-arrow-right el-icon--right"></i>
                    </el-button>
                </el-button-group>
                <el-button-group>
                    <el-button type="primary" icon="el-icon-edit"></el-button>
                    <el-button type="primary" icon="el-icon-share"></el-button>
                    <el-button type="primary" icon="el-icon-delete"></el-button>
                </el-button-group>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h1>加载中</h1>

                <a class="remarks">点击按钮后进行数据加载操作，在按钮上显示加载状态。</a>
            </div>
            <div>
                <el-button type="primary" :loading="true">加载中</el-button>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h1>不同尺寸</h1>

                <a class="remarks">Button 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。</a>
            </div>
            <div>
                <el-button type="primary" :loading="true">加载中</el-button>
            </div>
        </el-card>

        <h3>Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>size</td>
                <td>尺寸</td>
                <td>string</td>
                <td>medium / small / mini</td>
                <td>—</td>
            </tr>
            <tr>
                <td>type</td>
                <td>类型</td>
                <td>string</td>
                <td>primary / success / warning / danger / info / text</td>
                <td>—</td>
            </tr>
            <tr>
                <td>plain</td>
                <td>是否朴素按钮</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>round</td>
                <td>是否圆角按钮</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>circle</td>
                <td>是否圆形按钮</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>loading</td>
                <td>是否加载中状态</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>disabled</td>
                <td>是否禁用状态</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>icon</td>
                <td>图标类名</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>autofocus</td>
                <td>是否默认聚焦</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>native-type</td>
                <td>原生 type 属性</td>
                <td>string</td>
                <td>button / submit / reset</td>
                <td>button</td>
            </tr>
            </tbody>
        </table>

    </div>
</template>
<template id="elementui_upload">
    <div class="view">
        <h1>Upload 上传</h1>

        <a class="remarks">通过点击或者拖拽上传文件</a>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>点击上传</h4>
            </div>
            <div>
                <el-upload
                        class="upload-demo"
                        action="https://jsonplaceholder.typicode.com/posts/"
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :before-remove="beforeRemove"
                        multiple
                        :limit="3"
                        :on-exceed="handleExceed"
                        :file-list="fileList20">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>用户头像上传</h4>

                <a class="remarks">使用 <code>before-upload</code> 限制用户上传的图片格式和大小。</a>
            </div>
            <div>
                <el-upload
                        class="avatar-uploader"
                        action="https://jsonplaceholder.typicode.com/posts/"
                        :show-file-list="false"
                        :on-success="handleAvatarSuccess"
                        :before-upload="beforeAvatarUpload">
                    <img v-if="imageUrl20" :src="imageUrl20" class="avatar">
                    <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                </el-upload>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>照片墙</h4>

                <a class="remarks">使用 <code>list-type</code> 属性来设置文件列表的样式。</a>
            </div>
            <div>
                <el-upload
                        action="https://jsonplaceholder.typicode.com/posts/"
                        list-type="picture-card"
                        :on-preview="handlePictureCardPreview"
                        :on-remove="handleRemove">
                    <i class="el-icon-plus"></i>
                </el-upload>
                <el-dialog :visible.sync="dialogVisible20">
                    <img width="100%" :src="dialogImageUrl20" alt="">
                </el-dialog>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>图片列表缩略图</h4>
            </div>
            <div>
                <el-upload
                        class="upload-demo"
                        action="https://jsonplaceholder.typicode.com/posts/"
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :file-list="fileList20_2"
                        list-type="picture">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>上传文件列表控制</h4>

                <a class="remarks">通过 <code>on-change</code> 钩子函数来对列表进行控制</a>
            </div>
            <div>
                <el-upload
                        class="upload-demo"
                        action="https://jsonplaceholder.typicode.com/posts/"
                        :on-change="handleChange"
                        :file-list="fileList20_3">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>拖拽上传</h4>

                <a class="remarks">remarks</a>
            </div>
            <div>
                <el-upload
                        class="upload-demo"
                        drag
                        action="https://jsonplaceholder.typicode.com/posts/"
                        multiple>
                    <i class="el-icon-upload"></i>

                    <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                    <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>手动上传</h4>
            </div>
            <div>
                <el-upload
                        class="upload-demo"
                        ref="upload"
                        action="https://jsonplaceholder.typicode.com/posts/"
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :file-list="fileList20"
                        :auto-upload="false">
                    <el-button slot="trigger" size="small" type="primary">选取文件</el-button>
                    <el-button style="margin-left: 10px;" size="small" type="success"
                               @click="submitUpload">上传到服务器
                    </el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>
            </div>
        </el-card>
    </div>
</template>
<template id="elementui_form">
    <div class="view">
        <h1>Form 表单</h1>

        <a class="remarks">由输入框、选择器、单选框、多选框等控件组成，用以收集、校验、提交数据</a>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>典型表单</h4>

                <a class="remarks">包括各种表单项，比如输入框、选择器、开关、单选框、多选框等。</a>
            </div>
            <div>
                <el-form ref="form" :model="form24_" label-width="80px">
                    <el-form-item label="活动名称">
                        <el-input v-model="form24_.name"></el-input>
                    </el-form-item>
                    <el-form-item label="活动区域">
                        <el-select v-model="form24_.region" placeholder="请选择活动区域">
                            <el-option label="区域一" value="shanghai"></el-option>
                            <el-option label="区域二" value="beijing"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="活动时间">
                        <el-col :span="11">
                            <el-date-picker type="date" placeholder="选择日期" v-model="form24_.date1"
                                            style="width: 100%;"></el-date-picker>
                        </el-col>
                        <el-col class="line" :span="2">-</el-col>
                        <el-col :span="11">
                            <el-time-picker type="fixed-time" placeholder="选择时间" v-model="form24_.date2"
                                            style="width: 100%;"></el-time-picker>
                        </el-col>
                    </el-form-item>
                    <el-form-item label="即时配送">
                        <el-switch v-model="form24_.delivery"></el-switch>
                    </el-form-item>
                    <el-form-item label="活动性质">
                        <el-checkbox-group v-model="form24_.type">
                            <el-checkbox label="美食/餐厅线上活动" name="type"></el-checkbox>
                            <el-checkbox label="地推活动" name="type"></el-checkbox>
                            <el-checkbox label="线下主题活动" name="type"></el-checkbox>
                            <el-checkbox label="单纯品牌曝光" name="type"></el-checkbox>
                        </el-checkbox-group>
                    </el-form-item>
                    <el-form-item label="特殊资源">
                        <el-radio-group v-model="form24_.resource">
                            <el-radio label="线上品牌商赞助"></el-radio>
                            <el-radio label="线下场地免费"></el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item label="活动形式">
                        <el-input type="textarea" v-model="form24_.desc"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit">立即创建</el-button>
                        <el-button>取消</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>行内表单</h4>

                <a class="remarks">当垂直方向空间受限且表单较简单时，可以在一行内放置表单。</a>
            </div>
            <div>
                <el-form :inline="true" :model="formInline24_" class="demo-form-inline">
                    <el-form-item label="审批人">
                        <el-input v-model="formInline24_.user" placeholder="审批人"></el-input>
                    </el-form-item>
                    <el-form-item label="活动区域">
                        <el-select v-model="formInline24_.region" placeholder="活动区域">
                            <el-option label="区域一" value="shanghai"></el-option>
                            <el-option label="区域二" value="beijing"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="onSubmit">查询</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>对齐方式</h4>

                <a class="remarks">根据具体目标和制约因素，选择最佳的标签对齐方式。</a>
            </div>
            <div>
                <el-radio-group v-model="labelPosition24_" size="small">
                    <el-radio-button label="left">左对齐</el-radio-button>
                    <el-radio-button label="right">右对齐</el-radio-button>
                    <el-radio-button label="top">顶部对齐</el-radio-button>
                </el-radio-group>
                <div style="margin: 20px;"></div>
                <el-form :label-position="labelPosition24_" label-width="80px"
                         :model="formLabelAlign24_">
                    <el-form-item label="名称">
                        <el-input v-model="formLabelAlign24_.name"></el-input>
                    </el-form-item>
                    <el-form-item label="活动区域">
                        <el-input v-model="formLabelAlign24_.region"></el-input>
                    </el-form-item>
                    <el-form-item label="活动形式">
                        <el-input v-model="formLabelAlign24_.type"></el-input>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>表单验证</h4>

                <a class="remarks">在防止用户犯错的前提下，尽可能让用户更早地发现并纠正错误。</a>
            </div>
            <div>
                <el-form :model="ruleForm24_" :rules="rules" ref="ruleForm24_" label-width="100px"
                         class="demo-ruleForm">
                    <el-form-item label="活动名称" prop="name">
                        <el-input v-model="ruleForm24_.name"></el-input>
                    </el-form-item>
                    <el-form-item label="活动区域" prop="region">
                        <el-select v-model="ruleForm24_.region" placeholder="请选择活动区域">
                            <el-option label="区域一" value="shanghai"></el-option>
                            <el-option label="区域二" value="beijing"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="活动时间" required>
                        <el-col :span="11">
                            <el-form-item prop="date1">
                                <el-date-picker type="date" placeholder="选择日期"
                                                v-model="ruleForm24_.date1"
                                                style="width: 100%;"></el-date-picker>
                            </el-form-item>
                        </el-col>
                        <el-col class="line" :span="2">-</el-col>
                        <el-col :span="11">
                            <el-form-item prop="date2">
                                <el-time-picker type="fixed-time" placeholder="选择时间"
                                                v-model="ruleForm24_.date2"
                                                style="width: 100%;"></el-time-picker>
                            </el-form-item>
                        </el-col>
                    </el-form-item>
                    <el-form-item label="即时配送" prop="delivery">
                        <el-switch v-model="ruleForm24_.delivery"></el-switch>
                    </el-form-item>
                    <el-form-item label="活动性质" prop="type">
                        <el-checkbox-group v-model="ruleForm24_.type">
                            <el-checkbox label="美食/餐厅线上活动" name="type"></el-checkbox>
                            <el-checkbox label="地推活动" name="type"></el-checkbox>
                            <el-checkbox label="线下主题活动" name="type"></el-checkbox>
                            <el-checkbox label="单纯品牌曝光" name="type"></el-checkbox>
                        </el-checkbox-group>
                    </el-form-item>
                    <el-form-item label="特殊资源" prop="resource">
                        <el-radio-group v-model="ruleForm24_.resource">
                            <el-radio label="线上品牌商赞助"></el-radio>
                            <el-radio label="线下场地免费"></el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item label="活动形式" prop="desc">
                        <el-input type="textarea" v-model="ruleForm24_.desc"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button>
                        <el-button @click="resetForm('ruleForm')">重置</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>自定义校验规则</h4>

                <a class="remarks">这个例子中展示了如何使用自定义验证规则来完成密码的二次验证。</a>
            </div>
            <div>
                <el-form :model="ruleForm24_2" status-icon :rules="rules24_2" ref="ruleForm24_2"
                         label-width="100px" class="demo-ruleForm">
                    <el-form-item label="密码" prop="pass">
                        <el-input type="password" v-model="ruleForm24_2.pass"
                                  auto-complete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="确认密码" prop="checkPass">
                        <el-input type="password" v-model="ruleForm24_2.checkPass"
                                  auto-complete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="年龄" prop="age">
                        <el-input v-model.number="ruleForm24_2.age"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('ruleForm24_2')">提交</el-button>
                        <el-button @click="resetForm('ruleForm24_2')">重置</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>动态增减表单项</h4>
            </div>
            <div class="demo">
                <el-form :model="dynamicValidateForm" ref="dynamicValidateForm" label-width="100px"
                         class="demo-dynamic">
                    <el-form-item
                            prop="email"
                            label="邮箱"
                            :rules="[
                                                        { required: true, message: '请输入邮箱地址', trigger: 'blur' },
                                                        { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
                                                    ]">
                        <el-input v-model="dynamicValidateForm.email"></el-input>
                    </el-form-item>
                    <el-form-item
                            v-for="(domain, index) in dynamicValidateForm.domains"
                            :label="'域名' + index"
                            :key="domain.key"
                            :prop="'domains.' + index + '.value'"
                            :rules="{
                                                      required: true, message: '域名不能为空', trigger: 'blur'
                                                    }">
                        <el-input v-model="domain.value"></el-input>
                        <el-button @click.prevent="removeDomain(domain)">删除</el-button>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('dynamicValidateForm')">提交
                        </el-button>
                        <el-button @click="addDomain">新增域名</el-button>
                        <el-button @click="resetForm('dynamicValidateForm')">重置</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>数字类型验证</h4>
            </div>
            <div>
                <el-form :model="numberValidateForm" ref="numberValidateForm" label-width="100px"
                         class="demo-ruleForm">
                    <el-form-item
                            label="年龄"
                            prop="age"
                            :rules="[
                                                  { required: true, message: '年龄不能为空'},
                                                  { type: 'number', message: '年龄必须为数字值'}
                                                ]">
                        <el-input type="age" v-model.number="numberValidateForm.age"
                                  auto-complete="off"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="submitForm('numberValidateForm')">提交
                        </el-button>
                        <el-button @click="resetForm('numberValidateForm')">重置</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>

        <p>嵌套在 <code>el-form-item</code> 中的 <code>el-form-item</code> 标签宽度默认为零，不会继承 <code>el-form</code>
            的 <code>label-width</code>。如果需要可以为其单独设置 <code>label-width</code> 属性。</p>


        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>表单内组件尺寸控制</h4>

                <a class="remarks"><p>通过设置 Form 上的 <code>size</code> 属性可以使该表单内所有可调节大小的组件继承该尺寸。Form-Item
                    也具有该属性。</p></a>
            </div>
            <div>
                <el-form ref="form" :model="sizeForm" label-width="80px" size="mini">
                    <el-form-item label="活动名称">
                        <el-input v-model="sizeForm.name"></el-input>
                    </el-form-item>
                    <el-form-item label="活动区域">
                        <el-select v-model="sizeForm.region" placeholder="请选择活动区域">
                            <el-option label="区域一" value="shanghai"></el-option>
                            <el-option label="区域二" value="beijing"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="活动时间">
                        <el-col :span="11">
                            <el-date-picker type="date" placeholder="选择日期" v-model="sizeForm.date1"
                                            style="width: 100%;"></el-date-picker>
                        </el-col>
                        <el-col class="line" :span="2">-</el-col>
                        <el-col :span="11">
                            <el-time-picker type="fixed-time" placeholder="选择时间"
                                            v-model="sizeForm.date2"
                                            style="width: 100%;"></el-time-picker>
                        </el-col>
                    </el-form-item>
                    <el-form-item label="活动性质">
                        <el-checkbox-group v-model="sizeForm.type">
                            <el-checkbox-button label="美食/餐厅线上活动" name="type"></el-checkbox-button>
                            <el-checkbox-button label="地推活动" name="type"></el-checkbox-button>
                            <el-checkbox-button label="线下主题活动" name="type"></el-checkbox-button>
                        </el-checkbox-group>
                    </el-form-item>
                    <el-form-item label="特殊资源">
                        <el-radio-group v-model="sizeForm.resource" size="medium">
                            <el-radio border label="线上品牌商赞助"></el-radio>
                            <el-radio border label="线下场地免费"></el-radio>
                        </el-radio-group>
                    </el-form-item>
                    <el-form-item size="large">
                        <el-button type="primary" @click="onSubmit">立即创建</el-button>
                        <el-button>取消</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </el-card>

        <h3>Form Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>model</td>
                <td>表单数据对象</td>
                <td>object</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>rules</td>
                <td>表单验证规则</td>
                <td>object</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>inline</td>
                <td>行内表单模式</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>label-position</td>
                <td>表单域标签的位置</td>
                <td>string</td>
                <td>right/left/top</td>
                <td>right</td>
            </tr>
            <tr>
                <td>label-width</td>
                <td>表单域标签的宽度，作为 Form 直接子元素的 form-item 会继承该值</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>label-suffix</td>
                <td>表单域标签的后缀</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>show-message</td>
                <td>是否显示校验错误信息</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>inline-message</td>
                <td>是否以行内形式展示校验信息</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>status-icon</td>
                <td>是否在输入框中显示校验结果反馈图标</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>validate-on-rule-change</td>
                <td>是否在 <code>rules</code> 属性改变后立即触发一次验证</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>size</td>
                <td>用于控制该表单内组件的尺寸</td>
                <td>string</td>
                <td>medium / small / mini</td>
                <td>—</td>
            </tr>
            <tr>
                <td>disabled</td>
                <td>是否禁用该表单内的所有组件。若设置为 true，则表单内组件上的 disabled 属性不再生效</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            </tbody>
        </table>

        <h3>Form Methods</h3>
        <table class="table">
            <thead>
            <tr>
                <th>方法名</th>
                <th>说明</th>
                <th>参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>validate</td>
                <td>对整个表单进行校验的方法，参数为一个回调函数。该回调函数会在校验结束后被调用，并传入两个参数：是否校验成功和未通过校验的字段。若不传入回调函数，则会返回一个
                    promise
                </td>
                <td>Function(callback: Function(boolean, object))</td>
            </tr>
            <tr>
                <td>validateField</td>
                <td>对部分表单字段进行校验的方法</td>
                <td>Function(prop: string, callback: Function(errorMessage: string))</td>
            </tr>
            <tr>
                <td>resetFields</td>
                <td>对整个表单进行重置，将所有字段值重置为初始值并移除校验结果</td>
                <td>—</td>
            </tr>
            <tr>
                <td>clearValidate</td>
                <td>移除表单项的校验结果。传入待移除的表单项的 prop 属性组成的数组，如不传则移除整个表单的校验结果</td>
                <td>Function(props: array)</td>
            </tr>
            </tbody>
        </table>

        <h3>Form Events</h3>
        <table class="table">
            <thead>
            <tr>
                <th>事件名称</th>
                <th>说明</th>
                <th>回调参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>validate</td>
                <td>任一表单项被校验后触发</td>
                <td>被校验的表单项 prop 值，校验是否通过</td>
            </tr>
            </tbody>
        </table>

        <h3>Form-Item Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>prop</td>
                <td>表单域 model 字段，在使用 validate、resetFields 方法的情况下，该属性是必填的</td>
                <td>string</td>
                <td>传入 Form 组件的 <code>model</code> 中的字段</td>
                <td>—</td>
            </tr>
            <tr>
                <td>label</td>
                <td>标签文本</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>label-width</td>
                <td>表单域标签的的宽度，例如 '50px'</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>required</td>
                <td>是否必填，如不设置，则会根据校验规则自动生成</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>rules</td>
                <td>表单验证规则</td>
                <td>object</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>error</td>
                <td>表单域验证错误信息, 设置该值会使表单验证状态变为<code>error</code>，并显示该错误信息</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>show-message</td>
                <td>是否显示校验错误信息</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>inline-message</td>
                <td>以行内形式展示校验信息</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>size</td>
                <td>用于控制该表单域下组件的尺寸</td>
                <td>string</td>
                <td>medium / small / mini</td>
                <td>-</td>
            </tr>
            </tbody>
        </table>

        <h3>Form-Item Slot</h3>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>说明</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>—</td>
                <td>Form Item 的内容</td>
            </tr>
            <tr>
                <td>label</td>
                <td>标签文本的内容</td>
            </tr>
            </tbody>
        </table>

        <h3>Form-Item Methods</h3>
        <table class="table">
            <thead>
            <tr>
                <th>方法名</th>
                <th>说明</th>
                <th>参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>resetField</td>
                <td>对该表单项进行重置，将其值重置为初始值并移除校验结果</td>
                <td>-</td>
            </tr>
            <tr>
                <td>clearValidate</td>
                <td>移除该表单项的校验结果</td>
                <td>-</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>
<template id="elementui_table">
    <div class="view">
        <h1>Table 表格</h1>

        <a class="remarks">用于展示多条结构类似的数据，可对数据进行排序、筛选、对比或其他自定义操作。</a>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>基础表格</h4>

                <a class="remarks">基础的表格展示用法。</a>
            </div>
            <div>
                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="日期"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址">
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>带斑马纹表格</h4>

                <a class="remarks">使用带斑马纹的表格，可以更容易区分出不同行的数据。</a>
            </div>
            <div>
                <template>
                    <el-table
                            :data="tableData"
                            stripe
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="日期"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址">
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>带边框表格</h4>
            </div>
            <div>

                <div class="description"><p>默认情况下，Table
                    组件是不具有竖直方向的边框的，如果需要，可以使用<code>border</code>属性，它接受一个<code>Boolean</code>，设置为<code>true</code>即可启用。
                </p></div>

                <template>
                    <el-table
                            :data="tableData"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="日期"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址">
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>固定表头</h4>
            </div>
            <div>
                <template>
                    <el-table
                            :data="tableData"
                            height="250"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="日期"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址">
                        </el-table-column>
                    </el-table>
                </template>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>固定列</h4>

                <a class="remarks">横向内容过多时，可选择固定列。</a>
            </div>
            <div>
                <div class="description"><p>固定列需要使用<code>fixed</code>属性，它接受 Boolean
                    值或者<code>left</code><code>right</code>，表示左边固定还是右边固定。
                </p></div>
                <template>
                    <el-table
                            :data="tableData"
                            border
                            style="width: 100%">
                        <el-table-column
                                fixed
                                prop="date"
                                label="日期"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="province"
                                label="省份"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="city"
                                label="市区"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址"
                                width="300">
                        </el-table-column>
                        <el-table-column
                                prop="zip"
                                label="邮编"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                fixed="right"
                                label="操作"
                                width="100">
                            <template slot-scope="scope">
                                <el-button @click="handleClick(scope.row)" type="text" size="small">查看
                                </el-button>
                                <el-button type="text" size="small">编辑</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>固定列和表头</h4>

                <a class="remarks">横纵内容过多时，可选择固定列和表头。</a>
            </div>
            <div>
                <div class="description"><p>固定列和表头可以同时使用，只需要将上述两个属性分别设置好即可。</p></div>

                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%"
                            height="250">
                        <el-table-column
                                fixed
                                prop="date"
                                label="日期"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="province"
                                label="省份"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="city"
                                label="市区"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址"
                                width="300">
                        </el-table-column>
                        <el-table-column
                                prop="zip"
                                label="邮编"
                                width="120">
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>流体高度</h4>

                <a class="remarks">当数据量动态变化时，可以为 Table 设置一个最大高度。</a>
            </div>
            <div>
                <div class="description"><p>通过设置<code>max-height</code>属性为 Table
                    指定最大高度。此时若表格所需的高度大于最大高度，则会显示一个滚动条。</p></div>

                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%"
                            max-height="250">
                        <el-table-column
                                fixed
                                prop="date"
                                label="日期"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="province"
                                label="省份"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="city"
                                label="市区"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址"
                                width="300">
                        </el-table-column>
                        <el-table-column
                                prop="zip"
                                label="邮编"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                fixed="right"
                                label="操作"
                                width="120">
                            <template slot-scope="scope">
                                <el-button
                                        @click.native.prevent="deleteRow(scope.$index, tableData4)"
                                        type="text"
                                        size="small">
                                    移除
                                </el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>多级表头</h4>

                <a class="remarks">数据结构比较复杂的时候，可使用多级表头来展现数据的层次关系。</a>
            </div>
            <div>
                <div class="description"><p>只需要在 el-table-column 里面嵌套 el-table-column，就可以实现多级表头。</p>
                </div>

                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="日期"
                                width="150">
                        </el-table-column>
                        <el-table-column label="配送信息">
                            <el-table-column
                                    prop="name"
                                    label="姓名"
                                    width="120">
                            </el-table-column>
                            <el-table-column label="地址">
                                <el-table-column
                                        prop="province"
                                        label="省份"
                                        width="120">
                                </el-table-column>
                                <el-table-column
                                        prop="city"
                                        label="市区"
                                        width="120">
                                </el-table-column>
                                <el-table-column
                                        prop="address"
                                        label="地址"
                                        width="300">
                                </el-table-column>
                                <el-table-column
                                        prop="zip"
                                        label="邮编"
                                        width="120">
                                </el-table-column>
                            </el-table-column>
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>单选</h4>

                <a class="remarks">选择单行数据时使用色块表示。</a>
            </div>
            <div>
                <div class="description"><p>Table 组件提供了单选的支持，只需要配置<code>highlight-current-row</code>属性即可实现单选。之后由<code>current-change</code>事件来管理选中时触发的事件，它会传入<code>currentRow</code>，<code>oldCurrentRow</code>。如果需要显示索引，可以增加一列<code>el-table-column</code>，设置<code>type</code>属性为<code>index</code>即可显示从
                    1 开始的索引号。</p></div>

                <template>
                    <el-table
                            ref="singleTable"
                            :data="tableData"
                            highlight-current-row
                            @current-change="handleCurrentChange"
                            style="width: 100%">
                        <el-table-column
                                type="index"
                                width="50">
                        </el-table-column>
                        <el-table-column
                                property="date"
                                label="日期"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                property="name"
                                label="姓名"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                property="address"
                                label="地址">
                        </el-table-column>
                    </el-table>
                    <div style="margin-top: 20px">
                        <el-button @click="setCurrent(tableData[1])">选中第二行</el-button>
                        <el-button @click="setCurrent()">取消选择</el-button>
                    </div>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>多选</h4>

                <a class="remarks">选择多行数据时使用 Checkbox。</a>
            </div>
            <div>
                <div class="description"><p>实现多选非常简单:
                    手动添加一个<code>el-table-column</code>，设<code>type</code>属性为<code>selection</code>即可；默认情况下若内容过多会折行显示，若需要单行显示可以使用<code>show-overflow-tooltip</code>属性，它接受一个<code>Boolean</code>，为<code>true</code>时多余的内容会在
                    hover 时以 tooltip 的形式显示出来。</p></div>

                <template>
                    <el-table
                            ref="multipleTable"
                            :data="tableData"
                            tooltip-effect="dark"
                            style="width: 100%"
                            @selection-change="handleSelectionChange">
                        <el-table-column
                                type="selection"
                                width="55">
                        </el-table-column>
                        <el-table-column
                                label="日期"
                                width="120">
                            <template slot-scope="scope">{{ scope.row.date }}</template>
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址"
                                show-overflow-tooltip>
                        </el-table-column>
                    </el-table>
                    <div style="margin-top: 20px">
                        <el-button @click="toggleSelection([tableData[1], tableData[2]])">
                            切换第二、第三行的选中状态
                        </el-button>
                        <el-button @click="toggleSelection()">取消选择</el-button>
                    </div>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>排序</h4>

                <a class="remarks">对表格进行排序，可快速查找或对比数据。</a>
            </div>
            <div>
                <div class="description"><p>
                    在列中设置<code>sortable</code>属性即可实现以该列为基准的排序，接受一个<code>Boolean</code>，默认为<code>false</code>。可以通过
                    Table 的<code>default-sort</code>属性设置默认的排序列和排序顺序。可以使用<code>sort-method</code>或者<code>sort-by</code>使用自定义的排序规则。如果需要后端排序，需将<code>sortable</code>设置为<code>custom</code>，同时在
                    Table 上监听<code>sort-change</code>事件，在事件回调中可以获取当前排序的字段名和排序顺序，从而向接口请求排序后的表格数据。在本例中，我们还使用了<code>formatter</code>属性，它用于格式化指定列的值，接受一个<code>Function</code>，会传入两个参数：<code>row</code>和<code>column</code>，可以根据自己的需求进行处理。
                </p></div>

                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%"
                            :default-sort="{prop: 'date', order: 'descending'}"
                    >
                        <el-table-column
                                prop="date"
                                label="日期"
                                sortable
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                sortable
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址"
                                :formatter="formatter">
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>筛选</h4>

                <a class="remarks">对表格进行筛选，可快速查找到自己想看的数据。</a>
            </div>
            <div>
                <div class="description"><p>在列中设置<code>filters</code><code>filter-method</code>属性即可开启该列的筛选，filters
                    是一个数组，<code>filter-method</code>是一个方法，它用于决定某些数据是否显示，会传入三个参数：<code>value</code>,
                    <code>row</code> 和 <code>column</code>。</p></div>

                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="日期"
                                sortable
                                width="180"
                                :filters="[{text: '2016-05-01', value: '2016-05-01'}, {text: '2016-05-02', value: '2016-05-02'}, {text: '2016-05-03', value: '2016-05-03'}, {text: '2016-05-04', value: '2016-05-04'}]"
                                :filter-method="filterHandler"
                        >
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址"
                                :formatter="formatter">
                        </el-table-column>
                        <el-table-column
                                prop="tag"
                                label="标签"
                                width="100"
                                :filters="[{ text: '家', value: '家' }, { text: '公司', value: '公司' }]"
                                :filter-method="filterTag"
                                filter-placement="bottom-end">
                            <template slot-scope="scope">
                                <el-tag
                                        :type="scope.row.tag === '家' ? 'primary' : 'success'"
                                        disable-transitions>{{scope.row.tag}}
                                </el-tag>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>自定义列模板</h4>

                <a class="remarks">自定义列的显示内容，可组合其他组件使用。</a>
            </div>
            <div>
                <div class="description"><p>通过 <code>Scoped slot</code> 可以获取到 row, column, $index 和
                    store（table 内部的状态管理）的数据，用法参考 demo。</p></div>

                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%">
                        <el-table-column
                                label="日期"
                                width="180">
                            <template slot-scope="scope">
                                <i class="el-icon-time"></i>
                                <span style="margin-left: 10px">{{ scope.row.date }}</span>
                            </template>
                        </el-table-column>
                        <el-table-column
                                label="姓名"
                                width="180">
                            <template slot-scope="scope">
                                <el-popover trigger="hover" placement="top">
                                    <p>姓名: {{ scope.row.name }}</p>

                                    <p>住址: {{ scope.row.address }}</p>

                                    <div slot="reference" class="name-wrapper">
                                        <el-tag size="medium">{{ scope.row.name }}</el-tag>
                                    </div>
                                </el-popover>
                            </template>
                        </el-table-column>
                        <el-table-column label="操作">
                            <template slot-scope="scope">
                                <el-button
                                        size="mini"
                                        @click="handleEdit(scope.$index, scope.row)">编辑
                                </el-button>
                                <el-button
                                        size="mini"
                                        type="danger"
                                        @click="handleDelete(scope.$index, scope.row)">删除
                                </el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>


            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>展开行</h4>

                <a class="remarks">当行内容过多并且不想显示横向滚动条时，可以使用 Table 展开行功能。</a>
            </div>
            <div>

                <div class="description"><p>通过设置 type="expand" 和 <code>Scoped slot</code>
                    可以开启展开行功能，<code>el-table-column</code> 的模板会被渲染成为展开行的内容，展开行可访问的属性与使用自定义列模板时的 <code>Scoped
                        slot</code> 相同。</p></div>

                <template>
                    <el-table
                            :data="tableData5"
                            style="width: 100%">
                        <el-table-column type="expand">
                            <template slot-scope="props">
                                <el-form label-position="left" inline class="demo-table-expand">
                                    <el-form-item label="商品名称">
                                        <span>{{ props.row.name }}</span>
                                    </el-form-item>
                                    <el-form-item label="所属店铺">
                                        <span>{{ props.row.shop }}</span>
                                    </el-form-item>
                                    <el-form-item label="商品 ID">
                                        <span>{{ props.row.id }}</span>
                                    </el-form-item>
                                    <el-form-item label="店铺 ID">
                                        <span>{{ props.row.shopId }}</span>
                                    </el-form-item>
                                    <el-form-item label="商品分类">
                                        <span>{{ props.row.category }}</span>
                                    </el-form-item>
                                    <el-form-item label="店铺地址">
                                        <span>{{ props.row.address }}</span>
                                    </el-form-item>
                                    <el-form-item label="商品描述">
                                        <span>{{ props.row.desc }}</span>
                                    </el-form-item>
                                </el-form>
                            </template>
                        </el-table-column>
                        <el-table-column
                                label="商品 ID"
                                prop="id">
                        </el-table-column>
                        <el-table-column
                                label="商品名称"
                                prop="name">
                        </el-table-column>
                        <el-table-column
                                label="描述"
                                prop="desc">
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>表尾合计行</h4>

                <a class="remarks">若表格展示的是各类数字，可以在表尾显示各列的合计。</a>
            </div>
            <div>
                <div class="description"><p>将<code>show-summary</code>设置为<code>true</code>就会在表格尾部展示合计行。默认情况下，对于合计行，第一列不进行数据求合操作，而是显示「合计」二字（可通过<code>sum-text</code>配置），其余列会将本列所有数值进行求合操作，并显示出来。当然，你也可以定义自己的合计逻辑。使用<code>summary-method</code>并传入一个方法，返回一个数组，这个数组中的各项就会显示在合计行的各列中，具体可以参考本例中的第二个表格。
                </p></div>

                <template>
                    <el-table
                            :data="tableData6"
                            border
                            show-summary
                            style="width: 100%">
                        <el-table-column
                                prop="id"
                                label="ID"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名">
                        </el-table-column>
                        <el-table-column
                                prop="amount1"
                                sortable
                                label="数值 1">
                        </el-table-column>
                        <el-table-column
                                prop="amount2"
                                sortable
                                label="数值 2">
                        </el-table-column>
                        <el-table-column
                                prop="amount3"
                                sortable
                                label="数值 3">
                        </el-table-column>
                    </el-table>

                    <el-table
                            :data="tableData6"
                            border
                            height="200"
                            :summary-method="getSummaries"
                            show-summary
                            style="width: 100%; margin-top: 20px">
                        <el-table-column
                                prop="id"
                                label="ID"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名">
                        </el-table-column>
                        <el-table-column
                                prop="amount1"
                                label="数值 1（元）">
                        </el-table-column>
                        <el-table-column
                                prop="amount2"
                                label="数值 2（元）">
                        </el-table-column>
                        <el-table-column
                                prop="amount3"
                                label="数值 3（元）">
                        </el-table-column>
                    </el-table>
                </template>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>合并行或列</h4>

                <a class="remarks">多行或多列共用一个数据时，可以合并行或列。</a>
            </div>
            <div>
                <div class="description"><p>通过给<code>table</code>传入<code>span-method</code>方法可以实现合并行或列，方法的参数是一个对象，里面包含当前行<code>row</code>、当前列<code>column</code>、当前行号<code>rowIndex</code>、当前列号<code>columnIndex</code>四个属性。该函数可以返回一个包含两个元素的数组，第一个元素代表<code>rowspan</code>，第二个元素代表<code>colspan</code>。
                    也可以返回一个键名为<code>rowspan</code>和<code>colspan</code>的对象。</p></div>

                <template>
                    <div>
                        <el-table
                                :data="tableData6"
                                :span-method="arraySpanMethod"
                                border
                                style="width: 100%">
                            <el-table-column
                                    prop="id"
                                    label="ID"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="name"
                                    label="姓名">
                            </el-table-column>
                            <el-table-column
                                    prop="amount1"
                                    sortable
                                    label="数值 1">
                            </el-table-column>
                            <el-table-column
                                    prop="amount2"
                                    sortable
                                    label="数值 2">
                            </el-table-column>
                            <el-table-column
                                    prop="amount3"
                                    sortable
                                    label="数值 3">
                            </el-table-column>
                        </el-table>

                        <el-table
                                :data="tableData6"
                                :span-method="objectSpanMethod"
                                border
                                style="width: 100%; margin-top: 20px">
                            <el-table-column
                                    prop="id"
                                    label="ID"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="name"
                                    label="姓名">
                            </el-table-column>
                            <el-table-column
                                    prop="amount1"
                                    label="数值 1（元）">
                            </el-table-column>
                            <el-table-column
                                    prop="amount2"
                                    label="数值 2（元）">
                            </el-table-column>
                            <el-table-column
                                    prop="amount3"
                                    label="数值 3（元）">
                            </el-table-column>
                        </el-table>
                    </div>
                </template>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>自定义索引</h4>

                <a class="remarks">自定义 <code>type=index </code>列的行号。</a>
            </div>
            <div>
                <div class="description"><p>通过给 <code>type=index</code> 的列传入 <code>index</code>
                    属性，可以自定义索引。该属性传入数字时，将作为索引的起始值。也可以传入一个方法，它提供当前行的行号（从 <code>0</code>
                    开始）作为参数，返回值将作为索引展示。</p></div>

                <template>
                    <el-table
                            :data="tableData"
                            style="width: 100%">
                        <el-table-column
                                type="index"
                                :index="indexMethod">
                        </el-table-column>
                        <el-table-column
                                prop="date"
                                label="日期"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="姓名"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="address"
                                label="地址">
                        </el-table-column>
                    </el-table>
                </template>

            </div>
        </el-card>

        <h3>Table Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>data</td>
                <td>显示的数据</td>
                <td>array</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>height</td>
                <td>Table 的高度，默认为自动高度。如果 height 为 number 类型，单位 px；如果 height 为 string 类型，则这个高度会设置为 Table
                    的 style.height 的值，Table 的高度会受控于外部样式。
                </td>
                <td>string/number</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>max-height</td>
                <td>Table 的最大高度</td>
                <td>string/number</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>stripe</td>
                <td>是否为斑马纹 table</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>border</td>
                <td>是否带有纵向边框</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>size</td>
                <td>Table 的尺寸</td>
                <td>string</td>
                <td>medium / small / mini</td>
                <td>—</td>
            </tr>
            <tr>
                <td>fit</td>
                <td>列的宽度是否自撑开</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>show-header</td>
                <td>是否显示表头</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>highlight-current-row</td>
                <td>是否要高亮当前行</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>current-row-key</td>
                <td>当前行的 key，只写属性</td>
                <td>String,Number</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>row-class-name</td>
                <td>行的 className 的回调方法，也可以使用字符串为所有行设置一个固定的 className。</td>
                <td>Function({row, rowIndex})/String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>row-style</td>
                <td>行的 style 的回调方法，也可以使用一个固定的 Object 为所有行设置一样的 Style。</td>
                <td>Function({row, rowIndex})/Object</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>cell-class-name</td>
                <td>单元格的 className 的回调方法，也可以使用字符串为所有单元格设置一个固定的 className。</td>
                <td>Function({row, column, rowIndex, columnIndex})/String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>cell-style</td>
                <td>单元格的 style 的回调方法，也可以使用一个固定的 Object 为所有单元格设置一样的 Style。</td>
                <td>Function({row, column, rowIndex, columnIndex})/Object</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>header-row-class-name</td>
                <td>表头行的 className 的回调方法，也可以使用字符串为所有表头行设置一个固定的 className。</td>
                <td>Function({row, rowIndex})/String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>header-row-style</td>
                <td>表头行的 style 的回调方法，也可以使用一个固定的 Object 为所有表头行设置一样的 Style。</td>
                <td>Function({row, rowIndex})/Object</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>header-cell-class-name</td>
                <td>表头单元格的 className 的回调方法，也可以使用字符串为所有表头单元格设置一个固定的 className。</td>
                <td>Function({row, column, rowIndex, columnIndex})/String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>header-cell-style</td>
                <td>表头单元格的 style 的回调方法，也可以使用一个固定的 Object 为所有表头单元格设置一样的 Style。</td>
                <td>Function({row, column, rowIndex, columnIndex})/Object</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>row-key</td>
                <td>行数据的 Key，用来优化 Table 的渲染；在使用 reserve-selection 功能的情况下，该属性是必填的。类型为 String
                    时，支持多层访问：<code>user.info.id</code>，但不支持 <code>user.info[0].id</code>，此种情况请使用 <code>Function</code>。
                </td>
                <td>Function(row)/String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>empty-text</td>
                <td>空数据时显示的文本内容，也可以通过 <code>slot="empty"</code> 设置</td>
                <td>String</td>
                <td>—</td>
                <td>暂无数据</td>
            </tr>
            <tr>
                <td>default-expand-all</td>
                <td>是否默认展开所有行，当 Table 中存在 type="expand" 的 Column 的时候有效</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>expand-row-keys</td>
                <td>可以通过该属性设置 Table 目前的展开行，需要设置 row-key 属性才能使用，该属性为展开行的 keys 数组。</td>
                <td>Array</td>
                <td>—</td>
                <td></td>
            </tr>
            <tr>
                <td>default-sort</td>
                <td>默认的排序列的 prop 和顺序。它的<code>prop</code>属性指定默认的排序的列，<code>order</code>指定默认排序的顺序</td>
                <td>Object</td>
                <td><code>order</code>: ascending, descending</td>
                <td>如果只指定了<code>prop</code>, 没有指定<code>order</code>, 则默认顺序是ascending</td>
            </tr>
            <tr>
                <td>tooltip-effect</td>
                <td>tooltip <code>effect</code> 属性</td>
                <td>String</td>
                <td>dark/light</td>
                <td></td>
            </tr>
            <tr>
                <td>show-summary</td>
                <td>是否在表尾显示合计行</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>sum-text</td>
                <td>合计行第一列的文本</td>
                <td>String</td>
                <td>—</td>
                <td>合计</td>
            </tr>
            <tr>
                <td>summary-method</td>
                <td>自定义的合计计算方法</td>
                <td>Function({ columns, data })</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>span-method</td>
                <td>合并行或列的计算方法</td>
                <td>Function({ row, column, rowIndex, columnIndex })</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>select-on-indeterminate</td>
                <td>在多选表格中，当仅有部分行被选中时，点击表头的多选框时的行为。若为 true，则选中所有行；若为 false，则取消选择所有行</td>
                <td>Boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            </tbody>
        </table>

        <h3>Table Events</h3>
        <table class="table">
            <thead>
            <tr>
                <th>事件名</th>
                <th>说明</th>
                <th>参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>select</td>
                <td>当用户手动勾选数据行的 Checkbox 时触发的事件</td>
                <td>selection, row</td>
            </tr>
            <tr>
                <td>select-all</td>
                <td>当用户手动勾选全选 Checkbox 时触发的事件</td>
                <td>selection</td>
            </tr>
            <tr>
                <td>selection-change</td>
                <td>当选择项发生变化时会触发该事件</td>
                <td>selection</td>
            </tr>
            <tr>
                <td>cell-mouse-enter</td>
                <td>当单元格 hover 进入时会触发该事件</td>
                <td>row, column, cell, event</td>
            </tr>
            <tr>
                <td>cell-mouse-leave</td>
                <td>当单元格 hover 退出时会触发该事件</td>
                <td>row, column, cell, event</td>
            </tr>
            <tr>
                <td>cell-click</td>
                <td>当某个单元格被点击时会触发该事件</td>
                <td>row, column, cell, event</td>
            </tr>
            <tr>
                <td>cell-dblclick</td>
                <td>当某个单元格被双击击时会触发该事件</td>
                <td>row, column, cell, event</td>
            </tr>
            <tr>
                <td>row-click</td>
                <td>当某一行被点击时会触发该事件</td>
                <td>row, event, column</td>
            </tr>
            <tr>
                <td>row-contextmenu</td>
                <td>当某一行被鼠标右键点击时会触发该事件</td>
                <td>row, event</td>
            </tr>
            <tr>
                <td>row-dblclick</td>
                <td>当某一行被双击时会触发该事件</td>
                <td>row, event</td>
            </tr>
            <tr>
                <td>header-click</td>
                <td>当某一列的表头被点击时会触发该事件</td>
                <td>column, event</td>
            </tr>
            <tr>
                <td>header-contextmenu</td>
                <td>当某一列的表头被鼠标右键点击时触发该事件</td>
                <td>column, event</td>
            </tr>
            <tr>
                <td>sort-change</td>
                <td>当表格的排序条件发生变化的时候会触发该事件</td>
                <td>{ column, prop, order }</td>
            </tr>
            <tr>
                <td>filter-change</td>
                <td>当表格的筛选条件发生变化的时候会触发该事件，参数的值是一个对象，对象的 key 是 column 的 columnKey，对应的 value
                    为用户选择的筛选条件的数组。
                </td>
                <td>filters</td>
            </tr>
            <tr>
                <td>current-change</td>
                <td>当表格的当前行发生变化的时候会触发该事件，如果要高亮当前行，请打开表格的 highlight-current-row 属性</td>
                <td>currentRow, oldCurrentRow</td>
            </tr>
            <tr>
                <td>header-dragend</td>
                <td>当拖动表头改变了列的宽度的时候会触发该事件</td>
                <td>newWidth, oldWidth, column, event</td>
            </tr>
            <tr>
                <td>expand-change</td>
                <td>当用户对某一行展开或者关闭的时候会触发该事件</td>
                <td>row, expandedRows</td>
            </tr>
            </tbody>
        </table>

        <h3>Table Methods</h3>
        <table class="table">
            <thead>
            <tr>
                <th>方法名</th>
                <th>说明</th>
                <th>参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>clearSelection</td>
                <td>用于多选表格，清空用户的选择</td>
                <td>—</td>
            </tr>
            <tr>
                <td>toggleRowSelection</td>
                <td>用于多选表格，切换某一行的选中状态，如果使用了第二个参数，则是设置这一行选中与否（selected 为 true 则选中）</td>
                <td>row, selected</td>
            </tr>
            <tr>
                <td>toggleRowExpansion</td>
                <td>用于可展开表格，切换某一行的展开状态，如果使用了第二个参数，则是设置这一行展开与否（expanded 为 true 则展开）</td>
                <td>row, expanded</td>
            </tr>
            <tr>
                <td>setCurrentRow</td>
                <td>用于单选表格，设定某一行为选中行，如果调用时不加参数，则会取消目前高亮行的选中状态。</td>
                <td>row</td>
            </tr>
            <tr>
                <td>clearSort</td>
                <td>用于清空排序条件，数据会恢复成未排序的状态</td>
                <td>—</td>
            </tr>
            <tr>
                <td>clearFilter</td>
                <td>用于清空过滤条件，数据会恢复成未过滤的状态</td>
                <td>—</td>
            </tr>
            <tr>
                <td>doLayout</td>
                <td>对 Table 进行重新布局。当 Table 或其祖先元素由隐藏切换为显示时，可能需要调用此方法</td>
                <td>—</td>
            </tr>
            <tr>
                <td>sort</td>
                <td>手动对 Table 进行排序。参数<code>prop</code>属性指定排序列，<code>order</code>指定排序顺序。</td>
                <td>prop: string, order: string</td>
            </tr>
            </tbody>
        </table>


        <h3>Table Slot</h3>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>说明</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>append</td>
                <td>插入至表格最后一行之后的内容，如果需要对表格的内容进行无限滚动操作，可能需要用到这个 slot。若表格有合计行，该 slot 会位于合计行之上。</td>
            </tr>
            </tbody>
        </table>

        <h3>Table-column Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>type</td>
                <td>对应列的类型。如果设置了 <code>selection</code> 则显示多选框；如果设置了 <code>index</code> 则显示该行的索引（从 1
                    开始计算）；如果设置了 <code>expand</code> 则显示为一个可展开的按钮
                </td>
                <td>string</td>
                <td>selection/index/expand</td>
                <td>—</td>
            </tr>
            <tr>
                <td>index</td>
                <td>如果设置了 <code>type=index</code>，可以通过传递 <code>index</code> 属性来自定义索引</td>
                <td>string, Function(index)</td>
                <td>-</td>
                <td>-</td>
            </tr>
            <tr>
                <td>column-key</td>
                <td>column 的 key，如果需要使用 filter-change 事件，则需要此属性标识是哪个 column 的筛选条件</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>label</td>
                <td>显示的标题</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>prop</td>
                <td>对应列内容的字段名，也可以使用 property 属性</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>width</td>
                <td>对应列的宽度</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>min-width</td>
                <td>对应列的最小宽度，与 width 的区别是 width 是固定的，min-width 会把剩余宽度按比例分配给设置了 min-width 的列</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>fixed</td>
                <td>列是否固定在左侧或者右侧，true 表示固定在左侧</td>
                <td>string, boolean</td>
                <td>true, left, right</td>
                <td>—</td>
            </tr>
            <tr>
                <td>render-header</td>
                <td>列标题 Label 区域渲染使用的 Function</td>
                <td>Function(h, { column, $index })</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>sortable</td>
                <td>对应列是否可以排序，如果设置为 'custom'，则代表用户希望远程排序，需要监听 Table 的 sort-change 事件</td>
                <td>boolean, string</td>
                <td>true, false, 'custom'</td>
                <td>false</td>
            </tr>
            <tr>
                <td>sort-method</td>
                <td>对数据进行排序的时候使用的方法，仅当 sortable 设置为 true 的时候有效，需返回一个数字，和 Array.sort 表现一致</td>
                <td>Function(a, b)</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>sort-by</td>
                <td>指定数据按照哪个属性进行排序，仅当 sortable 设置为 true 且没有设置 sort-method 的时候有效。如果 sort-by 为数组，则先按照第 1
                    个属性排序，如果第 1 个相等，再按照第 2 个排序，以此类推
                </td>
                <td>String/Array/Function(row, index)</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>sort-orders</td>
                <td>数据在排序时所使用排序策略的轮转顺序，仅当 sortable 为 true 时有效。需传入一个数组，随着用户点击表头，该列依次按照数组中元素的顺序进行排序</td>
                <td>array</td>
                <td>数组中的元素需为以下三者之一：<code>ascending</code> 表示升序，<code>descending</code>
                    表示降序，<code>null</code> 表示还原为原始顺序
                </td>
                <td>['ascending', 'descending', null]</td>
            </tr>
            <tr>
                <td>resizable</td>
                <td>对应列是否可以通过拖动改变宽度（需要在 el-table 上设置 border 属性为真）</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>formatter</td>
                <td>用来格式化内容</td>
                <td>Function(row, column, cellValue, index)</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>show-overflow-tooltip</td>
                <td>当内容过长被隐藏时显示 tooltip</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>align</td>
                <td>对齐方式</td>
                <td>String</td>
                <td>left/center/right</td>
                <td>left</td>
            </tr>
            <tr>
                <td>header-align</td>
                <td>表头对齐方式，若不设置该项，则使用表格的对齐方式</td>
                <td>String</td>
                <td>left/center/right</td>
                <td>—</td>
            </tr>
            <tr>
                <td>class-name</td>
                <td>列的 className</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>label-class-name</td>
                <td>当前列标题的自定义类名</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>selectable</td>
                <td>仅对 type=selection 的列有效，类型为 Function，Function 的返回值用来决定这一行的 CheckBox 是否可以勾选</td>
                <td>Function(row, index)</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>reserve-selection</td>
                <td>仅对 type=selection 的列有效，类型为 Boolean，为 true 则会在数据更新之后保留之前选中的数据（需指定
                    <code>row-key</code>）
                </td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>filters</td>
                <td>数据过滤的选项，数组格式，数组中的元素需要有 text 和 value 属性。</td>
                <td>Array[{ text, value }]</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>filter-placement</td>
                <td>过滤弹出框的定位</td>
                <td>String</td>
                <td>与 Tooltip 的 <code>placement</code> 属性相同</td>
                <td>—</td>
            </tr>
            <tr>
                <td>filter-multiple</td>
                <td>数据过滤的选项是否多选</td>
                <td>Boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>filter-method</td>
                <td>数据过滤使用的方法，如果是多选的筛选项，对每一条数据会执行多次，任意一次返回 true 就会显示。</td>
                <td>Function(value, row, column)</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>filtered-value</td>
                <td>选中的数据过滤项，如果需要自定义表头过滤的渲染方式，可能会需要此属性。</td>
                <td>Array</td>
                <td>—</td>
                <td>—</td>
            </tr>
            </tbody>
        </table>

        <h3>Table-column Scoped Slot</h3>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>说明</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>—</td>
                <td>自定义列的内容，参数为 { row, column, $index }</td>
            </tr>
            </tbody>
        </table>

    </div>
</template>
<template id="elementui_pagination">
    <div class="view">
        <h1>Pagination 分页</h1>

        <a class="remarks">当数据量过多时，使用分页分解数据。</a>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>基础用法</h4>

            </div>
            <div class="demo">
                <div class="description"><p>
                    设置<code>layout</code>，表示需要显示的内容，用逗号分隔，布局元素会依次显示。<code>prev</code>表示上一页，<code>next</code>为下一页，<code>pager</code>表示页码列表，除此以外还提供了<code>jumper</code>和<code>total</code>，<code>size</code>和特殊的布局符号<code>-&gt;</code>，<code>-&gt;</code>后的元素会靠右显示，<code>jumper</code>表示跳页元素，<code>total</code>表示显示页码总数，<code>size</code>用于设置每页显示的页码数量。
                </p></div>

                <div class="block">
                    <span class="demonstration">页数较少时的效果</span>
                    <el-pagination
                            layout="prev, pager, next"
                            :total="50">
                    </el-pagination>
                </div>
                <!--
                                                         --->
                <div class="block">
                    <span class="demonstration">大于 7 页时的效果</span>
                    <el-pagination
                            layout="prev, pager, next"
                            :total="1000">
                    </el-pagination>
                </div>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>设置最大页码按钮数</h4>

                <a class="remarks">remarks</a>
            </div>
            <div>
                <div class="description"><p>默认情况下，当总页数超过 7 页时，Pagination
                    会折叠多余的页码按钮。通过<code>pager-count</code>属性可以设置最大页码按钮数。</p></div>

                <el-pagination
                        :page-size="20"
                        :pager-count="11"
                        layout="prev, pager, next"
                        :total="1000">
                </el-pagination>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>带有背景色的分页</h4>

            </div>
            <div>
                <div class="description"><p>设置<code>background</code>属性可以为分页按钮添加背景色。</p></div>
                <el-pagination
                        background
                        layout="prev, pager, next"
                        :total="1000">
                </el-pagination>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>小型分页</h4>

                <a class="remarks">在空间有限的情况下，可以使用简单的小型分页。</a>
            </div>
            <div>
                <div class="description"><p>
                    只需要一个<code>small</code>属性，它接受一个<code>Boolean</code>，默认为<code>false</code>，设为<code>true</code>即可启用。
                </p></div>


                <el-pagination
                        small
                        layout="prev, pager, next"
                        :total="50">
                </el-pagination>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>附加功能</h4>

                <a class="remarks">根据场景需要，可以添加其他功能模块。</a>
            </div>
            <div>
                <div class="description"><p>
                    此例是一个完整的用例，使用了<code>size-change</code>和<code>current-change</code>事件来处理页码大小和当前页变动时候触发的事件。<code>page-sizes</code>接受一个整型数组，数组元素为展示的选择每页显示个数的选项，<code>[100,
                    200, 300, 400]</code>表示四个选项，每页显示 100 个，200 个，300 个或者 400 个。</p></div>

                <template>
                    <div class="block">
                        <span class="demonstration">显示总数</span>
                        <el-pagination
                                @size-change="handleSizeChange"
                                @current-change="handleCurrentChange"
                                :current-page.sync="currentPage1"
                                :page-size="100"
                                layout="total, prev, pager, next"
                                :total="1000">
                        </el-pagination>
                    </div>
                    <div class="block">
                        <span class="demonstration">调整每页显示条数</span>
                        <el-pagination
                                @size-change="handleSizeChange"
                                @current-change="handleCurrentChange"
                                :current-page.sync="currentPage2"
                                :page-sizes="[100, 200, 300, 400]"
                                :page-size="100"
                                layout="sizes, prev, pager, next"
                                :total="1000">
                        </el-pagination>
                    </div>
                    <div class="block">
                        <span class="demonstration">直接前往</span>
                        <el-pagination
                                @size-change="handleSizeChange"
                                @current-change="handleCurrentChange"
                                :current-page.sync="currentPage3"
                                :page-size="100"
                                layout="prev, pager, next, jumper"
                                :total="1000">
                        </el-pagination>
                    </div>
                    <div class="block">
                        <span class="demonstration">完整功能</span>
                        <el-pagination
                                @size-change="handleSizeChange"
                                @current-change="handleCurrentChange"
                                :current-page="currentPage4"
                                :page-sizes="[100, 200, 300, 400]"
                                :page-size="100"
                                layout="total, sizes, prev, pager, next, jumper"
                                :total="400">
                        </el-pagination>
                    </div>
                </template>

            </div>
        </el-card>


        <h3>Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>small</td>
                <td>是否使用小型分页样式</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>background</td>
                <td>是否为分页按钮添加背景色</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>page-size</td>
                <td>每页显示条目个数</td>
                <td>Number</td>
                <td>—</td>
                <td>10</td>
            </tr>
            <tr>
                <td>total</td>
                <td>总条目数</td>
                <td>Number</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>page-count</td>
                <td>总页数，total 和 page-count 设置任意一个就可以达到显示页码的功能；如果要支持 page-sizes 的更改，则需要使用 total 属性</td>
                <td>Number</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>pager-count</td>
                <td>页码按钮的数量，当总页数超过该值时会折叠</td>
                <td>Number</td>
                <td>大于等于 5 且小于等于 21 的奇数</td>
                <td>7</td>
            </tr>
            <tr>
                <td>current-page</td>
                <td>当前页数，支持 .sync 修饰符</td>
                <td>Number</td>
                <td>—</td>
                <td>1</td>
            </tr>
            <tr>
                <td>layout</td>
                <td>组件布局，子组件名用逗号分隔</td>
                <td>String</td>
                <td><code>sizes</code>, <code>prev</code>, <code>pager</code>, <code>next</code>, <code>jumper</code>,
                    <code>-&gt;</code>, <code>total</code>, <code>slot</code></td>
                <td>'prev, pager, next, jumper, -&gt;, total'</td>
            </tr>
            <tr>
                <td>page-sizes</td>
                <td>每页显示个数选择器的选项设置</td>
                <td>Number[]</td>
                <td>—</td>
                <td>[10, 20, 30, 40, 50, 100]</td>
            </tr>
            <tr>
                <td>popper-class</td>
                <td>每页显示个数选择器的下拉框类名</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>prev-text</td>
                <td>替代图标显示的上一页文字</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>next-text</td>
                <td>替代图标显示的下一页文字</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>disabled</td>
                <td>是否禁用</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            </tbody>
        </table>

        <h3>Events</h3>
        <table class="table">
            <thead>
            <tr>
                <th>事件名称</th>
                <th>说明</th>
                <th>回调参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>size-change</td>
                <td>pageSize 改变时会触发</td>
                <td>每页条数</td>
            </tr>
            <tr>
                <td>current-change</td>
                <td>currentPage 改变时会触发</td>
                <td>当前页</td>
            </tr>
            <tr>
                <td>prev-click</td>
                <td>用户点击上一页按钮改变当前页后触发</td>
                <td>当前页</td>
            </tr>
            <tr>
                <td>next-click</td>
                <td>用户点击下一页按钮改变当前页后触发</td>
                <td>当前页</td>
            </tr>
            </tbody>
        </table>

        <h3>Slot</h3>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>说明</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>—</td>
                <td>自定义内容，需要在 <code>layout</code> 中列出 <code>slot</code></td>
            </tr>
            </tbody>
        </table>

    </div>
</template>

<template id="elementui_messagebox">
    <div class="view">
        <h1>MessageBox 弹框</h1>

        <a class="remarks">模拟系统的消息提示框而实现的一套模态对话框组件，用于消息提示、确认消息和提交内容。</a>

        <div class="tip"><p>从场景上说，MessageBox 的作用是美化系统自带的 <code>alert</code>、<code>confirm</code> 和
            <code>prompt</code>，因此适合展示较为简单的内容。如果需要弹出较为复杂的内容，请使用 Dialog。</p></div>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>消息提示</h4>

                <a class="remarks">当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。</a>
            </div>
            <div>
                <div class="description"><p>调用<code>$alert</code>方法即可打开消息提示，它模拟了系统的 <code>alert</code>，无法通过按下
                    ESC
                    或点击框外关闭。此例中接收了两个参数，<code>message</code>和<code>title</code>。值得一提的是，窗口被关闭后，它默认会返回一个<code>Promise</code>对象便于进行后续操作的处理。若不确定浏览器是否支持<code>Promise</code>，可自行引入第三方
                    polyfill 或像本例一样使用回调进行后续处理。</p></div>
                <template>
                    <el-button type="text" @click="open34_">点击打开 Message Box</el-button>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>确认消息</h4>

                <a class="remarks">提示用户确认其已经触发的动作，并询问是否进行此操作时会用到此对话框。</a>
            </div>
            <div>
                <div class="description"><p>调用<code>$confirm</code>方法即可打开消息提示，它模拟了系统的
                    <code>confirm</code>。Message Box
                    组件也拥有极高的定制性，我们可以传入<code>options</code>作为第三个参数，它是一个字面量对象。<code>type</code>字段表明消息类型，可以为<code>success</code>，<code>error</code>，<code>info</code>和<code>warning</code>，无效的设置将会被忽略。注意，第二个参数<code>title</code>必须定义为<code>String</code>类型，如果是<code>Object</code>，会被理解为<code>options</code>。在这里我们用了
                    Promise 来处理后续响应。</p></div>
                <template>
                    <el-button type="text" @click="open34_2">点击打开 Message Box</el-button>
                </template>


            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>提交内容</h4>

                <a class="remarks">当用户进行操作时会被触发，中断用户操作，提示用户进行输入的对话框。</a>
            </div>
            <div>
                <div class="description"><p>调用<code>$prompt</code>方法即可打开消息提示，它模拟了系统的 <code>prompt</code>。可以用<code>inputPattern</code>字段自己规定匹配模式，或者用<code>inputValidator</code>规定校验函数，可以返回<code>Boolean</code>或<code>String</code>，返回<code>false</code>或字符串时均表示校验未通过，同时返回的字符串相当于定义了<code>inputErrorMessage</code>字段。此外，可以用<code>inputPlaceholder</code>字段来定义输入框的占位符。
                </p></div>

                <template>
                    <el-button type="text" @click="open34_3">点击打开 Message Box</el-button>
                </template>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>自定义</h4>

                <a class="remarks">可自定义配置不同内容。</a>
            </div>
            <div>
                <div class="description"><p>
                    以上三个方法都是对<code>$msgbox</code>方法的再包装。本例直接调用<code>$msgbox</code>方法，使用了<code>showCancelButton</code>字段，用于显示取消按钮。另外可使用<code>cancelButtonClass</code>为其添加自定义样式，使用<code>cancelButtonText</code>来自定义按钮文本（Confirm
                    按钮也具有相同的字段，在文末的字段说明中有完整的字段列表）。此例还使用了<code>beforeClose</code>属性，它的值是一个方法，会在
                    MessageBox 的实例关闭前被调用，同时暂停实例的关闭。它有三个参数：<code>action</code>、实例本身和<code>done</code>方法。使用它能够在关闭前对实例进行一些操作，比如为确定按钮添加<code>loading</code>状态等；此时若需要关闭实例，可以调用<code>done</code>方法（若在<code>beforeClose</code>中没有调用<code>done</code>，则实例不会关闭）。
                </p></div>

                <template>
                    <el-button type="text" @click="open34_4">点击打开 Message Box</el-button>
                </template>
            </div>
        </el-card>

        <div class="tip"><p>弹出层的内容可以是 <code>VNode</code>，所以我们能把一些自定义组件传入其中。每次弹出层打开后，Vue 会对新老
            <code>VNode</code> 节点进行比对，然后将根据比较结果进行最小单位地修改视图。这也许会造成弹出层内容区域的组件没有重新渲染，例如 <a
                    href="https://github.com/ElemeFE/element/issues/8931">#8931</a>。当这类问题出现时，解决方案是给
            <code>VNode</code> 加上一个不相同的 key，参考<a href="https://jsfiddle.net/zhiyang/ezmhq2ef/">这里</a>。
        </p></div>


        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>使用 HTML 片段</h4>

                <a class="remarks">message 属性支持传入 HTML 片段。</a>
            </div>
            <div>
                <div class="description"><p>将<code>dangerouslyUseHTMLString</code>属性设置为 true，<code>message</code>
                    就会被当作 HTML 片段处理。</p></div>
                <template>
                    <el-button type="text" @click="open34_5">点击打开 Message Box</el-button>
                </template>

            </div>
        </el-card>

        <div class="warning"><p><code>message</code> 属性虽然支持传入 HTML 片段，但是在网站上动态渲染任意 HTML 是非常危险的，因为容易导致 <a
                href="https://en.wikipedia.org/wiki/Cross-site_scripting">XSS 攻击</a>。因此在
            <code>dangerouslyUseHTMLString</code>
            打开的情况下，请确保 <code>message</code> 的内容是可信的，<strong>永远不要</strong>将用户提交的内容赋值给
            <code>message</code> 属性。</p></div>


        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>区分取消与关闭</h4>

                <a class="remarks">有些场景下，点击取消按钮与点击关闭按钮有着不同的含义。</a>
            </div>
            <div>
                <div class="description"><p>默认情况下，当用户触发取消（点击取消按钮）和触发关闭（点击关闭按钮或遮罩层、按下 ESC 键）时，Promise 的
                    reject 回调和<code>callback</code>回调的参数均为
                    'cancel'。如果将<code>distinguishCancelAndClose</code>属性设置为 true，则上述两种行为的参数分别为 'cancel'
                    和 'close'。</p></div>
                <template>
                    <el-button type="text" @click="open34_6">点击打开 Message Box</el-button>
                </template>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>居中布局</h4>

                <a class="remarks">内容支持居中布局</a>
            </div>
            <div>
                <div class="description"><p>将 <code>center</code> 设置为 <code>true</code> 即可开启居中布局</p>
                </div>
                <template>
                    <el-button type="text" @click="open34_7">点击打开 Message Box</el-button>
                </template>
            </div>
        </el-card>

        <h1>全局方法</h1>

        <p>如果你完整引入了 Element，它会为 Vue.prototype 添加如下全局方法：$msgbox, $alert, $confirm 和 $prompt。因此在 Vue
            instance 中可以采用本页面中的方式调用 <code>MessageBox</code>。调用参数为：</p>
        <ul>
            <li><code>$msgbox(options)</code></li>
            <li><code>$alert(message, title, options)</code> 或 <code>$alert(message, options)</code>
            </li>
            <li><code>$confirm(message, title, options)</code> 或 <code>$confirm(message, options)</code>
            </li>
            <li><code>$prompt(message, title, options)</code> 或 <code>$prompt(message, options)</code>
            </li>
        </ul>

        <h3>Options</h3>

        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>title</td>
                <td>MessageBox 标题</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>message</td>
                <td>MessageBox 消息正文内容</td>
                <td>string / VNode</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>dangerouslyUseHTMLString</td>
                <td>是否将 message 属性作为 HTML 片段处理</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>type</td>
                <td>消息类型，用于显示图标</td>
                <td>string</td>
                <td>success / info / warning / error</td>
                <td>—</td>
            </tr>
            <tr>
                <td>iconClass</td>
                <td>自定义图标的类名，会覆盖 <code>type</code></td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>customClass</td>
                <td>MessageBox 的自定义类名</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>callback</td>
                <td>若不使用 Promise，可以使用此参数指定 MessageBox 关闭后的回调</td>
                <td>function(action, instance)，action 的值为'confirm', 'cancel'或'close', instance 为
                    MessageBox 实例，可以通过它访问实例上的属性和方法
                </td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>showClose</td>
                <td>MessageBox 是否显示右上角关闭按钮</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>beforeClose</td>
                <td>MessageBox 关闭前的回调，会暂停实例的关闭</td>
                <td>function(action, instance, done)，action 的值为'confirm', 'cancel'或'close'；instance 为
                    MessageBox 实例，可以通过它访问实例上的属性和方法；done 用于关闭 MessageBox 实例
                </td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>distinguishCancelAndClose</td>
                <td>是否将取消（点击取消按钮）与关闭（点击关闭按钮或遮罩层、按下 ESC 键）进行区分</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>lockScroll</td>
                <td>是否在 MessageBox 出现时将 body 滚动锁定</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>showCancelButton</td>
                <td>是否显示取消按钮</td>
                <td>boolean</td>
                <td>—</td>
                <td>false（以 confirm 和 prompt 方式调用时为 true）</td>
            </tr>
            <tr>
                <td>showConfirmButton</td>
                <td>是否显示确定按钮</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>cancelButtonText</td>
                <td>取消按钮的文本内容</td>
                <td>string</td>
                <td>—</td>
                <td>取消</td>
            </tr>
            <tr>
                <td>confirmButtonText</td>
                <td>确定按钮的文本内容</td>
                <td>string</td>
                <td>—</td>
                <td>确定</td>
            </tr>
            <tr>
                <td>cancelButtonClass</td>
                <td>取消按钮的自定义类名</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>confirmButtonClass</td>
                <td>确定按钮的自定义类名</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>closeOnClickModal</td>
                <td>是否可通过点击遮罩关闭 MessageBox</td>
                <td>boolean</td>
                <td>—</td>
                <td>true（以 alert 方式调用时为 false）</td>
            </tr>
            <tr>
                <td>closeOnPressEscape</td>
                <td>是否可通过按下 ESC 键关闭 MessageBox</td>
                <td>boolean</td>
                <td>—</td>
                <td>true（以 alert 方式调用时为 false）</td>
            </tr>
            <tr>
                <td>closeOnHashChange</td>
                <td>是否在 hashchange 时关闭 MessageBox</td>
                <td>boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>showInput</td>
                <td>是否显示输入框</td>
                <td>boolean</td>
                <td>—</td>
                <td>false（以 prompt 方式调用时为 true）</td>
            </tr>
            <tr>
                <td>inputPlaceholder</td>
                <td>输入框的占位符</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>inputType</td>
                <td>输入框的类型</td>
                <td>string</td>
                <td>—</td>
                <td>text</td>
            </tr>
            <tr>
                <td>inputValue</td>
                <td>输入框的初始文本</td>
                <td>string</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>inputPattern</td>
                <td>输入框的校验表达式</td>
                <td>regexp</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>inputValidator</td>
                <td>输入框的校验函数。可以返回布尔值或字符串，若返回一个字符串, 则返回结果会被赋值给 inputErrorMessage</td>
                <td>function</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>inputErrorMessage</td>
                <td>校验未通过时的提示文本</td>
                <td>string</td>
                <td>—</td>
                <td>输入的数据不合法!</td>
            </tr>
            <tr>
                <td>center</td>
                <td>是否居中布局</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>roundButton</td>
                <td>是否使用圆角按钮</td>
                <td>boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>

<template id="elementui_tooltip">
    <div class="view">
        <h1>Tooltip 文字提示</h1>

        <a class="remarks">常用于展示鼠标 hover 时的提示信息。</a>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>基础用法</h4>

                <a class="remarks">在这里我们提供 9 种不同方向的展示方式，可以通过以下完整示例来理解，选择你要的效果。</a>
            </div>
            <div>
                <div class="description"><p>使用<code>content</code>属性来决定<code>hover</code>时的提示信息。由<code>placement</code>属性决定展示效果：<code>placement</code>属性值为：<code>方向-对齐位置</code>；四个方向：<code>top</code>、<code>left</code>、<code>right</code>、<code>bottom</code>；三种对齐位置：<code>start</code>,
                    <code>end</code>，默认为空。如<code>placement="left-end"</code>，则提示信息出现在目标元素的左侧，且提示信息的底部与目标元素的底部对齐。
                </p></div>

                <div class="box">
                    <div class="top">
                        <el-tooltip class="item" effect="dark" content="Top Left 提示文字"
                                    placement="top-start">
                            <el-button>上左</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Top Center 提示文字"
                                    placement="top">
                            <el-button>上边</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Top Right 提示文字"
                                    placement="top-end">
                            <el-button>上右</el-button>
                        </el-tooltip>
                    </div>
                    <div class="left">
                        <el-tooltip class="item" effect="dark" content="Left Top 提示文字"
                                    placement="left-start">
                            <el-button>左上</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Left Center 提示文字"
                                    placement="left">
                            <el-button>左边</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Left Bottom 提示文字"
                                    placement="left-end">
                            <el-button>左下</el-button>
                        </el-tooltip>
                    </div>

                    <div class="right">
                        <el-tooltip class="item" effect="dark" content="Right Top 提示文字"
                                    placement="right-start">
                            <el-button>右上</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Right Center 提示文字"
                                    placement="right">
                            <el-button>右边</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Right Bottom 提示文字"
                                    placement="right-end">
                            <el-button>右下</el-button>
                        </el-tooltip>
                    </div>
                    <div class="bottom">
                        <el-tooltip class="item" effect="dark" content="Bottom Left 提示文字"
                                    placement="bottom-start">
                            <el-button>下左</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Bottom Center 提示文字"
                                    placement="bottom">
                            <el-button>下边</el-button>
                        </el-tooltip>
                        <el-tooltip class="item" effect="dark" content="Bottom Right 提示文字"
                                    placement="bottom-end">
                            <el-button>下右</el-button>
                        </el-tooltip>
                    </div>
                </div>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>主题</h4>

                <a class="remarks">Tooltip 组件提供了两个不同的主题：dark和light。</a>
            </div>
            <div>
                <div class="description"><p>通过设置<code>effect</code>属性来改变主题，默认为<code>dark</code>。</p>
                </div>

                <el-tooltip content="Top center" placement="top">
                    <el-button>Dark</el-button>
                </el-tooltip>
                <el-tooltip content="Bottom center" placement="bottom" effect="light">
                    <el-button>Light</el-button>
                </el-tooltip>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>更多 Content</h4>

                <a class="remarks">展示多行文本或者是设置文本内容的格式</a>
            </div>
            <div>
                <div class="description"><p>用具名 slot
                    分发<code>content</code>，替代<code>tooltip</code>中的<code>content</code>属性。</p></div>

                <el-tooltip placement="top">
                    <div slot="content">多行信息<br/>第二行信息</div>
                    <el-button>Top center</el-button>
                </el-tooltip>

            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>高级扩展</h4>

                <p>除了这些基本设置外，还有一些属性可以让使用者更好的定制自己的效果：</p>

                <p><code>transition</code> 属性可以定制显隐的动画效果，默认为<code>fade-in-linear</code>。
                    如果需要关闭 <code>tooltip</code> 功能，<code>disabled</code>
                    属性可以满足这个需求，它接受一个<code>Boolean</code>，设置为<code>true</code>即可。</p>

                <p>事实上，这是基于 <a href="https://github.com/element-component/vue-popper">Vue-popper</a>
                    的扩展，你可以自定义任意 Vue-popper 中允许定义的字段。
                    当然 Tooltip 组件实际上十分强大，文末的API文档会做一一说明。</p>
            </div>
            <div>
                <template>
                    <el-tooltip :disabled="disabled" content="点击关闭 tooltip 功能" placement="bottom"
                                effect="light">
                        <el-button @click="disabled = !disabled">点击{{disabled ? '开启' : '关闭'}} tooltip
                            功能
                        </el-button>
                    </el-tooltip>
                </template>
            </div>
        </el-card>

        <div class="tip"><p>tooltip 内不支持 <code>router-link</code> 组件，请使用 <code>vm.$router.push</code>
            代替。</p>

            <p>tooltip 内不支持 disabled form 元素，参考<a
                    href="https://developer.mozilla.org/en-US/docs/Web/Events/mouseenter">MDN</a>，请在
                disabled form 元素外层添加一层包裹元素。</p></div>

        <h3>Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>effect</td>
                <td>默认提供的主题</td>
                <td>String</td>
                <td>dark/light</td>
                <td>dark</td>
            </tr>
            <tr>
                <td>content</td>
                <td>显示的内容，也可以通过 <code>slot#content</code> 传入 DOM</td>
                <td>String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>placement</td>
                <td>Tooltip 的出现位置</td>
                <td>String</td>
                <td>
                    top/top-start/top-end/bottom/bottom-start/bottom-end/left/left-start/left-end/right/right-start/right-end
                </td>
                <td>bottom</td>
            </tr>
            <tr>
                <td>value(v-model)</td>
                <td>状态是否可见</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>disabled</td>
                <td>Tooltip 是否可用</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>offset</td>
                <td>出现位置的偏移量</td>
                <td>Number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            <tr>
                <td>transition</td>
                <td>定义渐变动画</td>
                <td>String</td>
                <td>—</td>
                <td>el-fade-in-linear</td>
            </tr>
            <tr>
                <td>visible-arrow</td>
                <td>是否显示 Tooltip 箭头，更多参数可见<a href="https://github.com/element-component/vue-popper">Vue-popper</a>
                </td>
                <td>Boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>popper-options</td>
                <td><a href="https://popper.js.org/documentation.html">popper.js</a> 的参数</td>
                <td>Object</td>
                <td>参考 <a href="https://popper.js.org/documentation.html">popper.js</a> 文档</td>
                <td>{ boundariesElement: 'body', gpuAcceleration: false }</td>
            </tr>
            <tr>
                <td>open-delay</td>
                <td>延迟出现，单位毫秒</td>
                <td>Number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            <tr>
                <td>manual</td>
                <td>手动控制模式，设置为 true 后，mouseenter 和 mouseleave 事件将不会生效</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>popper-class</td>
                <td>为 Tooltip 的 popper 添加类名</td>
                <td>String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>enterable</td>
                <td>鼠标是否可进入到 tooltip 中</td>
                <td>Boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>hide-after</td>
                <td>Tooltip 出现后自动隐藏延时，单位毫秒，为 0 则不会自动隐藏</td>
                <td>number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            </tbody>
        </table>

    </div>
</template>
<template id="elementui_popover">
    <div class="view">
        <h1>Popover 弹出框</h1>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>基础用法</h4>

                <a class="remarks">Popover 的属性与 Tooltip 很类似，它们都是基于Vue-popper开发的，因此对于重复属性，请参考 Tooltip
                    的文档，在此文档中不做详尽解释。

                </a>
            </div>
            <div>
                <div class="description"><p><code>trigger</code>属性用于设置何时触发
                    Popover，支持四种触发方式：<code>hover</code>，<code>click</code>，<code>focus</code> 和 <code>manual</code>。对于触发
                    Popover 的元素，有两种写法：使用 <code>slot="reference"</code>
                    的具名插槽，或使用自定义指令<code>v-popover</code>指向 Popover 的索引<code>ref</code>。</p></div>

                <el-popover
                        placement="top-start"
                        title="标题"
                        width="200"
                        trigger="hover"
                        content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">
                    <el-button slot="reference">hover 激活</el-button>
                </el-popover>

                <el-popover
                        placement="bottom"
                        title="标题"
                        width="200"
                        trigger="click"
                        content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">
                    <el-button slot="reference">click 激活</el-button>
                </el-popover>

                <el-popover
                        ref="popover"
                        placement="right"
                        title="标题"
                        width="200"
                        trigger="focus"
                        content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">
                </el-popover>
                <el-button v-popover:popover>focus 激活</el-button>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>嵌套信息</h4>

                <a class="remarks">可以在 Popover 中嵌套多种类型信息，以下为嵌套表格的例子。</a>
            </div>
            <div>
                <el-popover
                        placement="right"
                        width="400"
                        trigger="click">
                    <el-table :data="data">
                        <el-table-column width="150" property="date" label="日期"></el-table-column>
                        <el-table-column width="100" property="name" label="姓名"></el-table-column>
                        <el-table-column width="300" property="address" label="地址"></el-table-column>
                    </el-table>
                    <el-button slot="reference">click 激活</el-button>
                </el-popover>

            </div>
        </el-card>
        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>嵌套操作</h4>

                <a class="remarks">当然，你还可以嵌套操作，这相比 Dialog 更为轻量：</a>
            </div>
            <div>
                <el-popover
                        placement="top"
                        width="160"
                        v-model="visible43_2">
                    <p>这是一段内容这是一段内容确定删除吗？</p>

                    <div style="text-align: right; margin: 0">
                        <el-button size="mini" type="text" @click="visible43_2 = false">取消</el-button>
                        <el-button type="primary" size="mini" @click="visible43_2 = false">确定
                        </el-button>
                    </div>
                    <el-button slot="reference">删除</el-button>
                </el-popover>

            </div>
        </el-card>

        <h3>Attributes</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
                <th>类型</th>
                <th>可选值</th>
                <th>默认值</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>trigger</td>
                <td>触发方式</td>
                <td>String</td>
                <td>click/focus/hover/manual</td>
                <td>click</td>
            </tr>
            <tr>
                <td>title</td>
                <td>标题</td>
                <td>String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>content</td>
                <td>显示的内容，也可以通过 <code>slot</code> 传入 DOM</td>
                <td>String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>width</td>
                <td>宽度</td>
                <td>String, Number</td>
                <td>—</td>
                <td>最小宽度 150px</td>
            </tr>
            <tr>
                <td>placement</td>
                <td>出现位置</td>
                <td>String</td>
                <td>
                    top/top-start/top-end/bottom/bottom-start/bottom-end/left/left-start/left-end/right/right-start/right-end
                </td>
                <td>bottom</td>
            </tr>
            <tr>
                <td>disabled</td>
                <td>Popover 是否可用</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>value(v-model)</td>
                <td>状态是否可见</td>
                <td>Boolean</td>
                <td>—</td>
                <td>false</td>
            </tr>
            <tr>
                <td>offset</td>
                <td>出现位置的偏移量</td>
                <td>Number</td>
                <td>—</td>
                <td>0</td>
            </tr>
            <tr>
                <td>transition</td>
                <td>定义渐变动画</td>
                <td>String</td>
                <td>—</td>
                <td>fade-in-linear</td>
            </tr>
            <tr>
                <td>visible-arrow</td>
                <td>是否显示 Tooltip 箭头，更多参数可见<a href="https://github.com/element-component/vue-popper">Vue-popper</a>
                </td>
                <td>Boolean</td>
                <td>—</td>
                <td>true</td>
            </tr>
            <tr>
                <td>popper-options</td>
                <td><a href="https://popper.js.org/documentation.html">popper.js</a> 的参数</td>
                <td>Object</td>
                <td>参考 <a href="https://popper.js.org/documentation.html">popper.js</a> 文档</td>
                <td><code>{ boundariesElement: 'body', gpuAcceleration: false }</code></td>
            </tr>
            <tr>
                <td>popper-class</td>
                <td>为 popper 添加类名</td>
                <td>String</td>
                <td>—</td>
                <td>—</td>
            </tr>
            <tr>
                <td>open-delay</td>
                <td>触发方式为 hover 时的显示延迟，单位为毫秒</td>
                <td>Number</td>
                <td>—</td>
                <td>—</td>
            </tr>
            </tbody>
        </table>

        <h3>Slot</h3>
        <table class="table">
            <thead>
            <tr>
                <th>参数</th>
                <th>说明</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>—</td>
                <td>Popover 内嵌 HTML 文本</td>
            </tr>
            <tr>
                <td>reference</td>
                <td>触发 Popover 显示的 HTML 元素</td>
            </tr>
            </tbody>
        </table>

        <h3>Events</h3>
        <table class="table">
            <thead>
            <tr>
                <th>事件名称</th>
                <th>说明</th>
                <th>回调参数</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>show</td>
                <td>显示时触发</td>
                <td>—</td>
            </tr>
            <tr>
                <td>after-enter</td>
                <td>显示动画播放完毕后触发</td>
                <td>—</td>
            </tr>
            <tr>
                <td>hide</td>
                <td>隐藏时触发</td>
                <td>—</td>
            </tr>
            <tr>
                <td>after-leave</td>
                <td>隐藏动画播放完毕后触发</td>
                <td>—</td>
            </tr>
            </tbody>
        </table>
    </div>
</template>
<template id="demo_ajax">
    <div class="view">
        <h1>Ajax调用</h1>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>基础用法</h4>

                <el-button type="primary" @click="doAjax">调用AJAX</el-button>

                <h4>JavaScript代码</h4>

                <div>

                    <pre><code>
    $.services.example({}).then(function (data) {
        if (data.errors.length > 0) {
            toast.e(data.errors[0].message);
        } else {
            toast.i("Ajax调用成功!");
        }
    })
                    </code></pre>

                </div>
            </div>
        </el-card>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>AJAX统一文件上传接口</h4>

                <el-upload
                        style="width: 300px;"
                        name="file"
                        class="upload-demo"
                        action="upload"
                        :http-request="handleUpload"
                        :on-preview="handlePreview"
                        :on-remove="handleRemove"
                        :before-remove="beforeRemove"
                        multiple
                        :limit="3"
                        :on-exceed="handleExceed"
                        :file-list="fileList">
                    <el-button size="small" type="primary">点击上传</el-button>
                    <div slot="tip" class="el-upload__tip">只能上传jpg/png文件，且不超过500kb</div>
                </el-upload>

                <h4>JavaScript代码</h4>

                <div>

                    <pre><code>
    $.services.fileUpload(file).then(function (data) {
        if (data.errors.length > 0) {
            req.onError();
            toast.e(data.errors[0].message);
        } else {
            req.onSuccess();
            toast.i("文件上传成功!");
        }
    })
                    </code></pre>
                </div>
            </div>
        </el-card>
    </div>
</template>
<template id="demo_toast">
    <div class="view">
        <h1>小吐司、通知</h1>

        <el-card shadow="hover" class="m-t-20">
            <div slot="header" class="clearfix">
                <h4>小吐司、通知</h4>

                <el-button type="primary" @click="showMsg()">showMsg</el-button>
                <el-button type="primary" @click="showErr()">showErr</el-button>
                <el-button type="primary" @click="showWarn()">showWarn</el-button>
                <el-button type="primary" @click="showSuccess()">showSuccess</el-button>

                <h4>JavaScript代码</h4>

                <div>

                    <pre><code>
    showMsg:function(){
        toast.i('消息')
    },
    showErr:function(){
        toast.e('错误')
    },
    showWarn:function(){
        toast.w('警告')
    },
    showSuccess:function(){
        toast.w('成功')
    }
                    </code></pre>

                </div>
            </div>
        </el-card>
    </div>
</template>
<style>
    .view {
        width: 100%;
    }

    .demo-ul {
        margin-bottom: 20px;
    }

    .demo-ul li {
        font-size: 14px;
        margin-bottom: 10px;
        color: #99a9bf;
        list-style: none;
    }

    .demo-ul li strong {
        color: #5e6d82;
        font-weight: 400;
    }

    .demo-ul li:before {
        content: "";
        display: inline-block;
        width: 4px;
        height: 4px;
        border-radius: 50%;
        vertical-align: middle;
        background-color: #5e6d82;
        margin-right: 5px;
    }

    code-line {
        color: #797979;
        display: block;
    }

    code-line.text-indent {
        text-indent: 2em
    }

    code-line.text-indent-2 {
        text-indent: 4em
    }

    code-line.text-indent-3 {
        text-indent: 6em
    }

    code-line.text-indent-4 {
        text-indent: 8em
    }

    code-line.text-indent-5 {
        text-indent: 10em
    }

    .transition-box {
        margin-bottom: 10px;
        width: 200px;
        height: 100px;
        border-radius: 4px;
        background-color: #409eff;
        text-align: center;
        color: #fff;
        padding: 40px 20px;
        margin-right: 20px;
        box-sizing: border-box;
    }

    .el-row {
        margin-bottom: 20px;

    &
    :last-child {
        margin-bottom: 0;
    }

    }
    .el-col {
        border-radius: 4px;
    }

    .bg-purple-dark {
        background: #99a9bf;
    }

    .bg-purple {
        background: #d3dce6;
    }

    .bg-purple-light {
        background: #e5e9f2;
    }

    .grid-content {
        border-radius: 4px;
        min-height: 36px;
    }

    .row-bg {
        padding: 10px 0;
        background-color: #f9fafc;
    }

    .tip {
        padding: 8px 16px;
        background-color: #ecf8ff;
        border-radius: 4px;
        border-left: 5px solid #50bfff;
        margin: 20px 0;
    }

    ul {
        margin: 10px 0;
        padding: 0 0 0 20px;
        font-size: 14px;
        color: #5e6d82;
        line-height: 2em;
    }

    table.table {
        border-collapse: collapse;
        width: 100%;
        background-color: #fff;
        font-size: 14px;
        margin-bottom: 45px;
        line-height: 1.5em;
    }

    table.table th {
        text-align: left;
        white-space: nowrap;
        color: #666;
        font-weight: 400;
    }

    table.table td, table.table th {
        border-bottom: 1px solid #d8d8d8;
        padding: 15px;
        max-width: 250px;
    }

    table.table td {
        color: #333;
    }

    table.table td:first-child, table.table th:first-child {
        padding-left: 10px;
    }

    .layout .header {
        background-color: #b3c0d1;
        text-align: center;
        line-height: 60px;
    }

    .layout .main {
        background-color: #e9eef3;
        height: 200px;
        text-align: center;
        line-height: 160px;
    }

    .layout .footer {
        background-color: #b3c0d1;
        height: 60px;
        text-align: center;
        line-height: 60px;
    }

    .layout .aside {
        background-color: #d3dce6;
        height: 200px;
        text-align: center;
        line-height: 160px;
    }

    .demo-color-box {
        border-radius: 4px;
        padding: 20px;
        margin: 5px 0;
        height: 74px;
        box-sizing: border-box;
        color: #fff;
        font-size: 14px;
    }

    .demo-color-box-2 {
        border-radius: 4px;
        padding: 20px;
        margin: 5px 0;
        height: 74px;
        box-sizing: border-box;
        color: #303133;
        font-size: 14px;
    }

    .bg-text-primary {
        background-color: #303133
    }

    .bg-text-regular {
        background-color: #606266
    }

    .bg-text-secondary {
        background-color: #909399
    }

    .bg-text-placeholder {
        background-color: #c0c4cc
    }

    .demo-typo-box {
        height: 200px;
        width: 200px;
        position: relative;
        border: 1px solid #eaeefb;
        font-size: 40px;
        color: #1f2d3d;
        text-align: center;
        line-height: 162px;
        padding-bottom: 36px;
        box-sizing: border-box;
        display: inline-block;
        margin-right: 17px;
        border-radius: 4px
    }

    .demo-typo-box .name {
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 35px;
        border-top: 1px solid #eaeefb;
        font-size: 14px;
        color: #8492a6;
        line-height: 35px;
        text-align: left;
        text-indent: 10px;
        font-family: Helvetica Neue
    }

    .hljs {
        display: block;
        white-space: nowrap;
        line-height: 1.8;
        font-family: Menlo, Monaco, Consolas, Courier, monospace;
        font-size: 12px;
        padding: 18px 24px;
        background-color: #fafafa;
        border: 1px solid #eaeefb;
        margin-bottom: 25px;
        border-radius: 4px;
        overflow: auto;
        -webkit-font-smoothing: auto;
    }

    .hljs span {

        color: #3182bd;
    }

    ul.icon-list {
        overflow: hidden;
        list-style: none;
        padding: 0;
        border: 1px solid #eaeefb;
        border-radius: 4px;
    }

    ul.icon-list li {
        float: left;
        width: 16.66%;
        text-align: center;
        height: 120px;
        line-height: 120px;
        color: #666;
        font-size: 13px;
        transition: color .15s linear;
        border-right: 1px solid #eee;
        border-bottom: 1px solid #eee;
        margin-right: -1px;
        margin-bottom: -1px;
    }

    ul.icon-list li span {
        display: inline-block;
        line-height: normal;
        vertical-align: middle;
        font-family: Helvetica Neue, Helvetica, PingFang SC, Hiragino Sans GB, Microsoft YaHei, SimSun, sans-serif;
        color: #99a9bf;
    }

    ul.icon-list li i {
        display: block;
        font-size: 32px;
        margin-bottom: 15px;
        color: #606266;
    }

    ul.icon-list li .icon-name {
        display: inline-block;
        padding: 0 3px;
        height: 1em;
        color: #606266;
    }

    .demo-input .el-input {
        width: 180px;
    }

    .demo-input-suffix {
        margin-bottom: 15px;
    }

    .demo-input-suffix .el-input {
        margin-right: 15px;
    }

    .demo-input .el-textarea {
        width: 414px;
    }

    .demo-input .el-input-group {
        width: 100%;
    }

    .demo .block {
        padding: 30px 0;
        text-align: center;
        border-right: 1px solid #eff2f6;
        display: inline-block;
        width: 50%;
        box-sizing: border-box;
    }

    .demo .demonstration {
        display: block;
        color: #8492a6;
        font-size: 14px;
        margin-bottom: 20px;
    }

    .demo .el-cascader {
        width: 222px;
    }

    .demo .block:last-child {
        border-right: none;
    }

    .el-cascader {
        display: inline-block;
        position: relative;
        font-size: 14px;
        line-height: 40px;
    }

    .el-carousel__item h3 {
        text-align: center;
        color: #475669;
        font-size: 14px;
        opacity: 0.75;
        line-height: 150px;
        margin: 0;
    }

    .el-carousel__item:nth-child(2n) {
        background-color: #99a9bf;
    }

    .el-carousel__item:nth-child(2n+1) {
        background-color: #d3dce6;
    }

    .demo-carousel .el-carousel__item h3 {
        line-height: 400px;
    }

    .demo .el-input {
        margin-right: 10px;
        width: 270px;
        vertical-align: top;
    }

    .el-form-item__content {
        line-height: 40px;
        position: relative;
        font-size: 14px;
        width: 300px;
    }

    .el-button {
        display: inline-block;
        line-height: 1;
        white-space: nowrap;
        cursor: pointer;
        background: #fff;
        border: 1px solid #dcdfe6;
        border-color: #dcdfe6;
        color: #606266;
        -webkit-appearance: none;
        text-align: center;
        box-sizing: border-box;
        outline: none;
        margin: 0;
        transition: .1s;
        font-weight: 500;
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
        padding: 12px 20px;
        font-size: 14px;
        border-radius: 4px;
    }

    .el-table .warning-row {
        background: oldlace;
    }

    .el-table .success-row {
        background: #f0f9eb;
    }

    .box {
        width: 400px;

    .top {
        text-align: center;
    }

    .left {
        float: left;
        width: 60px;
    }

    .right {
        float: right;
        width: 60px;
    }

    .bottom {
        clear: both;
        text-align: center;
    }

    .item {
        margin: 4px;
    }

    .left .el-tooltip__popper,
    .right .el-tooltip__popper {
        padding: 8px 10px;
    }

    }
</style>

<script type="text/javascript">
    $(function () {
        var router = new VueRouter({
            routes: [
                {
                    path: '/',
                    redirect: '/demo/ajax'
                },
                {
                    path: '/freemarker/introduce',
                    meta: {index: '1-1'},
                    component: Vue.extend({template: '#freemarker_introduce'})
                },
                {
                    path: '/freemarker/input',
                    meta: {index: '1-2'},
                    component: Vue.extend({template: '#freemarker_input'})
                },
                {
                    path: '/freemarker/condition',
                    meta: {index: '1-3'},
                    component: Vue.extend({template: '#freemarker_condition'})
                },
                {
                    path: '/freemarker/foreach',
                    meta: {index: '1-4'},
                    component: Vue.extend({template: '#freemarker_foreach'})
                },
                {
                    path: '/freemarker/macro',
                    meta: {index: '1-5'},
                    component: Vue.extend({template: '#freemarker_macro'})
                },
                {
                    path: '/freemarker/import',
                    meta: {index: '1-6'},
                    component: Vue.extend({template: '#freemarker_import'})
                },
                {
                    path: '/freemarker/include',
                    meta: {index: '1-7'},
                    component: Vue.extend({template: '#freemarker_include'})
                },
                {
                    path: '/vue/introduce',
                    meta: {index: '2-1'},
                    component: Vue.extend({template: '#vue_introduce'})
                },
                {
                    path: '/vue/other',
                    meta: {index: '2-2'},
                    component: Vue.extend({template: '#vue_other'})
                },
                {
                    path: '/elementui/introduce',
                    meta: {index: '3-1'},
                    component: Vue.extend({template: '#elementui_introduce'})
                },
                {
                    path: '/elementui/animation',
                    meta: {index: '3-2'},
                    component: Vue.extend({
                        template: '#elementui_animation', data: function () {
                            return {show: true, show2: true, show3: true}
                        }
                    })
                },
                {
                    path: '/elementui/layout',
                    meta: {index: '3-3'},
                    component: Vue.extend({template: '#elementui_layout'})
                },
                {
                    path: '/elementui/container',
                    meta: {index: '3-4'},
                    component: Vue.extend({template: '#elementui_container'})
                },
                {path: '/elementui/color', meta: {index: '3-5'}, component: Vue.extend({template: '#elementui_color'})},
                {
                    path: '/elementui/typography',
                    meta: {index: '3-6'},
                    component: Vue.extend({template: '#elementui_typography'})
                },
                {path: '/elementui/icon', meta: {index: '3-7'}, component: Vue.extend({template: '#elementui_icon'})},
                {
                    path: '/elementui/button',
                    meta: {index: '3-8'},
                    component: Vue.extend({template: '#elementui_button'})
                },
                {
                    path: '/elementui/upload',
                    meta: {index: '3-20'},
                    component: Vue.extend({
                        template: '#elementui_upload',
                        data: function () {
                            return {
                                fileList20: [{
                                    name: 'food.jpeg',
                                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                                }, {
                                    name: 'food2.jpeg',
                                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                                }],
                                imageUrl20: '',
                                dialogImageUrl20: '',
                                dialogVisible20: false,
                                fileList20_2: [{
                                    name: 'food.jpeg',
                                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                                }, {
                                    name: 'food2.jpeg',
                                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                                }],
                                fileList20_3: [{
                                    name: 'food.jpeg',
                                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                                }, {
                                    name: 'food2.jpeg',
                                    url: 'https://fuss10.elemecdn.com/3/63/4e7f3a15429bfda99bce42a18cdd1jpeg.jpeg?imageMogr2/thumbnail/360x360/format/webp/quality/100'
                                }],
                                submitUpload: function () {
                                    this.$refs.upload.submit();
                                },
                                handleChange: function (file, fileList) {
                                    this.fileList3 = fileList.slice(-3);
                                },
                                handlePreview: function (file) {
                                    console.log(file);
                                },
                                handleRemove: function (file, fileList) {
                                    console.log(file, fileList);
                                },
                                handlePictureCardPreview: function (file) {
                                    this.dialogImageUrl = file.url;
                                    this.dialogVisible = true;
                                },
                                handleAvatarSuccess: function (res, file) {
                                    this.imageUrl = URL.createObjectURL(file.raw);
                                },
                                beforeAvatarUpload: function (file) {
                                    const isJPG = file.type === 'image/jpeg';
                                    const isLt2M = file.size / 1024 / 1024 < 2;

                                    if (!isJPG) {
                                        this.$message.error('上传头像图片只能是 JPG 格式!');
                                    }
                                    if (!isLt2M) {
                                        this.$message.error('上传头像图片大小不能超过 2MB!');
                                    }
                                    return isJPG && isLt2M;
                                },
                                handleExceed: function (files, fileList) {
                                    this.$message.warning('当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件用户头像上传');
                                },
                                beforeRemove: function (file, fileList) {
                                    return this.$confirm('确定移除 ${ file.name }？');
                                }
                            }
                        }
                    })
                },
                {
                    path: '/elementui/form', meta: {index: '3-24'}, component: Vue.extend({
                    template: '#elementui_form', data: function () {
                        return {
                            form24_: {
                                name: '',
                                region: '',
                                date1: '',
                                date2: '',
                                delivery: false,
                                type: [],
                                resource: '',
                                desc: ''
                            },
                            formInline24_: {
                                user: '',
                                region: ''
                            },
                            labelPosition24_: 'right',
                            formLabelAlign24_: {
                                name: '',
                                region: '',
                                type: ''
                            },
                            ruleForm24_: {
                                name: '',
                                region: '',
                                date1: '',
                                date2: '',
                                delivery: false,
                                type: [],
                                resource: '',
                                desc: ''
                            },
                            rules: {
                                name: [
                                    {required: true, message: '请输入活动名称', trigger: 'blur'},
                                    {min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur'}
                                ],
                                region: [
                                    {required: true, message: '请选择活动区域', trigger: 'change'}
                                ],
                                date1: [
                                    {type: 'date', required: true, message: '请选择日期', trigger: 'change'}
                                ],
                                date2: [
                                    {type: 'date', required: true, message: '请选择时间', trigger: 'change'}
                                ],
                                type: [
                                    {type: 'array', required: true, message: '请至少选择一个活动性质', trigger: 'change'}
                                ],
                                resource: [
                                    {required: true, message: '请选择活动资源', trigger: 'change'}
                                ],
                                desc: [
                                    {required: true, message: '请填写活动形式', trigger: 'blur'}
                                ]
                            },
                            ruleForm24_2: {
                                pass: '',
                                checkPass: '',
                                age: ''
                            },
                            rules24_2: {
                                pass: [
                                    {
                                        validator: function (rule, value, callback) {
                                            if (!value) {
                                                return callback(new Error('年龄不能为空'));
                                            }
                                            setTimeout(function () {
                                                if (!Number.isInteger(value)) {
                                                    callback(new Error('请输入数字值'));
                                                } else {
                                                    if (value < 18) {
                                                        callback(new Error('必须年满18岁'));
                                                    } else {
                                                        callback();
                                                    }
                                                }
                                            }, 1000);
                                        }, trigger: 'blur'
                                    }
                                ],
                                checkPass: [
                                    {
                                        validator: function (rule, value, callback) {
                                            if (value === '') {
                                                callback(new Error('请输入密码'));
                                            } else {
                                                if (this.ruleForm24_2.checkPass !== '') {
                                                    this.$refs.ruleForm24_2.validateField('checkPass');
                                                }
                                                callback();
                                            }
                                        }, trigger: 'blur'
                                    }
                                ],
                                age: [
                                    {
                                        validator: function (rule, value, callback) {
                                            if (value === '') {
                                                callback(new Error('请再次输入密码'));
                                            } else if (value !== this.ruleForm24_2.pass) {
                                                callback(new Error('两次输入密码不一致!'));
                                            } else {
                                                callback();
                                            }
                                        }, trigger: 'blur'
                                    }
                                ]
                            },
                            dynamicValidateForm: {
                                domains: [{
                                    value: ''
                                }],
                                email: ''
                            },
                            numberValidateForm: {
                                age: ''
                            },
                            sizeForm: {
                                name: '',
                                region: '',
                                date1: '',
                                date2: '',
                                delivery: false,
                                type: [],
                                resource: '',
                                desc: ''
                            },
                            submitForm: function (formName) {
                                this.$refs[formName].validate(function (valid) {
                                    if (valid) {
                                        alert('submit!');
                                    } else {
                                        console.log('error submit!!');
                                        return false;
                                    }
                                });
                            },
                            resetForm: function (formName) {
                                this.$refs[formName].resetFields();
                            },
                            onSubmit: function () {
                                toast.i("submit");
                            },
                            removeDomain: function (item) {
                                var index = this.dynamicValidateForm.domains.indexOf(item)
                                if (index !== -1) {
                                    this.dynamicValidateForm.domains.splice(index, 1)
                                }
                            },
                            addDomain: function () {
                                this.dynamicValidateForm.domains.push({
                                    value: '',
                                    key: Date.now()
                                });
                            },
                        }
                    }
                })
                },
                {
                    path: '/elementui/table',
                    meta: {index: '3-25'},
                    component: Vue.extend({
                        template: '#elementui_table', data: function () {
                            return {
                                tableData: [{
                                    date: '2016-05-03',
                                    name: '王小虎',
                                    province: '上海',
                                    city: '普陀区',
                                    address: '上海市普陀区金沙江路 1518 弄',
                                    zip: 200333,
                                    tag: '家'
                                }, {
                                    date: '2016-05-02',
                                    name: '王小虎',
                                    province: '上海',
                                    city: '普陀区',
                                    address: '上海市普陀区金沙江路 1518 弄',
                                    zip: 200333,
                                    tag: '家'
                                }, {
                                    date: '2016-05-04',
                                    name: '王小虎',
                                    province: '上海',
                                    city: '普陀区',
                                    address: '上海市普陀区金沙江路 1518 弄',
                                    zip: 200333,
                                    tag: '家'
                                }, {
                                    date: '2016-05-01',
                                    name: '王小虎',
                                    province: '上海',
                                    city: '普陀区',
                                    address: '上海市普陀区金沙江路 1518 弄',
                                    zip: 200333,
                                    tag: '家'
                                }],
                                multipleSelection: [],
                                tableData5: [{
                                    id: '12987122',
                                    name: '好滋好味鸡蛋仔',
                                    category: '江浙小吃、小吃零食',
                                    desc: '荷兰优质淡奶，奶香浓而不腻',
                                    address: '上海市普陀区真北路',
                                    shop: '王小虎夫妻店',
                                    shopId: '10333'
                                }, {
                                    id: '12987123',
                                    name: '好滋好味鸡蛋仔',
                                    category: '江浙小吃、小吃零食',
                                    desc: '荷兰优质淡奶，奶香浓而不腻',
                                    address: '上海市普陀区真北路',
                                    shop: '王小虎夫妻店',
                                    shopId: '10333'
                                }, {
                                    id: '12987125',
                                    name: '好滋好味鸡蛋仔',
                                    category: '江浙小吃、小吃零食',
                                    desc: '荷兰优质淡奶，奶香浓而不腻',
                                    address: '上海市普陀区真北路',
                                    shop: '王小虎夫妻店',
                                    shopId: '10333'
                                }, {
                                    id: '12987126',
                                    name: '好滋好味鸡蛋仔',
                                    category: '江浙小吃、小吃零食',
                                    desc: '荷兰优质淡奶，奶香浓而不腻',
                                    address: '上海市普陀区真北路',
                                    shop: '王小虎夫妻店',
                                    shopId: '10333'
                                }],
                                tableData6: [{
                                    id: '12987122',
                                    name: '王小虎',
                                    amount1: '234',
                                    amount2: '3.2',
                                    amount3: 10
                                }, {
                                    id: '12987123',
                                    name: '王小虎',
                                    amount1: '165',
                                    amount2: '4.43',
                                    amount3: 12
                                }, {
                                    id: '12987124',
                                    name: '王小虎',
                                    amount1: '324',
                                    amount2: '1.9',
                                    amount3: 9
                                }, {
                                    id: '12987125',
                                    name: '王小虎',
                                    amount1: '621',
                                    amount2: '2.2',
                                    amount3: 17
                                }, {
                                    id: '12987126',
                                    name: '王小虎',
                                    amount1: '539',
                                    amount2: '4.1',
                                    amount3: 15
                                }],
                                handleCurrentChange: function (val) {
                                    toast.i('当前页: ' + val);
                                },
                                handleSelectionChange: function (val) {
                                    this.multipleSelection = val;
                                },
                                indexMethod: function (index) {
                                    return index * 2;
                                },
                                objectSpanMethod: function ({ row, column, rowIndex, columnIndex }) {
                                    if (columnIndex === 0) {
                                        if (rowIndex % 2 === 0) {
                                            return {
                                                rowspan: 2,
                                                colspan: 1
                                            };
                                        } else {
                                            return {
                                                rowspan: 0,
                                                colspan: 0
                                            };
                                        }
                                    }
                                },
                                arraySpanMethod: function ({ row, column, rowIndex, columnIndex }) {
                                    if (rowIndex % 2 === 0) {
                                        if (columnIndex === 0) {
                                            return [1, 2];
                                        } else if (columnIndex === 1) {
                                            return [0, 0];
                                        }
                                    }
                                },

                                objectSpanMethod: function ({ row, column, rowIndex, columnIndex }) {
                                    if (columnIndex === 0) {
                                        if (rowIndex % 2 === 0) {
                                            return {
                                                rowspan: 2,
                                                colspan: 1
                                            };
                                        } else {
                                            return {
                                                rowspan: 0,
                                                colspan: 0
                                            };
                                        }
                                    }
                                },
                                getSummaries: function (param) {
                                    const { columns, data } = param;
                                    const sums = [];
                                    columns.forEach(function (column, index) {
                                        if (index === 0) {
                                            sums[index] = '总价';
                                            return;
                                        }
                                        const values = data.map(function (item) {
                                            Number(item[column.property])
                                        });
                                        if (!values.every(function (value) {
                                                    isNaN(value)
                                                })) {
                                            sums[index] = values.reduce(function (prev, curr) {
                                                const value = Number(curr);
                                                if (!isNaN(value)) {
                                                    return prev + curr;
                                                } else {
                                                    return prev;
                                                }
                                            }, 0);
                                            sums[index] += ' 元';
                                        } else {
                                            sums[index] = 'N/A';
                                        }
                                    });
                                    return sums;
                                },
                                filterTag: function (value, row) {
                                    return row.tag === value;
                                },
                                formatter: function (row, column) {
                                    return row.address;
                                },
                                filterHandler: function (value, row, column) {
                                    const property = column['property'];
                                    return row[property] === value;
                                },
                            }
                        }
                    })
                },
                {
                    path: '/elementui/pagination',
                    meta: {index: '3-29'},
                    component: Vue.extend({
                        template: '#elementui_pagination', data: function () {
                            return {
                                currentPage1: 5,
                                currentPage2: 5,
                                currentPage3: 5,
                                currentPage4: 4,
                                handleSizeChange: function (val) {
                                    console.log('每页 ${val} 条');
                                },
                                handleCurrentChange: function (val) {
                                    toast.i('当前页: ' + val);
                                },
                            }
                        }
                    })
                },
                {
                    path: '/elementui/tooltip',
                    meta: {index: '3-42'},
                    component: Vue.extend({
                        template: '#elementui_tooltip', data: function () {
                            return {
                                disabled: true
                            }
                        }
                    })
                },
                {
                    path: '/elementui/popover',
                    meta: {index: '3-43'},
                    component: Vue.extend({
                        template: '#elementui_popover', data: function () {
                            return {
                                visible43_2: false,
                                data: [{
                                    date: '2016-05-03',
                                    name: '王小虎',
                                    province: '上海',
                                    city: '普陀区',
                                    address: '上海市普陀区金沙江路 1518 弄',
                                    zip: 200333,
                                    tag: '家'
                                }, {
                                    date: '2016-05-02',
                                    name: '王小虎',
                                    province: '上海',
                                    city: '普陀区',
                                    address: '上海市普陀区金沙江路 1518 弄',
                                    zip: 200333,
                                    tag: '家'
                                }]
                            }
                        }
                    })
                },
                {
                    path: '/demo/ajax',
                    meta: {index: '4-1'},
                    component: Vue.extend({
                        template: '#demo_ajax',
                        data: function () {
                            return {
                                doAjax: function () {
                                    $(function () {
                                        $.services.example({}).then(function (data) {
                                            if (data.errors.length > 0) {
                                                toast.e(data.errors[0].message);
                                            } else {
                                                toast.i("Ajax调用成功!");
                                            }
                                        })
                                    })
                                },
                                fileList: [{
                                    name: 'food.jpeg',
                                    url: 'static/img/logo.png'
                                }],
                                handleUpload: function (req) {
                                    $.services.fileUpload(req.file).then(function (data) {
                                        if (data.errors.length > 0) {
                                            req.onError();
                                            toast.e(data.errors[0].message);
                                        } else {
                                            req.onSuccess();
                                            toast.i("文件上传成功!");
                                        }
                                    })
                                },
                                handlePreview: function (file) {
                                    console.log(file);
                                },
                                handleRemove: function (file, fileList) {
                                    console.log(file, fileList);
                                },
                                beforeRemove: function (file, fileList) {
                                    console.log(fileList);
                                    return this.$confirm('确定移除 ${ file.name }？');
                                },
                                handleExceed: function (files, fileList) {
                                    this.$message.warning('当前限制选择 3 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件用户头像上传');
                                },
                            }
                        }
                    })
                },
                {
                    path: '/demo/toast',
                    meta: {index: '4-2'},
                    component: Vue.extend({
                        template: '#demo_toast',
                        data: function () {
                            return {
                                showMsg: function () {
                                    toast.i('消息')
                                },
                                showErr: function () {
                                    toast.e('错误')
                                },
                                showWarn: function () {
                                    toast.w('警告')
                                },
                                showSuccess: function () {
                                    toast.w('成功')
                                }
                            }
                        }
                    })
                },
            ]
        });
        router.beforeEach(function (to, from, next) {
            next();
        })

        var app = new Vue({
            el: '#app',
            router: router,
            data: {
                transitionName: ''
            },
            methods: {
                handleSelect: function (key, keyPath) {
                    //console.log(key, keyPath);
                    this.activeIndex = key
                    this.$router.push(key);
                },
                handleOpen: function (key, keyPath) {
                    //console.log(key, keyPath);
                },
                handleClose: function (key, keyPath) {
                    //console.log(key, keyPath);
                }
            },
            created: function () {
            },
            mounted: function () {
            },
            watch: {
                'value': function (val, oldVal) {//属性监听
                    toast.i("value=" + val);
                },
                '$route': function (to, from) {
                    this.transitionName = to.meta.index < from.meta.index ? 'left-in-right-out' : 'right-in-left-out'
                }
            }
        });
    });

</script>
