<%@ page import="java.time.LocalTime" %>
<%
    String name = "Nico";  // replace with your full name
    int hour = LocalTime.now().getHour();
    String greeting;

    if (hour < 12) {
        greeting = "Good morning, " + name + ", Welcome to COMP367";
    } else {
        greeting = "Good afternoon, " + name + ", Welcome to COMP367";
    }
%>
<!DOCTYPE html>
<html>
<body>
<h1><%= greeting %></h1>
</body>
</html>
