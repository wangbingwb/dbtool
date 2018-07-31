<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="include/top.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<%@ include file="include/foot.jsp"%>
<script>
    =%=(function(){
        =%=.services.example({}).then(function(data){
            if (data.errors.length > 0) {
                toast.e(data.errors[0].message,1000);
            } else {
                toast.i("Ajax调用成功!",1000);
            }
        })
    })
</script>
</body>
</html>
