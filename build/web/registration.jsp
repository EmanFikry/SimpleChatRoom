<%-- 
    Document   : registration
    Created on : Feb 23, 2018, 10:18:20 AM
    Author     : Eman-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body style='font-family: Arial, Helvetica, sans-serif;color: #1a0033; background-size: 100%;
          background-image: url("http://backgroundcheckall.com/wp-content/uploads/2017/12/blue-and-white-background-hd-13.jpg");background-repeat: no-repeat'>
        <c:if test="${sessionScope.userName != null}">
            <c:redirect url = "signin.jsp"/>
        </c:if>
    <center>
        <img src="http://www.pvhc.net/img46/xqdlffilkombldcjqjyg.png" 
             alt="Chat" style="width:300px;height:200px">
    </center>
    <div>
        <center>
            <form method=post action="regServlet">
                <div>
                    <h1>Sign Up</h1>
                    <label for="uname"><b>Name</b></label>
                    <br>
                    <input type="text" placeholder="Enter Name" name="uname" 
                           style=' width: 30%;
                           padding: 15px;
                           margin: 5px 0 22px 0;
                           display: inline-block;
                           border: none;
                           border-radius: 15px;
                           background: #e6f2ff;' value="${registerationName}" 
                           required>
                    <br>
                    <br>
                    <label for="uemail"><b>Email</b></label>
                    <br>
                    <input type="text" placeholder="Enter Email" name="uemail"
                           style=' width: 30%;
                           padding: 15px;
                           margin: 5px 0 22px 0;
                           display: inline-block;
                           border: none;
                           border-radius: 15px;
                           background: #e6f2ff;' value="${registerationEmail}"
                           required>
                    <br>
                    <label id="error">${registerationMsg}</label>
                    <br>
                    <label for="upsw"><b>Password</b></label>
                    <br>
                    <input type="password" placeholder="Enter Password" name="upsw"
                           style=' width: 30%;
                           padding: 15px;
                           margin: 5px 0 22px 0;
                           display: inline-block;
                           border: none;
                           border-radius: 15px;
                           background: #e6f2ff;'
                           required>
                    <br>
                    <div>
                        <button type="submit" 
                                style='background-color:#1a0033;
                                color: white;
                                padding: 14px 20px;
                                margin: 8px 0;
                                border: none;
                                cursor: pointer;
                                width: 10%;
                                border-radius: 15px;
                                opacity: 0.9;'>Sign Up</button>
                    </div>
                </div>
            </form>
        </center>
    </div>
    <c:remove var="registerationMsg" scope="application" />
    <c:remove var="registerationName" scope="application" />
    <c:remove var="registerationEmail" scope="application" />

</body>
</html>
