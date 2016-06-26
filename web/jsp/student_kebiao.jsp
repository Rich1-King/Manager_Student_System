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
    <title>学生课表</title>
    <style type="text/css">
        body
        {
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
        }

        table
        {
            width: 100%;
            height: 100%;
            border-collapse: collapse;
        }

        th
        {
            border: 1px solid black;
            height: 20px;
            width: 12.5%;
            border-collapse: collapse;
            text-align: center;
            background-color: grey;
            color: whitesmoke;
        }
        td
        {
            border: 1px solid black;
            height: auto;
            width: 12.5%;
            border-collapse: collapse;
            text-align: center;
        }
        .course
        {
            background-color: darkgrey;
            color: whitesmoke;
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
        $(document).ready(function()
        {
            $.post("GetCourseAction",
                    null,
                    function (data, stautxt) {
                         var num = data["id"].length;

                         for(var i=0; i<num; i++)
                         {
                             var dt = data["time"][i];
                            switch(dt) {
                                case "周一 08:30~10:00":
                                    $("#MonFirst").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周一 10:30~12:00":
                                    $("#MonSecond").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周一 14:30~16:00":
                                    $("#MonThird").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                case "周一 16:30~18:00":
                                    $("#MonFourth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                            break;
                                case "周一 19:30~21:00":
                                    $("＃MonFifth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                            break;

                                case "周二 08:30~10:00":
                                    $("#TueFirst").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周二 10:30~12:00":
                                    $("#TueSecond").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周二 14:30~16:00":
                                    $("#TueThird").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周二 16:30~18:00":
                                    $("#Tuefourth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周二 19:30~21:00":
                                    $("#Tuefifth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;

                                case "周三 08:30~10:00":
                                    $("#WedFirst").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周三 10:30~12:00":
                                    $("#WedSecond").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周三 14:30~16:00":
                                    $("#WedThird").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周三 16:30~18:00":
                                    $("#WedFourth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周三 19:30~21:00":
                                    $("#Wedfifth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;

                                case "周四 08:30~10:00":
                                    $("#ThuFirst").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周四 10:30~12:00":
                                    $("#ThuSecond").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周四 14:30~16:00":
                                    $("#ThuThird").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周四 16:30~18:00":
                                    $("#ThuFourth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周四 19:30~21:00":
                                    $("#ThuFifth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;

                                case "周五 08:30~10:00":
                                    $("#FriFirst").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周五 10:30~12:00":
                                    $("#FriSecond").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周五 14:30~16:00":
                                    $("#FriThird").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周五 16:30~18:00":
                                    $("#FriFourth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周五 19:30~21:00":
                                    $("#FriFifth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;

                                case "周六 08:30~10:00":
                                    $("#SatFirst").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周六 10:30~12:00":
                                    $("#SatSecond").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周六 14:30~16:00":
                                    $("#SatThird").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周六 16:30~18:00":
                                    $("#SatFourth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周六 19:30~21:00":
                                    $("#SatFifth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;

                                case "周日 08:30~10:00":
                                    $("#SunFirst").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周日 10:30~12:00":
                                    $("#SunSecond").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周日 14:30~16:00":
                                    $("#SunThird").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周日 16:30~18:00":
                                    $("#SunFourth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                                case "周日 19:30~21:00":
                                    $("#SunFifth").html(data["course"][i]+"("+data["classroom"][i]+")"+"<br>"+data["teacher"][i]);
                                    break;
                            }
                         }
                         $("#tip").css("display","none")
                    }, "json");
        });
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
   <table>
       <tr>
           <th></th>
           <th>星期一</th>
           <th>星期二</th>
           <th>星期三</th>
           <th>星期四</th>
           <th>星期五</th>
           <th>星期六</th>
           <th>星期日</th>
       </tr>
       <tr>
           <td class="course">一、二</td>
           <td id="MonFirst"></td>
           <td id="TueFirst"></td>
           <td id="WedFirst"></td>
           <td id="ThuFirst"></td>
           <td id="FriFirst"></td>
           <td id="SatFirst"></td>
           <td id="SunFirst"></td>
       </tr>
       <tr>
           <td class="course">三、四</td>
           <td id="MonSecond"></td>
           <td id="TueSecond"></td>
           <td id="WedSecond"></td>
           <td id="ThuSecond"></td>
           <td id="FriSecond"></td>
           <td id="SatSecond"></td>
           <td id="SunSecond"></td>
       </tr>
       <tr>
           <td class="course">五、六</td>
           <td id="MonThird"></td>
           <td id="TueThird"></td>
           <td id="WedThird"></td>
           <td id="ThuThird"></td>
           <td id="FriThird"></td>
           <td id="SatThird"></td>
           <td id="SunThird"></td>
       </tr>
       <tr>
           <td class="course">七、八</td>
           <td id="MonFourth"></td>
           <td id="TueFourth"></td>
           <td id="WedFourth"></td>
           <td id="ThuFourth"></td>
           <td id="FriFourth"></td>
           <td id="SatFourth"></td>
           <td id="SunFourth"></td>
       </tr>
       <tr>
           <td class="course">九、十、十一</td>
           <td id="MonFifth"></td>
           <td id="TueFifth"></td>
           <td id="WedFifth"></td>
           <td id="ThuFifth"></td>
           <td id="FriFifth"></td>
           <td id="SatFifth"></td>
           <td id="SunFifth"></td>
       </tr>
   </table>
</body>
</html>
