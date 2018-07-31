<head>
    <style>
        html,body{
            overflow: hidden;
        }
        .box{
            width: 100%;
            height: 100%;
            overflow: scroll;
        }
        .box a{
            color: #c38168;
            line-height: 18px;
            text-decoration: underline;
        }
        .box::-webkit-scrollbar {/*滚动条整体样式*/
            width: 10px;     /*高宽分别对应横竖滚动条的尺寸*/
            height: 1px;
        }
        .box::-webkit-scrollbar-thumb {/*滚动条里面小方块*/
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 5px rgba(73, 73, 73, 0.2);
            background: #828282;
        }
        .box::-webkit-scrollbar-track {/*滚动条里面轨道*/
            -webkit-box-shadow: inset 0 0 5px rgba(125, 125, 125, 0.2);
            border-radius: 10px;
            background: #EDEDED;
        }
    </style>
</head>
<body>

<div class="box">
    <p>
    ${msg}
    </p>
</div>

</body>