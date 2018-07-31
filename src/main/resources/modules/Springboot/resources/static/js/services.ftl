/**
 * Created by  on 2018-07-09.
 */
$(function(){
    $.services = {};
    $.url = "/ajax";
    $.extend($.services,{
        example:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.example.example",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
        createUser:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.example.user.create",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
        deleteUser:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.example.user.delete",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
        updateUser:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.example.user.update",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
        findUser:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.example.user.find",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
        getUser:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.example.user.get",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
        getAllUser:function(data){
            return $.ajax({
                type: 'POST',
                url: $.url+"?method=ajax.example.user.get.all",
                data: JSON.stringify(data),
                contentType:"text/plain",
                dataType: "json"
            })
        },
    })

    /**
     * 通用消息提示框
     */
    window.toast = {
        vue: new Vue(),
        i: function (message,callback) {
            this.vue.$message({
                type: "info",
                showClose: true,
                message: message,
                duration: 2000,
                onClose:callback
            });
        },
        e: function (message,callback) {
            this.vue.$message({
                type: "error",
                showClose: true,
                message: message,
                duration: 2000,
                onClose:callback
            });
        },
        w: function (message,callback) {
            this.vue.$message({
                type: "warning",
                showClose: true,
                message: message,
                duration: 2000,
                onClose:callback
            });
        },
        s: function (message,callback) {
            this.vue.$message({
                type: "success",
                showClose: true,
                message: message,
                duration: 2000,
                onClose:callback
            });
        }
    };
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
        $("body").append($("<a id='wb-open' href='"+url+"' target='_blank' style='dispaly:none;'></a>"))
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
    /**
     * 滚动屏蔽至顶部
     */
    window.scrollToTop = function(){
        var distance = document.documentElement.scrollTop || document.body.scrollTop;
        var step = distance/10;

        (function jump(){
            if(distance > 0){
                distance-=step;
                window.scrollTo(0,distance);
                setTimeout(jump,10)
            }
        })();
    }

    /**
     * 控制任一目标滚动到顶部
     * select jquery对象
     */
    window.scrollToTop = function(select){
        var distance = $(select).scrollTop();
        var step = distance/10;

        (function jump(){
            if(distance > 0){
                distance-=step;
                $(select).scrollTop(distance);
                setTimeout(jump,10)
            }else{
                $(select).scrollTop(distance);
            }
        })();
    }
})
