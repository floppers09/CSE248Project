<%--
  Created by IntelliJ IDEA.
  User: phil
  Date: 5/9/17
  Time: 10:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="../../">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%--bootstrap core--%>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--bootstrap theme--%>
    <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" rel="stylesheet">

    <link href="w3.css" rel="stylesheet">
    <link href="theme.css" rel="stylesheet">

    <script src="main.js"></script>
    <script src="homepage-establishment/settings/settings.js"></script>
    <title>Settings</title>
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="homepage-establishment/business">Buissness Name</a>
        </div>
        <ol class="nav navbar-nav">
            <li><a href="homepage-establishment/">Home</a></li>
            <li><a href="homepage-establishment/eventEditor/">Create Event</a></li>
            <li><a href="#">View Planned Events</a></li>
            <li><a href="homepage-establishment/employees/">Manage Employees</a></li>
            <li><a href="#">Finances</a></li>
            <li class="active"><a disabled="true">Account Settings</a></li>
            <li><a href="" onclick="signOut()">Sign Out</a></li>
        </ol>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <form action="" method="post" class="form-signin">
                <h2>Change Password</h2>
                <input type="password" id="old-password" class="form-control" placeholder="Old Password" name="password">
                <input type="password" id="password" class="form-control" placeholder="New Password" name="password">
                <input type="password" id="password-confirm" class="form-control" placeholder="Retype new Password" name="password-confirm">
                <button type="button" class="btn btnDark" onclick="sendChangePasswordRequest()">Change Password</button>
            </form>
        </div>
        <div class="col-sm-6">
            <form action="" method="post" class="form-signin">
                <h2>Business Info</h2>
                <p>Business Name</p>
                <input type="text" id="name" name="name" class="form-control" placeholder="Business Name">
                <p>Business Phone Number</p>
                <input type="number" id="phone" name="phone" class="form-control" placeholder="Phone Number">
                <p>Business Address</p>
                <input type="text" id="address" name="address" class="form-control" placeholder="Street Address">
                <input type="number" id="zip" name="zip" class="form-control" placeholder="Zip Code">
                <input type="text" id="imageSrc" name="imageSrc" class="form-control" placeholder="Image">
                <button type="button" class="btn btnDark" onclick="">Update Info</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
