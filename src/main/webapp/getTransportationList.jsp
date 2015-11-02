<%@page import="java.util.ArrayList"%><%@page import="models.*"%><%@page contentType="text/plain" pageEncoding="UTF-8"%><%
    
    int id = Integer.parseInt(request.getParameter("id"));
    DBEntry[] params = {
        new DBEntry("person_id", EntryType.Int, id)
    };
    Transport[] transports = Transport.getAll(params);
    ArrayList<Transportation> transArr = new ArrayList<>();
    params[0].name = "transport_id";
    for (Transport tr : transports)
    {
        params[0].setValue(tr.getId());
        Transportation[] buf = Transportation.getAll(params);
        for (Transportation buf2 : buf)
        {
            transArr.add(buf2);
        }
    }
    for (Transportation transportation: transArr)
    {
    if (transportation != null) {
    Request req = Request.getOne(transportation.getRequestId());
%><%=transportation.getRequestId()%>
<%=transportation.getRequestType()%>
<%=transportation.getResourceNumber()+transportation.getResourceMeasureName()+" "+transportation.getResourceTypeName()%>
<%=Transport.getOne(transportation.getTransportId()).getName()%>
<%=Transport.getOne(transportation.getTransportId()).getNumber()%>
<%=req.getDateString()%>
<%=transportation.getTimeStart()%>
<%=transportation.getTimeFinish()%>
<%=transportation.getStockId()%>
<%=transportation.getStockLocation().getAddress()%>
<%=transportation.getFinishLocation().getAddress()%>
<%=transportation.getSafetyName()%>
<%
} else {
%><%="error"%><%
    }
    %>////<%
    }
%>