<script>
    window.nav = new Vue({
        data: {
            activeIndex: 'home',
            contextPath: '${contextPath?default("")}',
            homePath: '${homePath?default("")}',
            loadingTip: '',
            loadingBar: '',
            tip: {
                show: function (msg) {
                    var message = "<i class='el-icon-loading'></i> 正在加载 ..."
                    if (msg) {
                        message = "<i class='el-icon-loading'></i> " + msg
                    }
                    if (!nav.loadingTip) {
                        nav.loadingTip = nav.$message({
                            type: '',
                            duration: 0,
                            dangerouslyUseHTMLString: true,
                            message: message
                        });
                    } else {
                        nav.loadingTip.message = message;
                    }
                },
                close: function () {
                    if (nav.loadingTip) {
                        nav.loadingTip.close();
                        nav.loadingTip = '';
                    }
                }
            },
            bar: {
                show: function () {
                    if (!nav.loadingBar) {
                        nav.loadingBar = nav.$message({
                            type: '',
                            duration: 0,
                            customClass: 'loading-bar',
                            dangerouslyUseHTMLString: true,
                            message: '<i class="bar" style="width: 90%"></i>'
                        });
                    } else {
                        nav.loadingBar.message = '<i class="bar" style="width: 90%"></i>'
                    }
                },
                finish: function () {
                    if (nav.loadingBar) {
                        nav.loadingBar.message = '<i class="bar" style="width: 100%"></i>'
                        setTimeout(function(){
                            if (nav.loadingBar) {
                                nav.loadingBar.close();
                                nav.loadingBar = '';
                            }
                        },500);
                    }
                },
                error: function () {
                    if (nav.loadingBar) {
                        nav.loadingBar.message = '<i class="bar error" style="width: 100%"></i>'
                        setTimeout(function(){
                            if(nav.loadingBar){
                                nav.loadingBar.close();
                                nav.loadingBar = '';
                            }
                        },500);
                    }
                }
            }
        },
        methods: {
            i: function (message, callback) {
                this.$message({
                    type: "info",
                    showClose: true,
                    message: message,
                    duration: 1500,
                    onClose: callback
                });
            },
            e: function (message, callback) {
                this.$message({
                    type: "error",
                    showClose: true,
                    message: message,
                    duration: 1500,
                    onClose: callback
                });
            },
            w: function (message, callback) {
                this.$message({
                    type: "warning",
                    showClose: true,
                    message: message,
                    duration: 1500,
                    onClose: callback
                });
            },
            s: function (message, callback) {
                this.$message({
                    type: "success",
                    showClose: true,
                    message: message,
                    duration: 1500,
                    onClose: callback
                });
            },
            toOpen: function (url) {
                nav.tip.show();
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
                nav.tip.show();
                location.href = this.contextPath + "/"
            },
            /**
             * 滚动屏蔽至顶部
             */
            scrollToTop: function () {
                var distance = document.documentElement.scrollTop || document.body.scrollTop;
                var step = distance / 10;

                (function jump() {
                    if (distance > 0) {
                        distance -= step;
                        window.scrollTo(0, distance);
                        setTimeout(jump, 10)
                    }
                })();
            },
            /**
             * 控制任一目标滚动到顶部
             * select jquery对象
             */
            scrollToTop: function (select) {
                var distance = $(select).scrollTop();
                var step = distance / 10;

                (function jump() {
                    if (distance > 0) {
                        distance -= step;
                        $(select).scrollTop(distance);
                        setTimeout(jump, 10)
                    } else {
                        $(select).scrollTop(distance);
                    }
                })();
            }
        }
    });

    /**
     * 获取url参数
     * @param key
     */
    window.location.getParam = function (key) {
        var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return decodeURIComponent(r[2]);
        }
        return null;
    }
    /**
     * 打开新标签
     * @param url
     */
    window.location.open = function (url) {
        $("body").append($("<a id='wb-open' href='" + url + "' target='_blank' style='dispaly:none;'></a>"))
        document.getElementById("wb-open").click();
        $("#wb-open").remove();
    }
    /**
     * 日期格式化
     */
    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, //month
            "d+": this.getDate(),    //day
            "h+": this.getHours(),   //hour
            "m+": this.getMinutes(), //minute
            "s+": this.getSeconds(), //second
            "q+": Math.floor((this.getMonth() + 3) / 3),  //quarter
            "S": this.getMilliseconds() //millisecond
        }
        if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
                (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1,
                    RegExp.$1.length == 1 ? o[k] :
                            ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    };
    /**
     * 数组移除
     */
    Array.prototype.remove = function (val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };
    /**
     * 数组替换
     */
    Array.prototype.replace = function (val, obj) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1, obj);
        }
    };
    /**
     * 数组位置调整
     */
    Array.prototype.exchange = function (val1, val2) {
        if (val1 < 0 || val2 < 0 || val2 >= this.length || val1 >= this.length) {
            return;
        }
        var o1 = this[val1];
        var o2 = this[val2];
        this.splice(val1, 1, o2);
        this.splice(val2, 1, o1);
    };
</script>