<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.assign1.model.Registration" %>
<% Registration r = (Registration) request.getAttribute("registration"); %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Registration Successful</title></head>
<body>
<h1>Registration Successful</h1>
<table border="1" cellpadding="6">
  <tr><td>User id</td><td><%= r.getUserId() %></td></tr>
  <tr><td>Name</td><td><%= r.getName() %></td></tr>
  <tr><td>Address</td><td><%= r.getAddress() %></td></tr>
  <tr><td>Country</td><td><%= r.getCountry() %></td></tr>
  <tr><td>ZIP Code</td><td><%= r.getZip() %></td></tr>
  <tr><td>Email</td><td><%= r.getEmail() %></td></tr>
  <tr><td>Sex</td><td><%= r.getSex() %></td></tr>
  <tr><td>Language</td><td><%= r.getLanguagesAsString() %></td></tr>
  <tr><td>About</td><td><%= r.getAbout() %></td></tr>
</table>
<p><a href="index.jsp">Back to form</a></p>
</body>
</html>