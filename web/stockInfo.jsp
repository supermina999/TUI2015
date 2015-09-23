<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0;
   String s = request.getParameter("id");
   Stock stock = new Stock();
   if (s == null)
   {%>
        <script>
         window.location.href = "/";
        </script>
   <% } else {
    stock = Stock.getOne(Integer.parseInt(s));
   }
%>
<%@include file = "layout1.jsp"%>

<br>
    <div class="form-block center-block" style="width: 50%;">
        <center><h2 class="title">Склад № <%=Integer.parseInt(s)%></h2></center>
        <hr>
         <form class="form-horizontal">
        <div class="col-lg-5 col-sm-5">
                <div class="box-style-1 gray-bg team-member">
                    <img src="images/team-member-2.jpg" alt="">
                </div>
        </div>
            <div class="form-group col-sm-7">
                <p style="font-size: 15px;"> <b>Организация:</b> <a href="organizationInfo.jsp?id=<%=stock.getOrganizationId()%>"><%=stock.getOrganizationName()%></a> </p>
                <p style="font-size: 15px;"> <b>Город:</b> <%=stock.getLocation().getCityName()%>, <%=stock.getLocation().getCountryName()%> </p>
                <p style="font-size: 15px;"> <b>Адрес:</b> <%=stock.getLocation().getAddress()%> </p>
                    
            </div>
            <div class="form-group"></div>
        </form>
</div>


<%@include file = "layout2.jsp"%>