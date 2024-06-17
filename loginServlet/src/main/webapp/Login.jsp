<%--
  Created by IntelliJ IDEA.
  User: odalw
  Date: 5/26/2024
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>User Login</h1>

<form style="text-align: center" action=login method=post>
<table >
    <tr><td>Enter name:</td> <td>
        <input type=text name=textName>
    </td></tr>
    <tr><td>Enter password:</td><td>
        <input  type=password name=textPass>
   </td></tr>
    <tr><td><input type= submit value=Login></td><td><input type="reset"></td></tr>
</table>
</form>


</body>
</html>
