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
})
