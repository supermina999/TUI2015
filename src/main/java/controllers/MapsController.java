package controllers;

import javax.servlet.http.HttpServletRequest;

public class MapsController {
    public static void updateSafety(HttpServletRequest request) throws Exception
    {
        double x1 = Double.parseDouble(request.getParameter("x1"));
        double y1 = Double.parseDouble(request.getParameter("y1"));
        double x2 = Double.parseDouble(request.getParameter("x2"));
        double y2 = Double.parseDouble(request.getParameter("y2"));
        int safety = Integer.parseInt(request.getParameter("safety"));
        int node1 = maps.Map.getNodeByCoord(x1, y1);
        int node2 = maps.Map.getNodeByCoord(x2, y2);
        maps.Path path = maps.Map.getDistance(node1, node2, 100);
        maps.Map.setSafetyOnPath(path, safety);
    }
}
