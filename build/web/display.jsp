<%-- 
    Document   : jsp1
    Created on : Feb 11, 2018, 2:15:46 PM
    Author     : Eman-PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body onload="setInterval('getMsgs()', 5000)">
        <form method=get action="MainServlet">
            <br> Name: &nbsp; &nbsp; <input type=text id=nameField>
            <br> Message: &nbsp; &nbsp; <input type=text id=msgField> 
            <input type="button" id="sendBtn" value=Send>
        </form>
        <br>
        <br>
        <br>
        <div id="displayResult">
        </div>

        <script>

            $(document).ready(function ()
            {
                $("#sendBtn").click(function () {
                    var name = $("#nameField").val();
                    var msg = $("#msgField").val();
                    var jsonData = {'nameField': name, 'msgField': msg};

                    $.ajax({
                        url: "MainServlet",
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
                    url: "MainServlet",
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
                            data2 = data2 + "<tr><td>" + data[i].name + "</td> <td>" + data[i].message + "</td></tr>";
                        }
                        var start = "<table><tr><th>Name</th><th>Message</th></tr>";
                        var end = "</table>";
                        document.getElementById("displayResult").innerHTML = start + data2 + end;
                    }});
            }
        </script>

    </body>
</html>