<%--
  Created by IntelliJ IDEA.
  User: Xena
  Date: 2018/5/29
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>聊天记录</title>
    <style>
        span{
            float: right;
        }
    </style>
    <script src="<%= basePath%>js/jquery-1.10.1.min.js"></script>
    <script>
        $(function () {
//           获得按钮
            $("#btn").click(
                function () {
                    //获得我们的文本框输入的内容
                    var wcont="<span>"+$("#content").val()+":我</span><br/>";
//               将span的标签填到div中
                    $("#main").append(wcont);

                    var value=$("#content").val();//记录文本框中的内容
                    $("#content").val("");//将文本框内容置空

                    //对方回应，数据库的查询    异步   ajax
//                输入1 选择支付  将支付的id发给控制层，通过id找到该类型下的所有信息
                    //   var num=1;
                    <%--//   var cid=${requestScope.messageCatory[num].id};    //num是js的变量   el表达式java的   java里面用了js的变量，不识别--%>

                    //直接给处理器
                    $.ajax({
                        type:"get",
                        url:"${pageContext.request.contextPath}/selectMessages",
                        data:"index="+value,           //发送给处理器
                        success:function (mlist) {
                            // mlist  接收传递的消息的列表
                            //js去绘制页面
                            for(var i=0;i<mlist.length;i++){
                                var messeage=mlist[i];//取得列表里面的每一个消息
                                var mzhan="<p>"+(i+1)+","+messeage.mname+"</p>"
                                $("#main").append(mzhan);
                            }
                        }
                    });
                }
            );
        });

    </script>
</head>
<body>



<div id="main" style="border: 1px solid black; width: 600px;height: 600px ">


    客服萌萌：<br/>
    <c:forEach items="${messageCatory}" var="catory" varStatus="s">
        ${s.index+1},${catory.mcatory}<br/>
    </c:forEach>
    上帝有啥需求？
</div>

<p><input id="content" name="content" style="width: 450px">
    <input type="button" value="提交" id="btn"/>
</p>

</body>
</html>
