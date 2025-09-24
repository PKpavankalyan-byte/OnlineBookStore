<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.login{
		 padding: 10px 20px;
            background: green;
            color: white;
            text-decoration: none; /* remove underline */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
		}
		.login:hover{
		background:darkgreen;
		}
		 body {
            display: flex;
            justify-content: center;   /* horizontal center */
            align-items: center;       /* vertical center */
            height: 100vh;             /* full page height */
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            margin: 20px auto;
            width: 400px;
        }
        td {
            padding: 10px;
        }
        th {
            text-align: left;
            padding: 10px;
            background-color: #f2f2f2;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 95%;
            padding: 8px;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background: green;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: darkgreen;
        }
    </style>
</head>
<body>
	<form action="register" method="post">
        <table border="1">
            <tr>
                <th colspan="2" style="text-align: center;">User Registration</th>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td><input type="text" name="fullname" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <input type="radio" name="gender" value="Male" required> Male
                    <input type="radio" name="gender" value="Female"> Female
                </td>
            </tr>
            <tr>
            	<td>City:</td>
            	<td>
            		<select name="city" style="align: center;">
            			<option>Select City</option>
            			<option>Hyderabad</option>
            			<option>Banglore</option>
            			<option>Mumbai</option>
            			<option>Pune</option>
            		</select>
            	</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" value="Register">
                </td>
            </tr>
            <tr>
            <td><p style="color:orange">If already registered &#128073; &nbsp; </p></td>
            <td><a href="login.jsp" class="login">Login</a></td>
            </tr>
        </table>
    </form>
</body>
</html>