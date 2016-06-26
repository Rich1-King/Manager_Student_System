<%--
  Created by IntelliJ IDEA.
  User: rich1
  Date: 6/17/16
  Time: 12:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>System of Student</title>

        <style type="text/css">
             body, div
             {
                margin: 0px;
                padding: 0px;
                width: 100%;
                overflow-y: visible;
             }
            #header
            {
                margin: 0px;
                padding: 0px;
                width: Auto;
                height: 35px;
                background-color: lightskyblue;
            }

            #title
            {
                margin: 0px;
                width: auto;
                height: 50px;
                text-align: center;
                line-height: 50px;
                background-color: aqua;
            }

            #body
            {
                width: auto;
                height: 587px;
                margin: 0px;
            }
            #left
            {
                width: 20%;
                height: auto;
                min-height: 587px;
                margin: 0px;
                background-color: aqua;
                float: left;
            }
            #left div
            {
                margin-top: 20px;
                padding: 0px;
                height: 40px;
                width: 100%;
                text-align: center;
                line-height: 40px;
                border-color: #43f631;
                background-color: red;
                cursor: default;
                border-radius: 30px;
                -moz-user-select: none;
            }
            #left div:hover
            {
                background-color: indianred;
            }
            #left div:active
            {
                background-color: darkred;
            }
            #left #inf
            {
                margin-top: 0px;
                -moz-user-select: none;
            }
            #right
            {
                margin: 0px;
                padding: 0px;
                height: auto;
                min-height: 587px;
                width: 80%;
                float: left;
                border-width: 0px;
            }
            div iframe
            {
                margin: 0px;
                height: 100%;
                width: 100%;
                border-width: 0px;
            }

            #foot
            {
                width: 100%;
                height: 40px;
                margin: 0px;
                background-color: black;
            }
            #foot p
            {
                margin: 0px;
                padding: 0px;
                text-align: center;
                line-height: 40px;
                -moz-user-select: none;
                cursor: default;
                color: white;
            }

        </style>
        <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
        <script language="JavaScript">
            $(document).ready(function()
            {
                $("#inf").css("backgroundColor","darkred")
                $(document).click(function(e)
                {
                    var but = $(e.target).attr('id');
                    switch (but)
                    {
                        case "inf":
                            $("#frame").attr("src","student_inf.jsp");
                            $("#inf").css("backgroundColor","darkred");
                            $("#xuanke").css("backgroundColor","red");
                            $("#kebiao").css("backgroundColor","red");
                            usehover($("#xuanke"));
                            usehover($("#kebiao"));
                            removehover($("#inf"));
                            break;
                        case "xuanke":
                            $("#frame").attr("src","student_xuanke.jsp");
                            $("#xuanke").css("backgroundColor","darkred");

                            $("#kebiao").css("backgroundColor","red");
                            $("#inf").css("backgroundColor","red");
                            usehover($("#kebiao"));
                            usehover($("#inf"));
                            removehover($("#xuanke"));
                            break;
                        case "kebiao":
                            $("#frame").attr("src","student_kebiao.jsp");
                            $("#kebiao").css("backgroundColor","darkred");
                            $("#inf").css("backgroundColor","red");
                            $("#xuanke").css("backgroundColor","red");
                            usehover($("#xuanke"));
                            usehover($("#inf"));
                            removehover($("#kebiao"));
                            break;
                        default:
                            break;
                    }
                });
            });
            function usehover(value)
            {
                value.hover(function () {
                    value.css("backgroundColor","indianred");
                },function(){
                    value.css("backgroundColor","red");
                });
            }
            function removehover(value)
            {
                value.hover(function () {
                    value.css("backgroundColor","darkred");
                    },function(){
                        value.css("backgroundColor","darkred");
                });
            }
        </script>
    </head>
    <body>
        <div id="header"></div>


        <div>
            <h1 id="title">学生选课管理系统</h1>
        </div>

        <div id="body">
            <div id="left">
                <div id="inf">学生信息</div>
                <div id="xuanke">学生选课</div>
                <div id="kebiao">学生课表</div>
            </div>

            <div id="right">
                <iframe id="frame" src="student_inf.jsp"></iframe>
            </div>
        </div>

        <div id="foot">
            <p>@copyright 版权所有</p>
        </div>
    </body>
</html>
