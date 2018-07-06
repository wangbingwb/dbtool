<div id="app" v-cloak>
    <el-container>
        <el-aside class="menu">
            <el-scrollbar style="height: 100%">
                <el-menu
                        :default-active="activeIndex"
                        @open="handleOpen"
                        @close="handleClose"
                        @select="handleSelect"
                        active-text-color="#409eff">
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
                        <el-menu-item-group>
                            <template slot="title">Other</template>
                            <el-menu-item index="2-20">解决页面初始化前闪现源代码</el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                    <el-submenu index="3">
                        <template slot="title">
                            <i class="el-icon-document"></i>
                            <span slot="title">ElementUI</span>
                        </template>

                        <el-menu-item index="3-1">入门介绍</el-menu-item>
                        <el-menu-item index="3-2">内置过渡动画</el-menu-item>
                        <el-menu-item index="3-3">Layout布局</el-menu-item>
                        <el-menu-item index="3-4">Container 布局容器</el-menu-item>
                        <el-menu-item index="3-5">Color 色彩</el-menu-item>
                        <el-menu-item index="3-6">Typography 字体</el-menu-item>
                        <el-menu-item index="3-7">Icon 图标</el-menu-item>
                        <el-menu-item index="3-8">Button 按钮</el-menu-item>
                        <el-menu-item-group title="Form">
                            <el-menu-item index="3-9">Radio 单选框</el-menu-item>
                            <el-menu-item index="3-10">Checkbox 多选框</el-menu-item>
                            <el-menu-item index="3-11">Input 输入框</el-menu-item>
                            <el-menu-item index="3-12">InputNumber 计数器</el-menu-item>
                            <el-menu-item index="3-13">Select 选择器</el-menu-item>
                            <el-menu-item index="3-14">Cascader 级联选择器</el-menu-item>
                            <el-menu-item index="3-15">Switch 开关</el-menu-item>
                            <el-menu-item index="3-16">Slider 滑块</el-menu-item>
                            <el-menu-item index="3-17">TimePicker 时间选择器</el-menu-item>
                            <el-menu-item index="3-18">DatePicker 日期选择器</el-menu-item>
                            <el-menu-item index="3-19">DateTimePicker 日期时间选择器</el-menu-item>
                            <el-menu-item index="3-20">Upload 上传</el-menu-item>
                            <el-menu-item index="3-21">Rate 评分</el-menu-item>
                            <el-menu-item index="3-22">ColorPicker 颜色选择器</el-menu-item>
                            <el-menu-item index="3-23">Transfer 穿梭框</el-menu-item>
                            <el-menu-item index="3-24">Form 表单</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="Data">
                            <el-menu-item index="3-25">Table 表格</el-menu-item>
                            <el-menu-item index="3-26">Tag 标签</el-menu-item>
                            <el-menu-item index="3-27">Progress 进度条</el-menu-item>
                            <el-menu-item index="3-28">Tree 树形控件</el-menu-item>
                            <el-menu-item index="3-29">Pagination 分页</el-menu-item>
                            <el-menu-item index="3-30">Badge 标记</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="Notice">
                            <el-menu-item index="3-31">Alert 警告</el-menu-item>
                            <el-menu-item index="3-32">Loading 加载</el-menu-item>
                            <el-menu-item index="3-33">Message 消息提示</el-menu-item>
                            <el-menu-item index="3-34">MessageBox 弹框</el-menu-item>
                            <el-menu-item index="3-35">Notification 通知</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="Navigation">
                            <el-menu-item index="3-36">NavMenu 导航菜单</el-menu-item>
                            <el-menu-item index="3-37">Tabs 标签页</el-menu-item>
                            <el-menu-item index="3-38">Breadcrumb 面包屑</el-menu-item>
                            <el-menu-item index="3-39">Dropdown 下拉菜单</el-menu-item>
                            <el-menu-item index="3-40">Steps 步骤条</el-menu-item>
                        </el-menu-item-group>
                        <el-menu-item-group title="Others">
                            <el-menu-item index="3-41">Dialog 对话框</el-menu-item>
                            <el-menu-item index="3-42">Tooltip 文字提示</el-menu-item>
                            <el-menu-item index="3-43">Popover 弹出框</el-menu-item>
                            <el-menu-item index="3-44">Card 卡片</el-menu-item>
                            <el-menu-item index="3-45">Carousel 走马灯</el-menu-item>
                            <el-menu-item index="3-46">Collapse 折叠面板</el-menu-item>
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
            </el-scrollbar>

        </el-aside>

        <el-main class="main">
            <el-scrollbar style="height: 100%" id="scrollbar">
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '1-1'">
                        <h1>介绍说明</h1>

                        <p> Freemarker 是一款模板引擎，是一种基于模版生成静态文件的通用
                            工具，它是为Java程序员提供的一个开发包，或者说是一个类库，它不是面向最终用户的，而是为程序员提供了一款可以嵌入他们开发产品的应用程序。</p>

                        <p> Freemarker 是使用纯java编写的，为了提高页面的访问速度，需要把页面静态化， 那么Freemarker就是被用来生成html页面。</p>


                        <h1>前提条件</h1>

                        <p>本工程使用的Freemarker整合了Spring MVC， 与你需要了解或熟悉Spring MVC框架。如果你熟悉EL表达，将有助于该工程Freemarker的使用。</p>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '1-2'">
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
                    <div class="view" v-show="activeIndex == '1-3'">
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
                    <div class="view" v-show="activeIndex == '1-4'">
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
                    <div class="view" v-show="activeIndex == '1-5'">
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
                    <div class="view" v-show="activeIndex == '1-6'">

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
                    <div class="view" v-show="activeIndex == '1-7'">

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
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '2-1'">

                        <h1>介绍说明</h1>

                        <p>Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，
                            Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或
                            既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。</p>
                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '2-20'">

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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-1'">

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

                        <el-card shadow="hover">
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
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-2'">

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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-3'">

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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-4'">

                        <h1>Container 布局容器</h1>

                        <p>用于布局的容器组件，方便快速搭建页面的基本结构：</p>

                        <p><code>&lt;el-container&gt;</code>：外层容器。当子元素中包含 <code>&lt;el-header&gt;</code> 或 <code>&lt;el-footer&gt;</code>
                            时，全部子元素会垂直上下排列，否则会水平左右排列。</p>

                        <p><code>&lt;el-header&gt;</code>：顶栏容器。</p>

                        <p><code>&lt;el-aside&gt;</code>：侧边栏容器。</p>

                        <p><code>&lt;el-main&gt;</code>：主要区域容器。</p>

                        <p><code>&lt;el-footer&gt;</code>：底栏容器。</p>
                        <el-tip>
                            <p>以上组件采用了 flex 布局，使用前请确定目标浏览器是否兼容。此外，<code>&lt;el-container&gt;</code>
                                的子元素只能是后四者，后四者的父元素也只能是 <code>&lt;el-container&gt;</code>。</p>
                        </el-tip>

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
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-5'">

                        <el-card shadow="hover">
                            <div slot="header" class="clearfix">
                                主色
                                <p class="text-smaller text-color-secondary">Element 主要品牌颜色是鲜艳、友好的蓝色。</p>
                            </div>
                            <div>
                                <el-row>
                                    <el-col span="5">
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
                                    <el-col span="5">
                                        <div class="demo-color-box bg-success">Success
                                            <div class="value">#67C23A</div>
                                        </div>
                                    </el-col>
                                    <el-col span="5">
                                        <div class="demo-color-box bg-warning">Warning
                                            <div class="value">#E6A23C</div>
                                        </div>
                                    </el-col>
                                    <el-col span="5">
                                        <div class="demo-color-box bg-danger">Danger
                                            <div class="value">#F56C6C</div>
                                        </div>
                                    </el-col>
                                    <el-col span="5">
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
                                    <el-col span="5">
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
                                    <el-col span="1">
                                        <div style="width: 20px;height: 10px"></div>
                                    </el-col>
                                    <el-col span="5">
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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-6'">

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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-7'">

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

                            <el-collapse class="m-t-20">
                                <el-collapse-item>
                                    <template slot="title">
                                        代码<i class="header-icon el-icon-edit-outline"></i>
                                    </template>
                                    <code>
                                        <code-line>${'<template>'?html}</code-line>
                                        <code-line>${'</template>'?html}</code-line>
                                    </code>
                                </el-collapse-item>
                            </el-collapse>
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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-8'">

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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-9'">

                        <h1>Radio 单选框</h1>
                        <a class="remarks">在一组备选项中进行单选</a>

                        <el-card shadow="hover">
                            <div slot="header" class="clearfix">
                                <h1>基础用法</h1>

                                <a class="remarks">由于选项默认可见，不宜过多，若选项过多，建议使用 Select 选择器。</a>
                            </div>
                            <div>
                                <template>
                                    <el-radio v-model="radio" label="1">备选项</el-radio>
                                    <el-radio v-model="radio" label="2">备选项</el-radio>
                                </template>
                            </div>

                        </el-card>
                        <el-card shadow="hover">
                            <div slot="header" class="clearfix">
                                <h1>禁用状态</h1>

                                <a class="remarks">单选框不可用的状态。</a>
                            </div>
                            <div>
                                <template>
                                    <el-radio disabled v-model="radio1" label="禁用">备选项</el-radio>
                                    <el-radio disabled v-model="radio1" label="选中且禁用">备选项</el-radio>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover">
                            <div slot="header" class="clearfix">
                                <h1>单选框组</h1>

                                <a class="remarks">适用于在多个互斥的选项中选择的场景</a>
                            </div>
                            <div>
                                <template>
                                    <el-radio-group v-model="radio2">
                                        <el-radio :label="3">备选项</el-radio>
                                        <el-radio :label="6">备选项</el-radio>
                                        <el-radio :label="9">备选项</el-radio>
                                    </el-radio-group>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover">
                            <div slot="header" class="clearfix">
                                <h1>按钮样式</h1>

                                <a class="remarks">按钮样式的单选组合。</a>
                            </div>
                            <div>
                                <template>
                                    <div>
                                        <el-radio-group v-model="radio3">
                                            <el-radio-button label="上海"></el-radio-button>
                                            <el-radio-button label="北京"></el-radio-button>
                                            <el-radio-button label="广州"></el-radio-button>
                                            <el-radio-button label="深圳"></el-radio-button>
                                        </el-radio-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-radio-group v-model="radio4" size="medium">
                                            <el-radio-button label="上海"></el-radio-button>
                                            <el-radio-button label="北京"></el-radio-button>
                                            <el-radio-button label="广州"></el-radio-button>
                                            <el-radio-button label="深圳"></el-radio-button>
                                        </el-radio-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-radio-group v-model="radio5" size="small">
                                            <el-radio-button label="上海"></el-radio-button>
                                            <el-radio-button label="北京" disabled></el-radio-button>
                                            <el-radio-button label="广州"></el-radio-button>
                                            <el-radio-button label="深圳"></el-radio-button>
                                        </el-radio-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-radio-group v-model="radio6" disabled size="mini">
                                            <el-radio-button label="上海"></el-radio-button>
                                            <el-radio-button label="北京"></el-radio-button>
                                            <el-radio-button label="广州"></el-radio-button>
                                            <el-radio-button label="深圳"></el-radio-button>
                                        </el-radio-group>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover">
                            <div slot="header" class="clearfix">
                                <h1>带有边框</h1>

                            </div>
                            <div>
                                <template>
                                    <div>
                                        <el-radio v-model="radio7" label="1" border>备选项1</el-radio>
                                        <el-radio v-model="radio7" label="2" border>备选项2</el-radio>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-radio v-model="radio8" label="1" border size="medium">备选项1</el-radio>
                                        <el-radio v-model="radio8" label="2" border size="medium">备选项2</el-radio>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-radio-group v-model="radio9" size="small">
                                            <el-radio label="1" border>备选项1</el-radio>
                                            <el-radio label="2" border disabled>备选项2</el-radio>
                                        </el-radio-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-radio-group v-model="radio10" size="mini" disabled>
                                            <el-radio label="1" border>备选项1</el-radio>
                                            <el-radio label="2" border>备选项2</el-radio>
                                        </el-radio-group>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <h3>Radio Attributes</h3>
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
                                <td>label</td>
                                <td>Radio 的 value</td>
                                <td>string / number / boolean</td>
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
                            <tr>
                                <td>border</td>
                                <td>是否显示边框</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>Radio 的尺寸，仅在 border 为真时有效</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生 name 属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>
                        <h3>Radio Events</h3>
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
                                <td>change</td>
                                <td>绑定值变化时触发的事件</td>
                                <td>选中的 Radio label 值</td>
                            </tr>
                            </tbody>
                        </table>
                        <h3>Radio-group Attributes</h3>
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
                                <td>单选框组尺寸，仅对按钮形式的 Radio 或带有边框的 Radio 有效</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>text-color</td>
                                <td>按钮形式的 Radio 激活时的文本颜色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#ffffff</td>
                            </tr>
                            <tr>
                                <td>fill</td>
                                <td>按钮形式的 Radio 激活时的填充色和边框色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#409EFF</td>
                            </tr>
                            </tbody>
                        </table>
                        <h3>Radio-group Events</h3>
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
                                <td>change</td>
                                <td>绑定值变化时触发的事件</td>
                                <td>选中的 Radio label 值</td>
                            </tr>
                            </tbody>
                        </table>
                        <h3>Radio-button Attributes</h3>
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
                                <td>label</td>
                                <td>Radio 的 value</td>
                                <td>string / number</td>
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
                            <tr>
                                <td>name</td>
                                <td>原生 name 属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-10'">

                        <h1>Checkbox 多选框</h1>
                        <a class="remarks">一组备选项中进行多选</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h1>基础用法</h1>

                                <a class="remarks">单独使用可以表示两种状态之间的切换，写在标签中的内容为 checkbox 按钮后的介绍。</a>
                            </div>
                            <div>
                                <template>
                                    <!-- `checked` 为 true 或 false -->
                                    <el-checkbox v-model="checked">备选项</el-checkbox>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h1>禁用状态</h1>

                                <a class="remarks">多选框不可用状态。</a>
                            </div>
                            <div>
                                <template>
                                    <el-checkbox v-model="checked1" disabled>备选项1</el-checkbox>
                                    <el-checkbox v-model="checked2" disabled>备选项</el-checkbox>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h1>多选框组</h1>

                                <a class="remarks">适用于多个勾选框绑定到同一个数组的情景，通过是否勾选来表示这一组选项中选中的项。</a>
                            </div>
                            <div>
                                <template>
                                    <el-checkbox-group v-model="checkList">
                                        <el-checkbox label="复选框 A"></el-checkbox>
                                        <el-checkbox label="复选框 B"></el-checkbox>
                                        <el-checkbox label="复选框 C"></el-checkbox>
                                        <el-checkbox label="禁用" disabled></el-checkbox>
                                        <el-checkbox label="选中且禁用" disabled></el-checkbox>
                                    </el-checkbox-group>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h1>indeterminate 状态</h1>

                                <a class="remarks"><code>indeterminate</code> 属性用以表示 checkbox 的不确定状态，一般用于实现全选的效果</a>
                            </div>
                            <div>
                                <template>
                                    <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll"
                                                 @change="handleCheckAllChange">全选
                                    </el-checkbox>
                                    <div style="margin: 15px 0;"></div>
                                    <el-checkbox-group v-model="checkedCities" @change="handleCheckedCitiesChange">
                                        <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}
                                        </el-checkbox>
                                    </el-checkbox-group>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h1>可选项目数量的限制</h1>

                                <a class="remarks">使用<code>min</code>和 <code>max</code> 属性能够限制可以被勾选的项目的数量。</a>
                            </div>
                            <div>
                                <template>
                                    <el-checkbox-group
                                            v-model="checkedCities1"
                                            :min="1"
                                            :max="2">
                                        <el-checkbox v-for="city in cities" :label="city" :key="city">{{city}}
                                        </el-checkbox>
                                    </el-checkbox-group>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h1>按钮样式</h1>

                                <a class="remarks">按钮样式的多选组合。</a>
                            </div>
                            <div>
                                <template>
                                    <div>
                                        <el-checkbox-group v-model="checkboxGroup1">
                                            <el-checkbox-button v-for="city in cities" :label="city" :key="city">
                                                {{city}}
                                            </el-checkbox-button>
                                        </el-checkbox-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-checkbox-group v-model="checkboxGroup2" size="medium">
                                            <el-checkbox-button v-for="city in cities" :label="city" :key="city">
                                                {{city}}
                                            </el-checkbox-button>
                                        </el-checkbox-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-checkbox-group v-model="checkboxGroup3" size="small">
                                            <el-checkbox-button v-for="city in cities" :label="city"
                                                                :disabled="city === '北京'" :key="city">{{city}}
                                            </el-checkbox-button>
                                        </el-checkbox-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-checkbox-group v-model="checkboxGroup4" size="mini" disabled>
                                            <el-checkbox-button v-for="city in cities" :label="city" :key="city">
                                                {{city}}
                                            </el-checkbox-button>
                                        </el-checkbox-group>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                带有边框
                            </div>
                            <div>
                                <template>
                                    <div>
                                        <el-checkbox v-model="checked3" label="备选项1" border></el-checkbox>
                                        <el-checkbox v-model="checked4" label="备选项2" border></el-checkbox>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-checkbox v-model="checked5" label="备选项1" border size="medium"></el-checkbox>
                                        <el-checkbox v-model="checked6" label="备选项2" border size="medium"></el-checkbox>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-checkbox-group v-model="checkboxGroup5" size="small">
                                            <el-checkbox label="备选项1" border></el-checkbox>
                                            <el-checkbox label="备选项2" border disabled></el-checkbox>
                                        </el-checkbox-group>
                                    </div>
                                    <div style="margin-top: 20px">
                                        <el-checkbox-group v-model="checkboxGroup6" size="mini" disabled>
                                            <el-checkbox label="备选项1" border></el-checkbox>
                                            <el-checkbox label="备选项2" border></el-checkbox>
                                        </el-checkbox-group>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <h3>Checkbox Attributes</h3>
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
                                <td>label</td>
                                <td>选中状态的值（只有在<code>checkbox-group</code>或者绑定对象类型为<code>array</code>时有效）</td>
                                <td>string / number / boolean</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>true-label</td>
                                <td>选中时的值</td>
                                <td>string / number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>false-label</td>
                                <td>没有选中时的值</td>
                                <td>string / number</td>
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
                            <tr>
                                <td>border</td>
                                <td>是否显示边框</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>Checkbox 的尺寸，仅在 border 为真时有效</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生 name 属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>checked</td>
                                <td>当前是否勾选</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>indeterminate</td>
                                <td>设置 indeterminate 状态，只负责样式控制</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Checkbox Events</h3>
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
                                <td>change</td>
                                <td>当绑定值变化时触发的事件</td>
                                <td>更新后的值</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Checkbox-group Attributes</h3>
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
                                <td>多选框组尺寸，仅对按钮形式的 Checkbox 或带有边框的 Checkbox 有效</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>min</td>
                                <td>可被勾选的 checkbox 的最小数量</td>
                                <td>number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>max</td>
                                <td>可被勾选的 checkbox 的最大数量</td>
                                <td>number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>text-color</td>
                                <td>按钮形式的 Checkbox 激活时的文本颜色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#ffffff</td>
                            </tr>
                            <tr>
                                <td>fill</td>
                                <td>按钮形式的 Checkbox 激活时的填充色和边框色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#409EFF</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Checkbox-group Events</h3>
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
                                <td>change</td>
                                <td>当绑定值变化时触发的事件</td>
                                <td>更新后的值</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Checkbox-button Attributes</h3>
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
                                <td>label</td>
                                <td>选中状态的值（只有在<code>checkbox-group</code>或者绑定对象类型为<code>array</code>时有效）</td>
                                <td>string / number / boolean</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>true-label</td>
                                <td>选中时的值</td>
                                <td>string / number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>false-label</td>
                                <td>没有选中时的值</td>
                                <td>string / number</td>
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
                            <tr>
                                <td>name</td>
                                <td>原生 name 属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>checked</td>
                                <td>当前是否勾选</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view demo-input" v-show="activeIndex == '3-11'">

                        <h1>Input 输入框</h1>
                        <a class="remarks">通过鼠标或键盘输入字符</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>
                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <el-input v-model="input" placeholder="请输入内容"></el-input>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>禁用状态</h4>
                            </div>
                            <div>
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="input1"
                                        :disabled="true">
                                </el-input>
                            </div>

                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可清空</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <el-input
                                        placeholder="请输入内容"
                                        v-model="input10"
                                        clearable>
                                </el-input>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带 icon 的输入框</h4>

                                <a class="remarks">带有图标标记输入类型</a>
                            </div>
                            <div>
                                <div class="demo-input-suffix">
                                    属性方式：
                                    <el-input
                                            placeholder="请选择日期"
                                            suffix-icon="el-icon-date"
                                            v-model="input2">
                                    </el-input>
                                    <el-input
                                            placeholder="请输入内容"
                                            prefix-icon="el-icon-search"
                                            v-model="input21">
                                    </el-input>
                                </div>
                                <div class="demo-input-suffix">
                                    slot 方式：
                                    <el-input
                                            placeholder="请选择日期"
                                            v-model="input22">
                                        <i slot="suffix" class="el-input__icon el-icon-date"></i>
                                    </el-input>
                                    <el-input
                                            placeholder="请输入内容"
                                            v-model="input23">
                                        <i slot="prefix" class="el-input__icon el-icon-search"></i>
                                    </el-input>
                                </div>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>文本域</h4>

                                <a class="remarks">用于输入多行文本信息，通过将 type 属性的值指定为 textarea。</a>
                            </div>
                            <div>
                                <el-input
                                        type="textarea"
                                        :rows="2"
                                        placeholder="请输入内容"
                                        v-model="textarea">
                                </el-input>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可自适应文本高度的文本域</h4>

                                <a class="remarks">通过设置 <code>autosize</code> 属性可以使得文本域的高度能够根据文本内容自动进行调整，并且 <code>autosize</code>
                                    还可以设定为一个对象，指定最小行数和最大行数。</a>
                            </div>
                            <div>
                                <el-input
                                        type="textarea"
                                        autosize
                                        placeholder="请输入内容"
                                        v-model="textarea2">
                                </el-input>
                                <div style="margin: 20px 0;"></div>
                                <el-input
                                        type="textarea"
                                        :autosize="{ minRows: 2, maxRows: 4}"
                                        placeholder="请输入内容"
                                        v-model="textarea3">
                                </el-input>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>复合型输入框</h4>

                                <a class="remarks">可前置或后置元素，一般为标签或按钮</a>
                            </div>
                            <div>
                                <div>
                                    <el-input placeholder="请输入内容" v-model="input3">
                                        <template slot="prepend">Http://</template>
                                    </el-input>
                                </div>
                                <div style="margin-top: 15px;">
                                    <el-input placeholder="请输入内容" v-model="input4">
                                        <template slot="append">.com</template>
                                    </el-input>
                                </div>
                                <div style="margin-top: 15px;">
                                    <el-input placeholder="请输入内容" v-model="input5" class="input-with-select">
                                        <el-select v-model="select" slot="prepend" placeholder="请选择">
                                            <el-option label="餐厅名" value="1"></el-option>
                                            <el-option label="订单号" value="2"></el-option>
                                            <el-option label="用户电话" value="3"></el-option>
                                        </el-select>
                                        <el-button slot="append" icon="el-icon-search"></el-button>
                                    </el-input>
                                </div>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>尺寸</h4>
                            </div>
                            <div>
                                <div class="demo-input-size">
                                    <el-input
                                            placeholder="请输入内容"
                                            suffix-icon="el-icon-date"
                                            v-model="input6">
                                    </el-input>
                                    <el-input
                                            size="medium"
                                            placeholder="请输入内容"
                                            suffix-icon="el-icon-date"
                                            v-model="input7">
                                    </el-input>
                                    <el-input
                                            size="small"
                                            placeholder="请输入内容"
                                            suffix-icon="el-icon-date"
                                            v-model="input8">
                                    </el-input>
                                    <el-input
                                            size="mini"
                                            placeholder="请输入内容"
                                            suffix-icon="el-icon-date"
                                            v-model="input9">
                                    </el-input>
                                </div>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带输入建议</h4>

                                <a class="remarks">根据输入内容提供对应的输入建议</a>
                            </div>
                            <div>
                                <el-row class="demo-autocomplete">
                                    <el-col :span="12">
                                        <div class="sub-title">激活即列出输入建议</div>
                                        <el-autocomplete
                                                class="inline-input"
                                                v-model="state1"
                                                :fetch-suggestions="querySearch"
                                                placeholder="请输入内容"
                                                @select="handleSelect"
                                                ></el-autocomplete>
                                    </el-col>
                                    <el-col :span="12">
                                        <div class="sub-title">输入后匹配输入建议</div>
                                        <el-autocomplete
                                                class="inline-input"
                                                v-model="state2"
                                                :fetch-suggestions="querySearch"
                                                placeholder="请输入内容"
                                                :trigger-on-focus="false"
                                                @select="handleSelect"
                                                ></el-autocomplete>
                                    </el-col>
                                </el-row>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义模板</h4>

                                <a class="remarks">可自定义输入建议的显示</a>
                            </div>
                            <div>
                                <el-autocomplete
                                        popper-class="my-autocomplete"
                                        v-model="state3"
                                        :fetch-suggestions="querySearch"
                                        placeholder="请输入内容"
                                        @select="handleSelect">
                                    <i
                                            class="el-icon-edit el-input__icon"
                                            slot="suffix"
                                            @click="handleIconClick">
                                    </i>
                                    <template slot-scope="{ item }">
                                        <div class="name">{{ item.value }}</div>
                                        <span class="addr">{{ item.address }}</span>
                                    </template>
                                </el-autocomplete>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>远程搜索</h4>

                                <a class="remarks">从服务端搜索数据</a>
                            </div>
                            <div>
                                <el-autocomplete
                                        v-model="state4"
                                        :fetch-suggestions="querySearchAsync"
                                        placeholder="请输入内容"
                                        @select="handleSelect"></el-autocomplete>
                            </div>
                        </el-card>

                        <h3>Input Attributes</h3>
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
                                <td>类型</td>
                                <td>string</td>
                                <td>text，textarea 和其他 <a
                                        href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#Form_%3Cinput%3E_types">原生
                                    input 的 type 值</a></td>
                                <td>text</td>
                            </tr>
                            <tr>
                                <td>value</td>
                                <td>绑定值</td>
                                <td>string / number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>maxlength</td>
                                <td>原生属性，最大输入长度</td>
                                <td>number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>minlength</td>
                                <td>原生属性，最小输入长度</td>
                                <td>number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>placeholder</td>
                                <td>输入框占位文本</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>clearable</td>
                                <td>是否可清空</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>输入框尺寸，只在 <code>type!="textarea"</code> 时有效</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>prefix-icon</td>
                                <td>输入框头部图标</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>suffix-icon</td>
                                <td>输入框尾部图标</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>rows</td>
                                <td>输入框行数，只对 <code>type="textarea"</code> 有效</td>
                                <td>number</td>
                                <td>—</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>autosize</td>
                                <td>自适应内容高度，只对 <code>type="textarea"</code> 有效，可传入对象，如，{ minRows: 2, maxRows: 6 }</td>
                                <td>boolean / object</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>auto-complete</td>
                                <td>原生属性，自动补全</td>
                                <td>string</td>
                                <td>on, off</td>
                                <td>off</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>readonly</td>
                                <td>原生属性，是否只读</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>max</td>
                                <td>原生属性，设置最大值</td>
                                <td>—</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>min</td>
                                <td>原生属性，设置最小值</td>
                                <td>—</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>step</td>
                                <td>原生属性，设置输入字段的合法数字间隔</td>
                                <td>—</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>resize</td>
                                <td>控制是否能被用户缩放</td>
                                <td>string</td>
                                <td>none, both, horizontal, vertical</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>autofocus</td>
                                <td>原生属性，自动获取焦点</td>
                                <td>boolean</td>
                                <td>true, false</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>form</td>
                                <td>原生属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>label</td>
                                <td>输入框关联的label文字</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>tabindex</td>
                                <td>输入框的tabindex</td>
                                <td>string</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Input Slots</h3>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>name</th>
                                <th>说明</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>prefix</td>
                                <td>输入框头部内容，只对 <code>type="text"</code> 有效</td>
                            </tr>
                            <tr>
                                <td>suffix</td>
                                <td>输入框尾部内容，只对 <code>type="text"</code> 有效</td>
                            </tr>
                            <tr>
                                <td>prepend</td>
                                <td>输入框前置内容，只对 <code>type="text"</code> 有效</td>
                            </tr>
                            <tr>
                                <td>append</td>
                                <td>输入框后置内容，只对 <code>type="text"</code> 有效</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Input Events</h3>
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
                                <td>blur</td>
                                <td>在 Input 失去焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            <tr>
                                <td>focus</td>
                                <td>在 Input 获得焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            <tr>
                                <td>change</td>
                                <td>在 Input 值改变时触发</td>
                                <td>(value: string | number)</td>
                            </tr>
                            <tr>
                                <td>clear</td>
                                <td>在点击由 <code>clearable</code> 属性生成的清空按钮时触发</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Input Methods</h3>
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
                                <td>focus</td>
                                <td>使 input 获取焦点</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>使 input 失去焦点</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>select</td>
                                <td>选中 input 中的文字</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Autocomplete Attributes</h3>
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
                                <td>placeholder</td>
                                <td>输入框占位文本</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>value-key</td>
                                <td>输入建议对象中用于显示的键名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>value</td>
                            </tr>
                            <tr>
                                <td>value</td>
                                <td>必填值，输入绑定值</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>debounce</td>
                                <td>获取输入建议的去抖延时</td>
                                <td>number</td>
                                <td>—</td>
                                <td>300</td>
                            </tr>
                            <tr>
                                <td>placement</td>
                                <td>菜单弹出位置</td>
                                <td>string</td>
                                <td>top / top-start / top-end / bottom / bottom-start / bottom-end</td>
                                <td>bottom-start</td>
                            </tr>
                            <tr>
                                <td>fetch-suggestions</td>
                                <td>返回输入建议的方法，仅当你的输入建议数据 resolve 时，通过调用 callback(data:[]) 来返回它</td>
                                <td>Function(queryString, callback)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>popper-class</td>
                                <td>Autocomplete 下拉列表的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>trigger-on-focus</td>
                                <td>是否在输入框 focus 时显示建议列表</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>select-when-unmatched</td>
                                <td>在输入没有任何匹配建议的情况下，按下回车是否触发 <code>select</code> 事件</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>label</td>
                                <td>输入框关联的label文字</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>prefix-icon</td>
                                <td>输入框头部图标</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>suffix-icon</td>
                                <td>输入框尾部图标</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>hide-loading</td>
                                <td>是否隐藏远程加载时的加载图标</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Autocomplete Slots</h3>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>name</th>
                                <th>说明</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>prefix</td>
                                <td>输入框头部内容</td>
                            </tr>
                            <tr>
                                <td>suffix</td>
                                <td>输入框尾部内容</td>
                            </tr>
                            <tr>
                                <td>prepend</td>
                                <td>输入框前置内容</td>
                            </tr>
                            <tr>
                                <td>append</td>
                                <td>输入框后置内容</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Autocomplete Scoped Slot</h3>
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
                                <td>自定义输入建议，参数为 { item }</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Autocomplete Events</h3>
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
                                <td>select</td>
                                <td>点击选中建议项时触发</td>
                                <td>选中建议项</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Autocomplete Methods</h3>
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
                                <td>focus</td>
                                <td>使 input 获取焦点</td>
                                <td>-</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3></h3>

                        <h3></h3>
                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-12'">

                        <h1>InputNumber 计数器</h1>

                        <a class="remarks">仅允许输入标准的数字值，可定义范围</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>
                            </div>
                            <div>
                                <template>
                                    <el-input-number v-model="num1" @change="handleChange" :min="1" :max="10"
                                                     label="描述文字"></el-input-number>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>禁用状态</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <template>
                                    <el-input-number v-model="num2" :disabled="true"></el-input-number>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>步数</h4>

                                <a class="remarks">允许定义递增递减的步数控制</a>
                            </div>
                            <div>
                                <template>
                                    <el-input-number v-model="num3" :step="2"></el-input-number>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>精度</h4>
                            </div>
                            <div>
                                <template>
                                    <el-input-number v-model="num9" :precision="2" :step="0.1"
                                                     :max="10"></el-input-number>
                                </template>
                            </div>
                        </el-card>

                        <div class="tip"><p><code>precision</code> 的值必须是一个正整数，并且不能小于 <code>step</code> 的小数位数。</p></div>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>尺寸</h4>

                                <a class="remarks">额外提供了 <code>medium</code>、<code>small</code>、<code>mini</code>
                                    三种尺寸的数字输入框</a>
                            </div>
                            <div>
                                <template>
                                    <el-input-number v-model="num4"></el-input-number>
                                    <el-input-number size="medium" v-model="num5"></el-input-number>
                                    <el-input-number size="small" v-model="num6"></el-input-number>
                                    <el-input-number size="mini" v-model="num7"></el-input-number>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>按钮位置</h4>
                            </div>
                            <div>
                                <template>
                                    <el-input-number v-model="num8" controls-position="right" @change="handleChange"
                                                     :min="1" :max="10"></el-input-number>
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
                                <td>value</td>
                                <td>绑定值</td>
                                <td>number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>min</td>
                                <td>设置计数器允许的最小值</td>
                                <td>number</td>
                                <td>—</td>
                                <td>-Infinity</td>
                            </tr>
                            <tr>
                                <td>max</td>
                                <td>设置计数器允许的最大值</td>
                                <td>number</td>
                                <td>—</td>
                                <td>Infinity</td>
                            </tr>
                            <tr>
                                <td>step</td>
                                <td>计数器步长</td>
                                <td>number</td>
                                <td>—</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>precision</td>
                                <td>数值精度</td>
                                <td>number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>计数器尺寸</td>
                                <td>string</td>
                                <td>large, small</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否禁用计数器</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>controls</td>
                                <td>是否使用控制按钮</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>controls-position</td>
                                <td>控制按钮位置</td>
                                <td>string</td>
                                <td>right</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>label</td>
                                <td>输入框关联的label文字</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
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
                                <td>change</td>
                                <td>绑定值被改变时触发</td>
                                <td>最后变更的值</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>在组件 Input 失去焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            <tr>
                                <td>focus</td>
                                <td>在组件 Input 获得焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>focus</td>
                                <td>使 input 获取焦点</td>
                                <td>-</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-13'">
                        <h1>Select 选择器</h1>

                        <a class="remarks">当选项过多时，使用下拉菜单展示并选择内容。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">适用广泛的基础单选</a>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value" placeholder="请选择">
                                        <el-option
                                                v-for="item in options"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>有禁用选项</h4>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value2" placeholder="请选择">
                                        <el-option
                                                v-for="item in options2"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value"
                                                :disabled="item.disabled">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>禁用状态</h4>

                                <a class="remarks">选择器不可用状态</a>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value3" disabled placeholder="请选择">
                                        <el-option
                                                v-for="item in options2"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可清空单选</h4>

                                <a class="remarks">包含清空按钮，可将选择器清空为初始状态</a>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value4" clearable placeholder="请选择">
                                        <el-option
                                                v-for="item in options"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础多选</h4>

                                <a class="remarks">适用性较广的基础多选，用 Tag 展示已选项</a>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value5" multiple placeholder="请选择">
                                        <el-option
                                                v-for="item in options"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>

                                    <el-select
                                            v-model="value11"
                                            multiple
                                            collapse-tags
                                            style="margin-left: 20px;"
                                            placeholder="请选择">
                                        <el-option
                                                v-for="item in options"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>

                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义模板</h4>

                                <a class="remarks">可以自定义备选项</a>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value6" placeholder="请选择">
                                        <el-option
                                                v-for="item in cities"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                            <span style="float: left">{{ item.label }}</span>
                                            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.value }}</span>
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>

                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>分组</h4>

                                <a class="remarks">备选项进行分组展示</a>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value7" placeholder="请选择">
                                        <el-option-group
                                                v-for="group in options3"
                                                :key="group.label"
                                                :label="group.label">
                                            <el-option
                                                    v-for="item in group.options"
                                                    :key="item.value"
                                                    :label="item.label"
                                                    :value="item.value">
                                            </el-option>
                                        </el-option-group>
                                    </el-select>
                                </template>
                            </div>

                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可搜索</h4>

                                <a class="remarks">可以利用搜索功能快速查找选项</a>
                            </div>
                            <div>
                                <template>
                                    <el-select v-model="value8" filterable placeholder="请选择">
                                        <el-option
                                                v-for="item in options"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>远程搜索</h4>

                                <a class="remarks">从服务器搜索数据，输入关键字进行查找</a>
                            </div>
                            <div>
                                <template>
                                    <el-select
                                            v-model="value9"
                                            multiple
                                            filterable
                                            remote
                                            reserve-keyword
                                            placeholder="请输入关键词"
                                            :remote-method="remoteMethod"
                                            :loading="loading">
                                        <el-option
                                                v-for="item in options4"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>创建条目</h4>

                                <a class="remarks">可以创建并选中选项中不存在的条目</a>
                            </div>
                            <div>
                                <template>
                                    <el-select
                                            v-model="value10"
                                            multiple
                                            filterable
                                            allow-create
                                            default-first-option
                                            placeholder="请选择文章标签">
                                        <el-option
                                                v-for="item in options5"
                                                :key="item.value"
                                                :label="item.label"
                                                :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </div>
                        </el-card>

                        <h3>Select Attributes</h3>
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
                                <td>multiple</td>
                                <td>是否多选</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>value-key</td>
                                <td>作为 value 唯一标识的键名，绑定值为对象类型时必填</td>
                                <td>string</td>
                                <td>—</td>
                                <td>value</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>输入框尺寸</td>
                                <td>string</td>
                                <td>medium/small/mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>clearable</td>
                                <td>单选时是否可以清空选项</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>collapse-tags</td>
                                <td>多选时是否将选中值按文字的形式展示</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>multiple-limit</td>
                                <td>多选时用户最多可以选择的项目数，为 0 则不限制</td>
                                <td>number</td>
                                <td>—</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>select input 的 name 属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>auto-complete</td>
                                <td>select input 的 autocomplete 属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>off</td>
                            </tr>
                            <tr>
                                <td>placeholder</td>
                                <td>占位符</td>
                                <td>string</td>
                                <td>—</td>
                                <td>请选择</td>
                            </tr>
                            <tr>
                                <td>filterable</td>
                                <td>是否可搜索</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>allow-create</td>
                                <td>是否允许用户创建新条目，需配合 <code>filterable</code> 使用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>filter-method</td>
                                <td>自定义搜索方法</td>
                                <td>function</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>remote</td>
                                <td>是否为远程搜索</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>remote-method</td>
                                <td>远程搜索方法</td>
                                <td>function</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>loading</td>
                                <td>是否正在从远程获取数据</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>loading-text</td>
                                <td>远程加载时显示的文字</td>
                                <td>string</td>
                                <td>—</td>
                                <td>加载中</td>
                            </tr>
                            <tr>
                                <td>no-match-text</td>
                                <td>搜索条件无匹配时显示的文字</td>
                                <td>string</td>
                                <td>—</td>
                                <td>无匹配数据</td>
                            </tr>
                            <tr>
                                <td>no-data-text</td>
                                <td>选项为空时显示的文字</td>
                                <td>string</td>
                                <td>—</td>
                                <td>无数据</td>
                            </tr>
                            <tr>
                                <td>popper-class</td>
                                <td>Select 下拉框的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>reserve-keyword</td>
                                <td>多选且可搜索时，是否在选中一个选项后保留当前的搜索关键词</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>default-first-option</td>
                                <td>在输入框按下回车，选择第一个匹配项。需配合 <code>filterable</code> 或 <code>remote</code> 使用</td>
                                <td>boolean</td>
                                <td>-</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>popper-append-to-body</td>
                                <td>是否将弹出框插入至 body 元素。在弹出框的定位出现问题时，可将该属性设置为 false</td>
                                <td>boolean</td>
                                <td>-</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>automatic-dropdown</td>
                                <td>对于不可搜索的 Select，是否在输入框获得焦点后自动弹出选项菜单</td>
                                <td>boolean</td>
                                <td>-</td>
                                <td>false</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Select Events</h3>
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
                                <td>change</td>
                                <td>选中值发生变化时触发</td>
                                <td>目前的选中值</td>
                            </tr>
                            <tr>
                                <td>visible-change</td>
                                <td>下拉框出现/隐藏时触发</td>
                                <td>出现则为 true，隐藏则为 false</td>
                            </tr>
                            <tr>
                                <td>remove-tag</td>
                                <td>多选模式下移除tag时触发</td>
                                <td>移除的tag值</td>
                            </tr>
                            <tr>
                                <td>clear</td>
                                <td>可清空的单选模式下用户点击清空按钮时触发</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>当 input 失去焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            <tr>
                                <td>focus</td>
                                <td>当 input 获得焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Select Slots</h3>
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
                                <td>Option 组件列表</td>
                            </tr>
                            <tr>
                                <td>prefix</td>
                                <td>Select 组件头部内容</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Option Group Attributes</h3>
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
                                <td>label</td>
                                <td>分组的组名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否将该分组下所有选项置为禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Option Attributes</h3>
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
                                <td>value</td>
                                <td>选项的值</td>
                                <td>string/number/object</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>label</td>
                                <td>选项的标签，若不设置则默认与 <code>value</code> 相同</td>
                                <td>string/number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否禁用该选项</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>focus</td>
                                <td>使 input 获取焦点</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>使 input 失去焦点，并隐藏下拉框</td>
                                <td>-</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-14'">
                        <h1>Cascader 级联选择器</h1>

                        <a class="remarks">当一个数据集合有清晰的层级结构时，可通过级联选择器逐级查看并选择。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">有两种触发子菜单的方式</a>
                            </div>
                            <div class="source demo" style="padding: 0px;">
                                <div class="block">
                                    <span class="demonstration">默认 click 触发子菜单</span>
                                    <el-cascader
                                            :options="options3"
                                            v-model="selectedOptions"
                                            @change="handleChange">
                                    </el-cascader>
                                </div>
                                <!--
                                                                -->
                                <div class="block">
                                    <span class="demonstration">hover 触发子菜单</span>
                                    <el-cascader
                                            expand-trigger="hover"
                                            :options="options3"
                                            v-model="selectedOptions2"
                                            @change="handleChange">
                                    </el-cascader>
                                </div>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>禁用选项</h4>

                                <a class="remarks">通过在数据源中设置<code>disabled</code> 字段来声明该选项是禁用的</a>
                            </div>
                            <div>
                                <el-cascader
                                        :options="options4"
                                        ></el-cascader>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>仅显示最后一级</h4>

                                <a class="remarks">可以仅在输入框中显示选中项最后一级的标签，而不是选中项所在的完整路径。</a>
                            </div>
                            <div>
                                <el-cascader
                                        :options="options4"
                                        :show-all-levels="false"
                                        ></el-cascader>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>默认值</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <el-cascader
                                        :options="options3"
                                        v-model="selectedOptions3"
                                        ></el-cascader>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>选择即改变</h4>

                                <a class="remarks">点击或移入选项即表示选中该项，可用于选择任意一级菜单的选项。</a>
                            </div>
                            <div>
                                <el-cascader
                                        :options="options3"
                                        change-on-select
                                        ></el-cascader>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>动态加载次级选项</h4>

                                <a class="remarks">当选中某一级时，动态加载该级下的选项。</a>
                            </div>
                            <div>
                                <el-cascader
                                        :options="options5"
                                        @active-item-change="handleItemChange"
                                        :props="props"
                                        ></el-cascader>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可搜索</h4>

                                <a class="remarks">可以快捷地搜索选项并选择。</a>
                            </div>
                            <div class="source demo">
                                <div class="block">
                                    <span class="demonstration">只可选择最后一级菜单的选项</span>
                                    <el-cascader
                                            placeholder="试试搜索：指南"
                                            :options="options3"
                                            filterable
                                            ></el-cascader>
                                </div>
                                <!--
                                                                -->
                                <div class="block">
                                    <span class="demonstration">可选择任意一级菜单的选项</span>
                                    <el-cascader
                                            placeholder="试试搜索：指南"
                                            :options="options"
                                            filterable
                                            change-on-select
                                            ></el-cascader>
                                </div>
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
                                <td>options</td>
                                <td>可选项数据源，键名可通过 <code>props</code> 属性配置</td>
                                <td>array</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>props</td>
                                <td>配置选项，具体见下表</td>
                                <td>object</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>value</td>
                                <td>选中项绑定值</td>
                                <td>array</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>separator</td>
                                <td>选项分隔符</td>
                                <td>string</td>
                                <td>—</td>
                                <td>斜杠'/'</td>
                            </tr>
                            <tr>
                                <td>popper-class</td>
                                <td>自定义浮层类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>placeholder</td>
                                <td>输入框占位文本</td>
                                <td>string</td>
                                <td>—</td>
                                <td>请选择</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>clearable</td>
                                <td>是否支持清空选项</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>expand-trigger</td>
                                <td>次级菜单的展开方式</td>
                                <td>string</td>
                                <td>click / hover</td>
                                <td>click</td>
                            </tr>
                            <tr>
                                <td>show-all-levels</td>
                                <td>输入框中是否显示选中值的完整路径</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>filterable</td>
                                <td>是否可搜索选项</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>debounce</td>
                                <td>搜索关键词输入的去抖延迟，毫秒</td>
                                <td>number</td>
                                <td>—</td>
                                <td>300</td>
                            </tr>
                            <tr>
                                <td>change-on-select</td>
                                <td>是否允许选择任意一级的选项</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>尺寸</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>before-filter</td>
                                <td>筛选之前的钩子，参数为输入的值，若返回 false 或者返回 Promise 且被 reject，则停止筛选</td>
                                <td>function(value)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>props</h3>
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
                                <td>value</td>
                                <td>指定选项的值为选项对象的某个属性值</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>label</td>
                                <td>指定选项标签为选项对象的某个属性值</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>children</td>
                                <td>指定选项的子选项为选项对象的某个属性值</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>指定选项的禁用为选项对象的某个属性值</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
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
                                <td>change</td>
                                <td>当绑定值变化时触发的事件</td>
                                <td>当前值</td>
                            </tr>
                            <tr>
                                <td>active-item-change</td>
                                <td>当父级选项变化时触发的事件，仅在 <code>change-on-select</code> 为 <code>false</code> 时可用</td>
                                <td>各父级选项组成的数组</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>在 Cascader 失去焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            <tr>
                                <td>focus</td>
                                <td>在 Cascader 获得焦点时触发</td>
                                <td>(event: Event)</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-15'">
                        <h1>Switch 开关</h1>

                        <a class="remarks">表示两种相互对立的状态间的切换，多用于触发「开/关」。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基本用法</h4>

                            </div>
                            <div>
                                <el-switch
                                        v-model="value15_2"
                                        active-color="#13ce66"
                                        inactive-color="#ff4949">
                                </el-switch>
                            </div>
                        </el-card>


                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>文字描述</h4>
                            </div>
                            <div>
                                <el-switch
                                        v-model="value15_3"
                                        active-text="按月付费"
                                        inactive-text="按年付费">
                                </el-switch>
                                <el-switch
                                        style="display: block"
                                        v-model="value15_4"
                                        active-color="#13ce66"
                                        inactive-color="#ff4949"
                                        active-text="按月付费"
                                        inactive-text="按年付费">
                                </el-switch>
                            </div>
                        </el-card>


                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>扩展的 value 类型</h4>
                            </div>
                            <div>
                                <el-tooltip :content="'Switch value: ' + value15_5" placement="top">
                                    <el-switch
                                            v-model="value15_5"
                                            active-color="#13ce66"
                                            inactive-color="#ff4949"
                                            active-value="100"
                                            inactive-value="0">
                                    </el-switch>
                                </el-tooltip>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>禁用状态</h4>
                            </div>
                            <div>
                                <el-switch
                                        v-model="value15_6"
                                        disabled>
                                </el-switch>
                                <el-switch
                                        v-model="value15_7"
                                        disabled>
                                </el-switch>
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
                                <td>disabled</td>
                                <td>是否禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>width</td>
                                <td>switch 的宽度（像素）</td>
                                <td>number</td>
                                <td>—</td>
                                <td>40</td>
                            </tr>
                            <tr>
                                <td>active-icon-class</td>
                                <td>switch 打开时所显示图标的类名，设置此项会忽略 <code>active-text</code></td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>inactive-icon-class</td>
                                <td>switch 关闭时所显示图标的类名，设置此项会忽略 <code>inactive-text</code></td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>active-text</td>
                                <td>switch 打开时的文字描述</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>inactive-text</td>
                                <td>switch 关闭时的文字描述</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>active-value</td>
                                <td>switch 打开时的值</td>
                                <td>boolean / string / number</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>inactive-value</td>
                                <td>switch 关闭时的值</td>
                                <td>boolean / string / number</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>active-color</td>
                                <td>switch 打开时的背景色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#409EFF</td>
                            </tr>
                            <tr>
                                <td>inactive-color</td>
                                <td>switch 关闭时的背景色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#C0CCDA</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>switch 对应的 name 属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
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
                                <td>change</td>
                                <td>switch 状态发生变化时的回调函数</td>
                                <td>新状态的值</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>focus</td>
                                <td>使 Switch 获取焦点</td>
                                <td>-</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-16'">
                        <h1>Slider 滑块</h1>

                        <a class="remarks">通过拖动滑块在一个固定区间内进行选择</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">在拖动滑块时，显示当前值</a>
                            </div>
                            <div>
                                <template>
                                    <div class="block">
                                        <span class="demonstration">默认</span>
                                        <el-slider v-model="value16_1"></el-slider>
                                    </div>
                                    <div class="block">
                                        <span class="demonstration">自定义初始值</span>
                                        <el-slider v-model="value16_2"></el-slider>
                                    </div>
                                    <div class="block">
                                        <span class="demonstration">隐藏 Tooltip</span>
                                        <el-slider v-model="value16_3" :show-tooltip="false"></el-slider>
                                    </div>
                                    <div class="block">
                                        <span class="demonstration">格式化 Tooltip</span>
                                        <el-slider v-model="value16_4" :format-tooltip="formatTooltip"></el-slider>
                                    </div>
                                    <div class="block">
                                        <span class="demonstration">禁用</span>
                                        <el-slider v-model="value16_5" disabled></el-slider>
                                    </div>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>离散值</h4>

                                <a class="remarks">选项可以是离散的</a>
                            </div>
                            <div>
                                <template>
                                    <div class="block">
                                        <span class="demonstration">不显示间断点</span>
                                        <el-slider
                                                v-model="value16_6"
                                                :step="10">
                                        </el-slider>
                                    </div>
                                    <div class="block">
                                        <span class="demonstration">显示间断点</span>
                                        <el-slider
                                                v-model="value16_7"
                                                :step="10"
                                                show-stops>
                                        </el-slider>
                                    </div>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带有输入框</h4>

                                <a class="remarks">通过输入框设置精确数值</a>
                            </div>
                            <div>
                                <template>
                                    <div class="block">
                                        <el-slider
                                                v-model="value16_8"
                                                show-input>
                                        </el-slider>
                                    </div>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>范围选择</h4>

                                <a class="remarks">支持选择某一数值范围</a>
                            </div>
                            <div>
                                <template>
                                    <div class="block">
                                        <el-slider
                                                v-model="value16_9"
                                                range
                                                show-stops
                                                :max="10">
                                        </el-slider>
                                    </div>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>竖向模式</h4>

                            </div>
                            <div>
                                <template>
                                    <div class="block">
                                        <el-slider
                                                v-model="value16_10"
                                                vertical
                                                height="200px">
                                        </el-slider>
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
                                <td>min</td>
                                <td>最小值</td>
                                <td>number</td>
                                <td>—</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>max</td>
                                <td>最大值</td>
                                <td>number</td>
                                <td>—</td>
                                <td>100</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>step</td>
                                <td>步长</td>
                                <td>number</td>
                                <td>—</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>show-input</td>
                                <td>是否显示输入框，仅在非范围选择时有效</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>show-input-controls</td>
                                <td>在显示输入框的情况下，是否显示输入框的控制按钮</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>input-size</td>
                                <td>输入框的尺寸</td>
                                <td>string</td>
                                <td>large / medium / small / mini</td>
                                <td>small</td>
                            </tr>
                            <tr>
                                <td>show-stops</td>
                                <td>是否显示间断点</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>show-tooltip</td>
                                <td>是否显示 tooltip</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>format-tooltip</td>
                                <td>格式化 tooltip message</td>
                                <td>function(value)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>range</td>
                                <td>是否为范围选择</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>vertical</td>
                                <td>是否竖向模式</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>height</td>
                                <td>Slider 高度，竖向模式时必填</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>label</td>
                                <td>屏幕阅读器标签</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>debounce</td>
                                <td>输入时的去抖延迟，毫秒，仅在<code>show-input</code>等于true时有效</td>
                                <td>number</td>
                                <td>—</td>
                                <td>300</td>
                            </tr>
                            <tr>
                                <td>tooltip-class</td>
                                <td>tooltip 的自定义类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
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
                                <td>change</td>
                                <td>值改变时触发（使用鼠标拖曳时，只在松开鼠标后触发）</td>
                                <td>改变后的值</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-17'">
                        <h1>TimePicker 时间选择器</h1>

                        <a class="remarks">用于选择或输入日期</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>固定时间点</h4>

                                <a class="remarks">提供几个固定的时间点供用户选择</a>
                            </div>
                            <div>
                                <el-time-select
                                        v-model="value17_1"
                                        :picker-options="{start: '08:30',step: '00:15',end: '18:30'}"
                                        placeholder="选择时间">
                                </el-time-select>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>任意时间点</h4>

                                <a class="remarks">可以选择任意时间</a>
                            </div>
                            <div>
                                <template>
                                    <el-time-picker
                                            v-model="value17_2"
                                            :picker-options="{selectableRange: '18:30:00 - 20:30:00'}"
                                            placeholder="任意时间点">
                                    </el-time-picker>
                                    <el-time-picker
                                            arrow-control
                                            v-model="value17_3"
                                            :picker-options="{selectableRange: '18:30:00 - 20:30:00'}"
                                            placeholder="任意时间点">
                                    </el-time-picker>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>固定时间范围</h4>

                                <a class="remarks">若先选择开始时间，则结束时间内备选项的状态会随之改变</a>
                            </div>
                            <div>
                                <template>
                                    <el-time-select
                                            placeholder="起始时间"
                                            v-model="startTime"
                                            :picker-options="{
                                                  start: '08:30',
                                                  step: '00:15',
                                                  end: '18:30'
                                                }">
                                    </el-time-select>
                                    <el-time-select
                                            placeholder="结束时间"
                                            v-model="endTime"
                                            :picker-options="{
                                                  start: '08:30',
                                                  step: '00:15',
                                                  end: '18:30',
                                                  minTime: startTime
                                                }">
                                    </el-time-select>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>任意时间范围</h4>

                                <a class="remarks">可选择任意的时间范围</a>
                            </div>
                            <div>
                                <template>
                                    <el-time-picker
                                            is-range
                                            v-model="value17_4"
                                            range-separator="至"
                                            start-placeholder="开始时间"
                                            end-placeholder="结束时间"
                                            placeholder="选择时间范围">
                                    </el-time-picker>
                                    <el-time-picker
                                            is-range
                                            arrow-control
                                            v-model="value17_5"
                                            range-separator="至"
                                            start-placeholder="开始时间"
                                            end-placeholder="结束时间"
                                            placeholder="选择时间范围">
                                    </el-time-picker>
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
                                <td>readonly</td>
                                <td>完全只读</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>editable</td>
                                <td>文本框可输入</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>clearable</td>
                                <td>是否显示清除按钮</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>输入框尺寸</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>placeholder</td>
                                <td>非范围选择时的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>start-placeholder</td>
                                <td>范围选择时开始日期的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>end-placeholder</td>
                                <td>范围选择时开始日期的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>is-range</td>
                                <td>是否为时间范围选择，仅对<code>&lt;el-time-picker&gt;</code>有效</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>arrow-control</td>
                                <td>是否使用箭头进行时间选择，仅对<code>&lt;el-time-picker&gt;</code>有效</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>value</td>
                                <td>绑定值</td>
                                <td>date(TimePicker) / string(TimeSelect)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>align</td>
                                <td>对齐方式</td>
                                <td>string</td>
                                <td>left / center / right</td>
                                <td>left</td>
                            </tr>
                            <tr>
                                <td>popper-class</td>
                                <td>TimePicker 下拉框的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>picker-options</td>
                                <td>当前时间日期选择器特有的选项参考下表</td>
                                <td>object</td>
                                <td>—</td>
                                <td>{}</td>
                            </tr>
                            <tr>
                                <td>range-separator</td>
                                <td>选择范围时的分隔符</td>
                                <td>string</td>
                                <td>-</td>
                                <td>'-'</td>
                            </tr>
                            <tr>
                                <td>value-format</td>
                                <td>可选，仅TimePicker时可用，绑定值的格式。不指定则绑定值为 Date 对象</td>
                                <td>string</td>
                                <td>见<a href="#/zh-CN/component/date-picker#ri-qi-ge-shi">日期格式</a></td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>default-value</td>
                                <td>可选，选择器打开时默认显示的时间</td>
                                <td>Date(TimePicker) / string(TimeSelect)</td>
                                <td>可被<code>new Date()</code>解析(TimePicker) / 可选值(TimeSelect)</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>prefix-icon</td>
                                <td>自定义头部图标的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-time</td>
                            </tr>
                            <tr>
                                <td>clear-icon</td>
                                <td>自定义清空图标的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-circle-close</td>
                            </tr>
                            </tbody>
                        </table>
                        <h3>Time Select Options</h3>
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
                                <td>start</td>
                                <td>开始时间</td>
                                <td>string</td>
                                <td>—</td>
                                <td>09:00</td>
                            </tr>
                            <tr>
                                <td>end</td>
                                <td>结束时间</td>
                                <td>string</td>
                                <td>—</td>
                                <td>18:00</td>
                            </tr>
                            <tr>
                                <td>step</td>
                                <td>间隔时间</td>
                                <td>string</td>
                                <td>—</td>
                                <td>00:30</td>
                            </tr>
                            <tr>
                                <td>minTime</td>
                                <td>最小时间，小于该时间的时间段将被禁用</td>
                                <td>string</td>
                                <td>—</td>
                                <td>00:00</td>
                            </tr>
                            <tr>
                                <td>maxTime</td>
                                <td>最大时间，大于该时间的时间段将被禁用</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Time Picker Options</h3>
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
                                <td>selectableRange</td>
                                <td>可选时间段，例如<code>'18:30:00 - 20:30:00'</code>或者传入数组<code>['09:30:00 - 12:00:00',
                                    '14:30:00 - 18:30:00']</code></td>
                                <td>string / array</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>format</td>
                                <td>时间格式化(TimePicker)</td>
                                <td>string</td>
                                <td>小时：<code>HH</code>，分：<code>mm</code>，秒：<code>ss</code>，AM/PM <code>A</code></td>
                                <td>'HH:mm:ss'</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Events</h3>
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
                                <td>change</td>
                                <td>用户确认选定的值时触发</td>
                                <td>组件绑定值</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>当 input 失去焦点时触发</td>
                                <td>组件实例</td>
                            </tr>
                            <tr>
                                <td>focus</td>
                                <td>当 input 获得焦点时触发</td>
                                <td>组件实例</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>focus</td>
                                <td>使 input 获取焦点</td>
                                <td>-</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-18'">
                        <h1>DatePicker 日期选择器</h1>

                        <a class="remarks">用于选择或输入日期</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>选择日</h4>

                                <a class="remarks">以「日」为基本单位，基础的日期选择控件</a>
                            </div>
                            <div class="demo">
                                <template>
                                    <div class="block">
                                        <span class="demonstration">默认</span>
                                        <el-date-picker
                                                v-model="value18_1"
                                                type="date"
                                                placeholder="选择日期">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">带快捷选项</span>
                                        <el-date-picker
                                                v-model="value18_2"
                                                align="right"
                                                type="date"
                                                placeholder="选择日期"
                                                :picker-options="pickerOptions18_1">
                                        </el-date-picker>
                                    </div>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>其他日期单位</h4>

                                <a class="remarks">通过扩展基础的日期选择，可以选择周、月、年或多个日期</a>
                            </div>
                            <div>
                                <div class="container demo">
                                    <div class="block">
                                        <span class="demonstration">周</span>
                                        <el-date-picker
                                                v-model="value18_3"
                                                type="week"
                                                format="yyyy 第 WW 周"
                                                placeholder="选择周">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">月</span>
                                        <el-date-picker
                                                v-model="value18_4"
                                                type="month"
                                                placeholder="选择月">
                                        </el-date-picker>
                                    </div>
                                </div>
                                <div class="container demo">
                                    <div class="block">
                                        <span class="demonstration">年</span>
                                        <el-date-picker
                                                v-model="value18_5"
                                                type="year"
                                                placeholder="选择年">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">多个日期</span>
                                        <el-date-picker
                                                type="dates"
                                                v-model="value18_6"
                                                placeholder="选择一个或多个日期">
                                        </el-date-picker>
                                    </div>
                                </div>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>选择日期范围</h4>

                                <a class="remarks">可在一个选择器中便捷地选择一个时间范围</a>
                            </div>
                            <div class="demo">
                                <a class="remarks">在选择日期范围时，默认情况下左右面板会联动。如果希望两个面板各自独立切换当前月份，可以使用unlink-panels属性解除联动。</a>
                                <template>
                                    <div class="block">
                                        <span class="demonstration">默认</span>
                                        {{value18_6_}}
                                        <el-date-picker
                                                v-model="value18_6_"
                                                type="daterange"
                                                range-separator="至"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">带快捷选项</span>
                                        <el-date-picker
                                                v-model="value18_7"
                                                type="daterange"
                                                align="right"
                                                unlink-panels
                                                range-separator="至"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期"
                                                :picker-options="pickerOptions18_2">
                                        </el-date-picker>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <h2>日期格式</h2>

                        <h4>使用format指定输入框的格式；使用value-format指定绑定值的格式。</h4>

                        <h4>默认情况下，组件接受并返回Date对象。以下为可用的格式化字串，以 UTC 2017年1月2日 03:04:05 为例：</h4>

                        <div class="warning"><p>请注意大小写</p></div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>格式</th>
                                <th>含义</th>
                                <th>备注</th>
                                <th>举例</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><code>yyyy</code></td>
                                <td>年</td>
                                <td></td>
                                <td>2017</td>
                            </tr>
                            <tr>
                                <td><code>M</code></td>
                                <td>月</td>
                                <td>不补0</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td><code>MM</code></td>
                                <td>月</td>
                                <td></td>
                                <td>01</td>
                            </tr>
                            <tr>
                                <td><code>W</code></td>
                                <td>周</td>
                                <td>仅周选择器的 <code>format</code> 可用；不补0</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td><code>WW</code></td>
                                <td>周</td>
                                <td>仅周选择器的 <code>format</code> 可用</td>
                                <td>01</td>
                            </tr>
                            <tr>
                                <td><code>d</code></td>
                                <td>日</td>
                                <td>不补0</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td><code>dd</code></td>
                                <td>日</td>
                                <td></td>
                                <td>02</td>
                            </tr>
                            <tr>
                                <td><code>H</code></td>
                                <td>小时</td>
                                <td>24小时制；不补0</td>
                                <td>3</td>
                            </tr>
                            <tr>
                                <td><code>HH</code></td>
                                <td>小时</td>
                                <td>24小时制</td>
                                <td>03</td>
                            </tr>
                            <tr>
                                <td><code>h</code></td>
                                <td>小时</td>
                                <td>12小时制，须和 <code>A</code> 或 <code>a</code> 使用；不补0</td>
                                <td>3</td>
                            </tr>
                            <tr>
                                <td><code>hh</code></td>
                                <td>小时</td>
                                <td>12小时制，须和 <code>A</code> 或 <code>a</code> 使用</td>
                                <td>03</td>
                            </tr>
                            <tr>
                                <td><code>m</code></td>
                                <td>分钟</td>
                                <td>不补0</td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <td><code>mm</code></td>
                                <td>分钟</td>
                                <td></td>
                                <td>04</td>
                            </tr>
                            <tr>
                                <td><code>s</code></td>
                                <td>秒</td>
                                <td>不补0</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td><code>ss</code></td>
                                <td>秒</td>
                                <td></td>
                                <td>05</td>
                            </tr>
                            <tr>
                                <td><code>A</code></td>
                                <td>AM/PM</td>
                                <td>仅 <code>format</code> 可用，大写</td>
                                <td>AM</td>
                            </tr>
                            <tr>
                                <td><code>a</code></td>
                                <td>am/pm</td>
                                <td>仅 <code>format</code> 可用，小写</td>
                                <td>am</td>
                            </tr>
                            <tr>
                                <td><code>timestamp</code></td>
                                <td>JS时间戳</td>
                                <td>仅 <code>value-format</code> 可用；组件绑定值为<code>number</code>类型</td>
                                <td>1483326245000</td>
                            </tr>
                            </tbody>
                        </table>


                        <el-card shadow="hover" class="m-t-20">
                            <div class="demo">
                                <template>
                                    <div class="block">
                                        <span class="demonstration">默认为 Date 对象</span>

                                        <div class="demonstration">值：{{ value18_10 }}</div>
                                        <el-date-picker
                                                v-model="value18_10"
                                                type="date"
                                                placeholder="选择日期"
                                                format="yyyy 年 MM 月 dd 日">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">使用 value-format</span>

                                        <div class="demonstration">值：{{ value18_11 }}</div>
                                        <el-date-picker
                                                v-model="value18_11"
                                                type="date"
                                                placeholder="选择日期"
                                                format="yyyy 年 MM 月 dd 日"
                                                value-format="yyyy-MM-dd">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">时间戳</span>

                                        <div class="demonstration">值：{{ value18_12 }}</div>
                                        <el-date-picker
                                                v-model="value18_12"
                                                type="date"
                                                placeholder="选择日期"
                                                format="yyyy 年 MM 月 dd 日"
                                                value-format="timestamp">
                                        </el-date-picker>
                                    </div>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>默认显示日期</h4>

                                <a class="remarks">在选择日期范围时，指定起始日期和结束日期的默认时刻。</a>
                            </div>
                            <div style="text-align: center;">
                                <template>
                                    <div class="block">
                                        <p>组件值：{{ value18_13 }}</p>
                                        <el-date-picker
                                                v-model="value18_13"
                                                type="daterange"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期"
                                                :default-time="['00:00:00', '23:59:59']">
                                        </el-date-picker>
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
                                <td>readonly</td>
                                <td>完全只读</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>editable</td>
                                <td>文本框可输入</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>clearable</td>
                                <td>是否显示清除按钮</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>输入框尺寸</td>
                                <td>string</td>
                                <td>large, small, mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>placeholder</td>
                                <td>非范围选择时的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>start-placeholder</td>
                                <td>范围选择时开始日期的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>end-placeholder</td>
                                <td>范围选择时结束日期的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>type</td>
                                <td>显示类型</td>
                                <td>string</td>
                                <td>year/month/date/dates/ week/datetime/datetimerange/daterange</td>
                                <td>date</td>
                            </tr>
                            <tr>
                                <td>format</td>
                                <td>显示在输入框中的格式</td>
                                <td>string</td>
                                <td>见<a href="#/zh-CN/component/date-picker#ri-qi-ge-shi">日期格式</a></td>
                                <td>yyyy-MM-dd</td>
                            </tr>
                            <tr>
                                <td>align</td>
                                <td>对齐方式</td>
                                <td>string</td>
                                <td>left, center, right</td>
                                <td>left</td>
                            </tr>
                            <tr>
                                <td>popper-class</td>
                                <td>DatePicker 下拉框的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>picker-options</td>
                                <td>当前时间日期选择器特有的选项参考下表</td>
                                <td>object</td>
                                <td>—</td>
                                <td>{}</td>
                            </tr>
                            <tr>
                                <td>range-separator</td>
                                <td>选择范围时的分隔符</td>
                                <td>string</td>
                                <td>—</td>
                                <td>'-'</td>
                            </tr>
                            <tr>
                                <td>default-value</td>
                                <td>可选，选择器打开时默认显示的时间</td>
                                <td>Date</td>
                                <td>可被<code>new Date()</code>解析</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>default-time</td>
                                <td>范围选择时选中日期所使用的当日内具体时刻</td>
                                <td>string[]</td>
                                <td>数组，长度为 2，每项值为字符串，形如<code>12:00:00</code>，第一项指定开始日期的时刻，第二项指定结束日期的时刻，不指定会使用时刻 <code>00:00:00</code>
                                </td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>value-format</td>
                                <td>可选，绑定值的格式。不指定则绑定值为 Date 对象</td>
                                <td>string</td>
                                <td>见<a href="#/zh-CN/component/date-picker#ri-qi-ge-shi">日期格式</a></td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>unlink-panels</td>
                                <td>在范围选择器里取消两个日期面板之间的联动</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>prefix-icon</td>
                                <td>自定义头部图标的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-date</td>
                            </tr>
                            <tr>
                                <td>clear-icon</td>
                                <td>自定义清空图标的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-circle-close</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Picker Options</h3>
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
                                <td>shortcuts</td>
                                <td>设置快捷选项，需要传入 { text, onClick } 对象用法参考 demo 或下表</td>
                                <td>Object[]</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabledDate</td>
                                <td>设置禁用状态，参数为当前日期，要求返回 Boolean</td>
                                <td>Function</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>firstDayOfWeek</td>
                                <td>周起始日</td>
                                <td>Number</td>
                                <td>1 到 7</td>
                                <td>7</td>
                            </tr>
                            <tr>
                                <td>onPick</td>
                                <td>选中日期后会执行的回调，只有当 <code>daterange</code> 或 <code>datetimerange</code> 才生效</td>
                                <td>Function({ maxDate, minDate })</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Shortcuts</h3>
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
                                <td>text</td>
                                <td>标题文本</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>onClick</td>
                                <td>选中后的回调函数，参数是 vm，可通过触发 'pick' 事件设置选择器的值。例如 vm.$emit('pick', new Date())</td>
                                <td>function</td>
                                <td>—</td>
                                <td>—</td>
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
                                <td>change</td>
                                <td>用户确认选定的值时触发</td>
                                <td>组件绑定值。格式与绑定值一致，可受 <code>value-format</code> 控制</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>当 input 失去焦点时触发</td>
                                <td>组件实例</td>
                            </tr>
                            <tr>
                                <td>focus</td>
                                <td>当 input 获得焦点时触发</td>
                                <td>组件实例</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>focus</td>
                                <td>使 input 获取焦点</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-19'">
                        <h1>DateTimePicker 日期时间选择器</h1>

                        <a class="remarks">在同一个选择器里选择日期和时间</a>
                        DateTimePicker 由 DatePicker 和 TimePicker 派生，Picker Options 或者其他选项可以参照 DatePicker 和 TimePicker。


                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>日期和时间点</h4>
                                <a class="remarks">通过设置type属性为datetime，即可在同一个选择器里同时进行日期和时间的选择。快捷选项的使用方法与 Date Picker
                                    相同。</a>
                            </div>
                            <div class="demo">
                                <template>
                                    <div class="block">
                                        <span class="demonstration">默认</span>
                                        <el-date-picker
                                                v-model="value19_1"
                                                type="datetime"
                                                placeholder="选择日期时间">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">带快捷选项</span>
                                        <el-date-picker
                                                v-model="value19_2"
                                                type="datetime"
                                                placeholder="选择日期时间"
                                                align="right"
                                                :picker-options="pickerOptions19_1">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">设置默认时间</span>
                                        <el-date-picker
                                                v-model="value19_3"
                                                type="datetime"
                                                placeholder="选择日期时间"
                                                default-time="12:00:00">
                                        </el-date-picker>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>日期和时间范围</h4>

                                <a class="remarks">设置type为datetimerange即可选择日期和时间范围</a>
                            </div>
                            <div class="demo">
                                <template>
                                    <div class="block">
                                        <span class="demonstration">默认</span>
                                        <el-date-picker
                                                v-model="value19_4"
                                                type="datetimerange"
                                                range-separator="至"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">带快捷选项</span>
                                        <el-date-picker
                                                v-model="value19_5"
                                                type="datetimerange"
                                                :picker-options="pickerOptions19_2"
                                                range-separator="至"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期"
                                                align="right">
                                        </el-date-picker>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>默认的起始与结束时刻</h4>

                                <a class="remarks">使用datetimerange进行范围选择时，在日期选择面板中选定起始与结束的日期，默认会使用该日期的00:00:00作为起始与结束的时刻；通过选项default-time可以控制选中起始与结束日期时所使用的具体时刻。default-time接受一个数组，数组每项值为字符串，形如12:00:00，其中第一项控制起始日期的具体时刻，第二项控制结束日期的具体时刻。</a>
                            </div>
                            <div class="demo">
                                <template>
                                    <div class="block">
                                        <span class="demonstration">起始日期时刻为 12:00:00</span>
                                        <el-date-picker
                                                v-model="value19_6"
                                                type="datetimerange"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期"
                                                :default-time="['12:00:00']">
                                        </el-date-picker>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">起始日期时刻为 12:00:00，结束日期时刻为 08:00:00</span>
                                        <el-date-picker
                                                v-model="value19_7"
                                                type="datetimerange"
                                                align="right"
                                                start-placeholder="开始日期"
                                                end-placeholder="结束日期"
                                                :default-time="['12:00:00', '08:00:00']">
                                        </el-date-picker>
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
                                <td>readonly</td>
                                <td>完全只读</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>editable</td>
                                <td>文本框可输入</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>clearable</td>
                                <td>是否显示清除按钮</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>输入框尺寸</td>
                                <td>string</td>
                                <td>large, small, mini</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>placeholder</td>
                                <td>非范围选择时的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>start-placeholder</td>
                                <td>范围选择时开始日期的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>end-placeholder</td>
                                <td>范围选择时结束日期的占位内容</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>time-arrow-control</td>
                                <td>是否使用箭头进行时间选择</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>type</td>
                                <td>显示类型</td>
                                <td>string</td>
                                <td>year/month/date/week/ datetime/datetimerange/daterange</td>
                                <td>date</td>
                            </tr>
                            <tr>
                                <td>format</td>
                                <td>显示在输入框中的格式</td>
                                <td>string</td>
                                <td>见<a href="#/zh-CN/component/date-picker#ri-qi-ge-shi">日期格式</a></td>
                                <td>yyyy-MM-dd</td>
                            </tr>
                            <tr>
                                <td>align</td>
                                <td>对齐方式</td>
                                <td>string</td>
                                <td>left, center, right</td>
                                <td>left</td>
                            </tr>
                            <tr>
                                <td>popper-class</td>
                                <td>DateTimePicker 下拉框的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>picker-options</td>
                                <td>当前时间日期选择器特有的选项参考下表</td>
                                <td>object</td>
                                <td>—</td>
                                <td>{}</td>
                            </tr>
                            <tr>
                                <td>range-separator</td>
                                <td>选择范围时的分隔符</td>
                                <td>string</td>
                                <td>-</td>
                                <td>'-'</td>
                            </tr>
                            <tr>
                                <td>default-value</td>
                                <td>可选，选择器打开时默认显示的时间</td>
                                <td>Date</td>
                                <td>可被<code>new Date()</code>解析</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>default-time</td>
                                <td>选中日期后的默认具体时刻</td>
                                <td>非范围选择时：string / 范围选择时：string[]</td>
                                <td>非范围选择时：形如<code>12:00:00</code>的字符串；范围选择时：数组，长度为 2，每项值为字符串，形如<code>12:00:00</code>，第一项指定开始日期的时刻，第二项指定结束日期的时刻。不指定会使用时刻
                                    <code>00:00:00</code></td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>value-format</td>
                                <td>可选，绑定值的格式。不指定则绑定值为 Date 对象</td>
                                <td>string</td>
                                <td>见<a href="#/zh-CN/component/date-picker#ri-qi-ge-shi">日期格式</a></td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>原生属性</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>unlink-panels</td>
                                <td>在范围选择器里取消两个日期面板之间的联动</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>prefix-icon</td>
                                <td>自定义头部图标的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-date</td>
                            </tr>
                            <tr>
                                <td>clear-icon</td>
                                <td>自定义清空图标的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-circle-close</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Picker Options</h3>
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
                                <td>shortcuts</td>
                                <td>设置快捷选项，需要传入 { text, onClick } 对象用法参考 demo 或下表</td>
                                <td>Object[]</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabledDate</td>
                                <td>设置禁用状态，参数为当前日期，要求返回 Boolean</td>
                                <td>Function</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>firstDayOfWeek</td>
                                <td>周起始日</td>
                                <td>Number</td>
                                <td>1 到 7</td>
                                <td>7</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Shortcuts</h3>
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
                                <td>text</td>
                                <td>标题文本</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>onClick</td>
                                <td>选中后的回调函数，参数是 vm，可通过触发 'pick' 事件设置选择器的值。例如 vm.$emit('pick', new Date())</td>
                                <td>function</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Events</h3>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Event Name</th>
                                <th>Description</th>
                                <th>Parameters</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>change</td>
                                <td>用户确认选定的值时触发</td>
                                <td>组件绑定值。格式与绑定值一致，可受 <code>value-format</code> 控制</td>
                            </tr>
                            <tr>
                                <td>blur</td>
                                <td>当 input 失去焦点时触发</td>
                                <td>组件实例</td>
                            </tr>
                            <tr>
                                <td>focus</td>
                                <td>当 input 获得焦点时触发</td>
                                <td>组件实例</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>focus</td>
                                <td>使 input 获取焦点</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-20'">
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

                        <h3>Attribute</h3>
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
                                <td>action</td>
                                <td>必选参数，上传的地址</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>headers</td>
                                <td>设置上传的请求头部</td>
                                <td>object</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>multiple</td>
                                <td>是否支持多选文件</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>data</td>
                                <td>上传时附带的额外参数</td>
                                <td>object</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>name</td>
                                <td>上传的文件字段名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>file</td>
                            </tr>
                            <tr>
                                <td>with-credentials</td>
                                <td>支持发送 cookie 凭证信息</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>show-file-list</td>
                                <td>是否显示已上传文件列表</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>drag</td>
                                <td>是否启用拖拽上传</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>accept</td>
                                <td>接受上传的<a
                                        href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#attr-accept">文件类型</a>（thumbnail-mode
                                    模式下此参数无效）
                                </td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>on-preview</td>
                                <td>点击文件列表中已上传的文件时的钩子</td>
                                <td>function(file)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>on-remove</td>
                                <td>文件列表移除文件时的钩子</td>
                                <td>function(file, fileList)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>on-success</td>
                                <td>文件上传成功时的钩子</td>
                                <td>function(response, file, fileList)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>on-error</td>
                                <td>文件上传失败时的钩子</td>
                                <td>function(err, file, fileList)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>on-progress</td>
                                <td>文件上传时的钩子</td>
                                <td>function(event, file, fileList)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>on-change</td>
                                <td>文件状态改变时的钩子，添加文件、上传成功和上传失败时都会被调用</td>
                                <td>function(file, fileList)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>before-upload</td>
                                <td>上传文件之前的钩子，参数为上传的文件，若返回 false 或者返回 Promise 且被 reject，则停止上传。</td>
                                <td>function(file)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>before-remove</td>
                                <td>删除文件之前的钩子，参数为上传的文件和文件列表，若返回 false 或者返回 Promise 且被 reject，则停止上传。</td>
                                <td>function(file, fileList)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>list-type</td>
                                <td>文件列表的类型</td>
                                <td>string</td>
                                <td>text/picture/picture-card</td>
                                <td>text</td>
                            </tr>
                            <tr>
                                <td>auto-upload</td>
                                <td>是否在选取文件后立即进行上传</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>file-list</td>
                                <td>上传的文件列表, 例如: [{name: 'food.jpg', url: 'https://xxx.cdn.com/xxx.jpg'}]</td>
                                <td>array</td>
                                <td>—</td>
                                <td>[]</td>
                            </tr>
                            <tr>
                                <td>http-request</td>
                                <td>覆盖默认的上传行为，可以自定义上传的实现</td>
                                <td>function</td>
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
                            <tr>
                                <td>limit</td>
                                <td>最大允许上传个数</td>
                                <td>number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>on-exceed</td>
                                <td>文件超出个数限制时的钩子</td>
                                <td>function(files, fileList)</td>
                                <td>—</td>
                                <td>-</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>clearFiles</td>
                                <td>清空已上传的文件列表（该方法不支持在 before-upload 中调用）</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>abort</td>
                                <td>取消上传请求</td>
                                <td>（ file: fileList 中的 file 对象 ）</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-21'">
                        <h1>Rate 评分</h1>

                        <a class="remarks">评分组件</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                            </div>
                            <div>
                                <div class="block">
                                    <span class="demonstration">默认不区分颜色</span>
                                    <el-rate v-model="value21_1"></el-rate>
                                </div>
                                <div class="block">
                                    <span class="demonstration">区分颜色</span>
                                    <el-rate
                                            v-model="value21_2"
                                            :colors="['#99A9BF', '#F7BA2A', '#FF9900']">
                                    </el-rate>
                                </div>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>辅助文字</h4>

                            </div>
                            <div>
                                <el-rate
                                        v-model="value21_3"
                                        show-text>
                                </el-rate>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>其它 icon</h4>

                            </div>
                            <div>
                                <el-rate
                                        v-model="value21_4"
                                        :icon-classes="['icon-rate-face-1', 'icon-rate-face-2', 'icon-rate-face-3']"
                                        void-icon-class="icon-rate-face-off"
                                        :colors="['#99A9BF', '#F7BA2A', '#FF9900']">
                                </el-rate>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>只读</h4>
                                <a class="remarks">只读的评分用来展示分数，允许出现半星</a>

                            </div>
                            <div>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                            </div>
                            <div>
                                <el-rate
                                        v-model="value21_5"
                                        disabled
                                        show-score
                                        text-color="#ff9900"
                                        score-template="{value}">
                                </el-rate>
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
                                <td>max</td>
                                <td>最大分值</td>
                                <td>number</td>
                                <td>—</td>
                                <td>5</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>是否为只读</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>allow-half</td>
                                <td>是否允许半选</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>low-threshold</td>
                                <td>低分和中等分数的界限值，值本身被划分在低分中</td>
                                <td>number</td>
                                <td>—</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>high-threshold</td>
                                <td>高分和中等分数的界限值，值本身被划分在高分中</td>
                                <td>number</td>
                                <td>—</td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <td>colors</td>
                                <td>icon 的颜色数组，共有 3 个元素，为 3 个分段所对应的颜色</td>
                                <td>array</td>
                                <td>—</td>
                                <td>['#F7BA2A', '#F7BA2A', '#F7BA2A']</td>
                            </tr>
                            <tr>
                                <td>void-color</td>
                                <td>未选中 icon 的颜色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#C6D1DE</td>
                            </tr>
                            <tr>
                                <td>disabled-void-color</td>
                                <td>只读时未选中 icon 的颜色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#EFF2F7</td>
                            </tr>
                            <tr>
                                <td>icon-classes</td>
                                <td>icon 的类名数组，共有 3 个元素，为 3 个分段所对应的类名</td>
                                <td>array</td>
                                <td>—</td>
                                <td>['el-icon-star-on', 'el-icon-star-on','el-icon-star-on']</td>
                            </tr>
                            <tr>
                                <td>void-icon-class</td>
                                <td>未选中 icon 的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-star-off</td>
                            </tr>
                            <tr>
                                <td>disabled-void-icon-class</td>
                                <td>只读时未选中 icon 的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>el-icon-star-on</td>
                            </tr>
                            <tr>
                                <td>show-text</td>
                                <td>是否显示辅助文字，若为真，则会从 texts 数组中选取当前分数对应的文字内容</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>show-score</td>
                                <td>是否显示当前分数，show-score 和 show-text 不能同时为真</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>text-color</td>
                                <td>辅助文字的颜色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>#1F2D3D</td>
                            </tr>
                            <tr>
                                <td>texts</td>
                                <td>辅助文字数组</td>
                                <td>array</td>
                                <td>—</td>
                                <td>['极差', '失望', '一般', '满意', '惊喜']</td>
                            </tr>
                            <tr>
                                <td>score-template</td>
                                <td>分数显示模板</td>
                                <td>string</td>
                                <td>—</td>
                                <td>{value}</td>
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
                                <td>change</td>
                                <td>分值改变时触发</td>
                                <td>改变后的分值</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-22'">
                        <h1>ColorPicker 颜色选择器</h1>

                        <a class="remarks">用于颜色选择，支持多种格式。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                            </div>
                            <div class="demo">
                                <div class="block">
                                    <span class="demonstration">有默认值</span>
                                    <el-color-picker v-model="color22_1"></el-color-picker>
                                </div>
                                <!--
                                                            --->
                                <div class="block">
                                    <span class="demonstration">无默认值</span>
                                    <el-color-picker v-model="color22_2"></el-color-picker>
                                </div>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>选择透明度</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <el-color-picker v-model="color22_3" show-alpha></el-color-picker>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>预定义颜色</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <div class="description"><p>ColorPicker 支持预定义颜色</p></div>

                                <el-color-picker
                                        v-model="color22_5"
                                        show-alpha
                                        :predefine="predefineColors22_">
                                </el-color-picker>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>不同尺寸</h4>

                            </div>
                            <div>
                                <el-color-picker v-model="color22_4"></el-color-picker>
                                <el-color-picker v-model="color22_4" size="medium"></el-color-picker>
                                <el-color-picker v-model="color22_4" size="small"></el-color-picker>
                                <el-color-picker v-model="color22_4" size="mini"></el-color-picker>

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
                                <td>disabled</td>
                                <td>是否禁用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>尺寸</td>
                                <td>string</td>
                                <td>—</td>
                                <td>medium / small / mini</td>
                            </tr>
                            <tr>
                                <td>show-alpha</td>
                                <td>是否支持透明度选择</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>color-format</td>
                                <td>写入 v-model 的颜色的格式</td>
                                <td>string</td>
                                <td>hsl / hsv / hex / rgb</td>
                                <td>hex（show-alpha 为 false）/ rgb（show-alpha 为 true）</td>
                            </tr>
                            <tr>
                                <td>popper-class</td>
                                <td>ColorPicker 下拉框的类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>predefine</td>
                                <td>预定义颜色</td>
                                <td>array</td>
                                <td>—</td>
                                <td>—</td>
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
                                <td>change</td>
                                <td>当绑定值变化时触发</td>
                                <td>当前值</td>
                            </tr>
                            <tr>
                                <td>active-change</td>
                                <td>面板中当前显示的颜色发生改变时触发</td>
                                <td>当前显示的颜色值</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-23'">
                        <h1>Transfer 穿梭框</h1>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                            </div>
                            <div>
                                <div class="description"><p>Transfer 的数据通过 <code>data</code> 属性传入。数据需要是一个对象数组，每个对象有以下属性：<code>key</code>
                                    为数据的唯一性标识，<code>label</code> 为显示文本，<code>disabled</code>
                                    表示该项数据是否禁止转移。目标列表中的数据项会同步到绑定至 <code>v-model</code> 的变量，值为数据项的 <code>key</code>
                                    所组成的数组。当然，如果希望在初始状态时目标列表不为空，可以像本例一样为 <code>v-model</code> 绑定的变量赋予一个初始值。</p></div>

                                <template>
                                    <el-transfer v-model="value23_1" :data="data23_"></el-transfer>
                                </template>


                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可搜索</h4>

                                <a class="remarks">在数据很多的情况下，可以对数据进行搜索和过滤。</a>
                            </div>
                            <div>
                                <div class="description"><p>设置 <code>filterable</code> 为 <code>true</code>
                                    即可开启搜索模式。默认情况下，若数据项的 <code>label</code> 属性包含搜索关键字，则会在搜索结果中显示。你也可以使用 <code>filter-method</code>
                                    定义自己的搜索逻辑。<code>filter-method</code> 接收一个方法，当搜索关键字变化时，会将当前的关键字和每个数据项传给该方法。若方法返回
                                    <code>true</code>，则会在搜索结果中显示对应的数据项。</p></div>

                                <template>
                                    <el-transfer
                                            filterable
                                            :filter-method="filterMethod"
                                            filter-placeholder="请输入城市拼音"
                                            v-model="value23_2"
                                            :data="data23_">
                                    </el-transfer>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可自定义</h4>

                                <a class="remarks">可以对列表标题文案、按钮文案、数据项的渲染函数、列表底部的勾选状态文案、列表底部的内容区等进行自定义。</a>
                            </div>
                            <div>
                                <div class="description"><p>可以使用 <code>titles</code>、<code>button-texts</code>、<code>render-content</code>
                                    和 <code>format</code> 属性分别对列表标题文案、按钮文案、数据项的渲染函数和列表顶部的勾选状态文案进行自定义。数据项的渲染还可以使用 <code>scoped-slot</code>
                                    进行自定义。对于列表底部的内容区，提供了两个具名 slot：<code>left-footer</code> 和 <code>right-footer</code>。此外，如果希望某些数据项在初始化时就被勾选，可以使用
                                    <code>left-default-checked</code> 和 <code>right-default-checked</code> 属性。最后，本例还展示了
                                    <code>change</code> 事件的用法。注意：由于 jsfiddle 不支持 JSX 语法，所以使用 <code>render-content</code>
                                    自定义数据项的例子在 jsfiddle 中无法运行。但是在实际的项目中，只要正确地配置了相关依赖，就可以正常运行。</p></div>


                                <template>
                                    <p style="text-align: center; margin: 0 0 20px">使用 render-content 自定义数据项</p>

                                    <div style="text-align: center">
                                        <el-transfer
                                                style="text-align: left; display: inline-block"
                                                v-model="value23_3"
                                                filterable
                                                :left-default-checked="[2, 3]"
                                                :right-default-checked="[1]"
                                                :render-content="renderFunc"
                                                :titles="['Source', 'Target']"
                                                :button-texts="['到左边', '到右边']"
                                                :format="{
                                                            noChecked: '${total}',
                                                            hasChecked: '${checked}/${total}'
                                                          }"
                                                @change="handleChange"
                                                :data="data23_">
                                            <el-button class="transfer-footer" slot="left-footer" size="small">操作
                                            </el-button>
                                            <el-button class="transfer-footer" slot="right-footer" size="small">操作
                                            </el-button>
                                        </el-transfer>
                                    </div>
                                    <p style="text-align: center; margin: 50px 0 20px">使用 scoped-slot 自定义数据项</p>

                                    <div style="text-align: center">
                                        <el-transfer
                                                style="text-align: left; display: inline-block"
                                                v-model="value23_4"
                                                filterable
                                                :left-default-checked="[2, 3]"
                                                :right-default-checked="[1]"
                                                :titles="['Source', 'Target']"
                                                :button-texts="['到左边', '到右边']"
                                                :format="{
                                                            noChecked: '${total}',
                                                            hasChecked: '${checked}/${total}'
                                                          }"
                                                @change="handleChange"
                                                :data="data23_">
                                            <span slot-scope="{ option }">{{ option.key }} - {{ option.label }}</span>
                                            <el-button class="transfer-footer" slot="left-footer" size="small">操作
                                            </el-button>
                                            <el-button class="transfer-footer" slot="right-footer" size="small">操作
                                            </el-button>
                                        </el-transfer>
                                    </div>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>数据项属性别名</h4>

                                <a class="remarks">默认情况下，Transfer 仅能识别数据项中的 <code>key</code>、<code>label</code> 和 <code>disabled</code>
                                    字段。如果你的数据的字段名不同，可以使用 <code>props</code> 属性为它们设置别名。</a>
                            </div>
                            <div>
                                <template>
                                    <el-transfer
                                            v-model="value23_5"
                                            :props="{
                                                      key: 'value',
                                                      label: 'desc'
                                                    }"
                                            :data="data23_1">
                                    </el-transfer>
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
                                <td>data</td>
                                <td>Transfer 的数据源</td>
                                <td>array[{ key, label, disabled }]</td>
                                <td>—</td>
                                <td>[ ]</td>
                            </tr>
                            <tr>
                                <td>filterable</td>
                                <td>是否可搜索</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>filter-placeholder</td>
                                <td>搜索框占位符</td>
                                <td>string</td>
                                <td>—</td>
                                <td>请输入搜索内容</td>
                            </tr>
                            <tr>
                                <td>filter-method</td>
                                <td>自定义搜索方法</td>
                                <td>function</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>target-order</td>
                                <td>右侧列表元素的排序策略：若为 <code>original</code>，则保持与数据源相同的顺序；若为 <code>push</code>，则新加入的元素排在最后；若为
                                    <code>unshift</code>，则新加入的元素排在最前
                                </td>
                                <td>string</td>
                                <td>original / push / unshift</td>
                                <td>original</td>
                            </tr>
                            <tr>
                                <td>titles</td>
                                <td>自定义列表标题</td>
                                <td>array</td>
                                <td>—</td>
                                <td>['列表 1', '列表 2']</td>
                            </tr>
                            <tr>
                                <td>button-texts</td>
                                <td>自定义按钮文案</td>
                                <td>array</td>
                                <td>—</td>
                                <td>[ ]</td>
                            </tr>
                            <tr>
                                <td>render-content</td>
                                <td>自定义数据项渲染函数</td>
                                <td>function(h, option)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>format</td>
                                <td>列表顶部勾选状态文案</td>
                                <td>object{noChecked, hasChecked}</td>
                                <td>—</td>
                                <td>{ noChecked: '${checked}/${total}', hasChecked: '${checked}/${total}' }</td>
                            </tr>
                            <tr>
                                <td>props</td>
                                <td>数据源的字段别名</td>
                                <td>object{key, label, disabled}</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>left-default-checked</td>
                                <td>初始状态下左侧列表的已勾选项的 key 数组</td>
                                <td>array</td>
                                <td>—</td>
                                <td>[ ]</td>
                            </tr>
                            <tr>
                                <td>right-default-checked</td>
                                <td>初始状态下右侧列表的已勾选项的 key 数组</td>
                                <td>array</td>
                                <td>—</td>
                                <td>[ ]</td>
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
                                <td>left-footer</td>
                                <td>左侧列表底部的内容</td>
                            </tr>
                            <tr>
                                <td>right-footer</td>
                                <td>右侧列表底部的内容</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Scoped Slot</h3>
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
                                <td>自定义数据项的内容，参数为 { option }</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Methods</h3>
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
                                <td>clearQuery</td>
                                <td>清空某个面板的搜索关键词</td>
                                <td>'left' / 'right'，指定需要清空的面板</td>
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
                                <td>change</td>
                                <td>右侧列表元素变化时触发</td>
                                <td>当前值、数据移动的方向（'left' / 'right'）、发生移动的数据 key 数组</td>
                            </tr>
                            <tr>
                                <td>left-check-change</td>
                                <td>左侧列表元素被用户选中 / 取消选中时触发</td>
                                <td>当前被选中的元素的 key 数组、选中状态发生变化的元素的 key 数组</td>
                            </tr>
                            <tr>
                                <td>right-check-change</td>
                                <td>右侧列表元素被用户选中 / 取消选中时触发</td>
                                <td>当前被选中的元素的 key 数组、选中状态发生变化的元素的 key 数组</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-24'">
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
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-25'">
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

                                <div class="description"><p>默认情况下，Table 组件是不具有竖直方向的边框的，如果需要，可以使用<code>border</code>属性，它接受一个<code>Boolean</code>，设置为<code>true</code>即可启用。
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
                                <div class="description"><p>固定列需要使用<code>fixed</code>属性，它接受 Boolean 值或者<code>left</code><code>right</code>，表示左边固定还是右边固定。
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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-26'">
                        <h1>Tag 标签</h1>

                        <a class="remarks">用于标记和选择。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                            </div>
                            <div>
                                <div class="description"><p>由<code>type</code>属性来选择tag的类型，也可以通过<code>color</code>属性来自定义背景色。
                                </p></div>

                                <el-tag>标签一</el-tag>
                                <el-tag type="success">标签二</el-tag>
                                <el-tag type="info">标签三</el-tag>
                                <el-tag type="warning">标签四</el-tag>
                                <el-tag type="danger">标签五</el-tag>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可移除标签</h4>

                            </div>
                            <div>
                                <div class="description"><p>设置<code>closable</code>属性可以定义一个标签是否可移除。默认的标签移除时会附带渐变动画，如果不想使用，可以设置<code>disable-transitions</code>属性，它接受一个<code>Boolean</code>，true
                                    为关闭。</p></div>
                                <el-tag
                                        v-for="tag in tags"
                                        :key="tag.name"
                                        closable
                                        :type="tag.type">
                                    {{tag.name}}
                                </el-tag>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>动态编辑标签</h4>

                                <a class="remarks">动态编辑标签可以通过点击标签关闭按钮后触发的<code>close</code> 事件来实现</a>
                            </div>
                            <div>

                                <el-tag
                                        :key="tag"
                                        v-for="tag in dynamicTags"
                                        closable
                                        :disable-transitions="false"
                                        @close="handleClose(tag)">
                                    {{tag}}
                                </el-tag>
                                <el-input
                                        class="input-new-tag"
                                        v-if="inputVisible"
                                        v-model="inputValue"
                                        ref="saveTagInput"
                                        size="small"
                                        @keyup.enter.native="handleInputConfirm"
                                        @blur="handleInputConfirm"
                                        >
                                </el-input>
                                <el-button v-else class="button-new-tag" size="small" @click="showInput">+ New Tag
                                </el-button>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>不同尺寸</h4>

                                <a class="remarks">Tag 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。</a>
                            </div>
                            <div>
                                <div class="description"><p>
                                    额外的尺寸：<code>medium</code>、<code>small</code>、<code>mini</code>，通过设置<code>size</code>属性来配置它们。
                                </p></div>

                                <el-tag closable>默认标签</el-tag>
                                <el-tag size="medium" closable>中等标签</el-tag>
                                <el-tag size="small" closable>小型标签</el-tag>
                                <el-tag size="mini" closable>超小标签</el-tag>
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
                                <td>type</td>
                                <td>主题</td>
                                <td>string</td>
                                <td>success/info/warning/danger</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>closable</td>
                                <td>是否可关闭</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>disable-transitions</td>
                                <td>是否禁用渐变动画</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>hit</td>
                                <td>是否有边框描边</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>color</td>
                                <td>背景色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>size</td>
                                <td>尺寸</td>
                                <td>string</td>
                                <td>medium / small / mini</td>
                                <td>—</td>
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
                                <td>close</td>
                                <td>关闭 Tag 时触发的事件</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-27'">
                        <h1>Progress 进度条</h1>

                        <a class="remarks">用于展示操作进度，告知用户当前状态和预期。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>线形进度条 — 百分比外显</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <div class="description"><p>Progress
                                    组件设置<code>percentage</code>属性即可，表示进度条对应的百分比，<strong>必填</strong>，必须在 0-100。</p></div>

                                <el-progress :percentage="0"></el-progress>
                                <el-progress :percentage="70"></el-progress>
                                <el-progress :percentage="80" color="#8e71c7"></el-progress>
                                <el-progress :percentage="100" status="success"></el-progress>
                                <el-progress :percentage="50" status="exception"></el-progress>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>线形进度条 — 百分比内显</h4>

                                <a class="remarks">百分比不占用额外控件，适用于文件上传等场景。</a>
                            </div>
                            <div>
                                <div class="description"><p>Progress 组件可通过 <code>stroke-width</code> 属性更改进度条的高度，并可通过
                                    <code>text-inside</code> 属性来将进度条描述置于进度条内部。</p></div>

                                <el-progress :text-inside="true" :stroke-width="18" :percentage="0"></el-progress>
                                <el-progress :text-inside="true" :stroke-width="18" :percentage="70"></el-progress>
                                <el-progress :text-inside="true" :stroke-width="18" :percentage="80"
                                             color="rgba(142, 113, 199, 0.7)"></el-progress>
                                <el-progress :text-inside="true" :stroke-width="18" :percentage="100"
                                             status="success"></el-progress>
                                <el-progress :text-inside="true" :stroke-width="18" :percentage="50"
                                             status="exception"></el-progress>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>环形进度条</h4>
                            </div>
                            <div>
                                <div class="description"><p>Progress 组件可通过 <code>type</code> 属性来指定使用环形进度条，在环形进度条中，还可以通过
                                    <code>width</code> 属性来设置其大小。</p></div>

                                <el-progress type="circle" :percentage="0"></el-progress>
                                <el-progress type="circle" :percentage="25"></el-progress>
                                <el-progress type="circle" :percentage="80" color="#8e71c7"></el-progress>
                                <el-progress type="circle" :percentage="100" status="success"></el-progress>
                                <el-progress type="circle" :percentage="50" status="exception"></el-progress>
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
                                <td><strong>percentage</strong></td>
                                <td><strong>百分比（必填）</strong></td>
                                <td>number</td>
                                <td>0-100</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>type</td>
                                <td>进度条类型</td>
                                <td>string</td>
                                <td>line/circle</td>
                                <td>line</td>
                            </tr>
                            <tr>
                                <td>stroke-width</td>
                                <td>进度条的宽度，单位 px</td>
                                <td>number</td>
                                <td>—</td>
                                <td>6</td>
                            </tr>
                            <tr>
                                <td>text-inside</td>
                                <td>进度条显示文字内置在进度条内（只在 type=line 时可用）</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>status</td>
                                <td>进度条当前状态</td>
                                <td>string</td>
                                <td>success/exception</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>color</td>
                                <td>进度条背景色（会覆盖 status 状态颜色）</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>width</td>
                                <td>环形进度条画布宽度（只在 type=circle 时可用）</td>
                                <td>number</td>
                                <td></td>
                                <td>126</td>
                            </tr>
                            <tr>
                                <td>show-text</td>
                                <td>是否显示进度条文字内容</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-28'">
                        <h1>Tree 树形控件</h1>

                        <a class="remarks">用清晰的层级结构展示信息，可展开或折叠。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">基础的树形结构展示。</a>
                            </div>
                            <div>
                                <el-tree :data="data" :props="defaultProps" @node-click="handleNodeClick"></el-tree>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可选择</h4>

                                <a class="remarks">适用于需要选择层级时使用。</a>
                            </div>
                            <div>
                                <el-tree
                                        :props="props"
                                        :load="loadNode"
                                        lazy
                                        show-checkbox
                                        @check-change="handleCheckChange">
                                </el-tree>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>懒加载自定义叶子节点</h4>

                            </div>
                            <div>
                                <div class="description"><p>由于在点击节点时才进行该层数据的获取，默认情况下 Tree
                                    无法预知某个节点是否为叶子节点，所以会为每个节点添加一个下拉按钮，如果节点没有下层数据，则点击后下拉按钮会消失。同时，你也可以提前告知 Tree
                                    某个节点是否为叶子节点，从而避免在叶子节点前渲染下拉按钮。</p></div>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>默认展开和默认选中</h4>

                                <a class="remarks">可将 Tree 的某些节点设置为默认展开或默认选中</a>
                            </div>
                            <div>
                                <div class="description"><p>分别通过<code>default-expanded-keys</code>和<code>default-checked-keys</code>设置默认展开和默认选中的节点。需要注意的是，此时必须设置<code>node-key</code>，其值为节点数据中的一个字段名，该字段在整棵树中是唯一的。
                                </p></div>

                                <el-tree
                                        :data="data"
                                        show-checkbox
                                        node-key="id"
                                        :default-expanded-keys="[2, 3]"
                                        :default-checked-keys="[5]"
                                        :props="defaultProps">
                                </el-tree>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>禁用状态</h4>

                                <a class="remarks">可将 Tree 的某些节点设置为禁用状态</a>
                            </div>
                            <div>
                                <div class="description"><p>通过<code>disabled</code>设置禁用状态。</p></div>
                                <el-tree
                                        :data="data"
                                        show-checkbox
                                        node-key="id"
                                        :default-expanded-keys="[2, 3]"
                                        :default-checked-keys="[5]">
                                </el-tree>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>树节点的选择</h4>

                            </div>
                            <div>
                                <div class="description"><p>本例展示如何获取和设置选中节点。获取和设置各有两种方式：通过 node 或通过 key。如果需要通过 key
                                    来获取或设置，则必须设置<code>node-key</code>。</p></div>
                                <el-tree
                                        :data="data"
                                        show-checkbox
                                        default-expand-all
                                        node-key="id"
                                        ref="tree"
                                        highlight-current
                                        :props="defaultProps">
                                </el-tree>

                                <div class="buttons">
                                    <el-button @click="getCheckedNodes">通过 node 获取</el-button>
                                    <el-button @click="getCheckedKeys">通过 key 获取</el-button>
                                    <el-button @click="setCheckedNodes">通过 node 设置</el-button>
                                    <el-button @click="setCheckedKeys">通过 key 设置</el-button>
                                    <el-button @click="resetChecked">清空</el-button>
                                </div>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义节点内容</h4>

                                <a class="remarks">节点的内容支持自定义，可以在节点区添加按钮或图标等内容</a>
                            </div>
                            <div>
                                <div class="description"><p>可以通过两种方法进行树节点内容的自定义：<code>render-content</code>和 scoped
                                    slot。使用<code>render-content</code>指定渲染函数，该函数返回需要的节点区内容即可。渲染函数的用法请参考 Vue 文档。使用 scoped
                                    slot 会传入两个参数<code>node</code>和<code>data</code>，分别表示当前节点的 Node 对象和当前节点的数据。注意：由于
                                    jsfiddle 不支持 JSX 语法，所以<code>render-content</code>示例在 jsfiddle
                                    中无法运行。但是在实际的项目中，只要正确地配置了相关依赖，就可以正常运行。</p></div>

                                <div class="custom-tree-container">
                                    <div class="block">
                                        <p>使用 render-content</p>
                                        <el-tree
                                                :data="data"
                                                show-checkbox
                                                node-key="id"
                                                default-expand-all
                                                :expand-on-click-node="false"
                                                :render-content="renderContent">
                                        </el-tree>
                                    </div>
                                    <div class="block">
                                        <p>使用 scoped slot</p>
                                        <el-tree
                                                :data="data"
                                                show-checkbox
                                                node-key="id"
                                                default-expand-all
                                                :expand-on-click-node="false">
                                            <span class="custom-tree-node" slot-scope="{ node, data }">
                                                <span>{{ node.label }}</span>
                                                <span>
                                                    <el-button
                                                            type="text"
                                                            size="mini"
                                                            @click="append(data)">
                                                        Append
                                                    </el-button>
                                                    <el-button
                                                            type="text"
                                                            size="mini"
                                                            @click="remove(node, data)">
                                                        Delete
                                                    </el-button>
                                                </span>
                                            </span>
                                        </el-tree>
                                    </div>
                                </div>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>节点过滤</h4>

                                <a class="remarks">通过关键字过滤树节点</a>
                            </div>
                            <div>
                                <div class="description"><p>在需要对节点进行过滤时，调用 Tree 实例的<code>filter</code>方法，参数为关键字。需要注意的是，此时需要设置<code>filter-node-method</code>，值为过滤函数。
                                </p></div>

                                <el-input
                                        placeholder="输入关键字进行过滤"
                                        v-model="filterText">
                                </el-input>

                                <el-tree
                                        class="filter-tree"
                                        :data="data"
                                        :props="defaultProps"
                                        default-expand-all
                                        :filter-node-method="filterNode"
                                        ref="tree2">
                                </el-tree>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>手风琴模式</h4>

                                <a class="remarks">对于同一级的节点，每次只能展开一个</a>
                            </div>
                            <div>

                                <el-tree
                                        :data="data"
                                        :props="defaultProps"
                                        accordion
                                        @node-click="handleNodeClick">
                                </el-tree>


                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可拖拽节点</h4>

                                <a class="remarks">通过 draggable 属性可让节点变为可拖拽。</a>
                            </div>
                            <div>

                                <el-tree
                                        :data="data"
                                        node-key="id"
                                        default-expand-all
                                        @node-drag-start="handleDragStart"
                                        @node-drag-enter="handleDragEnter"
                                        @node-drag-leave="handleDragLeave"
                                        @node-drag-over="handleDragOver"
                                        @node-drag-end="handleDragEnd"
                                        @node-drop="handleDrop"
                                        draggable
                                        :allow-drop="allowDrop"
                                        :allow-drag="allowDrag">
                                </el-tree>
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
                                <td>data</td>
                                <td>展示数据</td>
                                <td>array</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>empty-text</td>
                                <td>内容为空的时候展示的文本</td>
                                <td>String</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>node-key</td>
                                <td>每个树节点用来作为唯一标识的属性，整棵树应该是唯一的</td>
                                <td>String</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>props</td>
                                <td>配置选项，具体看下表</td>
                                <td>object</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>render-after-expand</td>
                                <td>是否在第一次展开某个树节点后才渲染其子节点</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>load</td>
                                <td>加载子树数据的方法，仅当 lazy 属性为true 时生效</td>
                                <td>function(node, resolve)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>render-content</td>
                                <td>树节点的内容区的渲染 Function</td>
                                <td>Function(h, { node, data, store }</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>highlight-current</td>
                                <td>是否高亮当前选中节点，默认值是 false。</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>default-expand-all</td>
                                <td>是否默认展开所有节点</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>expand-on-click-node</td>
                                <td>是否在点击节点的时候展开或者收缩节点， 默认值为 true，如果为 false，则只有点箭头图标的时候才会展开或者收缩节点。</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>check-on-click-node</td>
                                <td>是否在点击节点的时候选中节点，默认值为 false，即只有在点击复选框时才会选中节点。</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>auto-expand-parent</td>
                                <td>展开子节点的时候是否自动展开父节点</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>default-expanded-keys</td>
                                <td>默认展开的节点的 key 的数组</td>
                                <td>array</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>show-checkbox</td>
                                <td>节点是否可被选择</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>check-strictly</td>
                                <td>在显示复选框的情况下，是否严格的遵循父子不互相关联的做法，默认为 false</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>default-checked-keys</td>
                                <td>默认勾选的节点的 key 的数组</td>
                                <td>array</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>filter-node-method</td>
                                <td>对树节点进行筛选时执行的方法，返回 true 表示这个节点可以显示，返回 false 则表示这个节点会被隐藏</td>
                                <td>Function(value, data, node)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>accordion</td>
                                <td>是否每次只打开一个同级树节点展开</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>indent</td>
                                <td>相邻级节点间的水平缩进，单位为像素</td>
                                <td>number</td>
                                <td>—</td>
                                <td>16</td>
                            </tr>
                            <tr>
                                <td>lazy</td>
                                <td>是否懒加载子节点，需与 load 方法结合使用</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>draggable</td>
                                <td>是否开启拖拽节点功能</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>allow-drag</td>
                                <td>判断节点能否被拖拽</td>
                                <td>Function(node)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>allow-drop</td>
                                <td>拖拽时判定目标节点能否被放置。<code>type</code> 参数有三种情况：'prev'、'inner' 和
                                    'next'，分别表示放置在目标节点前、插入至目标节点和放置在目标节点后
                                </td>
                                <td>Function(draggingNode, dropNode, type)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>props</h3>
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
                                <td>label</td>
                                <td>指定节点标签为节点对象的某个属性值</td>
                                <td>string, function(data, node)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>children</td>
                                <td>指定子树为节点对象的某个属性值</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>disabled</td>
                                <td>指定节点选择框是否禁用为节点对象的某个属性值</td>
                                <td>boolean, function(data, node)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>isLeaf</td>
                                <td>指定节点是否为叶子节点，仅在指定了 lazy 属性的情况下生效</td>
                                <td>boolean, function(data, node)</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>方法</h3>

                        <p><code>Tree</code> 内部使用了 Node 类型的对象来包装用户传入的数据，用来保存目前节点的状态。
                            <code>Tree</code> 拥有如下方法：</p>
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
                                <td>filter</td>
                                <td>对树节点进行筛选操作</td>
                                <td>接收一个任意类型的参数，该参数会在 filter-node-method 中作为第一个参数</td>
                            </tr>
                            <tr>
                                <td>updateKeyChildren</td>
                                <td>通过 keys 设置节点子元素，使用此方法必须设置 node-key 属性</td>
                                <td>(key, data) 接收两个参数，1. 节点 key 2. 节点数据的数组</td>
                            </tr>
                            <tr>
                                <td>getCheckedNodes</td>
                                <td>若节点可被选择（即 <code>show-checkbox</code> 为 <code>true</code>），则返回目前被选中的节点所组成的数组</td>
                                <td>(leafOnly) 接收一个 boolean 类型的参数，若为 <code>true</code> 则仅返回被选中的叶子节点，默认值为
                                    <code>false</code></td>
                            </tr>
                            <tr>
                                <td>setCheckedNodes</td>
                                <td>设置目前勾选的节点，使用此方法必须设置 node-key 属性</td>
                                <td>(nodes) 接收勾选节点数据的数组</td>
                            </tr>
                            <tr>
                                <td>getCheckedKeys</td>
                                <td>若节点可被选择（即 <code>show-checkbox</code> 为 <code>true</code>），则返回目前被选中的节点的 key 所组成的数组
                                </td>
                                <td>(leafOnly) 接收一个 boolean 类型的参数，若为 <code>true</code> 则仅返回被选中的叶子节点的 keys，默认值为 <code>false</code>
                                </td>
                            </tr>
                            <tr>
                                <td>setCheckedKeys</td>
                                <td>通过 keys 设置目前勾选的节点，使用此方法必须设置 node-key 属性</td>
                                <td>(keys, leafOnly) 接收两个参数，1. 勾选节点的 key 的数组 2. boolean 类型的参数，若为 <code>true</code>
                                    则仅设置叶子节点的选中状态，默认值为 <code>false</code></td>
                            </tr>
                            <tr>
                                <td>setChecked</td>
                                <td>通过 key / data 设置某个节点的勾选状态，使用此方法必须设置 node-key 属性</td>
                                <td>(key/data, checked, deep) 接收三个参数，1. 勾选节点的 key 或者 data 2. boolean 类型，节点是否选中 3.
                                    boolean 类型，是否设置子节点 ，默认为 false
                                </td>
                            </tr>
                            <tr>
                                <td>getHalfCheckedNodes</td>
                                <td>若节点可被选择（即 <code>show-checkbox</code> 为 <code>true</code>），则返回目前半选中的节点所组成的数组</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>getHalfCheckedKeys</td>
                                <td>若节点可被选择（即 <code>show-checkbox</code> 为 <code>true</code>），则返回目前半选中的节点的 key 所组成的数组
                                </td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>getCurrentKey</td>
                                <td>获取当前被选中节点的 key，使用此方法必须设置 node-key 属性，若没有节点被选中则返回 null</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>getCurrentNode</td>
                                <td>获取当前被选中节点的 node，若没有节点被选中则返回 null</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>setCurrentKey</td>
                                <td>通过 key 设置某个节点的当前选中状态，使用此方法必须设置 node-key 属性</td>
                                <td>(key) 待被选节点的 key，若为 null 则取消当前高亮的节点</td>
                            </tr>
                            <tr>
                                <td>setCurrentNode</td>
                                <td>通过 node 设置某个节点的当前选中状态，使用此方法必须设置 node-key 属性</td>
                                <td>(node) 待被选节点的 node</td>
                            </tr>
                            <tr>
                                <td>getNode</td>
                                <td>根据 data 或者 key 拿到 Tree 组件中的 node</td>
                                <td>(data) 要获得 node 的 key 或者 data</td>
                            </tr>
                            <tr>
                                <td>remove</td>
                                <td>删除 Tree 中的一个节点</td>
                                <td>(data) 要删除的节点的 data、key 或者 node</td>
                            </tr>
                            <tr>
                                <td>append</td>
                                <td>为 Tree 中的一个节点追加一个子节点</td>
                                <td>(data, parentNode) 接收两个参数，1. 要追加的子节点的 data 2. 子节点的 parent 的 data、key 或者 node</td>
                            </tr>
                            <tr>
                                <td>insertBefore</td>
                                <td>为 Tree 的一个节点的前面增加一个节点</td>
                                <td>(data, refNode) 接收两个参数，1. 要增加的节点的 data 2. 要增加的节点的后一个节点的 data、key 或者 node</td>
                            </tr>
                            <tr>
                                <td>insertAfter</td>
                                <td>为 Tree 的一个节点的后面增加一个节点</td>
                                <td>(data, refNode) 接收两个参数，1. 要增加的节点的 data 2. 要增加的节点的前一个节点的 data、key 或者 node</td>
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
                                <td>node-click</td>
                                <td>节点被点击时的回调</td>
                                <td>共三个参数，依次为：传递给 <code>data</code> 属性的数组中该节点所对应的对象、节点对应的 Node、节点组件本身。</td>
                            </tr>
                            <tr>
                                <td>node-contextmenu</td>
                                <td>当某一节点被鼠标右键点击时会触发该事件</td>
                                <td>共四个参数，依次为：event、传递给 <code>data</code> 属性的数组中该节点所对应的对象、节点对应的 Node、节点组件本身。</td>
                            </tr>
                            <tr>
                                <td>check-change</td>
                                <td>节点选中状态发生变化时的回调</td>
                                <td>共三个参数，依次为：传递给 <code>data</code> 属性的数组中该节点所对应的对象、节点本身是否被选中、节点的子树中是否有被选中的节点</td>
                            </tr>
                            <tr>
                                <td>check</td>
                                <td>当复选框被点击的时候触发</td>
                                <td>共两个参数，依次为：传递给 <code>data</code> 属性的数组中该节点所对应的对象、树目前的选中状态对象，包含
                                    checkedNodes、checkedKeys、halfCheckedNodes、halfCheckedKeys 四个属性
                                </td>
                            </tr>
                            <tr>
                                <td>current-change</td>
                                <td>当前选中节点变化时触发的事件</td>
                                <td>共两个参数，依次为：当前节点的数据，当前节点的 Node 对象</td>
                            </tr>
                            <tr>
                                <td>node-expand</td>
                                <td>节点被展开时触发的事件</td>
                                <td>共三个参数，依次为：传递给 <code>data</code> 属性的数组中该节点所对应的对象、节点对应的 Node、节点组件本身</td>
                            </tr>
                            <tr>
                                <td>node-collapse</td>
                                <td>节点被关闭时触发的事件</td>
                                <td>共三个参数，依次为：传递给 <code>data</code> 属性的数组中该节点所对应的对象、节点对应的 Node、节点组件本身</td>
                            </tr>
                            <tr>
                                <td>node-drag-start</td>
                                <td>节点开始拖拽时触发的事件</td>
                                <td>共两个参数，依次为：被拖拽节点对应的 Node、event</td>
                            </tr>
                            <tr>
                                <td>node-drag-enter</td>
                                <td>拖拽进入其他节点时触发的事件</td>
                                <td>共三个参数，依次为：被拖拽节点对应的 Node、所进入节点对应的 Node、event</td>
                            </tr>
                            <tr>
                                <td>node-drag-leave</td>
                                <td>拖拽离开某个节点时触发的事件</td>
                                <td>共三个参数，依次为：被拖拽节点对应的 Node、所离开节点对应的 Node、event</td>
                            </tr>
                            <tr>
                                <td>node-drag-over</td>
                                <td>在拖拽节点时触发的事件（类似浏览器的 mouseover 事件）</td>
                                <td>共三个参数，依次为：被拖拽节点对应的 Node、当前进入节点对应的 Node、event</td>
                            </tr>
                            <tr>
                                <td>node-drag-end</td>
                                <td>拖拽结束时（可能未成功）触发的事件</td>
                                <td>共四个参数，依次为：被拖拽节点对应的 Node、结束拖拽时最后进入的节点（可能为空）、被拖拽节点的放置位置（before、after、inner）、event</td>
                            </tr>
                            <tr>
                                <td>node-drop</td>
                                <td>拖拽成功完成时触发的事件</td>
                                <td>共四个参数，依次为：被拖拽节点对应的 Node、结束拖拽时最后进入的节点、被拖拽节点的放置位置（before、after、inner）、event</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Scoped Slot</h3>
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
                                <td>自定义树节点的内容，参数为 { node, data }</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-29'">
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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-30'">
                        <h1>Badge 标记</h1>

                        <a class="remarks">出现在按钮、图标旁的数字或状态标记。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <div class="description"><p data-v-36db4f7e="">定义<code data-v-36db4f7e="">value</code>属性，它接受<code
                                        data-v-36db4f7e="">Number</code>或者<code data-v-36db4f7e="">String</code>。</p>
                                </div>

                                <el-badge :value="12" class="item">
                                    <el-button size="small">评论</el-button>
                                </el-badge>
                                <el-badge :value="3" class="item">
                                    <el-button size="small">回复</el-button>
                                </el-badge>

                                <el-dropdown trigger="click">
                                      <span class="el-dropdown-link">
                                        点我查看<i class="el-icon-caret-bottom el-icon--right"></i>
                                      </span>
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item class="clearfix">
                                            评论
                                            <el-badge class="mark" :value="12"/>
                                        </el-dropdown-item>
                                        <el-dropdown-item class="clearfix">
                                            回复
                                            <el-badge class="mark" :value="3"/>
                                        </el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>最大值</h4>

                                <a class="remarks">可自定义最大值。</a>
                            </div>
                            <div>
                                <div class="description"><p data-v-36db4f7e="">由<code data-v-36db4f7e="">max</code>属性定义，它接受一个<code
                                        data-v-36db4f7e="">Number</code>，需要注意的是，只有当<code data-v-36db4f7e="">value</code>为<code
                                        data-v-36db4f7e="">Number</code>时，它才会生效。</p></div>

                                <el-badge :value="200" :max="99" class="item">
                                    <el-button size="small">评论</el-button>
                                </el-badge>
                                <el-badge :value="100" :max="10" class="item">
                                    <el-button size="small">回复</el-button>
                                </el-badge>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义内容</h4>

                                <a class="remarks">可以显示数字以外的文本内容。</a>
                            </div>
                            <div>
                                <div class="description"><p data-v-36db4f7e="">定义<code
                                        data-v-36db4f7e="">value</code>为<code data-v-36db4f7e="">String</code>类型是时可以用于显示自定义文本。
                                </p></div>

                                <el-badge value="new" class="item">
                                    <el-button size="small">评论</el-button>
                                </el-badge>
                                <el-badge value="hot" class="item">
                                    <el-button size="small">回复</el-button>
                                </el-badge>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>小红点</h4>

                                <a class="remarks">以红点的形式标注需要关注的内容。</a>
                            </div>
                            <div>
                                <div class="description"><p data-v-36db4f7e="">除了数字外，设置<code
                                        data-v-36db4f7e="">is-dot</code>属性，它接受一个<code data-v-36db4f7e="">Boolean</code>。
                                </p></div>

                                <el-badge is-dot class="item">数据查询</el-badge>
                                <el-badge is-dot class="item">
                                    <el-button class="share-button" icon="el-icon-share" type="primary"></el-button>
                                </el-badge>

                            </div>
                        </el-card>

                        <h3>Attributes</h3>

                        <table data-v-36db4f7e="" class="table">
                            <thead data-v-36db4f7e="">
                            <tr data-v-36db4f7e="">
                                <th data-v-36db4f7e="">参数</th>
                                <th data-v-36db4f7e="">说明</th>
                                <th data-v-36db4f7e="">类型</th>
                                <th data-v-36db4f7e="">可选值</th>
                                <th data-v-36db4f7e="">默认值</th>
                            </tr>
                            </thead>
                            <tbody data-v-36db4f7e="">
                            <tr data-v-36db4f7e="">
                                <td data-v-36db4f7e="">value</td>
                                <td data-v-36db4f7e="">显示值</td>
                                <td data-v-36db4f7e="">string, number</td>
                                <td data-v-36db4f7e="">—</td>
                                <td data-v-36db4f7e="">—</td>
                            </tr>
                            <tr data-v-36db4f7e="">
                                <td data-v-36db4f7e="">max</td>
                                <td data-v-36db4f7e="">最大值，超过最大值会显示 '{max}+'，要求 value 是 Number 类型</td>
                                <td data-v-36db4f7e="">number</td>
                                <td data-v-36db4f7e="">—</td>
                                <td data-v-36db4f7e="">—</td>
                            </tr>
                            <tr data-v-36db4f7e="">
                                <td data-v-36db4f7e="">is-dot</td>
                                <td data-v-36db4f7e="">小圆点</td>
                                <td data-v-36db4f7e="">boolean</td>
                                <td data-v-36db4f7e="">—</td>
                                <td data-v-36db4f7e="">false</td>
                            </tr>
                            <tr data-v-36db4f7e="">
                                <td data-v-36db4f7e="">hidden</td>
                                <td data-v-36db4f7e="">隐藏 badge</td>
                                <td data-v-36db4f7e="">boolean</td>
                                <td data-v-36db4f7e="">—</td>
                                <td data-v-36db4f7e="">false</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-31'">
                        <h1>Alert 警告</h1>

                        <a class="remarks">用于页面中展示重要的提示信息。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基本用法</h4>

                                <a class="remarks">页面中的非浮层元素，不会自动消失。</a>
                            </div>
                            <div>
                                <div class="description"><p>Alert 组件提供四种主题，由<code>type</code>属性指定，默认值为<code>info</code>。
                                </p></div>
                                <template>
                                    <el-alert
                                            title="成功提示的文案"
                                            type="success">
                                    </el-alert>
                                    <el-alert
                                            title="消息提示的文案"
                                            type="info">
                                    </el-alert>
                                    <el-alert
                                            title="警告提示的文案"
                                            type="warning">
                                    </el-alert>
                                    <el-alert
                                            title="错误提示的文案"
                                            type="error">
                                    </el-alert>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义关闭按钮</h4>

                                <a class="remarks">自定义关闭按钮为文字或其他符号。</a>
                            </div>
                            <div>
                                <div class="description"><p>在 Alert
                                    组件中，你可以设置是否可关闭，关闭按钮的文本以及关闭时的回调函数。<code>closable</code>属性决定是否可关闭，接受<code>boolean</code>，默认为<code>true</code>。你可以设置<code>close-text</code>属性来代替右侧的关闭图标，注意：<code>close-text</code>必须为文本。设置<code>close</code>事件来设置关闭时的回调。
                                </p></div>

                                <template>
                                    <el-alert
                                            title="不可关闭的 alert"
                                            type="success"
                                            :closable="false">
                                    </el-alert>
                                    <el-alert
                                            title="自定义 close-text"
                                            type="info"
                                            close-text="知道了">
                                    </el-alert>
                                    <el-alert
                                            title="设置了回调的 alert"
                                            type="warning"
                                            @close="hello">
                                    </el-alert>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带有 icon</h4>

                                <a class="remarks">表示某种状态时提升可读性。</a>
                            </div>
                            <div>
                                <div class="description"><p>通过设置<code>show-icon</code>属性来显示 Alert 的
                                    icon，这能更有效地向用户展示你的显示意图。</p></div>

                                <template>
                                    <el-alert
                                            title="成功提示的文案"
                                            type="success"
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="消息提示的文案"
                                            type="info"
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="警告提示的文案"
                                            type="warning"
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="错误提示的文案"
                                            type="error"
                                            show-icon>
                                    </el-alert>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>文字居中</h4>

                                <a class="remarks">使用 <code>center</code> 属性让文字水平居中。</a>
                            </div>
                            <div>
                                <template>
                                    <el-alert
                                            title="成功提示的文案"
                                            type="success"
                                            center
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="消息提示的文案"
                                            type="info"
                                            center
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="警告提示的文案"
                                            type="warning"
                                            center
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="错误提示的文案"
                                            type="error"
                                            center
                                            show-icon>
                                    </el-alert>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带有辅助性文字介绍</h4>

                                <a class="remarks">包含标题和内容，解释更详细的警告。</a>
                            </div>
                            <div>

                                <div class="description"><p>除了必填的<code>title</code>属性外，你可以设置<code>description</code>属性来帮助你更好地介绍，我们称之为辅助性文字。辅助性文字只能存放单行文本，会自动换行显示。
                                </p></div>

                                <template>
                                    <el-alert
                                            title="带辅助性文字介绍"
                                            type="success"
                                            description="这是一句绕口令：黑灰化肥会挥发发灰黑化肥挥发；灰黑化肥会挥发发黑灰化肥发挥。 黑灰化肥会挥发发灰黑化肥黑灰挥发化为灰……">
                                    </el-alert>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带有 icon 和辅助性文字介绍</h4>

                            </div>
                            <div>
                                <div class="description"><p>最后，这是一个同时具有 icon 和辅助性文字的样例。</p></div>

                                <template>
                                    <el-alert
                                            title="成功提示的文案"
                                            type="success"
                                            description="文字说明文字说明文字说明文字说明文字说明文字说明"
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="消息提示的文案"
                                            type="info"
                                            description="文字说明文字说明文字说明文字说明文字说明文字说明"
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="警告提示的文案"
                                            type="warning"
                                            description="文字说明文字说明文字说明文字说明文字说明文字说明"
                                            show-icon>
                                    </el-alert>
                                    <el-alert
                                            title="错误提示的文案"
                                            type="error"
                                            description="文字说明文字说明文字说明文字说明文字说明文字说明"
                                            show-icon>
                                    </el-alert>
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
                                <td><strong>title</strong></td>
                                <td>标题，<strong>必选参数</strong></td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>type</td>
                                <td>主题</td>
                                <td>string</td>
                                <td>success/warning/info/error</td>
                                <td>info</td>
                            </tr>
                            <tr>
                                <td>description</td>
                                <td>辅助性文字。也可通过默认 slot 传入</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>closable</td>
                                <td>是否可关闭</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>center</td>
                                <td>文字是否居中</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>close-text</td>
                                <td>关闭按钮自定义文本</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>show-icon</td>
                                <td>是否显示图标</td>
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
                                <td>close</td>
                                <td>关闭alert时触发的事件</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-32'">
                        <h1>Loading 加载</h1>

                        <a class="remarks">加载数据时显示动效。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>区域加载</h4>

                                <a class="remarks">在表格等容器中加载数据时显示。</a>
                            </div>
                            <div>
                                <div class="description"><p>Element 提供了两种调用 Loading
                                    的方法：指令和服务。对于自定义指令<code>v-loading</code>，只需要绑定<code>Boolean</code>即可。默认状况下，Loading
                                    遮罩会插入到绑定元素的子节点，通过添加<code>body</code>修饰符，可以使遮罩插入至 DOM 中的 body 上。</p></div>

                                <template>
                                    <el-table
                                            v-loading="loading"
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
                                <h4>自定义</h4>

                                <a class="remarks">可自定义加载文案、图标和背景色。</a>
                            </div>
                            <div>
                                <div class="description"><p>
                                    在绑定了<code>v-loading</code>指令的元素上添加<code>element-loading-text</code>属性，其值会被渲染为加载文案，并显示在加载图标的下方。类似地，<code>element-loading-spinner</code>和<code>element-loading-background</code>属性分别用来设定图标类名和背景色值。
                                </p></div>

                                <template>
                                    <el-table
                                            v-loading="loading2"
                                            element-loading-text="拼命加载中"
                                            element-loading-spinner="el-icon-loading"
                                            element-loading-background="rgba(0, 0, 0, 0.8)"
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
                                <h4>整页加载</h4>

                                <a class="remarks">页面数据加载时显示。</a>
                            </div>
                            <div>
                                <div class="description"><p>当使用指令方式时，全屏遮罩需要添加<code>fullscreen</code>修饰符（遮罩会插入至 body
                                    上），此时若需要锁定屏幕的滚动，可以使用<code>lock</code>修饰符；当使用服务方式时，遮罩默认即为全屏，无需额外设置。</p></div>

                                <template>
                                    <el-button
                                            type="primary"
                                            @click="openFullScreen"
                                            v-loading.fullscreen.lock="fullscreenLoading">
                                        指令方式
                                    </el-button>
                                    <el-button
                                            type="primary"
                                            @click="openFullScreen2">
                                        服务方式
                                    </el-button>
                                </template>

                            </div>
                        </el-card>

                        <h1>服务</h1>

                        <p>Loading 还可以以服务的方式调用。引入 Loading 服务：</p>

                        <p>在需要调用时：</p>
                        <code>Loading.service(options);</code>

                        <p>其中 <code>options</code> 参数为 Loading 的配置项，具体见下表。<code>LoadingService</code> 会返回一个 Loading
                            实例，可通过调用该实例的 <code>close</code> 方法来关闭它：</p>

                        <code>
                            let loadingInstance = Loading.service(options);
                            this.$nextTick(() => { // 以服务的方式调用的 Loading 需要异步关闭
                            loadingInstance.close();
                            });
                        </code>

                        <p>需要注意的是，以服务的方式调用的全屏 Loading 是单例的：若在前一个全屏 Loading 关闭前再次调用全屏 Loading，并不会创建一个新的 Loading
                            实例，而是返回现有全屏 Loading 的实例：</p>

                        <code>let loadingInstance1 = Loading.service({ fullscreen: true });
                            let loadingInstance2 = Loading.service({ fullscreen: true });
                            console.log(loadingInstance1 === loadingInstance2); // true</code>

                        <p>此时调用它们中任意一个的 <code>close</code> 方法都能关闭这个全屏 Loading。</p>

                        <p>如果完整引入了 Element，那么 Vue.prototype 上会有一个全局方法 <code>$loading</code>，它的调用方式为：<code>this.$loading(options)</code>，同样会返回一个
                            Loading 实例。</p>


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
                                <td>target</td>
                                <td>Loading 需要覆盖的 DOM 节点。可传入一个 DOM 对象或字符串；若传入字符串，则会将其作为参数传入
                                    <code>document.querySelector</code>以获取到对应 DOM 节点
                                </td>
                                <td>object/string</td>
                                <td>—</td>
                                <td>document.body</td>
                            </tr>
                            <tr>
                                <td>body</td>
                                <td>同 <code>v-loading</code> 指令中的 <code>body</code> 修饰符</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>fullscreen</td>
                                <td>同 <code>v-loading</code> 指令中的 <code>fullscreen</code> 修饰符</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>lock</td>
                                <td>同 <code>v-loading</code> 指令中的 <code>lock</code> 修饰符</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>text</td>
                                <td>显示在加载图标下方的加载文案</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>spinner</td>
                                <td>自定义加载图标类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>background</td>
                                <td>遮罩背景色</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>customClass</td>
                                <td>Loading 的自定义类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>


                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-33'">
                        <h1>Message 消息提示</h1>

                        <a class="remarks">常用于主动操作后的反馈提示。与 Notification 的区别是后者更多用于系统级通知的被动提醒。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">从顶部出现，3 秒后自动消失。</a>
                            </div>
                            <div>
                                <div class="description"><p>Message 在配置上与 Notification 非常类似，所以部分 options 在此不做详尽解释，文末有
                                    options 列表，可以结合 Notification 的文档理解它们。Element 注册了一个<code>$message</code>方法用于调用，Message
                                    可以接收一个字符串或一个 VNode 作为参数，它会被显示为正文内容。</p></div>

                                <template>
                                    <el-button :plain="true" @click="open">打开消息提示</el-button>
                                    <el-button :plain="true" @click="openVn">VNode</el-button>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>不同状态</h4>

                                <a class="remarks">用来显示「成功、警告、消息、错误」类的操作反馈。</a>
                            </div>
                            <div>
                                <div class="description"><p>当需要自定义更多属性时，Message 也可以接收一个对象为参数。比如，设置<code>type</code>字段可以定义不同的状态，默认为<code>info</code>。此时正文内容以<code>message</code>的值传入。同时，我们也为
                                    Message 的各种 type 注册了方法，可以在不传入<code>type</code>字段的情况下像<code>open4</code>那样直接调用。</p>
                                </div>

                                <template>
                                    <el-button :plain="true" @click="open2">成功</el-button>
                                    <el-button :plain="true" @click="open3">警告</el-button>
                                    <el-button :plain="true" @click="open">消息</el-button>
                                    <el-button :plain="true" @click="open4">错误</el-button>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>可关闭</h4>

                                <a class="remarks">可以添加关闭按钮。</a>
                            </div>
                            <div>
                                <div class="description"><p>默认的 Message 是不可以被人工关闭的，如果需要可手动关闭的 Message，可以使用<code>showClose</code>字段。此外，和
                                    Notification 一样，Message 拥有可控的<code>duration</code>，设置<code>0</code>为不会被自动关闭，默认为 3000
                                    毫秒。</p></div>

                                <template>
                                    <el-button :plain="true" @click="open5">消息</el-button>
                                    <el-button :plain="true" @click="open6">成功</el-button>
                                    <el-button :plain="true" @click="open7">警告</el-button>
                                    <el-button :plain="true" @click="open8">错误</el-button>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>文字居中</h4>

                                <a class="remarks">使用<code>center</code> 属性让文字水平居中。</a>
                            </div>
                            <div>
                                <template>
                                    <el-button :plain="true" @click="openCenter">文字居中</el-button>
                                </template>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>使用 HTML 片段</h4>

                                <a class="remarks">message 属性支持传入 HTML 片段</a>
                            </div>
                            <div>
                                <div class="description"><p>将<code>dangerouslyUseHTMLString</code>属性设置为 true，<code>message</code>
                                    就会被当作 HTML 片段处理。</p></div>

                                <template>
                                    <el-button :plain="true" @click="openHTML">使用 HTML 片段</el-button>
                                </template>

                            </div>
                        </el-card>

                        <div class="warning"><p><code>message</code> 属性虽然支持传入 HTML 片段，但是在网站上动态渲染任意 HTML 是非常危险的，因为容易导致 <a
                                href="https://en.wikipedia.org/wiki/Cross-site_scripting">XSS 攻击</a>。因此在 <code>dangerouslyUseHTMLString</code>
                            打开的情况下，请确保 <code>message</code> 的内容是可信的，<strong>永远不要</strong>将用户提交的内容赋值给
                            <code>message</code> 属性。</p></div>


                        <h1>全局方法</h1>

                        <p>Element 为 Vue.prototype 添加了全局方法 $message。因此在 vue instance 中可以采用本页面中的方式调用 <code>Message</code>。
                        </p>

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
                                <td>message</td>
                                <td>消息文字</td>
                                <td>string / VNode</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>type</td>
                                <td>主题</td>
                                <td>string</td>
                                <td>success/warning/info/error</td>
                                <td>info</td>
                            </tr>
                            <tr>
                                <td>iconClass</td>
                                <td>自定义图标的类名，会覆盖 <code>type</code></td>
                                <td>string</td>
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
                                <td>customClass</td>
                                <td>自定义类名</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>duration</td>
                                <td>显示时间, 毫秒。设为 0 则不会自动关闭</td>
                                <td>number</td>
                                <td>—</td>
                                <td>3000</td>
                            </tr>
                            <tr>
                                <td>showClose</td>
                                <td>是否显示关闭按钮</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>center</td>
                                <td>文字是否居中</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>onClose</td>
                                <td>关闭时的回调函数, 参数为被关闭的 message 实例</td>
                                <td>function</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>方法</h3>

                        <p>调用 <code>Message</code> 或 <code>this.$message</code> 会返回当前 Message 的实例。如果需要手动关闭实例，可以调用它的
                            <code>close</code> 方法。</p>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>方法名</th>
                                <th>说明</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>close</td>
                                <td>关闭当前的 Message</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-34'">
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
                                    ESC 或点击框外关闭。此例中接收了两个参数，<code>message</code>和<code>title</code>。值得一提的是，窗口被关闭后，它默认会返回一个<code>Promise</code>对象便于进行后续操作的处理。若不确定浏览器是否支持<code>Promise</code>，可自行引入第三方
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
                                    <code>confirm</code>。Message Box 组件也拥有极高的定制性，我们可以传入<code>options</code>作为第三个参数，它是一个字面量对象。<code>type</code>字段表明消息类型，可以为<code>success</code>，<code>error</code>，<code>info</code>和<code>warning</code>，无效的设置将会被忽略。注意，第二个参数<code>title</code>必须定义为<code>String</code>类型，如果是<code>Object</code>，会被理解为<code>options</code>。在这里我们用了
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
                                href="https://en.wikipedia.org/wiki/Cross-site_scripting">XSS 攻击</a>。因此在 <code>dangerouslyUseHTMLString</code>
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
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-35'">
                        <h1>Notification 通知</h1>

                        <a class="remarks">悬浮出现在页面角落，显示全局的通知提醒消息。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基本用法</h4>

                                <a class="remarks">适用性广泛的通知栏</a>
                            </div>
                            <div>
                                <div class="description"><p>Notification 组件提供通知功能，Element 注册了<code>$notify</code>方法，接收一个<code>options</code>字面量参数，在最简单的情况下，你可以设置<code>title</code>字段和<code>message</code>字段，用于设置通知的标题和正文。默认情况下，经过一段时间后 Notification 组件会自动关闭，但是通过设置<code>duration</code>，可以控制关闭的时间间隔，特别的是，如果设置为<code>0</code>，则不会自动关闭。注意：<code>duration</code>接收一个<code>Number</code>，单位为毫秒，默认为<code>4500</code>。</p></div>
                                <template>
                                    <el-button
                                            plain
                                            @click="open35_">
                                        可自动关闭
                                    </el-button>
                                    <el-button
                                            plain
                                            @click="open35_2">
                                        不会自动关闭
                                    </el-button>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带有倾向性</h4>

                                <a class="remarks">带有 icon，常用来显示「成功、警告、消息、错误」类的系统消息</a>
                            </div>
                            <div>
                                <div class="description"><p>Element 为 Notification 组件准备了四种通知类型：<code>success</code>, <code>warning</code>, <code>info</code>, <code>error</code>。通过<code>type</code>字段来设置，除此以外的值将被忽略。同时，我们也为 Notification 的各种 type 注册了方法，可以在不传入<code>type</code>字段的情况下像<code>open5</code>和<code>open6</code>那样直接调用。</p></div>
                                <template>
                                    <el-button
                                            plain
                                            @click="open35_3">
                                        成功
                                    </el-button>
                                    <el-button
                                            plain
                                            @click="open35_4">
                                        警告
                                    </el-button>
                                    <el-button
                                            plain
                                            @click="open35_5">
                                        消息
                                    </el-button>
                                    <el-button
                                            plain
                                            @click="open35_6">
                                        错误
                                    </el-button>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义弹出位置</h4>

                                <a class="remarks">可以让 Notification 从屏幕四角中的任意一角弹出</a>
                            </div>
                            <div>
                                <div class="description"><p>使用<code>position</code>属性定义 Notification 的弹出位置，支持四个选项：<code>top-right</code>、<code>top-left</code>、<code>bottom-right</code>、<code>bottom-left</code>，默认为<code>top-right</code>。</p></div>
                                <template>
                                    <el-button
                                            plain
                                            @click="open35_7">
                                        右上角
                                    </el-button>
                                    <el-button
                                            plain
                                            @click="open35_8">
                                        右下角
                                    </el-button>
                                    <el-button
                                            plain
                                            @click="open35_9">
                                        左下角
                                    </el-button>
                                    <el-button
                                            plain
                                            @click="open35_10">
                                        左上角
                                    </el-button>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带有偏移</h4>

                                <a class="remarks">让 Notification 偏移一些位置</a>
                            </div>
                            <div>
                                <div class="description"><p>Notification 提供设置偏移量的功能，通过设置 <code>offset</code> 字段，可以使弹出的消息距屏幕边缘偏移一段距离。注意在同一时刻，所有的 Notification 实例应当具有一个相同的偏移量。</p></div>
                                <template>
                                    <el-button
                                            plain
                                            @click="open35_11">
                                        偏移的消息
                                    </el-button>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>使用 HTML 片段</h4>

                                <a class="remarks">message 属性支持传入 HTML 片段</a>
                            </div>
                            <div>
                                <div class="description"><p>将<code>dangerouslyUseHTMLString</code>属性设置为 true，<code>message</code> 就会被当作 HTML 片段处理。</p></div>
                                <template>
                                    <el-button
                                            plain
                                            @click="open35_12">
                                        使用 HTML 片段
                                    </el-button>
                                </template>

                            </div>
                        </el-card>
                        <div class="warning"><p><code>message</code> 属性虽然支持传入 HTML 片段，但是在网站上动态渲染任意 HTML 是非常危险的，因为容易导致 <a href="https://en.wikipedia.org/wiki/Cross-site_scripting">XSS 攻击</a>。因此在 <code>dangerouslyUseHTMLString</code> 打开的情况下，请确保 <code>message</code> 的内容是可信的，<strong>永远不要</strong>将用户提交的内容赋值给 <code>message</code> 属性。</p></div>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>隐藏关闭按钮</h4>

                                <a class="remarks">可以不显示关闭按钮</a>
                            </div>
                            <div>
                                <div class="description"><p>将<code>showClose</code>属性设置为<code>false</code>即可隐藏关闭按钮。</p></div>
                                <template>
                                    <el-button
                                            plain
                                            @click="open35_13">
                                        隐藏关闭按钮
                                    </el-button>
                                </template>
                            </div>
                        </el-card>

                        <h3>Options</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>title</td><td>标题</td><td>string</td><td>—</td><td>—</td></tr><tr><td>message</td><td>说明文字</td><td>string/Vue.VNode</td><td>—</td><td>—</td></tr><tr><td>dangerouslyUseHTMLString</td><td>是否将 message 属性作为 HTML 片段处理</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>type</td><td>主题样式，如果不在可选值内将被忽略</td><td>string</td><td>success/warning/info/error</td><td>—</td></tr><tr><td>iconClass</td><td>自定义图标的类名。若设置了 <code>type</code>，则 <code>iconClass</code> 会被覆盖</td><td>string</td><td>—</td><td>—</td></tr><tr><td>customClass</td><td>自定义类名</td><td>string</td><td>—</td><td>—</td></tr><tr><td>duration</td><td>显示时间, 毫秒。设为 0 则不会自动关闭</td><td>number</td><td>—</td><td>4500</td></tr><tr><td>position</td><td>自定义弹出位置</td><td>string</td><td>top-right/top-left/bottom-right/bottom-left</td><td>top-right</td></tr><tr><td>showClose</td><td>是否显示关闭按钮</td><td>boolean</td><td>—</td><td>true</td></tr><tr><td>onClose</td><td>关闭时的回调函数</td><td>function</td><td>—</td><td>—</td></tr><tr><td>onClick</td><td>点击 Notification 时的回调函数</td><td>function</td><td>—</td><td>—</td></tr><tr><td>offset</td><td>偏移的距离，在同一时刻，所有的 Notification 实例应当具有一个相同的偏移量</td><td>number</td><td>—</td><td>0</td></tr></tbody></table>

                        <h3>方法</h3>
                        <p>调用 <code>Notification</code> 或 <code>this.$notify</code> 会返回当前 Notification 的实例。如果需要手动关闭实例，可以调用它的 <code>close</code> 方法。</p>
                        <table class="table"><thead><tr><th>方法名</th><th>说明</th></tr></thead><tbody><tr><td>close</td><td>关闭当前的 Notification</td></tr></tbody></table>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-36'">
                        <h1>NavMenu 导航菜单</h1>

                        <a class="remarks">为网站提供导航功能的菜单。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>顶栏</h4>

                                <a class="remarks">适用广泛的基础用法。</a>
                            </div>
                            <div>
                                <div class="description"><p>导航菜单默认为垂直模式，通过<code>mode</code>属性可以使导航菜单变更为水平模式。另外，在菜单中通过<code>submenu</code>组件可以生成二级菜单。Menu 还提供了<code>background-color</code>、<code>text-color</code>和<code>active-text-color</code>，分别用于设置菜单的背景色、菜单的文字颜色和当前激活菜单的文字颜色。</p></div>
                                <el-menu :default-active="activeIndex36_" class="el-menu-demo" mode="horizontal" @select="handleSelect">
                                    <el-menu-item index="1">处理中心</el-menu-item>
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
                                    <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item>
                                </el-menu>
                                <div class="line"></div>
                                <el-menu
                                        :default-active="activeIndex36_2"
                                        class="el-menu-demo"
                                        mode="horizontal"
                                        @select="handleSelect"
                                        background-color="#545c64"
                                        text-color="#fff"
                                        active-text-color="#ffd04b">
                                    <el-menu-item index="1">处理中心</el-menu-item>
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
                                    <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">订单管理</a></el-menu-item>
                                </el-menu>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>侧栏</h4>

                                <a class="remarks">垂直菜单，可内嵌子菜单。</a>
                            </div>
                            <div>
                                <div class="description"><p>通过<code>el-menu-item-group</code>组件可以实现菜单进行分组，分组名可以通过<code>title</code>属性直接设定，也可以通过具名 slot 来设定。</p></div>
                                <el-row class="tac">
                                    <el-col :span="12">
                                        <h5>默认颜色</h5>
                                        <el-menu
                                                default-active="2"
                                                class="el-menu-vertical-demo"
                                                @open="handleOpen"
                                                @close="handleClose">
                                            <el-submenu index="1">
                                                <template slot="title">
                                                    <i class="el-icon-location"></i>
                                                    <span>导航一</span>
                                                </template>
                                                <el-menu-item-group>
                                                    <template slot="title">分组一</template>
                                                    <el-menu-item index="1-1">选项1</el-menu-item>
                                                    <el-menu-item index="1-2">选项2</el-menu-item>
                                                </el-menu-item-group>
                                                <el-menu-item-group title="分组2">
                                                    <el-menu-item index="1-3">选项3</el-menu-item>
                                                </el-menu-item-group>
                                                <el-submenu index="1-4">
                                                    <template slot="title">选项4</template>
                                                    <el-menu-item index="1-4-1">选项1</el-menu-item>
                                                </el-submenu>
                                            </el-submenu>
                                            <el-menu-item index="2">
                                                <i class="el-icon-menu"></i>
                                                <span slot="title">导航二</span>
                                            </el-menu-item>
                                            <el-menu-item index="3" disabled>
                                                <i class="el-icon-document"></i>
                                                <span slot="title">导航三</span>
                                            </el-menu-item>
                                            <el-menu-item index="4">
                                                <i class="el-icon-setting"></i>
                                                <span slot="title">导航四</span>
                                            </el-menu-item>
                                        </el-menu>
                                    </el-col>
                                    <el-col :span="12">
                                        <h5>自定义颜色</h5>
                                        <el-menu
                                                default-active="2"
                                                class="el-menu-vertical-demo"
                                                @open="handleOpen"
                                                @close="handleClose"
                                                background-color="#545c64"
                                                text-color="#fff"
                                                active-text-color="#ffd04b">
                                            <el-submenu index="1">
                                                <template slot="title">
                                                    <i class="el-icon-location"></i>
                                                    <span>导航一</span>
                                                </template>
                                                <el-menu-item-group>
                                                    <template slot="title">分组一</template>
                                                    <el-menu-item index="1-1">选项1</el-menu-item>
                                                    <el-menu-item index="1-2">选项2</el-menu-item>
                                                </el-menu-item-group>
                                                <el-menu-item-group title="分组2">
                                                    <el-menu-item index="1-3">选项3</el-menu-item>
                                                </el-menu-item-group>
                                                <el-submenu index="1-4">
                                                    <template slot="title">选项4</template>
                                                    <el-menu-item index="1-4-1">选项1</el-menu-item>
                                                </el-submenu>
                                            </el-submenu>
                                            <el-menu-item index="2">
                                                <i class="el-icon-menu"></i>
                                                <span slot="title">导航二</span>
                                            </el-menu-item>
                                            <el-menu-item index="3" disabled>
                                                <i class="el-icon-document"></i>
                                                <span slot="title">导航三</span>
                                            </el-menu-item>
                                            <el-menu-item index="4">
                                                <i class="el-icon-setting"></i>
                                                <span slot="title">导航四</span>
                                            </el-menu-item>
                                        </el-menu>
                                    </el-col>
                                </el-row>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>折叠</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <el-radio-group v-model="isCollapse" style="margin-bottom: 20px;">
                                    <el-radio-button :label="false">展开</el-radio-button>
                                    <el-radio-button :label="true">收起</el-radio-button>
                                </el-radio-group>
                                <el-menu default-active="1-4-1" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse">
                                    <el-submenu index="1">
                                        <template slot="title">
                                            <i class="el-icon-location"></i>
                                            <span slot="title">导航一</span>
                                        </template>
                                        <el-menu-item-group>
                                            <span slot="title">分组一</span>
                                            <el-menu-item index="1-1">选项1</el-menu-item>
                                            <el-menu-item index="1-2">选项2</el-menu-item>
                                        </el-menu-item-group>
                                        <el-menu-item-group title="分组2">
                                            <el-menu-item index="1-3">选项3</el-menu-item>
                                        </el-menu-item-group>
                                        <el-submenu index="1-4">
                                            <span slot="title">选项4</span>
                                            <el-menu-item index="1-4-1">选项1</el-menu-item>
                                        </el-submenu>
                                    </el-submenu>
                                    <el-menu-item index="2">
                                        <i class="el-icon-menu"></i>
                                        <span slot="title">导航二</span>
                                    </el-menu-item>
                                    <el-menu-item index="3" disabled>
                                        <i class="el-icon-document"></i>
                                        <span slot="title">导航三</span>
                                    </el-menu-item>
                                    <el-menu-item index="4">
                                        <i class="el-icon-setting"></i>
                                        <span slot="title">导航四</span>
                                    </el-menu-item>
                                </el-menu>
                            </div>
                        </el-card>

                        <h3>Menu Attribute</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>mode</td><td>模式</td><td>string</td><td>horizontal / vertical</td><td>vertical</td></tr><tr><td>collapse</td><td>是否水平折叠收起菜单（仅在 mode 为 vertical 时可用）</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>background-color</td><td>菜单的背景色（仅支持 hex 格式）</td><td>string</td><td>—</td><td>#ffffff</td></tr><tr><td>text-color</td><td>菜单的文字颜色（仅支持 hex 格式）</td><td>string</td><td>—</td><td>#303133</td></tr><tr><td>active-text-color</td><td>当前激活菜单的文字颜色（仅支持 hex 格式）</td><td>string</td><td>—</td><td>#409EFF</td></tr><tr><td>default-active</td><td>当前激活菜单的 index</td><td>string</td><td>—</td><td>—</td></tr><tr><td>default-openeds</td><td>当前打开的 sub-menu 的 index 的数组</td><td>Array</td><td>—</td><td>—</td></tr><tr><td>unique-opened</td><td>是否只保持一个子菜单的展开</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>menu-trigger</td><td>子菜单打开的触发方式(只在 mode 为 horizontal 时有效)</td><td>string</td><td>—</td><td>hover</td></tr><tr><td>router</td><td>是否使用 vue-router 的模式，启用该模式会在激活导航时以 index 作为 path 进行路由跳转</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>collapse-transition</td><td>是否开启折叠动画</td><td>boolean</td><td>—</td><td>true</td></tr></tbody></table>

                        <h3>Menu Methods</h3>
                        <table class="table"><thead><tr><th>事件名称</th><th>说明</th><th>参数</th></tr></thead><tbody><tr><td>open</td><td>展开指定的 sub-menu</td><td>index: 需要打开的 sub-menu 的 index</td></tr><tr><td>close</td><td>收起指定的 sub-menu</td><td>index: 需要收起的 sub-menu 的 index</td></tr></tbody></table>

                        <h3>Menu Events</h3>
                        <table class="table"><thead><tr><th>事件名称</th><th>说明</th><th>回调参数</th></tr></thead><tbody><tr><td>select</td><td>菜单激活回调</td><td>index: 选中菜单项的 index, indexPath: 选中菜单项的 index path</td></tr><tr><td>open</td><td>sub-menu 展开的回调</td><td>index: 打开的 sub-menu 的 index， indexPath: 打开的 sub-menu 的 index path</td></tr><tr><td>close</td><td>sub-menu 收起的回调</td><td>index: 收起的 sub-menu 的 index， indexPath: 收起的 sub-menu 的 index path</td></tr></tbody></table>

                        <h3>SubMenu Attribute</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>index</td><td>唯一标志</td><td>string</td><td>—</td><td>—</td></tr><tr><td>popper-class</td><td>弹出菜单的自定义类名</td><td>string</td><td>—</td><td>—</td></tr><tr><td>show-timeout</td><td>展开 sub-menu 的延时</td><td>number</td><td>—</td><td>300</td></tr><tr><td>hide-timeout</td><td>收起 sub-menu 的延时</td><td>number</td><td>—</td><td>300</td></tr><tr><td>disabled</td><td>是否禁用</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>popper-append-to-body</td><td>是否将弹出菜单插入至 body 元素。在菜单的定位出现问题时，可尝试修改该属性</td><td>boolean</td><td>—</td><td>一级子菜单：true / 非一级子菜单：false</td></tr></tbody></table>

                        <h3>Menu-Item Attribute</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>index</td><td>唯一标志</td><td>string</td><td>—</td><td>—</td></tr><tr><td>route</td><td>Vue Router 路径对象</td><td>Object</td><td>—</td><td>—</td></tr><tr><td>disabled</td><td>是否禁用</td><td>boolean</td><td>—</td><td>false</td></tr></tbody></table>

                        <h3>Menu-Group Attribute</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>title</td><td>分组标题</td><td>string</td><td>—</td><td>—</td></tr></tbody></table>

                    </div>
                </transition>

                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-37'">
                        <h1>Tabs 标签页</h1>

                        <a class="remarks">分隔内容上有关联但属于不同类别的数据集合。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">基础的、简洁的标签页。</a>
                            </div>
                            <div>
                                <div class="description"><p>Tabs 组件提供了选项卡功能，默认选中第一个标签页，你也可以通过 <code>value</code> 属性来指定当前选中的标签页。</p></div>
                                <template>
                                    <el-tabs v-model="activeName37_" @tab-click="handleClick">
                                        <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
                                        <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
                                        <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
                                        <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
                                    </el-tabs>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>选项卡样式</h4>

                                <a class="remarks">选项卡样式的标签页。</a>
                            </div>
                            <div>
                                <div class="description"><p>只需要设置 <code>type</code> 属性为 <code>card</code> 就可以使选项卡改变为标签风格。</p></div>
                                <template>
                                    <el-tabs v-model="activeName37_2" type="card" @tab-click="handleClick37_">
                                        <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
                                        <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
                                        <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
                                        <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
                                    </el-tabs>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>卡片化</h4>

                                <a class="remarks">卡片化的标签页。</a>
                            </div>
                            <div>
                                <div class="description"><p>将<code>type</code>设置为<code>border-card</code>。</p></div>

                                <el-tabs type="border-card">
                                    <el-tab-pane label="用户管理">用户管理</el-tab-pane>
                                    <el-tab-pane label="配置管理">配置管理</el-tab-pane>
                                    <el-tab-pane label="角色管理">角色管理</el-tab-pane>
                                    <el-tab-pane label="定时任务补偿">定时任务补偿</el-tab-pane>
                                </el-tabs>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>位置</h4>

                                <a class="remarks">可以通过 tab-position 设置标签的位置</a>
                            </div>
                            <div>
                                <template>
                                    <el-radio-group v-model="tabPosition37_" style="margin-bottom: 30px;">
                                        <el-radio-button label="top">top</el-radio-button>
                                        <el-radio-button label="right">right</el-radio-button>
                                        <el-radio-button label="bottom">bottom</el-radio-button>
                                        <el-radio-button label="left">left</el-radio-button>
                                    </el-radio-group>

                                    <el-tabs :tab-position="tabPosition37_" style="height: 200px;">
                                        <el-tab-pane label="用户管理">用户管理</el-tab-pane>
                                        <el-tab-pane label="配置管理">配置管理</el-tab-pane>
                                        <el-tab-pane label="角色管理">角色管理</el-tab-pane>
                                        <el-tab-pane label="定时任务补偿">定时任务补偿</el-tab-pane>
                                    </el-tabs>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义标签页</h4>

                                <a class="remarks">可以通过具名 slot 来实现自定义标签页的内容</a>
                            </div>
                            <div>
                                <el-tabs type="border-card">
                                    <el-tab-pane>
                                        <span slot="label"><i class="el-icon-date"></i> 我的行程</span>
                                        我的行程
                                    </el-tab-pane>
                                    <el-tab-pane label="消息中心">消息中心</el-tab-pane>
                                    <el-tab-pane label="角色管理">角色管理</el-tab-pane>
                                    <el-tab-pane label="定时任务补偿">定时任务补偿</el-tab-pane>
                                </el-tabs>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>动态增减标签页</h4>

                                <a class="remarks">增减标签页按钮只能在选项卡样式的标签页下使用</a>
                            </div>
                            <div>
                                <el-tabs v-model="editableTabsValue37_" type="card" editable @edit="handleTabsEdit">
                                    <el-tab-pane
                                            :key="item.name"
                                            v-for="(item, index) in editableTabs37_"
                                            :label="item.title"
                                            :name="item.name"
                                            >
                                        {{item.content}}
                                    </el-tab-pane>
                                </el-tabs>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义增加标签页触发器</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <div style="margin-bottom: 20px;">
                                    <el-button
                                            size="small"
                                            @click="addTab(editableTabsValue37_2)"
                                            >
                                        add tab
                                    </el-button>
                                </div>
                                <el-tabs v-model="editableTabsValue37_2" type="card" closable @tab-remove="removeTab">
                                    <el-tab-pane
                                            v-for="(item, index) in editableTabs37_2"
                                            :key="item.name"
                                            :label="item.title"
                                            :name="item.name"
                                            >
                                        {{item.content}}
                                    </el-tab-pane>
                                </el-tabs>

                                <h3>Tabs Attributes</h3>
                                <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>type</td><td>风格类型</td><td>string</td><td>card/border-card</td><td>—</td></tr><tr><td>closable</td><td>标签是否可关闭</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>addable</td><td>标签是否可增加</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>editable</td><td>标签是否同时可增加和关闭</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>value</td><td>绑定值，选中选项卡的 name</td><td>string</td><td>—</td><td>第一个选项卡的 name</td></tr><tr><td>tab-position</td><td>选项卡所在位置</td><td>string</td><td>top/right/bottom/left</td><td>top</td></tr><tr><td>stretch</td><td>标签的宽度是否自撑开</td><td>boolean</td><td>-</td><td>false</td></tr><tr><td>before-leave</td><td>切换标签之前的钩子，若返回 false 或者返回 Promise 且被 reject，则阻止切换。</td><td>Function(activeName, oldActiveName)</td><td>—</td><td>—</td></tr></tbody></table>

                                <h3>Tabs Events</h3>
                                <table class="table"><thead><tr><th>事件名称</th><th>说明</th><th>回调参数</th></tr></thead><tbody><tr><td>tab-click</td><td>tab 被选中时触发</td><td>被选中的标签 tab 实例</td></tr><tr><td>tab-remove</td><td>点击 tab 移除按钮后触发</td><td>被删除的标签的 name</td></tr><tr><td>tab-add</td><td>点击 tabs 的新增按钮后触发</td><td>—</td></tr><tr><td>edit</td><td>点击 tabs 的新增按钮或 tab 被关闭后触发</td><td>(targetName, action)</td></tr></tbody></table>

                                <h3>Tab-pane Attributes</h3>
                                <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>label</td><td>选项卡标题</td><td>string</td><td>—</td><td>—</td></tr><tr><td>disabled</td><td>是否禁用</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>name</td><td>与选项卡 activeName 对应的标识符，表示选项卡别名</td><td>string</td><td>—</td><td>该选项卡在选项卡列表中的顺序值，如第一个选项卡则为'1'</td></tr><tr><td>closable</td><td>标签是否可关闭</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>lazy</td><td>标签是否延迟渲染</td><td>boolean</td><td>—</td><td>false</td></tr></tbody></table>
                            </div>
                        </el-card>
                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-38'">
                        <h1>Breadcrumb 面包屑</h1>

                        <a class="remarks">显示当前页面的路径，快速返回之前的任意页面。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">适用广泛的基础用法。</a>
                            </div>
                            <div>
                                <div class="description"><p>在<code>el-breadcrumb</code>中使用<code>el-breadcrumb-item</code>标签表示从首页开始的每一级。Element 提供了一个<code>separator</code>属性，在<code>el-breadcrumb</code>标签中设置它来决定分隔符，它只能是字符串，默认为斜杠<code>/</code>。</p></div>
                                <el-breadcrumb separator="/">
                                    <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
                                    <el-breadcrumb-item><a href="/">活动管理</a></el-breadcrumb-item>
                                    <el-breadcrumb-item>活动列表</el-breadcrumb-item>
                                    <el-breadcrumb-item>活动详情</el-breadcrumb-item>
                                </el-breadcrumb>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>图标分隔符</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>
                                <div class="description"><p>通过设置 <code>separator-class</code> 可使用相应的 <code>iconfont</code> 作为分隔符，注意这将使 <code>separator</code> 设置失效</p></div>
                                <el-breadcrumb separator-class="el-icon-arrow-right">
                                    <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
                                    <el-breadcrumb-item>活动管理</el-breadcrumb-item>
                                    <el-breadcrumb-item>活动列表</el-breadcrumb-item>
                                    <el-breadcrumb-item>活动详情</el-breadcrumb-item>
                                </el-breadcrumb>

                            </div>
                        </el-card>

                        <h3>Breadcrumb Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>separator</td><td>分隔符</td><td>string</td><td>—</td><td>斜杠'/'</td></tr><tr><td>separator-class</td><td>图标分隔符 class</td><td>string</td><td>—</td><td>-</td></tr></tbody></table>

                        <h3>Breadcrumb Item Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>to</td><td>路由跳转对象，同 <code>vue-router</code> 的 <code>to</code></td><td>string/object</td><td>—</td><td>—</td></tr><tr><td>replace</td><td>在使用 to 进行路由跳转时，启用 replace 将不会向 history 添加新记录</td><td>boolean</td><td>—</td><td>false</td></tr></tbody></table>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-39'">
                        <h1>Dropdown 下拉菜单</h1>

                        <a class="remarks">将动作或菜单折叠到下拉菜单中。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">移动到下拉菜单上，展开更多操作。</a>
                            </div>
                            <div>
                                <div class="description"><p>通过组件<code>slot</code>来设置下拉触发的元素以及需要通过具名<code>slot</code>为<code>dropdown</code> 来设置下拉菜单。默认情况下，下拉按钮只要<code>hover</code>即可，无需点击也会显示下拉菜单。</p></div>
                                <el-dropdown>
                                    <span class="el-dropdown-link">
                                      下拉菜单<i class="el-icon-arrow-down el-icon--right"></i>
                                    </span>
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item disabled>双皮奶</el-dropdown-item>
                                        <el-dropdown-item divided>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>触发对象</h4>

                                <a class="remarks">可使用按钮触发下拉菜单。</a>
                            </div>
                            <div>
                                <div class="description"><p>设置<code>split-button</code>属性来让触发下拉元素呈现为按钮组，左边是功能按钮，右边是触发下拉菜单的按钮，设置为<code>true</code>即可。</p></div>
                                <el-dropdown>
                                    <el-button type="primary">
                                        更多菜单<i class="el-icon-arrow-down el-icon--right"></i>
                                    </el-button>
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item>双皮奶</el-dropdown-item>
                                        <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                                <el-dropdown split-button type="primary" @click="handleClick39_">
                                    更多菜单
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item>双皮奶</el-dropdown-item>
                                        <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>

                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>触发方式</h4>

                                <a class="remarks">可以配置 click 激活或者 hover 激活。</a>
                            </div>
                            <div>
                                <div class="description"><p>在<code>trigger</code>属性设置为<code>click</code>即可。</p></div>
                                <el-row class="block-col-2">
                                    <el-col :span="12">
                                        <span class="demonstration">hover 激活</span>
                                        <el-dropdown>
      <span class="el-dropdown-link">
        下拉菜单<i class="el-icon-arrow-down el-icon--right"></i>
      </span>
                                            <el-dropdown-menu slot="dropdown">
                                                <el-dropdown-item>黄金糕</el-dropdown-item>
                                                <el-dropdown-item>狮子头</el-dropdown-item>
                                                <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                                <el-dropdown-item>双皮奶</el-dropdown-item>
                                                <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                            </el-dropdown-menu>
                                        </el-dropdown>
                                    </el-col>
                                    <el-col :span="12">
                                        <span class="demonstration">click 激活</span>
                                        <el-dropdown trigger="click">
                                          <span class="el-dropdown-link">
                                            下拉菜单<i class="el-icon-arrow-down el-icon--right"></i>
                                          </span>
                                            <el-dropdown-menu slot="dropdown">
                                                <el-dropdown-item>黄金糕</el-dropdown-item>
                                                <el-dropdown-item>狮子头</el-dropdown-item>
                                                <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                                <el-dropdown-item>双皮奶</el-dropdown-item>
                                                <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                            </el-dropdown-menu>
                                        </el-dropdown>
                                    </el-col>
                                </el-row>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>菜单隐藏方式</h4>

                                <a class="remarks">可以hide-on-click属性来配置。</a>
                            </div>
                            <div>
                                <el-dropdown :hide-on-click="false">
                                    <span class="el-dropdown-link">
                                      下拉菜单<i class="el-icon-arrow-down el-icon--right"></i>
                                    </span>
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item disabled>双皮奶</el-dropdown-item>
                                        <el-dropdown-item divided>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>指令事件</h4>

                                <a class="remarks">点击菜单项后会触发事件，用户可以通过相应的菜单项 key 进行不同的操作</a>
                            </div>
                            <div>
                                <el-dropdown @command="handleCommand39_">
                                    <span class="el-dropdown-link">
                                    下拉菜单<i class="el-icon-arrow-down el-icon--right"></i>
                                    </span>
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item command="a">黄金糕</el-dropdown-item>
                                        <el-dropdown-item command="b">狮子头</el-dropdown-item>
                                        <el-dropdown-item command="c">螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item command="d" disabled>双皮奶</el-dropdown-item>
                                        <el-dropdown-item command="e" divided>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>不同尺寸</h4>

                                <a class="remarks">Dropdown 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的尺寸。</a>
                            </div>
                            <div>
                                <el-dropdown split-button type="primary">
                                    默认尺寸
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item>双皮奶</el-dropdown-item>
                                        <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>

                                <el-dropdown size="medium" split-button type="primary">
                                    中等尺寸
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item>双皮奶</el-dropdown-item>
                                        <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>

                                <el-dropdown size="small" split-button type="primary">
                                    小型尺寸
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item>双皮奶</el-dropdown-item>
                                        <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>

                                <el-dropdown size="mini" split-button type="primary">
                                    超小尺寸
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>黄金糕</el-dropdown-item>
                                        <el-dropdown-item>狮子头</el-dropdown-item>
                                        <el-dropdown-item>螺蛳粉</el-dropdown-item>
                                        <el-dropdown-item>双皮奶</el-dropdown-item>
                                        <el-dropdown-item>蚵仔煎</el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                            </div>
                        </el-card>


                        <h3>Dropdown Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>type</td><td>菜单按钮类型，同 Button 组件(只在<code>split-button</code>为 true 的情况下有效)</td><td>string</td><td>—</td><td>—</td></tr><tr><td>size</td><td>菜单尺寸，在<code>split-button</code>为 true 的情况下也对触发按钮生效</td><td>string</td><td>medium / small / mini</td><td>—</td></tr><tr><td>split-button</td><td>下拉触发元素呈现为按钮组</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>placement</td><td>菜单弹出位置</td><td>string</td><td>top/top-start/top-end/bottom/bottom-start/bottom-end</td><td>bottom-end</td></tr><tr><td>trigger</td><td>触发下拉的行为</td><td>string</td><td>hover, click</td><td>hover</td></tr><tr><td>hide-on-click</td><td>是否在点击菜单项后隐藏菜单</td><td>boolean</td><td>—</td><td>true</td></tr><tr><td>show-timeout</td><td>展开下拉菜单的延时（仅在 trigger 为 hover 时有效）</td><td>number</td><td>—</td><td>250</td></tr><tr><td>hide-timeout</td><td>收起下拉菜单的延时（仅在 trigger 为 hover 时有效）</td><td>number</td><td>—</td><td>150</td></tr></tbody></table>

                        <h3>Dropdown Events</h3>
                        <table class="table"><thead><tr><th>事件名称</th><th>说明</th><th>回调参数</th></tr></thead><tbody><tr><td>click</td><td><code>split-button</code> 为 true 时，点击左侧按钮的回调</td><td>—</td></tr><tr><td>command</td><td>点击菜单项触发的事件回调</td><td>dropdown-item 的指令</td></tr><tr><td>visible-change</td><td>下拉框出现/隐藏时触发</td><td>出现则为 true，隐藏则为 false</td></tr></tbody></table>

                        <h3>Dropdown Menu Item Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>command</td><td>指令</td><td>string/number/object</td><td>—</td><td>—</td></tr><tr><td>disabled</td><td>禁用</td><td>boolean</td><td>—</td><td>false</td></tr><tr><td>divided</td><td>显示分割线</td><td>boolean</td><td>—</td><td>false</td></tr></tbody></table>
                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-40'">
                        <h1>Steps 步骤条</h1>

                        <a class="remarks">引导用户按照流程完成任务的分步导航条，可根据实际应用场景设定步骤，步骤不得少于 2 步。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">简单的步骤条。</a>
                            </div>
                            <div>
                                <el-steps :active="active40_" finish-status="success">
                                    <el-step title="步骤 1"></el-step>
                                    <el-step title="步骤 2"></el-step>
                                    <el-step title="步骤 3"></el-step>
                                </el-steps>

                                <el-button style="margin-top: 12px;" @click="next">下一步</el-button>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>含状态步骤条</h4>

                                <a class="remarks">每一步骤显示出该步骤的状态。</a>
                            </div>
                            <div>
                                <div class="description"><p>也可以使用<code>title</code>具名分发，可以用<code>slot</code>的方式来取代属性的设置，在本文档最后的列表中有所有的 slot name 可供参考。</p></div>

                                <el-steps :space="200" :active="1" finish-status="success">
                                    <el-step title="已完成"></el-step>
                                    <el-step title="进行中"></el-step>
                                    <el-step title="步骤 3"></el-step>
                                </el-steps>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>有描述的步骤条</h4>

                                <a class="remarks">每个步骤有其对应的步骤状态描述。</a>
                            </div>
                            <div>
                                <el-steps :active="1">
                                    <el-step title="步骤 1" description="这是一段很长很长很长的描述性文字"></el-step>
                                    <el-step title="步骤 2" description="这是一段很长很长很长的描述性文字"></el-step>
                                    <el-step title="步骤 3" description="这段就没那么长了"></el-step>
                                </el-steps>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>居中的步骤条</h4>

                                <a class="remarks">标题和描述都将居中。</a>
                            </div>
                            <div>
                                <el-steps :active="2" align-center>
                                    <el-step title="步骤1" description="这是一段很长很长很长的描述性文字"></el-step>
                                    <el-step title="步骤2" description="这是一段很长很长很长的描述性文字"></el-step>
                                    <el-step title="步骤3" description="这是一段很长很长很长的描述性文字"></el-step>
                                    <el-step title="步骤4" description="这是一段很长很长很长的描述性文字"></el-step>
                                </el-steps>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>带图标的步骤条</h4>

                                <a class="remarks">步骤条内可以启用各种自定义的图标。</a>
                            </div>
                            <div>
                                <div class="description"><p>通过<code>icon</code>属性来设置图标，图标的类型可以参考 Icon 组件的文档，除此以外，还能通过具名<code>slot</code>来使用自定义的图标。</p></div>
                                <el-steps :active="1">
                                    <el-step title="步骤 1" icon="el-icon-edit"></el-step>
                                    <el-step title="步骤 2" icon="el-icon-upload"></el-step>
                                    <el-step title="步骤 3" icon="el-icon-picture"></el-step>
                                </el-steps>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>竖式步骤条</h4>

                                <a class="remarks">竖直方向的步骤条。</a>
                            </div>
                            <div>
                                <div class="description"><p>只需要在<code>el-steps</code>元素中设置<code>direction</code>属性为<code>vertical</code>即可。</p></div>

                                <div style="height: 300px;">
                                    <el-steps direction="vertical" :active="1">
                                        <el-step title="步骤 1"></el-step>
                                        <el-step title="步骤 2"></el-step>
                                        <el-step title="步骤 3" description="这是一段很长很长很长的描述性文字"></el-step>
                                    </el-steps>
                                </div>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>简洁风格的步骤条</h4>

                                <a class="remarks">设置 simple 可应用简洁风格，该条件下 align-center / description / direction / space 都将失效。</a>
                            </div>
                            <div>
                                <el-steps :active="1" simple>
                                    <el-step title="步骤 1" icon="el-icon-edit"></el-step>
                                    <el-step title="步骤 2" icon="el-icon-upload"></el-step>
                                    <el-step title="步骤 3" icon="el-icon-picture"></el-step>
                                </el-steps>

                                <el-steps :active="1" finish-status="success" simple style="margin-top: 20px">
                                    <el-step title="步骤 1" ></el-step>
                                    <el-step title="步骤 2" ></el-step>
                                    <el-step title="步骤 3" ></el-step>
                                </el-steps>
                            </div>
                        </el-card>

                        <h3>Steps Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>space</td><td>每个 step 的间距，不填写将自适应间距。支持百分比。</td><td>number / string</td><td>—</td><td>—</td></tr><tr><td>direction</td><td>显示方向</td><td>string</td><td>vertical/horizontal</td><td>horizontal</td></tr><tr><td>active</td><td>设置当前激活步骤</td><td>number</td><td>—</td><td>0</td></tr><tr><td>process-status</td><td>设置当前步骤的状态</td><td>string</td><td>wait / process / finish / error / success</td><td>process</td></tr><tr><td>finish-status</td><td>设置结束步骤的状态</td><td>string</td><td>wait / process / finish / error / success</td><td>finish</td></tr><tr><td>align-center</td><td>进行居中对齐</td><td>boolean</td><td>-</td><td>false</td></tr><tr><td>simple</td><td>是否应用简洁风格</td><td>boolean</td><td>-</td><td>false</td></tr></tbody></table>

                        <h3>Step Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>title</td><td>标题</td><td>string</td><td>—</td><td>—</td></tr><tr><td>description</td><td>描述性文字</td><td>string</td><td>—</td><td>—</td></tr><tr><td>icon</td><td>图标</td><td>传入 icon 的 class 全名来自定义 icon，也支持 slot 方式写入</td><td>string</td><td>—</td></tr><tr><td>status</td><td>设置当前步骤的状态，不设置则根据 steps 确定状态</td><td>wait / process / finish / error / success</td><td>-</td><td></td></tr></tbody></table>

                        <h3>Step Slot</h3>
                        <table class="table"><thead><tr><th>name</th><th>说明</th></tr></thead><tbody><tr><td>icon</td><td>图标</td></tr><tr><td>title</td><td>标题</td></tr><tr><td>description</td><td>描述性文字</td></tr></tbody></table>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-41'">
                        <h1>Title</h1>

                        <a class="remarks">remarks</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>Title</h4>

                                <a class="remarks">remarks</a>
                            </div>
                            <div>

                            </div>
                        </el-card>
                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-42'">
                        <h1>Tooltip 文字提示</h1>

                        <a class="remarks">常用于展示鼠标 hover 时的提示信息。</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">在这里我们提供 9 种不同方向的展示方式，可以通过以下完整示例来理解，选择你要的效果。</a>
                            </div>
                            <div>
                                <div class="description"><p>使用<code>content</code>属性来决定<code>hover</code>时的提示信息。由<code>placement</code>属性决定展示效果：<code>placement</code>属性值为：<code>方向-对齐位置</code>；四个方向：<code>top</code>、<code>left</code>、<code>right</code>、<code>bottom</code>；三种对齐位置：<code>start</code>, <code>end</code>，默认为空。如<code>placement="left-end"</code>，则提示信息出现在目标元素的左侧，且提示信息的底部与目标元素的底部对齐。</p></div>

                                <div class="box">
                                    <div class="top">
                                        <el-tooltip class="item" effect="dark" content="Top Left 提示文字" placement="top-start">
                                            <el-button>上左</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Top Center 提示文字" placement="top">
                                            <el-button>上边</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Top Right 提示文字" placement="top-end">
                                            <el-button>上右</el-button>
                                        </el-tooltip>
                                    </div>
                                    <div class="left">
                                        <el-tooltip class="item" effect="dark" content="Left Top 提示文字" placement="left-start">
                                            <el-button>左上</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Left Center 提示文字" placement="left">
                                            <el-button>左边</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Left Bottom 提示文字" placement="left-end">
                                            <el-button>左下</el-button>
                                        </el-tooltip>
                                    </div>

                                    <div class="right">
                                        <el-tooltip class="item" effect="dark" content="Right Top 提示文字" placement="right-start">
                                            <el-button>右上</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Right Center 提示文字" placement="right">
                                            <el-button>右边</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Right Bottom 提示文字" placement="right-end">
                                            <el-button>右下</el-button>
                                        </el-tooltip>
                                    </div>
                                    <div class="bottom">
                                        <el-tooltip class="item" effect="dark" content="Bottom Left 提示文字" placement="bottom-start">
                                            <el-button>下左</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Bottom Center 提示文字" placement="bottom">
                                            <el-button>下边</el-button>
                                        </el-tooltip>
                                        <el-tooltip class="item" effect="dark" content="Bottom Right 提示文字" placement="bottom-end">
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
                                <div class="description"><p>通过设置<code>effect</code>属性来改变主题，默认为<code>dark</code>。</p></div>

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
                                <div class="description"><p>用具名 slot 分发<code>content</code>，替代<code>tooltip</code>中的<code>content</code>属性。</p></div>

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
                                    如果需要关闭 <code>tooltip</code> 功能，<code>disabled</code> 属性可以满足这个需求，它接受一个<code>Boolean</code>，设置为<code>true</code>即可。</p>
                                <p>事实上，这是基于 <a href="https://github.com/element-component/vue-popper">Vue-popper</a> 的扩展，你可以自定义任意 Vue-popper 中允许定义的字段。
                                    当然 Tooltip 组件实际上十分强大，文末的API文档会做一一说明。</p>
                            </div>
                            <div>
                                <template>
                                    <el-tooltip :disabled="disabled" content="点击关闭 tooltip 功能" placement="bottom" effect="light">
                                        <el-button @click="disabled = !disabled">点击{{disabled ? '开启' : '关闭'}} tooltip 功能</el-button>
                                    </el-tooltip>
                                </template>
                            </div>
                        </el-card>

                        <div class="tip"><p>tooltip 内不支持 <code>router-link</code> 组件，请使用 <code>vm.$router.push</code> 代替。</p><p>tooltip 内不支持 disabled form 元素，参考<a href="https://developer.mozilla.org/en-US/docs/Web/Events/mouseenter">MDN</a>，请在 disabled form 元素外层添加一层包裹元素。</p></div>

                        <h3>Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>effect</td><td>默认提供的主题</td><td>String</td><td>dark/light</td><td>dark</td></tr><tr><td>content</td><td>显示的内容，也可以通过 <code>slot#content</code> 传入 DOM</td><td>String</td><td>—</td><td>—</td></tr><tr><td>placement</td><td>Tooltip 的出现位置</td><td>String</td><td>top/top-start/top-end/bottom/bottom-start/bottom-end/left/left-start/left-end/right/right-start/right-end</td><td>bottom</td></tr><tr><td>value(v-model)</td><td>状态是否可见</td><td>Boolean</td><td>—</td><td>false</td></tr><tr><td>disabled</td><td>Tooltip 是否可用</td><td>Boolean</td><td>—</td><td>false</td></tr><tr><td>offset</td><td>出现位置的偏移量</td><td>Number</td><td>—</td><td>0</td></tr><tr><td>transition</td><td>定义渐变动画</td><td>String</td><td>—</td><td>el-fade-in-linear</td></tr><tr><td>visible-arrow</td><td>是否显示 Tooltip 箭头，更多参数可见<a href="https://github.com/element-component/vue-popper">Vue-popper</a></td><td>Boolean</td><td>—</td><td>true</td></tr><tr><td>popper-options</td><td><a href="https://popper.js.org/documentation.html">popper.js</a> 的参数</td><td>Object</td><td>参考 <a href="https://popper.js.org/documentation.html">popper.js</a> 文档</td><td>{ boundariesElement: 'body', gpuAcceleration: false }</td></tr><tr><td>open-delay</td><td>延迟出现，单位毫秒</td><td>Number</td><td>—</td><td>0</td></tr><tr><td>manual</td><td>手动控制模式，设置为 true 后，mouseenter 和 mouseleave 事件将不会生效</td><td>Boolean</td><td>—</td><td>false</td></tr><tr><td>popper-class</td><td>为 Tooltip 的 popper 添加类名</td><td>String</td><td>—</td><td>—</td></tr><tr><td>enterable</td><td>鼠标是否可进入到 tooltip 中</td><td>Boolean</td><td>—</td><td>true</td></tr><tr><td>hide-after</td><td>Tooltip 出现后自动隐藏延时，单位毫秒，为 0 则不会自动隐藏</td><td>number</td><td>—</td><td>0</td></tr></tbody></table>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-43'">
                        <h1>Popover 弹出框</h1>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">Popover 的属性与 Tooltip 很类似，它们都是基于Vue-popper开发的，因此对于重复属性，请参考 Tooltip 的文档，在此文档中不做详尽解释。

                                </a>
                            </div>
                            <div>
                                <div class="description"><p><code>trigger</code>属性用于设置何时触发 Popover，支持四种触发方式：<code>hover</code>，<code>click</code>，<code>focus</code> 和 <code>manual</code>。对于触发 Popover 的元素，有两种写法：使用 <code>slot="reference"</code> 的具名插槽，或使用自定义指令<code>v-popover</code>指向 Popover 的索引<code>ref</code>。</p></div>

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
                                        <el-button type="primary" size="mini" @click="visible43_2 = false">确定</el-button>
                                    </div>
                                    <el-button slot="reference">删除</el-button>
                                </el-popover>

                            </div>
                        </el-card>

                        <h3>Attributes</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th><th>类型</th><th>可选值</th><th>默认值</th></tr></thead><tbody><tr><td>trigger</td><td>触发方式</td><td>String</td><td>click/focus/hover/manual</td><td>click</td></tr><tr><td>title</td><td>标题</td><td>String</td><td>—</td><td>—</td></tr><tr><td>content</td><td>显示的内容，也可以通过 <code>slot</code> 传入 DOM</td><td>String</td><td>—</td><td>—</td></tr><tr><td>width</td><td>宽度</td><td>String, Number</td><td>—</td><td>最小宽度 150px</td></tr><tr><td>placement</td><td>出现位置</td><td>String</td><td>top/top-start/top-end/bottom/bottom-start/bottom-end/left/left-start/left-end/right/right-start/right-end</td><td>bottom</td></tr><tr><td>disabled</td><td>Popover 是否可用</td><td>Boolean</td><td>—</td><td>false</td></tr><tr><td>value(v-model)</td><td>状态是否可见</td><td>Boolean</td><td>—</td><td>false</td></tr><tr><td>offset</td><td>出现位置的偏移量</td><td>Number</td><td>—</td><td>0</td></tr><tr><td>transition</td><td>定义渐变动画</td><td>String</td><td>—</td><td>fade-in-linear</td></tr><tr><td>visible-arrow</td><td>是否显示 Tooltip 箭头，更多参数可见<a href="https://github.com/element-component/vue-popper">Vue-popper</a></td><td>Boolean</td><td>—</td><td>true</td></tr><tr><td>popper-options</td><td><a href="https://popper.js.org/documentation.html">popper.js</a> 的参数</td><td>Object</td><td>参考 <a href="https://popper.js.org/documentation.html">popper.js</a> 文档</td><td><code>{ boundariesElement: 'body', gpuAcceleration: false }</code></td></tr><tr><td>popper-class</td><td>为 popper 添加类名</td><td>String</td><td>—</td><td>—</td></tr><tr><td>open-delay</td><td>触发方式为 hover 时的显示延迟，单位为毫秒</td><td>Number</td><td>—</td><td>—</td></tr></tbody></table>

                        <h3>Slot</h3>
                        <table class="table"><thead><tr><th>参数</th><th>说明</th></tr></thead><tbody><tr><td>—</td><td>Popover 内嵌 HTML 文本</td></tr><tr><td>reference</td><td>触发 Popover 显示的 HTML 元素</td></tr></tbody></table>

                        <h3>Events</h3>
                        <table class="table"><thead><tr><th>事件名称</th><th>说明</th><th>回调参数</th></tr></thead><tbody><tr><td>show</td><td>显示时触发</td><td>—</td></tr><tr><td>after-enter</td><td>显示动画播放完毕后触发</td><td>—</td></tr><tr><td>hide</td><td>隐藏时触发</td><td>—</td></tr><tr><td>after-leave</td><td>隐藏动画播放完毕后触发</td><td>—</td></tr></tbody></table>
                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-44'">
                        <h1>Card 卡片</h1>

                        <a class="remarks">将信息聚合在卡片容器中展示。</a>


                        <h4 class=" m-t-20">基础用法</h4>

                        <a class="remarks">包含标题，内容和操作。</a>

                        <el-card class="box-card m-t-10">
                            <div slot="header" class="clearfix">
                                <span>卡片名称</span>
                                <el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>
                            </div>
                            <div v-for="o in 4" :key="o" class="text item">
                                {{'列表内容 ' + o }}
                            </div>
                        </el-card>


                        <h4 class=" m-t-20">简单卡片</h4>

                        <a class="remarks">卡片可以只有内容区域。</a>

                        <el-card class="box-card m-t-10">
                            <div v-for="o in 4" :key="o" class="text item">
                                {{'列表内容 ' + o }}
                            </div>
                        </el-card>


                        <h4 class=" m-t-20">带图片</h4>

                        <a class="remarks">可配置定义更丰富的内容展示。</a>

                        <el-row class="m-t-10">
                            <el-col :span="8" v-for="(o, index) in 2" :key="o" :offset="index > 0 ? 2 : 0">
                                <el-card :body-style="{ padding: '0px' }">
                                    <img src="~examples/assets/images/hamburger.png" class="image">

                                    <div style="padding: 14px;">
                                        <span>好吃的汉堡</span>

                                        <div class="bottom clearfix">
                                            <time class="time">{{ currentDate44 }}</time>
                                            <el-button type="text" class="button">操作按钮</el-button>
                                        </div>
                                    </div>
                                </el-card>
                            </el-col>
                        </el-row>

                        <h4 class=" m-t-20">卡片阴影</h4>

                        <a class="remarks">可对阴影的显示进行配置。</a>

                        <div class="description m-t-10"><p data-v-68fac5f9="">通过<code data-v-68fac5f9="">shadow</code>属性设置卡片阴影出现的时机：<code
                                data-v-68fac5f9="">always</code>、<code data-v-68fac5f9="">hover</code>或<code
                                data-v-68fac5f9="">never</code>。</p></div>

                        <el-row :gutter="12" class=" m-t-10">
                            <el-col :span="8">
                                <el-card shadow="always">
                                    总是显示
                                </el-card>
                            </el-col>
                            <el-col :span="8">
                                <el-card shadow="hover">
                                    鼠标悬浮时显示
                                </el-card>
                            </el-col>
                            <el-col :span="8">
                                <el-card shadow="never">
                                    从不显示
                                </el-card>
                            </el-col>
                        </el-row>

                        <h3>Attributes</h3>
                        <table data-v-68fac5f9="" class="table">
                            <thead data-v-68fac5f9="">
                            <tr data-v-68fac5f9="">
                                <th data-v-68fac5f9="">参数</th>
                                <th data-v-68fac5f9="">说明</th>
                                <th data-v-68fac5f9="">类型</th>
                                <th data-v-68fac5f9="">可选值</th>
                                <th data-v-68fac5f9="">默认值</th>
                            </tr>
                            </thead>
                            <tbody data-v-68fac5f9="">
                            <tr data-v-68fac5f9="">
                                <td data-v-68fac5f9="">header</td>
                                <td data-v-68fac5f9="">设置 header，也可以通过 <code data-v-68fac5f9="">slot#header</code> 传入
                                    DOM
                                </td>
                                <td data-v-68fac5f9="">string</td>
                                <td data-v-68fac5f9="">—</td>
                                <td data-v-68fac5f9="">—</td>
                            </tr>
                            <tr data-v-68fac5f9="">
                                <td data-v-68fac5f9="">body-style</td>
                                <td data-v-68fac5f9="">设置 body 的样式</td>
                                <td data-v-68fac5f9="">object</td>
                                <td data-v-68fac5f9="">—</td>
                                <td data-v-68fac5f9="">{ padding: '20px' }</td>
                            </tr>
                            <tr data-v-68fac5f9="">
                                <td data-v-68fac5f9="">shadow</td>
                                <td data-v-68fac5f9="">设置阴影显示时机</td>
                                <td data-v-68fac5f9="">string</td>
                                <td data-v-68fac5f9="">always / hover / never</td>
                                <td data-v-68fac5f9="">always</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-45'">
                        <h1>Carousel 走马灯</h1>

                        <a class="remarks">在有限空间内，循环播放同一类型的图片、文字等内容</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">适用广泛的基础用法</a>
                            </div>
                            <div class="demo">
                                <div class="description"><p>结合使用<code>el-carousel</code>和<code>el-carousel-item</code>标签就得到了一个走马灯。幻灯片的内容是任意的，需要放在<code>el-carousel-item</code>标签中。默认情况下，在鼠标
                                    hover 底部的指示器时就会触发切换。通过设置<code>trigger</code>属性为<code>click</code>，可以达到点击触发的效果。</p>
                                </div>

                                <template>
                                    <div class="block">
                                        <span class="demonstration">默认 Hover 指示器触发</span>
                                        <el-carousel height="150px">
                                            <el-carousel-item v-for="item in 4" :key="item">
                                                <h3>{{ item }}</h3>
                                            </el-carousel-item>
                                        </el-carousel>
                                    </div>
                                    <!--
                                                                    --->
                                    <div class="block">
                                        <span class="demonstration">Click 指示器触发</span>
                                        <el-carousel trigger="click" height="150px">
                                            <el-carousel-item v-for="item in 4" :key="item">
                                                <h3>{{ item }}</h3>
                                            </el-carousel-item>
                                        </el-carousel>
                                    </div>
                                </template>
                            </div>
                        </el-card>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>指示器</h4>

                                <a class="remarks">可以将指示器的显示位置设置在容器外部</a>
                            </div>
                            <div class="demo-carousel">
                                <template>
                                    <el-carousel indicator-position="outside">
                                        <el-carousel-item v-for="item in 4" :key="item">
                                            <h3>{{ item }}</h3>
                                        </el-carousel-item>
                                    </el-carousel>
                                </template>

                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>切换箭头</h4>

                                <a class="remarks">可以设置切换箭头的显示时机</a>
                            </div>
                            <div class="demo-carousel">
                                <div class="description"><p><code>arrow</code>属性定义了切换箭头的显示时机。默认情况下，切换箭头只有在鼠标 hover
                                    到走马灯上时才会显示；若将<code>arrow</code>设置为<code>always</code>，则会一直显示；设置为<code>never</code>，则会一直隐藏。
                                </p></div>

                                <template>
                                    <el-carousel :interval="5000" arrow="always">
                                        <el-carousel-item v-for="item in 4" :key="item">
                                            <h3>{{ item }}</h3>
                                        </el-carousel-item>
                                    </el-carousel>
                                </template>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>卡片化</h4>

                                <a class="remarks">当页面宽度方向空间空余，但高度方向空间匮乏时，可使用卡片风格</a>
                            </div>
                            <div>
                                <div class="description"><p>将<code>type</code>属性设置为<code>card</code>即可启用卡片模式。从交互上来说，卡片模式和一般模式的最大区别在于，可以通过直接点击两侧的幻灯片进行切换。
                                </p></div>

                                <template>
                                    <el-carousel :interval="4000" type="card" height="200px">
                                        <el-carousel-item v-for="item in 6" :key="item">
                                            <h3>{{ item }}</h3>
                                        </el-carousel-item>
                                    </el-carousel>
                                </template>
                            </div>
                        </el-card>

                        <h3>Carousel Attributes</h3>
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
                                <td>走马灯的高度</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>initial-index</td>
                                <td>初始状态激活的幻灯片的索引，从 0 开始</td>
                                <td>number</td>
                                <td>—</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>trigger</td>
                                <td>指示器的触发方式</td>
                                <td>string</td>
                                <td>click</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>autoplay</td>
                                <td>是否自动切换</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>true</td>
                            </tr>
                            <tr>
                                <td>interval</td>
                                <td>自动切换的时间间隔，单位为毫秒</td>
                                <td>number</td>
                                <td>—</td>
                                <td>3000</td>
                            </tr>
                            <tr>
                                <td>indicator-position</td>
                                <td>指示器的位置</td>
                                <td>string</td>
                                <td>outside/none</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>arrow</td>
                                <td>切换箭头的显示时机</td>
                                <td>string</td>
                                <td>always/hover/never</td>
                                <td>hover</td>
                            </tr>
                            <tr>
                                <td>type</td>
                                <td>走马灯的类型</td>
                                <td>string</td>
                                <td>card</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Carousel Events</h3>
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
                                <td>change</td>
                                <td>幻灯片切换时触发</td>
                                <td>目前激活的幻灯片的索引，原幻灯片的索引</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Carousel Methods</h3>
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
                                <td>setActiveItem</td>
                                <td>手动切换幻灯片</td>
                                <td>需要切换的幻灯片的索引，从 0 开始；或相应 <code>el-carousel-item</code> 的 <code>name</code> 属性值</td>
                            </tr>
                            <tr>
                                <td>prev</td>
                                <td>切换至上一张幻灯片</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>next</td>
                                <td>切换至下一张幻灯片</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Carousel-Item Attributes</h3>
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
                                <td>name</td>
                                <td>幻灯片的名字，可用作 <code>setActiveItem</code> 的参数</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>label</td>
                                <td>该幻灯片所对应指示器的文本</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </transition>
                <transition name="wb-zoom-in-top">
                    <div class="view" v-show="activeIndex == '3-46'">
                        <h1>Collapse 折叠面板</h1>

                        <a class="remarks">通过折叠面板收纳内容区域</a>

                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>基础用法</h4>

                                <a class="remarks">可同时展开多个面板，面板之间不影响</a>
                            </div>
                            <div>
                                <el-collapse v-model="activeNames46" @change="handleChange">
                                    <el-collapse-item title="一致性 Consistency" name="1">
                                        <div>与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；</div>
                                        <div>在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="反馈 Feedback" name="2">
                                        <div>控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；</div>
                                        <div>页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="效率 Efficiency" name="3">
                                        <div>简化流程：设计简洁直观的操作流程；</div>
                                        <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
                                        <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="可控 Controllability" name="4">
                                        <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
                                        <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
                                    </el-collapse-item>
                                </el-collapse>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>手风琴效果</h4>

                                <a class="remarks">每次只能展开一个面板</a>
                            </div>
                            <div>
                                <el-collapse v-model="activeNames46" accordion>
                                    <el-collapse-item title="一致性 Consistency" name="1">
                                        <div>与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；</div>
                                        <div>在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="反馈 Feedback" name="2">
                                        <div>控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；</div>
                                        <div>页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="效率 Efficiency" name="3">
                                        <div>简化流程：设计简洁直观的操作流程；</div>
                                        <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
                                        <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="可控 Controllability" name="4">
                                        <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
                                        <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
                                    </el-collapse-item>
                                </el-collapse>
                            </div>
                        </el-card>
                        <el-card shadow="hover" class="m-t-20">
                            <div slot="header" class="clearfix">
                                <h4>自定义面板标题</h4>

                                <a class="remarks">除了可以通过 <code>title</code> 属性以外，还可以通过具名 <code>slot</code>
                                    来实现自定义面板的标题内容，以实现增加图标等效果。</a>
                            </div>
                            <div>
                                <el-collapse accordion>
                                    <el-collapse-item>
                                        <template slot="title">
                                            一致性 Consistency<i class="header-icon el-icon-info"></i>
                                        </template>
                                        <div>与现实生活一致：与现实生活的流程、逻辑保持一致，遵循用户习惯的语言和概念；</div>
                                        <div>在界面中一致：所有的元素和结构需保持一致，比如：设计样式、图标和文本、元素的位置等。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="反馈 Feedback">
                                        <div>控制反馈：通过界面样式和交互动效让用户可以清晰的感知自己的操作；</div>
                                        <div>页面反馈：操作后，通过页面元素的变化清晰地展现当前状态。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="效率 Efficiency">
                                        <div>简化流程：设计简洁直观的操作流程；</div>
                                        <div>清晰明确：语言表达清晰且表意明确，让用户快速理解进而作出决策；</div>
                                        <div>帮助用户识别：界面简单直白，让用户快速识别而非回忆，减少用户记忆负担。</div>
                                    </el-collapse-item>
                                    <el-collapse-item title="可控 Controllability">
                                        <div>用户决策：根据场景可给予用户操作建议或安全提示，但不能代替用户进行决策；</div>
                                        <div>结果可控：用户可以自由的进行操作，包括撤销、回退和终止当前操作等。</div>
                                    </el-collapse-item>
                                </el-collapse>
                            </div>
                        </el-card>

                        <h3>Collapse Attributes</h3>
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
                                <td>accordion</td>
                                <td>是否手风琴模式</td>
                                <td>boolean</td>
                                <td>—</td>
                                <td>false</td>
                            </tr>
                            <tr>
                                <td>value</td>
                                <td>当前激活的面板(如果是手风琴模式，绑定值类型需要为<code>string</code>，否则为<code>array</code>)</td>
                                <td>string/array</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Collapse Events</h3>
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
                                <td>change</td>
                                <td>当前激活面板改变时触发(如果是手风琴模式，参数 <code>activeNames</code> 类型为<code>string</code>，否则为<code>array</code>)
                                </td>
                                <td>(activeNames: array|string)</td>
                            </tr>
                            </tbody>
                        </table>

                        <h3>Collapse Item Attributes</h3>
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
                                <td>name</td>
                                <td>唯一标志符</td>
                                <td>string/number</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            <tr>
                                <td>title</td>
                                <td>面板标题</td>
                                <td>string</td>
                                <td>—</td>
                                <td>—</td>
                            </tr>
                            </tbody>
                        </table>
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


            </el-scrollbar>
        </el-main>
    </el-container>
</div>
<style>

    .demo-ul{
        margin-bottom: 20px;
    }

    .demo-ul li{
        font-size: 14px;
        margin-bottom: 10px;
        color: #99a9bf;
        list-style: none;
    }
    .demo-ul li strong{
        color: #5e6d82;
        font-weight: 400;
    }
    .demo-ul li:before{
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

        var cityOptions = ['上海', '北京', '广州', '深圳'];

        var app = new Vue({
            el: '#app',
            data: {//todo
                activeIndex: "3-29",
                show: true,
                show2: true,
                show3: true,
                radio: '1',
                radio1: '选中且禁用',
                radio2: 3,
                radio3: '上海',
                radio4: '上海',
                radio5: '上海',
                radio6: '上海',
                radio7: '1',
                radio8: '1',
                radio9: '1',
                radio10: '1',
                checked: true,
                checked1: false,
                checked2: true,
                checkList: ['选中且禁用', '复选框 A'],
                checkAll: false,
                checkedCities: ['上海', '北京'],
                cities: cityOptions,
                isIndeterminate: true,
                checkedCities1: ['上海', '北京'],
                checkboxGroup1: ['上海'],
                checkboxGroup2: ['上海'],
                checkboxGroup3: ['上海'],
                checkboxGroup4: ['上海'],
                checked3: true,
                checked4: false,
                checked5: false,
                checked6: true,
                checkboxGroup5: [],
                checkboxGroup6: [],
                input: '',
                input1: '',
                input10: '',
                input2: '',
                input21: '',
                input22: '',
                input23: '',
                textarea: '',
                textarea2: '',
                textarea3: '',
                input3: '',
                input4: '',
                input5: '',
                select: '',
                input6: '',
                input7: '',
                input8: '',
                input9: '',
                state1: '',
                state2: '',
                state3: '',
                restaurants: [],
                state4: '',
                timeout: null,
                num1: 1,
                num2: 1,
                num3: 5,
                num9: 1,
                num4: 1,
                num5: 1,
                num6: 1,
                num7: 1,
                num8: 1,
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
                options2: [{
                    value: '选项1',
                    label: '黄金糕'
                }, {
                    value: '选项2',
                    label: '双皮奶',
                    disabled: true
                }, {
                    value: '选项3',
                    label: '蚵仔煎'
                }, {
                    value: '选项4',
                    label: '龙须面'
                }, {
                    value: '选项5',
                    label: '北京烤鸭'
                }],
                value2: '',
                value3: '',
                value4: '',
                value5: [],
                value11: [],
                cities: [{
                    value: 'Beijing',
                    label: '北京'
                }, {
                    value: 'Shanghai',
                    label: '上海'
                }, {
                    value: 'Nanjing',
                    label: '南京'
                }, {
                    value: 'Chengdu',
                    label: '成都'
                }, {
                    value: 'Shenzhen',
                    label: '深圳'
                }, {
                    value: 'Guangzhou',
                    label: '广州'
                }],
                value6: '',
                options3: [{
                    label: '热门城市',
                    options: [{
                        value: 'Shanghai',
                        label: '上海'
                    }, {
                        value: 'Beijing',
                        label: '北京'
                    }]
                }, {
                    label: '城市名',
                    options: [{
                        value: 'Chengdu',
                        label: '成都'
                    }, {
                        value: 'Shenzhen',
                        label: '深圳'
                    }, {
                        value: 'Guangzhou',
                        label: '广州'
                    }, {
                        value: 'Dalian',
                        label: '大连'
                    }]
                }],
                value7: '',
                value8: '',
                value1: true,
                date: '',
                options4: [],
                value9: [],
                list: [],
                loading: false,
                states: ["Alabama", "Alaska", "Arizona",
                    "Arkansas", "California", "Colorado",
                    "Connecticut", "Delaware", "Florida",
                    "Georgia", "Hawaii", "Idaho", "Illinois",
                    "Indiana", "Iowa", "Kansas", "Kentucky",
                    "Louisiana", "Maine", "Maryland",
                    "Massachusetts", "Michigan", "Minnesota",
                    "Mississippi", "Missouri", "Montana",
                    "Nebraska", "Nevada", "New Hampshire",
                    "New Jersey", "New Mexico", "New York",
                    "North Carolina", "North Dakota", "Ohio",
                    "Oklahoma", "Oregon", "Pennsylvania",
                    "Rhode Island", "South Carolina",
                    "South Dakota", "Tennessee", "Texas",
                    "Utah", "Vermont", "Virginia",
                    "Washington", "West Virginia", "Wisconsin",
                    "Wyoming"],
                options5: [{
                    value: 'HTML',
                    label: 'HTML'
                }, {
                    value: 'CSS',
                    label: 'CSS'
                }, {
                    value: 'JavaScript',
                    label: 'JavaScript'
                }],
                value10: [],
                options3: [{
                    value: 'zhinan',
                    label: '指南',
                    children: [{
                        value: 'shejiyuanze',
                        label: '设计原则',
                        children: [{
                            value: 'yizhi',
                            label: '一致'
                        }, {
                            value: 'fankui',
                            label: '反馈'
                        }, {
                            value: 'xiaolv',
                            label: '效率'
                        }, {
                            value: 'kekong',
                            label: '可控'
                        }]
                    }]
                }, {
                    value: 'zujian',
                    label: '组件',
                    children: [{
                        value: 'basic',
                        label: 'Basic',
                        children: [{
                            value: 'layout',
                            label: 'Layout 布局'
                        }, {
                            value: 'color',
                            label: 'Color 色彩'
                        }]
                    }, {
                        value: 'form',
                        label: 'Form',
                        children: [{
                            value: 'radio',
                            label: 'Radio 单选框'
                        }, {
                            value: 'checkbox',
                            label: 'Checkbox 多选框'
                        }, {
                            value: 'input',
                            label: 'Input 输入框'
                        }]
                    }]
                }, {
                    value: 'ziyuan',
                    label: '资源',
                    children: [{
                        value: 'axure',
                        label: 'Axure Components'
                    }, {
                        value: 'sketch',
                        label: 'Sketch Templates'
                    }, {
                        value: 'jiaohu',
                        label: '组件交互文档'
                    }]
                }],
                options4: [{
                    value: 'zhinan',
                    label: '指南',
                    disabled: true,
                    children: [{
                        value: 'shejiyuanze',
                        label: '设计原则',
                        children: [{
                            value: 'yizhi',
                            label: '一致'
                        }, {
                            value: 'fankui',
                            label: '反馈'
                        }, {
                            value: 'xiaolv',
                            label: '效率'
                        }, {
                            value: 'kekong',
                            label: '可控'
                        }]
                    }]
                }, {
                    value: 'zujian',
                    label: '组件',
                    children: [{
                        value: 'basic',
                        label: 'Basic',
                        children: [{
                            value: 'layout',
                            label: 'Layout 布局'
                        }, {
                            value: 'color',
                            label: 'Color 色彩'
                        }]
                    }, {
                        value: 'form',
                        label: 'Form',
                        children: [{
                            value: 'radio',
                            label: 'Radio 单选框'
                        }, {
                            value: 'checkbox',
                            label: 'Checkbox 多选框'
                        }, {
                            value: 'input',
                            label: 'Input 输入框'
                        }]
                    }]
                }, {
                    value: 'ziyuan',
                    label: '资源',
                    children: [{
                        value: 'axure',
                        label: 'Axure Components'
                    }, {
                        value: 'sketch',
                        label: 'Sketch Templates'
                    }, {
                        value: 'jiaohu',
                        label: '组件交互文档'
                    }]
                }],
                selectedOptions: [],
                selectedOptions2: [],
                selectedOptions3: ['zujian', 'basic', 'layout'],
                options5: [{
                    label: '江苏',
                    cities: []
                }, {
                    label: '浙江',
                    cities: []
                }],
                props: {
                    value: 'label',
                    children: 'cities'
                },
                value15_1: true,
                value15_2: true,
                value15_3: true,
                value15_4: true,
                value15_5: '100',
                value15_6: true,
                value15_7: false,

                value16_1: 0,
                value16_2: 50,
                value16_3: 36,
                value16_4: 48,
                value16_5: 42,
                value16_7: 0,
                value16_6: 0,
                value16_8: 0,
                value16_9: [4, 8],
                value16_10: 0,

                value17_1: '',
                value17_2: new Date(2016, 9, 10, 18, 40),
                value17_3: new Date(2016, 9, 10, 18, 40),
                startTime: '',
                endTime: '',
                value17_4: [new Date(2016, 9, 10, 8, 40), new Date(2016, 9, 10, 9, 40)],
                value17_5: [new Date(2016, 9, 10, 8, 40), new Date(2016, 9, 10, 9, 40)],

                pickerOptions18_1: {
                    disabledDate: function (time) {
                        return time.getTime() > Date.now();
                    },
                    shortcuts: [{
                        text: '今天',
                        onClick: function (picker) {
                            picker.$emit('pick', new Date());
                        }
                    }, {
                        text: '昨天',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24);
                            picker.$emit('pick', date);
                        }
                    }, {
                        text: '一周前',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', date);
                        }
                    }]
                },
                value18_1: '',
                value18_2: '',
                value18_3: '',
                value18_4: '',
                value18_5: '',
                value18_6: [],
                pickerOptions18_2: {
                    shortcuts: [{
                        text: '最近一周',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近一个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近三个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                            picker.$emit('pick', [start, end]);
                        }
                    }]
                },
                value18_6_: '',
                value18_7: '',
                value18_10: '',
                value18_11: '',
                value18_12: '',
                value18_13: [],


                pickerOptions19_1: {
                    disabledDate: function (time) {
                        return time.getTime() > Date.now();
                    },
                    shortcuts: [{
                        text: '今天',
                        onClick: function (picker) {
                            picker.$emit('pick', new Date());
                        }
                    }, {
                        text: '昨天',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24);
                            picker.$emit('pick', date);
                        }
                    }, {
                        text: '一周前',
                        onClick: function (picker) {
                            const date = new Date();
                            date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', date);
                        }
                    }]
                },
                value19_1: '',
                value19_2: '',
                value19_3: '',
                pickerOptions19_2: {
                    shortcuts: [{
                        text: '最近一周',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近一个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
                            picker.$emit('pick', [start, end]);
                        }
                    }, {
                        text: '最近三个月',
                        onClick: function (picker) {
                            const end = new Date();
                            const start = new Date();
                            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
                            picker.$emit('pick', [start, end]);
                        }
                    }]
                },
                value19_4: [new Date(2000, 10, 10, 10, 10), new Date(2000, 10, 11, 10, 10)],
                value19_5: '',
                value19_6: '',
                value19_7: '',

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

                value21_1: null,
                value21_2: null,
                value21_3: null,
                value21_4: null,
                value21_5: 3.7,

                color22_1: '#409EFF',
                color22_2: null,
                color22_3: 'rgba(19, 206, 102, 0.8)',
                color22_5: 'rgba(255, 69, 0, 0.68)',
                predefineColors22_: [
                    '#ff4500',
                    '#ff8c00',
                    '#ffd700',
                    '#90ee90',
                    '#00ced1',
                    '#1e90ff',
                    '#c71585',
                    'rgba(255, 69, 0, 0.68)',
                    'rgb(255, 120, 0)',
                    'hsv(51, 100, 98)',
                    'hsva(120, 40, 94, 0.5)',
                    'hsl(181, 100%, 37%)',
                    'hsla(209, 100%, 56%, 0.73)',
                    '#c7158577'
                ],
                color22_4: '#409EFF',

                data23_: [
                    {
                        key: 1,
                        label: '备选项1',
                        disabled: false
                    },
                    {
                        key: 2,
                        label: '备选项2',
                        disabled: false
                    },
                    {
                        key: 3,
                        label: '备选项3',
                        disabled: true
                    },
                    {
                        key: 4,
                        label: '备选项4',
                        disabled: false
                    }
                ],
                data23_1: [
                    {
                        value: 1,
                        desc: '备选项1',
                        disabled: false
                    },
                    {
                        value: 2,
                        desc: '备选项2',
                        disabled: false
                    },
                    {
                        value: 3,
                        desc: '备选项3',
                        disabled: false
                    },
                    {
                        value: 4,
                        desc: '备选项4',
                        disabled: false
                    }
                ],
                value23_1: [1],
                value23_2: [],
                value23_3: [1],
                value23_4: [1],
                value23_5: [],

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

                tags: [
                    {name: '标签一', type: ''},
                    {name: '标签二', type: 'success'},
                    {name: '标签三', type: 'info'},
                    {name: '标签四', type: 'warning'},
                    {name: '标签五', type: 'danger'}
                ],
                dynamicTags: ['标签一', '标签二', '标签三'],
                inputVisible: false,
                inputValue: '',

                data: [{
                    label: '一级 1',
                    children: [{
                        label: '二级 1-1',
                        children: [{
                            label: '三级 1-1-1'
                        }]
                    }]
                }, {
                    label: '一级 2',
                    children: [{
                        label: '二级 2-1',
                        children: [{
                            label: '三级 2-1-1'
                        }]
                    }, {
                        label: '二级 2-2',
                        children: [{
                            label: '三级 2-2-1'
                        }]
                    }]
                }, {
                    label: '一级 3',
                    children: [{
                        label: '二级 3-1',
                        children: [{
                            label: '三级 3-1-1'
                        }]
                    }, {
                        label: '二级 3-2',
                        children: [{
                            label: '三级 3-2-1'
                        }]
                    }]
                }],
                defaultProps: {
                    children: 'children',
                    label: 'label'
                },
                props: {
                    label: 'name',
                    children: 'zones'
                },
                count: 1,
                props1: {
                    label: 'name',
                    children: 'zones',
                    isLeaf: 'leaf'
                },
                filterText: '',

                currentPage1: 5,
                currentPage2: 5,
                currentPage3: 5,
                currentPage4: 4,

                loading1: true,
                loading2: true,
                fullscreenLoading: false,

                activeIndex36_: '1',
                activeIndex36_2: '1',
                isCollapse: true,

                activeName37_: 'second',
                activeName37_2: 'first',
                tabPosition37_: 'top',
                editableTabsValue37_: '2',
                editableTabs37_: [{
                    title: 'Tab 1',
                    name: '1',
                    content: 'Tab 1 content'
                }, {
                    title: 'Tab 2',
                    name: '2',
                    content: 'Tab 2 content'
                }],
                tabIndex37_: 2,
                editableTabsValue37_2: '2',
                editableTabs37_2: [{
                    title: 'Tab 1',
                    name: '1',
                    content: 'Tab 1 content'
                }, {
                    title: 'Tab 2',
                    name: '2',
                    content: 'Tab 2 content'
                }],

                active40_: 0,

                disabled:true,

                visible43_2: false,

                currentDate44: new Date(),

                activeNames46: ['1'],
            },
            methods: {
                open35_13:function() {
                    this.$notify.success({
                        title: 'Info',
                        message: '这是一条没有关闭按钮的消息',
                        showClose: false
                    });
                },
                open35_12:function() {
                    this.$notify({
                        title: 'HTML 片段',
                        dangerouslyUseHTMLString: true,
                        message: '<strong>这是 <i>HTML</i> 片段</strong>'
                    });
                },
                open35_11:function() {
                    this.$notify({
                        title: '偏移',
                        message: '这是一条带有偏移的提示消息',
                        offset: 100
                    });
                },
                open35_7:function() {
                    this.$notify({
                        title: '自定义位置',
                        message: '右上角弹出的消息'
                    });
                },

                open35_8:function() {
                    this.$notify({
                        title: '自定义位置',
                        message: '右下角弹出的消息',
                        position: 'bottom-right'
                    });
                },

                open35_9:function() {
                    this.$notify({
                        title: '自定义位置',
                        message: '左下角弹出的消息',
                        position: 'bottom-left'
                    });
                },

                open35_10:function() {
                    this.$notify({
                        title: '自定义位置',
                        message: '左上角弹出的消息',
                        position: 'top-left'
                    });
                },
                open35_3:function() {
                    this.$notify({
                        title: '成功',
                        message: '这是一条成功的提示消息',
                        type: 'success'
                    });
                },

                open35_4:function() {
                    this.$notify({
                        title: '警告',
                        message: '这是一条警告的提示消息',
                        type: 'warning'
                    });
                },

                open35_5:function() {
                    this.$notify.info({
                        title: '消息',
                        message: '这是一条消息的提示消息'
                    });
                },

                open35_6:function() {
                    this.$notify.error({
                        title: '错误',
                        message: '这是一条错误的提示消息'
                    });
                },
                open35_:function() {
                    const h = this.$createElement;

                    this.$notify({
                        title: '标题名称',
                        message: h('i', { style: 'color: teal'}, '这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案这是提示文案')
                    });
                },

                open35_2:function() {
                    this.$notify({
                        title: '提示',
                        message: '这是一条不会自动关闭的消息',
                        duration: 0
                    });
                },
                addTab:function(targetName) {
                    let newTabName = ++this.tabIndex + '';
                    this.editableTabs37_2.push({
                        title: 'New Tab',
                        name: newTabName,
                        content: 'New Tab content'
                    });
                    this.editableTabsValue37_2 = newTabName;
                },
                removeTab:function(targetName) {
                        let tabs = this.editableTabs37_2;
                        let activeName = this.editableTabsValue37_2;
                        if (activeName === targetName) {
                            tabs.forEach(function(tab, index) {
                                if (tab.name === targetName) {
                                let nextTab = tabs[index + 1] || tabs[index - 1];
                                if (nextTab) {
                                    activeName = nextTab.name;
                                }
                            }
                        });
                    }
                    this.editableTabsValue37_2 = activeName;
                    this.editableTabs37_2 = tabs.filter(function(tab){ tab.name !== targetName});
                },
                handleTabsEdit:function(targetName, action) {
                        if (action === 'add') {
                            let newTabName = ++this.tabIndex + '';
                            this.editableTabs37_.push({
                                title: 'New Tab',
                                name: newTabName,
                                content: 'New Tab content'
                            });
                            this.editableTabsValue = newTabName;
                        }
                        if (action === 'remove') {
                            let tabs = this.editableTabs37_;
                            let activeName = this.editableTabsValue37_;
                            if (activeName === targetName) {
                                tabs.forEach(function(tab, index) {
                                    if (tab.name === targetName) {
                                    let nextTab = tabs[index + 1] || tabs[index - 1];
                                    if (nextTab) {
                                        activeName = nextTab.name;
                                    }
                                }
                            });
                        }

                        this.editableTabsValue = activeName;
                        this.editableTabs = tabs.filter(function(tab){tab.name !== targetName});
                    }
                },
                handleClick37_:function(tab, event) {
                    console.log(tab, event);
                },
                handleCommand39_:function(command) {
                    this.$message('click on item ' + command);
                },
                handleClick39_:function() {
                    alert('button click');
                },
                next:function() {
                    if (this.active++ > 2) this.active = 0;
                },
                open34_7: function () {
                    this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning',
                        center: true
                    }).then(function () {
                        this.$message({
                            type: 'success',
                            message: '删除成功!'
                        });
                    }).catch(function () {
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                        });
                    });
                },
                open34_6: function () {
                    this.$confirm('检测到未保存的内容，是否在离开页面前保存修改？', '确认信息', {
                        distinguishCancelAndClose: true,
                        confirmButtonText: '保存',
                        cancelButtonText: '放弃修改'
                    }).then(function () {
                        this.$message({
                            type: 'info',
                            message: '保存修改'
                        });
                    }).catch(function (action) {
                        this.$message({
                            type: 'info',
                            message: action === 'cancel'
                                    ? '放弃保存并离开页面'
                                    : '停留在当前页面'
                        })
                    });
                },
                open34_5: function () {
                    this.$alert('<strong>这是 <i>HTML</i> 片段</strong>', 'HTML 片段', {
                        dangerouslyUseHTMLString: true
                    });
                },
                open34_4: function () {
                    const h = this.$createElement;
                    this.$msgbox({
                        title: '消息',
                        message: h('p', null, [
                            h('span', null, '内容可以是 '),
                            h('i', {style: 'color: teal'}, 'VNode')
                        ]),
                        showCancelButton: true,
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        beforeClose: function (action, instance, done) {
                            if (action === 'confirm') {
                                instance.confirmButtonLoading = true;
                                instance.confirmButtonText = '执行中...';
                                setTimeout(function () {
                                    done();
                                    setTimeout(function () {
                                        instance.confirmButtonLoading = false;
                                    }, 300);
                                }, 3000);
                            } else {
                                done();
                            }
                        }
                    }).then(function (action) {
                        this.$message({
                            type: 'info',
                            message: 'action: ' + action
                        });
                    });
                },
                open34_3: function () {
                    this.$prompt('请输入邮箱', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        inputPattern: /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/,
                        inputErrorMessage: '邮箱格式不正确'
                    }).then(function (value) {
                        this.$message({
                            type: 'success',
                            message: '你的邮箱是: ' + value
                        });
                    }).catch(function(){
                        this.$message({
                            type: 'info',
                            message: '取消输入'
                        });
                    });
                },
                open34_2: function () {
                    this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
                        confirmButtonText: '确定',
                        cancelButtonText: '取消',
                        type: 'warning'
                    }).then(function () {
                        this.$message({
                            type: 'success',
                            message: '删除成功!'
                        });
                    }).catch(function () {
                        this.$message({
                            type: 'info',
                            message: '已取消删除'
                        });
                    });
                },
                open34_: function () {
                    this.$alert('这是一段内容', '标题名称', {
                        confirmButtonText: '确定',
                        callback: function (action) {
                            this.$message({
                                type: 'info',
                                message: 'action: ' + action
                            });
                        }
                    });
                },
                openHTML: function () {
                    this.$message({
                        dangerouslyUseHTMLString: true,
                        message: '<strong>这是 <i>HTML</i> 片段</strong>'
                    });
                },
                openCenter: function () {
                    this.$message({
                        message: '居中的文字',
                        center: true
                    });
                },
                open5: function () {
                    this.$message({
                        showClose: true,
                        message: '这是一条消息提示'
                    });
                },

                open6: function () {
                    this.$message({
                        showClose: true,
                        message: '恭喜你，这是一条成功消息',
                        type: 'success'
                    });
                },

                open7: function () {
                    this.$message({
                        showClose: true,
                        message: '警告哦，这是一条警告消息',
                        type: 'warning'
                    });
                },

                open8: function () {
                    this.$message({
                        showClose: true,
                        message: '错了哦，这是一条错误消息',
                        type: 'error'
                    });
                },
                open2: function () {
                    this.$message({
                        message: '恭喜你，这是一条成功消息',
                        type: 'success'
                    });
                },

                open3: function () {
                    this.$message({
                        message: '警告哦，这是一条警告消息',
                        type: 'warning'
                    });
                },

                open4: function () {
                    this.$message.error('错了哦，这是一条错误消息');
                },
                open: function () {
                    this.$message('这是一条消息提示');
                },

                openVn: function () {
                    const h = this.$createElement;
                    this.$message({
                        message: h('p', null, [
                            h('span', null, '内容可以是 '),
                            h('i', {style: 'color: teal'}, 'VNode')
                        ])
                    });
                },
                openFullScreen: function () {
                    this.fullscreenLoading = true;
                    setTimeout(function () {
                        this.fullscreenLoading = false;
                    }, 2000);
                },
                openFullScreen2: function () {
                    const loading = this.$loading({
                        lock: true,
                        text: 'Loading',
                        spinner: 'el-icon-loading',
                        background: 'rgba(0, 0, 0, 0.7)'
                    });
                    setTimeout(function () {
                        loading.close();
                    }, 2000);
                },
                hello: function () {
                    alert('Hello World!');
                },
                handleSizeChange: function (val) {
                    console.log('每页 ${val} 条');
                },
                handleCurrentChange: function (val) {
                    toast.i('当前页: '+val);
                },
                handleDragStart: function (node, ev) {
                    console.log('drag start', node);
                },
                handleDragEnter: function (draggingNode, dropNode, ev) {
                    console.log('tree drag enter: ', dropNode.label);
                },
                handleDragLeave: function (draggingNode, dropNode, ev) {
                    console.log('tree drag leave: ', dropNode.label);
                },
                handleDragOver: function (draggingNode, dropNode, ev) {
                    console.log('tree drag over: ', dropNode.label);
                },
                handleDragEnd: function (draggingNode, dropNode, dropType, ev) {
                    console.log('tree drag end: ', dropNode && dropNode.label, dropType);
                },
                handleDrop: function (draggingNode, dropNode, dropType, ev) {
                    console.log('tree drop: ', dropNode.label, dropType);
                },
                allowDrop: function (draggingNode, dropNode, type) {
                    if (dropNode.data.label === '二级 3-1') {
                        return type !== 'inner';
                    } else {
                        return true;
                    }
                },
                allowDrag: function (draggingNode) {
                    return draggingNode.data.label.indexOf('三级 3-2-2') === -1;
                },
                filterNode: function (value, data) {
                    if (!value) return true;
                    return data.label.indexOf(value) !== -1;
                },
                append: function (data) {
                    const newChild = {id: id++, label: 'testtest', children: []};
                    if (!data.children) {
                        this.$set(data, 'children', []);
                    }
                    data.children.push(newChild);
                },

                remove: function (node, data) {
                    const parent = node.parent;
                    const children = parent.data.children || parent.data;
                    const index = children.findIndex(function (d) {
                        d.id === data.id
                    });
                    children.splice(index, 1);
                },

                renderContent: function (h, { node, data, store }) {
                    return (
                    '<span class="custom-tree-node">' +
                    '<span>{node.label}</span>' +
                    '<span>' +
                    '<el-button size="mini" type="text" @click="append(data)">Append</el-button>' +
                    '<el-button size="mini" type="text" @click="remove(node, data)">Delete</el-button>' +
                    '</span>' +
                    '</span>');
                },
                getCheckedNodes: function () {
                    console.log(this.$refs.tree.getCheckedNodes());
                },
                getCheckedKeys: function () {
                    console.log(this.$refs.tree.getCheckedKeys());
                },
                setCheckedNodes: function () {
                    this.$refs.tree.setCheckedNodes([{
                        id: 5,
                        label: '二级 2-1'
                    }, {
                        id: 9,
                        label: '三级 1-1-1'
                    }]);
                },
                setCheckedKeys: function () {
                    this.$refs.tree.setCheckedKeys([3]);
                },
                resetChecked: function () {
                    this.$refs.tree.setCheckedKeys([]);
                },
                loadNode1: function (node, resolve) {
                    if (node.level === 0) {
                        return resolve([{name: 'region'}]);
                    }
                    if (node.level > 1) return resolve([]);

                    setTimeout(function () {
                        const data = [{
                            name: 'leaf',
                            leaf: true
                        }, {
                            name: 'zone'
                        }];

                        resolve(data);
                    }, 500);
                },
                loadNode: function (node, resolve) {
                    if (node.level === 0) {
                        return resolve([{name: 'region1'}, {name: 'region2'}]);
                    }
                    if (node.level > 3) return resolve([]);

                    var hasChild;
                    if (node.data.name === 'region1') {
                        hasChild = true;
                    } else if (node.data.name === 'region2') {
                        hasChild = false;
                    } else {
                        hasChild = Math.random() > 0.5;
                    }

                    setTimeout(function () {
                        var data;
                        if (hasChild) {
                            data = [{
                                name: 'zone' + this.count++
                            }, {
                                name: 'zone' + this.count++
                            }];
                        } else {
                            data = [];
                        }
                        resolve(data);
                    }, 500);
                },
                handleCheckChange: function (data, checked, indeterminate) {
                    console.log(data, checked, indeterminate);
                },
                handleNodeClick: function (data) {
                    console.log(data);
                },
                handleClose: function (tag) {
                    this.dynamicTags.splice(this.dynamicTags.indexOf(tag), 1);
                },

                showInput: function () {
                    this.inputVisible = true;
                    this.$nextTick(function () {
                        this.$refs.saveTagInput.$refs.input.focus();
                    });
                },
                handleInputConfirm: function () {
                    let inputValue = this.inputValue;
                    if (inputValue) {
                        this.dynamicTags.push(inputValue);
                    }
                    this.inputVisible = false;
                    this.inputValue = '';
                },
                toggleSelection: function (rows) {
                    if (rows) {
                        rows.forEach(function (row) {
                            this.$refs.multipleTable.toggleRowSelection(row);
                        });
                    } else {
                        this.$refs.multipleTable.clearSelection();
                    }
                },
                handleSelectionChange: function (val) {
                    this.multipleSelection = val;
                },
                indexMethod: function (index) {
                    return index * 2;
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

                handleEdit: function (index, row) {
                    console.log(index, row);
                },
                handleDelete: function (index, row) {
                    console.log(index, row);
                },
                filterTag: function (value, row) {
                    return row.tag === value;
                },
                filterHandler: function (value, row, column) {
                    const property = column['property'];
                    return row[property] === value;
                },
                formatter: function (row, column) {
                    return row.address;
                },
                setCurrent: function (row) {
                    this.$refs.singleTable.setCurrentRow(row);
                },
                handleCurrentChange: function (val) {
                    this.currentRow = val;
                },
                deleteRow: function (index, rows) {
                    rows.splice(index, 1);
                },
                handleClick: function (row) {
                    toast.i(row);
                },
                tableRowClassName: function ({row, rowIndex}) {
                    if (rowIndex === 1) {
                        return 'warning-row';
                    } else if (rowIndex === 3) {
                        return 'success-row';
                    }
                    return '';
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
                handleChange: function (value, direction, movedKeys) {
                    console.log(value, direction, movedKeys);
                },
                renderFunc: function (h, option) {
                    console.log(option)
                    return '<span>{{ option.key }} - {{ option.label }}</span>';
                },
                filterMethod: function (query, item) {
                    return item.label.indexOf(query) > -1;
                },
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
                },
                formatTooltip: function (val) {
                    return val / 100;
                },
                message: function () {
                    toast.i("我是Vue+Element弹出的消息")
                },
                nextPage: function () {
                    //module实例对象获取data
                    app.$data.value = "new Value";
                },
                handleOpen: function (key, keyPath) {
                    console.log(key, keyPath);
                },
                handleClose: function (key, keyPath) {
                    console.log(key, keyPath);
                },
                handleSelect: function (key, keyPath) {
                    console.log(key, keyPath);
                    this.activeIndex = key
                },
                handleChange: function (value) {
                    console.log(value);
                },
                handleCheckAllChange: function (val) {
                    this.checkedCities = val ? cityOptions : [];
                    this.isIndeterminate = false;
                },
                handleCheckedCitiesChange: function (value) {
                    let checkedCount = value.length;
                    this.checkAll = checkedCount === this.cities.length;
                    this.isIndeterminate = checkedCount > 0 && checkedCount < this.cities.length;
                },
                querySearch: function (queryString, cb) {
                    var restaurants = this.restaurants;
                    var results = queryString ? restaurants.filter(this.createFilter(queryString)) : restaurants;
                    // 调用 callback 返回建议列表的数据
                    cb(results);
                },
                querySearchAsync: function (queryString, cb) {
                    var restaurants = this.restaurants;
                    var results = queryString ? restaurants.filter(this.createStateFilter(queryString)) : restaurants;

                    clearTimeout(this.timeout);
                    this.timeout = setTimeout(function () {
                        cb(results);
                    }, 3000 * Math.random());
                },
                createFilter: function (queryString) {
                    return function (restaurant) {
                        return (restaurant.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
                    };
                },
                createStateFilter: function (queryString) {
                    return function (state) {
                        return (state.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
                    };
                },
                loadAll: function () {
                    return [
                        {"value": "三全鲜食（北新泾店）", "address": "长宁区新渔路144号"},
                        {"value": "Hot honey 首尔炸鸡（仙霞路）", "address": "上海市长宁区淞虹路661号"},
                        {"value": "新旺角茶餐厅", "address": "上海市普陀区真北路988号创邑金沙谷6号楼113"},
                        {"value": "泷千家(天山西路店)", "address": "天山西路438号"},
                        {"value": "胖仙女纸杯蛋糕（上海凌空店）", "address": "上海市长宁区金钟路968号1幢18号楼一层商铺18-101"},
                        {"value": "贡茶", "address": "上海市长宁区金钟路633号"},
                        {"value": "豪大大香鸡排超级奶爸", "address": "上海市嘉定区曹安公路曹安路1685号"},
                        {"value": "茶芝兰（奶茶，手抓饼）", "address": "上海市普陀区同普路1435号"},
                        {"value": "十二泷町", "address": "上海市北翟路1444弄81号B幢-107"},
                        {"value": "星移浓缩咖啡", "address": "上海市嘉定区新郁路817号"},
                        {"value": "阿姨奶茶/豪大大", "address": "嘉定区曹安路1611号"},
                        {"value": "新麦甜四季甜品炸鸡", "address": "嘉定区曹安公路2383弄55号"}
                    ];
                },

                handleIconClick: function (ev) {
                    console.log(ev);
                },
                remoteMethod: function (query) {
                    if (query !== '') {
                        this.loading = true;
                        setTimeout(function () {

                            this.loading = false;
                            this.options4 = this.list.filter(function (item) {
                                return item.label.toLowerCase()
                                                .indexOf(query.toLowerCase()) > -1;
                            });
                        }.bind(this), 200);
                    } else {
                        this.options4 = [];
                    }
                },
                handleItemChange: function (val) {
                    console.log('active item:', val);
                    setTimeout(function () {
                        if (val.indexOf('江苏') > -1 && !this.options2[0].cities.length) {
                            this.options2[0].cities = [{
                                label: '南京'
                            }];
                        } else if (val.indexOf('浙江') > -1 && !this.options2[1].cities.length) {
                            this.options2[1].cities = [{
                                label: '杭州'
                            }];
                        }
                    }, 300)
                },
            },
            created: function () {
            },
            mounted: function () {
                this.restaurants = this.loadAll();
                this.list = this.states.map(function (item) {
                    return {value: item, label: item};
                });
            },
            watch: {
                'value': function (val, oldVal) {//属性监听
                    toast.i("value=" + val);
                },
                'vm.pageNumber': function (val, oldVal) {//对象属性监听
                    toast.i("pageNumber=" + val);
                },
                'activeIndex': function (val, oldVal) {
                    scrollToTop("#scrollbar .el-scrollbar__wrap");
                },
                'filterText': function (val) {
                    this.$refs.tree2.filter(val);
                }
            }
        });
    });

</script>
