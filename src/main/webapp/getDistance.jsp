<%@page contentType="text/html" pageEncoding="UTF-8"%><%
    int node1 = Integer.parseInt(request.getParameter("node1"));
    int node2 = Integer.parseInt(request.getParameter("node2"));
%><%= maps.Map.getDistance(node1, node2, 0) %>