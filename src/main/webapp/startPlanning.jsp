<%@page import="maps.Planner"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.ApplicationController"%>
<%
    int tab = 0;
%>
<%@include file = "layout1.jsp"%>

<%
    new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(new Date());
                    calendar.add(Calendar.DAY_OF_MONTH, 1);
                    Planner.createPlan(calendar.getTime());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
%>
<script>
    window.location.href = "calculationControlPanel.jsp";
</script>

<%@include file = "layout2.jsp"%>