<%-- 
    Document   : newDisplay
    Created on : Feb 23, 2018, 11:33:02 AM
    Author     : Eman-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body onload="setInterval('getMsgs()', 5000)" style='color: #1a0033;font-family: Arial, Helvetica, sans-serif;background-size: 100%;
          background-image: url("http://backgroundcheckall.com/wp-content/uploads/2017/12/blue-and-white-background-hd-13.jpg");background-repeat: no-repeat'>
        <c:if test="${sessionScope.userName == null}">
            <c:redirect url = "registration.jsp"/>
        </c:if>
        <br>

        <br>
    <center>
        <label><b>Welcome : ${userName}</b></label>
        <br>
        <br>
        <br>
        <label for="msgField"><b>Message</b></label>
        <br>
        <input type="text" placeholder="Enter Message" id="msgField"
               style=' width: 30%;
               padding: 15px;
               margin: 5px 0 22px 0;
               display: inline-block;
               border: none;
               border-radius: 15px;
               background: #e6f2ff;' 
               required>
        <br>
        <div style="width: 100%;margin: 0 auto;">
            <form method=get action="signOutServlet">
                <button type="button" id="sendBtn"
                        style='background-color: #1a0033;
                        color: white;
                        padding: 14px 20px;
                        margin: 8px 0;
                        border: none;
                        cursor: pointer;
                        width: 10%;
                        border-radius: 15px;
                        float: contour;
                        opacity: 0.9;'>Send Message</button>
                <button type="submit"
                        style='background-color:#1a0033;
                        color: white;
                        padding: 14px 20px;
                        margin: 8px 0;
                        border: none;
                        cursor: pointer;
                        width: 10%;
                        opacity: 0.9;
                        float: contour;
                        border-radius: 15px;'>Log Out</button>
            </form>

        </div>
    </center>
    <br>
    <br>
    <br>
    <div style="width:100%;margin: 0 auto;overflow-x: hidden;">
        <div id="displayUsers" style="float: left;width:20%">
        </div>
        <div id="displayResult" style="float: left;width:70%">
        </div>

    </div>

    <script>
        $(document).ready(function ()
        {
            $("#logoutBtn").click(function () {
                $.ajax({
                    url: "regServlet",
                    type: 'get',
                    contentType: 'application/json',
                    error: function (xhr, status, error) {
                        console.log(xhr);
                        console.log(status);
                        console.log(error);
                    }
                });
            });
        });

        $(document).ready(function ()
        {
            $("#sendBtn").click(function () {
                var msg = $("#msgField").val();
                document.getElementById("msgField").value = "";
                var jsonData = {'msgField': msg};
                $.ajax({
                    url: "MsgServlet",
                    type: 'GET',
                    contentType: 'application/json',
                    data: jsonData,
                    error: function (xhr, status, error) {
                        console.log(xhr);
                        console.log(status);
                        console.log(error);
                    }
                });
            });
        });
        function getMsgs()
        {
            $.ajax({
                url: "loginServlet",
                type: 'get',
                contentType: 'application/json',
                dataType: 'json',
                error: function (xhr, status, error) {
                    console.log(xhr);
                    console.log(status);
                    console.log(error);
                },
                success: function (newData)
                {
                    var data2 = '';
                    for (i = 0; i < newData.length; i++)
                    {
                        data2 = data2 + "<tr><td style='padding: 15px;text-align: left;\n\
                        '>"
                                + newData[i].name + " </td> <td style='padding: 15px;\n\
                        text-align: left;'>"
                                + newData[i].status + "</td></tr>";
                    }
                    var start = "<table style='\n\
                        '><tr> <th style='padding: 15px;text-align: left;\n\
                        '>Name</th>\n\
                        <th style='padding: 15px;text-align: left;\n\
                        '> Status </th></tr> ";
                    var end = "</table>";
                    document.getElementById("displayUsers").innerHTML = start + data2 + end;
                }});

            $.ajax({
                url: "MsgServlet",
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                error: function (xhr, status, error) {
                    console.log(xhr);
                    console.log(status);
                    console.log(error);
                },
                success: function (data)
                {
                    var data2 = '';
                    for (i = 0; i < data.length; i++)
                    {
                        data2 = data2 + "<tr><td style='padding: 15px;text-align: left;\n\
                        '>"
                                + data[i].name + " </td> <td style='padding: 15px;\n\
                        text-align: left;'>"
                                + data[i].message + "</td></tr>";
                    }
                    var start = "<table style='\n\
                        '><tr> <th style='padding: 15px;text-align: left;\n\
                        '>Name</th>\n\
                        <th style='padding: 15px;text-align: left;\n\
                        '> Message </th></tr> ";
                    var end = "</table>";
                    document.getElementById("displayResult").innerHTML = start + data2 + end;
                }});
        }
    </script>
</body>
</html>
