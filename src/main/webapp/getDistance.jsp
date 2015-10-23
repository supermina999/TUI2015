<%@page contentType="text/html" pageEncoding="UTF-8"%><%
    double x1 = Double.parseDouble(request.getParameter("x1"));
    double y1 = Double.parseDouble(request.getParameter("y1"));
    double x2 = Double.parseDouble(request.getParameter("x2"));
    double y2 = Double.parseDouble(request.getParameter("y2"));
%><%= maps.Map.getDistance(maps.Map.getNodeByCoord(x1, y1),
        maps.Map.getNodeByCoord(x2, y2), 0) %>