<%--
  Created by IntelliJ IDEA.
  User: rich1
  Date: 5/27/16
  Time: 6:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="html/error.html"%>
<html>
    <head>
        <title>System of Student</title>
        <!--<meta http-equiv="refresh" content="0;url=jsp/main.jsp"/>-->
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
        <script type="text/javascript">
            function login()
            {
                //var form = document.getElementById("formValue");
                //form.action = "loginAction";
                //form.submit();
                $.post("loginAction",
                        {
                            studentId:$("#studentId").val(),
                            password:$("#pw").val()
                        },
                        function(data,stautxt)
                        {
                            if(data["bool"] == true)
                            {
                                window.location = "jsp/main.jsp";
                            }
                            else
                            {
                                alert(data["tip"]);
                            }
                        },"json");
            }
        </script>
        <style type="text/css">
            html,body
            {
                min-height: 100%;
                min-width: 100%;
            }
            body
            {
                margin: 0px;
                padding: 0px;
                text-align: center;
                background-image: url(Image/beijing.jpeg);
                background-position: center;
            }
            #beijingLogin
            {
                position: absolute;
                width: 100%;
                height: 100%;
                background: inherit;
                filter: blur(1px);

            }
            #login
            {
                position: absolute;
                width: 300px;
                height: 250px;
                top: 200px;
                left: 35%;
                border-radius: 10px;
                background: rgba(0, 0, 0, 0.5);
            }
            #tip
            {
                position: absolute;
                top: -15px;
                left: 40%;
                font-size: 35px;
                color: blue;
            }
            #form
            {
                position: relative;
                top: 85px;
                width: 100%;
                height: 200px;
                padding: 0px;
            }
            input
            {
                width: 200px;
                height: 35px;
                margin: 5px;
                background: rgba(255, 255, 255, 0.4);
                border-radius: 5px;
                color: #fff;
                text-align: center;
            }
            input:focus
            {
                background-color: rgba(0, 0, 0, 0.2);
                -moz-box-shadow: 0 0 5px 1px rgba(255,255,255,.5);
                -webkit-box-shadow: 0 0 5px 1px rgba(255,255,255,.5);
                box-shadow: 0 0 5px 1px rgba(255,255,255,.5);
                overflow: hidden;
            }
            Button
            {
                position: relative;
                width: 100px;
                height: 38px;
                color: green;
                border: 1px solid #253737;
                background: #416b68;
                background: -webkit-gradient(linear, left top, left bottom, from(#6da5a3), to(#416b68));
                background: -webkit-linear-gradient(top, #6da5a3, #416b68);
                background: -moz-linear-gradient(top, #6da5a3, #416b68);
                background: -ms-linear-gradient(top, #6da5a3, #416b68);
                background: -o-linear-gradient(top, #6da5a3, #416b68);
                background-image: -ms-linear-gradient(top, #6da5a3 0%, #416b68 100%);
                -webkit-border-radius: 6px;
                -moz-border-radius: 6px;
                border-radius: 6px;
                -webkit-box-shadow: rgba(255,255,255,0.1) 0 1px 0, inset rgba(255,255,255,0.7) 0 1px 0;
                -moz-box-shadow: rgba(255,255,255,0.1) 0 1px 0, inset rgba(255,255,255,0.7) 0 1px 0;
                box-shadow: rgba(255,255,255,0.1) 0 1px 0, inset rgba(255,255,255,0.7) 0 1px 0;
                text-shadow: #333333 0 1px 0;
                color: #e1e1e1;
                left: 48px;
            }
            Button:hover {
                border: 1px solid #253737;
                text-shadow: #333333 0 1px 0;
                background: #416b68;
                background: -webkit-gradient(linear, left top, left bottom, from(#77b2b0), to(#416b68));
                background: -webkit-linear-gradient(top, #77b2b0, #416b68);
                background: -moz-linear-gradient(top, #77b2b0, #416b68);
                background: -ms-linear-gradient(top, #77b2b0, #416b68);
                background: -o-linear-gradient(top, #77b2b0, #416b68);
                background-image: -ms-linear-gradient(top, #77b2b0 0%, #416b68 100%);
                color: #fff;
            }

            Button:active {
                margin-top:1px;
                text-shadow: #333333 0 -1px 0;
                border: 1px solid #253737;
                background: #6da5a3;
                background: -webkit-gradient(linear, left top, left bottom, from(#416b68), to(#416b68));
                background: -webkit-linear-gradient(top, #416b68, #609391);
                background: -moz-linear-gradient(top, #416b68, #6da5a3);
                background: -ms-linear-gradient(top, #416b68, #6da5a3);
                background: -o-linear-gradient(top, #416b68, #6da5a3);
                background-image: -ms-linear-gradient(top, #416b68 0%, #6da5a3 100%);
                color: #fff;
                -webkit-box-shadow: rgba(255,255,255,0) 0 1px 0, inset rgba(255,255,255,0.7) 0 1px 0;
                -moz-box-shadow: rgba(255,255,255,0) 0 1px 0, inset rgba(255,255,255,0.7) 0 1px 0;
                box-shadow: rgba(255,255,255,0) 0 1px 0, inset rgba(255,255,255,0.7) 0 1px 0;
            }



        </style>
    </head>
    <body>
        <div></div>
        <div id="beijingLogin"></div>
        <div id="login">
            <p id="tip">登&nbsp;录</p>
            <div id="form">
                <form id="formValue" method="post">
                    <input type="text" id="studentId" placeholder="StudentId"
                           name="studentId"/>
                    <input type="password" id="pw" placeholder="Password"
                           name="password"/>
                </form>
                <Button onclick="login()">登&nbsp;录</Button>
            </div>
        </div>
        <div></div>
    </body>
</html>
