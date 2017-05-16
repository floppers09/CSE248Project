<%--
  Created by IntelliJ IDEA.
  User: phil
  Date: 5/13/17
  Time: 12:14 AM
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
    <link href="theme.css?v=0.0.7" rel="stylesheet">
    <link href="homepage/homepage.css" rel="stylesheet">
    <link href="homepage/business/business.css" rel="stylesheet">


    <script src="main.js"></script>
    <script src="homepage/search/search.js"></script>
    <script src="homepage/business/business.js"></script>
    <title>Business</title>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-custom">
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="homepage/"><span class=""></span> Home</a></li>
                <li class="nav-item"><a href="homepage/tickets" class="nav-link active"><span class="glyphicon-envelope"></span>
                    Tickets</a>
                </li>
                <li><a href="homepage/settings"><span class="glyphicon glyphicon-user"></span> Account Settings</a></li>
                <li>
                    <div class="nav navbar-form">
                        <div class="form-group">
                            <input id="searchField" placeholder="Search" class=" Testy form-control searchbar">
                            <button onclick="search()" type="submit" class="Testy btn btnDark">Submit</button>
                        </div>
                    </div>
                </li>
                <li><a href="" onclick="signOut()">Sign Out</a></li>
            </ul>
        </div>
    </nav>
</div>
<br>
<h1 id="noBusiness" class="noBusiness" style="display: none">No Business Found.</h1>
<div id="businessPage" class="container" >

    <div class="business">
        <h2 id="businessName">Business Name</h2>
        <img class="businessImg" src="https://i.imgur.com/1wc10tt.jpg">
        <div class="descriptionItems">
            <p id="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras mauris est, volutpat vel nulla in, sodales consectetur velit. Donec suscipit nisi enim, ut mattis mauris maximus eget. Pellentesque condimentum nulla sit amet nisl feugiat rutrum. Nunc ante enim, pulvinar at metus eu, mattis lacinia justo. Nam sit amet purus orci. In bibendum ultrices eros a aliquam. Nulla ultricies lectus eu augue sed.</p>
        </div>
        <div>
            <h3>Business Hours:</h3>
            <TABLE id="businessHours" class="businessHours">
                <tr>
                    <th width="(100/7)%">Mon</th>
                    <th width="(100/7)%">Tues</th>
                    <th width="(100/7)%">Wed</th>
                    <th width="(100/7)%">Thurs</th>
                    <th width="(100/7)%">Fri</th>
                    <th width="(100/7)%">Sun</th>
                    <th width="(100/7)%">Sat</th>
                </tr>
                <tr>
                    <td id="mon" width="(100/7)%">1</td>
                    <td id="tues" width="(100/7)%">2</td>
                    <td id="wed" width="(100/7)%">3</td>
                    <td id="thurs" width="(100/7)%">4</td>
                    <td id="fri" width="(100/7)%">5</td>
                    <td id="sat" width="(100/7)%">6</td>
                    <td id="sun" width="(100/7)%">7</td>
                </tr>
            </TABLE>
        </div>
    </div>

</div>
</body>
<script>parseURI()</script>
</html>
