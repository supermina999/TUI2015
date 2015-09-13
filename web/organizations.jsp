<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minpermission = 8; 
   int tab = 2; %>
<%@include file = "layout1.jsp"%>
        <center>
            <br><h1>Организации</h1><br>
                <div class="form-group has-feedback" style="width: 50%;">
                        <input type="text" class="form-control" placeholder="Название">
                        <i class="fa fa-search form-control-feedback"></i>
                </div>
        </center>
<%@include file = "layout2.jsp"%>
