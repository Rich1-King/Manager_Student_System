<%--
  Created by IntelliJ IDEA.
  User: rich1
  Date: 6/2/16
  Time: 12:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="../html/error.html" %>
<html>
<head>
    <title>学生选课</title>
    <style>
        body, div
        {
            margin: 0px;
            padding: 0px;
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

        table
        {
            border-collapse: collapse;
        }
        #courseTable
        {
            width: 100%;
        }
        th, td
        {
            border: 1px solid black;
            margin: 0px;
            padding: 5px 20px;
            text-align: center;
        }
        th
        {
            height: 20px;
            background-color: darkseagreen;
        }
        td, input
        {
            height: 20px;
        }
        .other
        {
            width: 18%;
        }
        #id
        {
            width: 10%;
        }
        #select
        {
            border: 1px solid darkseagreen;

        }
        .input
        {
            text-align: center;
            line-height: 20px;
            margin-right: 5px;
        }
        #downtip
        {
            margin: 0px;
            padding: 0px;
            width: 100%;
            height: 40px;
            background-color: #43f631;

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
        var num = -1;
        var page = 1;
        $(document).ready(function()
                 {
                   $.post("CourseAction"
                           , null
                           ,function(data,statusText)
                           {
                               for(var i = 0; i < data.id.length; i++)
                               {
                                   if((Math.floor(i/12) +1) == page)
                                   {
                                       $("#tableHeader").after("<tr><td>"
                                               + data["id"][data.id.length - i - 1] + "</td>" +
                                               "<td>" + data["course"][data.id.length - i - 1] + "</td>" +
                                               "<td>" + data["classroom"][data.id.length - i - 1] + "</td>" +
                                               "<td>" + data["time"][data.id.length - i - 1] + "</td>" +
                                               "<td>" + data["teacher"][data.id.length - i - 1] + "</td>" +
                                               "<td>" +
                                               "<input class=\"input\" id=\"input" + (data.id.length - i - 1) + "\" type=\"checkbox\" disabled=\"true\"/>选课" +
                                               "</td></tr>");
                                   }
                               }
                               num = data.id.length;

                               $.post("GetCourseAction",
                                       null,
                                       function(data,stautxt)
                                       {
                                           for(var i=0; i<data["id"].length; i++)
                                           {
                                               $("#input" + (data["id"][i]-1)).attr("checked", "checked");
                                           }
                                           $("#tip").css("display","none");
                                       },"json");
                           },"json");
                 });

        function submitClick()
        {
            $("#tip").css("display","block");
            $("#bufferContent").html("正在选课......");
            var nums = new Array();

            if(num == -1)
            {
                return;
            }
            for(var i=0; i<num; i++)
            {
                $("#input" + i).attr("disabled", true);

                if ($("#input" + i).attr("checked")=="checked")
                {
                    nums.push(i + 1);
                }
            }

                var strnums = nums.join(",");

                $.post("SelectCourseAction",
                        {
                            nums : strnums
                        },
                        function(data,stuatxt)
                        {
                            $("#tip").css("display","none");
                            $("#bufferContent").html("正在加载数据......");
                            alert(data["tip"]);
                        },"json");

        }

        function editClick()
        {
            for(var i=0; i<num; i++)
            {
                $("#input" + i).attr("disabled", false);
            }
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
        <div id="save" onclick="submitClick()">提交</div>
        <div id="edit" onclick="editClick()">编辑</div>
    </div>
    <div id="body">
        <table id="courseTable">
            <tr id="tableHeader">
                <th id="id">编号</th>
                <th class="other">课程</th>
                <th class="other">教室</th>
                <th class="other">上课时间</th>
                <th class="other">任课老师</th>
                <th class="other" id="select"></th>
            </tr>
        </table>
        <div id="downtip">
        </div>
    </div>
</body>
</html>
