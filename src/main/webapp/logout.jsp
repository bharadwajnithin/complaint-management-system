<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%
    session.invalidate(); // End the session
    response.sendRedirect("login.jsp"); // Redirect to login page
%>
