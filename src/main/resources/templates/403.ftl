<head>

    <style>
        body {
            margin: 0px;
            padding: 0px;
            background-color: #f2f2f2;
        }

        .box {
            width: 700px;
            margin: 50px auto;
            display: table;
        }

        .container {
            display: table-cell;
            vertical-align: middle;
        }

        .code {
            font-weight: 500;
            top: 100px;
            left: 400px;
            text-align: center;
            width: 300px;
            margin-top: 30px;
            margin-bottom: 10px;
            font-family: 'Varela Round', sans-serif;
            font-size: 60px;
            color: #6bbee0;
            letter-spacing: 3px;
            text-shadow: 0 0 5px #78d0ec;
            animation: flux 2s linear infinite;
        }

        .message {
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            color: #505050;
            font-weight: 500;
        }

        .message2 {
            font-family: 'Poppins', sans-serif;
            font-size: 15px;
            color: #505050;
            font-weight: 300;
            width: 360px;
            white-space: nowrap;
        }

        .door-frame {
            height: 340px;
            width: 220px;
            border-radius: 90px 90px 0 0;
            background-color: #8594A5;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .door {
            height: 280px;
            width: 170px;
            border-radius: 70px 70px 0 0;
            background-color: #A0AEC0;
        }

        .eye {
            top: 15px;
            left: 25px;
            height: 5px;
            width: 15px;
            border-radius: 50%;
            background-color: white;
            animation: eye 7s ease-in-out infinite;
            position: absolute;
        }

        .eye2 {
            left: 65px;
        }

        .window {
            height: 40px;
            width: 130px;
            background-color: #1C2127;
            border-radius: 3px;
            margin: 80px auto;
            position: relative;
        }

        .leaf {
            height: 40px;
            width: 130px;
            background-color: #8594A5;
            border-radius: 3px;
            margin: 80px auto;
            animation: leaf 7s infinite;
            transform-origin: right;
        }

        .handle {
            height: 8px;
            width: 30px;
            border-radius: 4px;
            background-color: #EBF3FC;
            position: absolute;
            margin-top: 195px;
            margin-left: 30px;
        }

        .rectangle {
            height: 60px;
            width: 20px;
            background-color: #CBD8E6;
            border-radius: 4px;
            position: absolute;
            margin-top: 160px;
            margin-left: 20px;
        }

        .message3 {
            margin-top: 20px;
            font-size: 12px;
        }

        a.login {
            font-size: 15px;
            text-decoration: none;
            color: rgba(0, 130, 192, 0.69);
        }

        a.login:hover {
            color: #0074c0;
        }

        @keyframes leaf {
            0% {
                transform: scaleX(1);
            }
            5% {
                transform: scaleX(0.2);
            }
            70% {
                transform: scaleX(0.2);
            }
            75% {
                transform: scaleX(1);
            }
            100% {
                transform: scaleX(1);
            }
        }

        @keyframes eye {
            0% {
                opacity: 0;
                transform: translateX(0)
            }
            5% {
                opacity: 0;
            }
            15% {
                opacity: 1;
                transform: translateX(0)
            }
            20% {
                transform: translateX(15px)
            }
            35% {
                transform: translateX(15px)
            }
            40% {
                transform: translateX(-15px)
            }
            60% {
                transform: translateX(-15px)
            }
            65% {
                transform: translateX(0)
            }
        }

        @keyframes flux {
            0%,
            100% {
                text-shadow: 0 0 5px #00FFC6, 0 0 15px #00FFC6, 0 0 50px #00FFC6, 0 0 50px #00FFC6, 0 0 2px #B9FFE8, 2px 2px 3px #12E29C;
                color: #4BFFEF;
            }
            50% {
                text-shadow: 0 0 3px #00B58D, 0 0 7px #00B58D, 0 0 25px #00B58D, 0 0 25px #00B58D, 0 0 2px #00B58D, 2px 2px 3px #006A60;
                color: #63D3AE;
            }
        }


    </style>
    <script>
        window.onload = function () {
            var count = 4;

            function go() {
                if (count > 0) {
                    var e = document.getElementById("timer");
                    e.innerHTML = count + " 秒后自动跳转登录页"
                    count--;
                } else {
                    location.href = '${Uri.getUrl("/login")}';
                }
            }

            setInterval(go, 1000);
        };
    </script>
</head>
<body>
<div class="box">
    <div class="container">
        <div class="door-frame">
            <div class="door">
                <div class="rectangle">
                </div>
                <div class="handle">
                </div>
                <div class="window">
                    <div class="eye">
                    </div>
                    <div class="eye eye2">
                    </div>
                    <div class="leaf">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="code">403</div>
        <div class="message">您没有足够的权限哦!</div>
        <div class="message2">您正在试图访问一个没有事先授权的页面.或登录已失效。</div>
        <div class="message3" id="timer">5 秒后自动跳转登录页</div>
        <a class="login" href="${Uri.getUrl("/login")}">立即跳转</a>
    </div>

</div>

</body>