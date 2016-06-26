<%--
  Created by IntelliJ IDEA.
  User: rich1
  Date: 6/2/16
  Time: 12:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="../html/error.html" %>
<html>
<head>
    <title>学生信息</title>
    <style type="text/css">

        body, div
        {
            margin: 0px;
            padding: 0px;
        }
        body
        {
            width: 100%;
            height: 100%;
            position: relative;
        }
        #header
        {
            margin: 0px;
            padding: 0px;
            width: 100%;
            height: 30px;
            background-color: darkgray;
        }
        #header div
        {
            float: right;
            width: 40px;
            height: 25px;
            text-align: center;
            line-height: 25px;
            border-radius: 10px;
            margin-right: 10px;
            margin-top: 2px;
            background-color: lawngreen;
            -moz-user-select: none;
            cursor: pointer;
        }
        #header div:hover
        {
            background-color: darkseagreen;
        }
        #header div:active
        {
            background-color: darkgreen;
        }

        li
        {
            margin-left: 50px;
            margin-top: 40px;
            list-style: none;
            height: 20px;
        }
        li input
        {
            margin-left: 10px;
            width: 200px;
            height: 35px;
        }
        li select
        {
            margin-left: 10px;
            width: auto;
            height: 35px;
        }
        #tip
        {   
            position: absolute;
            width: 300px;
            height: 250px;
            z-index: 10;
            top: 25%;
            left: 35%;
            text-align: center;
            line-height: 250px;
            vertical-align: middle;
        }
        #bufferImage
        {
            filter:alpha(opacity=1);
            -moz-opacity: 1;
            -khtml-opacity: 1;
            opacity: 1;
            width: 100px;
            height: 250px;
            float: left;
            text-align: center;
            line-height: 250px;
            vertical-align: middle;
            margin-top: 80px;
        }
        #buffer
        {
            width: 100px;
            height: 100px;
        }
        #bufferContent
        {
            filter:alpha(opacity=1);
            -moz-opacity: 1;
            -khtml-opacity: 1;
            opacity: 1;
            width: 200px;
            height: 250px;
            float: left;
            text-align: center;
            padding: 0px;

        }
    </style>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
    <script type="text/javascript">
        var bool = false;
        function editorInf()
        {
            if(bool == false)
            {
                return;
            }
            $(".inf").attr("disabled", false);
            flag = true;
        }
        function saveInf()
        {
            if(flag == false)
            {
                return;
            }

            $(".inf").attr("disabled", true);

            $.post("infSaveAction",
                    {
                        name: $("#name").attr("value"),
                        studentId: $("#studentId").attr("value"),
                        age: $("#age").attr("value"),
                        sex: $("#sex").val(),
                        major: $("#major").attr("value"),
                        course: $("#course").attr("value"),
                        phone: $("#phone").attr("value"),
                        address: $("#address").attr("value")
                    },
                    function(data,statuText)
                    {
                        alert(data["tip"]);
                    },"json");

            flag = false;
        }

    </script>
</head>
<body>
    <div id="tip">
        <div id="bufferImage">
            <img id="buffer" src="../Image/buffer.gif" alt="正在加载数据......"/>
        </div>
        <div id="bufferContent">
            正在加载数据......
        </div>

    </div>
    <div id="header">
         <div id="save" onclick="saveInf()">保存</div>
         <div id="edit" onclick="editorInf()">编辑</div>
    </div>
    <div id="body">
        <li>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            名:<input id="name" type="text" class="inf" disabled="true"/></li>
        <li>学&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            号:<input id="studentId" type="text" disabled="true"/></li>
        <li>年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            龄:<input id="age" type="text" class="inf" disabled="true"/></li>
        <li>性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别:
            <select id="sex" class="inf" disabled="true">
                <option>男</option>
                <option>女</option>
                <option>其他</option>
            </select>
        </li>
        <li>专&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            业:<input id="major" type="text" class="inf" disabled="true"/></li>
        <li>班&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            级:<input id="course" type="text" class="inf" disabled="true"/></li>
        <li>电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            话:<input id="phone" type="text" class="inf" disabled="true"/></li>
        <li>户籍地址:<input id="address" type="text" class="inf" disabled="true"/></li>

    </div>
    <script type="text/javascript">
        $(document).ready(function()
                {
                    $.post("infAction", null,
                            function(data, statusText)
                            {
                                    $("#name").attr("value", data["name"]);
                                    $("#studentId").attr("value", data["studentId"]);
                                    $("#age").attr("value", data["age"]);
                                    $("#sex").val(data["sex"]);
                                    $("#major").attr("value", data["major"]);
                                    $("#course").attr("value", data["course"]);
                                    $("#phone").attr("value", data["phone"]);
                                    $("#address").attr("value", data["address"]);
                                    bool = true;
                                    $("#tip").css("display","none");
                            }
                    ,"json");

                }
        );
    </script>
</body>
</html>
