<%-- 
    Document   : index
    Created on : Aug 8, 2017, 12:19:30 PM
    Author     : Ishanka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spices-Nishan products</title>
<!--        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>-->
    </head>
    <body>
        <form method="post" action="login.jsp">
            <center>
                <table border="1" width="30%" cellpadding="3">
                    <thead>
                        <tr>
                            <th colspan="2">Login Here</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>User name</td>
                            <td><input type="text" name="uname" value="" /></td>
                        </tr>

                        <tr>
                            <td>Password</td>
                            <td><input type="password" name="pass" value="" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Login" /></td>
                            <td><input type="reset" value="Reset" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Yet Not Registered!! <a href="reg.jsp">Register Here</a></td>
                        </tr>
                    </tbody>
                </table>
            </center>

        </form>

<!--        <button class="btn btn-info">test</button>-->
    </body>
</html>
