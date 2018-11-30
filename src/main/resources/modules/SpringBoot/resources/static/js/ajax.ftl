//创建axios实例
instance = axios.create({
    method: 'post',
    timeout: 30000,
});

// 添加请求拦截器
instance.interceptors.request.use(function (config) {
    // 在发送请求之前做些什么
    nav.bar.show();
    if (config.url == '/upload') {
        nav.tip.show("上传中 ...");
    } else {
        nav.tip.show();
    }
    return config;
}, function (error) {
    // 对请求错误做些什么
    return Promise.reject(error);
});

// 添加响应拦截器
instance.interceptors.response.use(function (response) {
    // 对响应数据做点什么
    nav.tip.close();
    nav.bar.finish();
    return response;
}, function (error) {
    // 对响应错误做点什么
    nav.tip.close();
    nav.bar.error();
    const rsp = {errors: []};
    if (!error.response) {
        rsp.errors.push({message: error.message});
    } else {
        switch (error.response.status) {
            case 401:
                rsp.errors.push({message: "未授权，请登录(401)"});
                break
            case 403:
                rsp.errors.push({message: "拒绝访问(403)"});
                break
            case 404:
                rsp.errors.push({message: "请求地址错误(404)"});
                break
            case 408:
                rsp.errors.push({message: "请求超时(408)"});
                break
            case 500:
                rsp.errors.push({message: "服务器内部错误(500)"});
                break
            case 501:
                rsp.errors.push({message: "服务未实现(501)"});
                break
            default:
                rsp.errors.push({message: "请求错误(" + error.response.status + ")"});
                break
        }
    }
    return Promise.reject(rsp);
});
jsonRequest = function (config) {
    return instance.request({
        params: {
            method: config.method
        },
        url: "/ajax",
        headers: {'Content-Type': 'text/plain'},
        data: config.data
    }).then(function (response) {
        return Promise.resolve(response.data);
    }, function (response) {
        return Promise.resolve(response);
    })
};
fileRequest = function (config) {
    return instance.request({
        url: "/upload",
        data: config.data,
        headers: {'Content-Type': 'multipart/form-data'},
        onUploadProgress: function (progressEvent) {
            var complete = (progressEvent.loaded / progressEvent.total * 100 | 0) + '%'
            nav.tip.show("上传中(" + complete + ")")
        }
    }).then(function (response) {
        return Promise.resolve(response.data);
    }, function (response) {
        return Promise.resolve(response);
    })
};
window.ajax = {
    example: function (data) {
        return jsonRequest({
            method: "ajax.example.example",
            data: data
        })
    },
    fileUpload: function (file) {
        var fd = new FormData();
        fd.append("file", file);
        return fileRequest({
            data: fd
        })
    },
<#list modules as db>
<#list db.tables as table>
<#if table.getCreate()>
    ${table.getFName()}Create: function (data) {
        return jsonRequest({
            method:"ajax.${db.moduleName}.${table.getLName()}.create",
            data: JSON.stringify(data),
        })
    },
</#if>
<#if table.getDelete()>
    ${table.getFName()}Delete: function (data) {
        return jsonRequest({
            method:"ajax.${db.moduleName}.${table.getLName()}.delete",
            data: JSON.stringify(data),
        })
    },
</#if>
<#if table.getUpdate()>
    ${table.getFName()}Update: function (data) {
        return jsonRequest({
            method:"ajax.${db.moduleName}.${table.getLName()}.update",
            data: JSON.stringify(data),
        })
    },
</#if>
<#if table.getFind()>
    ${table.getFName()}Find: function (data) {
        return jsonRequest({
            method:"ajax.${db.moduleName}.${table.getLName()}.find",
            data: JSON.stringify(data),
        })
    },
</#if>
<#if table.getGet()>
    ${table.getFName()}Get: function(data) {
        return jsonRequest({
            method:"ajax.${db.moduleName}.${table.getLName()}.get",
            data: JSON.stringify(data),
        })
    },
</#if>
<#if table.getSearch()>
    ${table.getFName()}Search: function (data) {
        return jsonRequest({
            method:"ajax.${db.moduleName}.${table.getLName()}.search",
            data: JSON.stringify(data),
        })
    },
</#if>
<#if table.getGetAll()>
    ${table.getFName()}GetAll: function (data) {
        return jsonRequest({
            method:"ajax.${db.moduleName}.${table.getLName()}.get.all",
            data: JSON.stringify(data),
        })
    },
</#if>
</#list>
</#list>
}