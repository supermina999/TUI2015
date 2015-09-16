<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0; %>
<%@include file = "layout1.jsp"%>
<br>
    <div class="form-block center-block" style="width: 50%;">
        <center><h2 class="title">Название</h2></center>
        <hr>
         <form class="form-horizontal">
        <div class="col-lg-4 col-sm-4">
                <div class="box-style-1 gray-bg team-member">
                    <img src="images/old_logo.png" alt="">
                </div>
        </div>
            <div class="form-group col-sm-7">
                <p style="font-size: 20px;"> <b>Адрес:</b> ляляля </p>
                <p style="font-size: 20px;"> <b>Вебсайт:</b> thebest.com </p>
                <p style="font-size: 20px;"> <b>Волонтеры:</b> 17 </p> 
                    
            </div>
            <div class="form-group"></div>
            <div class="gray-bg">
                        <br>
                        <div class="col-md-8">
                            <input type="text" class="form-control" placeholder="ФИО" style="width: 105%;">
                            <i class="fa fa-search form-control-feedback"></i>
                        </div>
                        <div class="col-md-4">
                            <select class="form-control" style="width: 100%;">
                                    <option>Выберите город</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                            </select>
                        </div>
                        <br><br><br>
                    </div>
                    <br>
                        <table class="table table-bordered">
                        <thead>
                                <tr>
                                    <th style="width: 50%;">ФИО</th>
                                        <th style="width: 25%;">Телефон</th>
                                        <th style="width: 25%;">Email</th>
                                </tr>
                        </thead>
                        <tbody>
                                <tr>
                                        <td class="quantity">2 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.4 Smartphone</a><span class="small">4.7" Dual Core 1GB</span></td>
                                        <td class="amount">$199.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.2 Tablet</a><span class="small">7.3" Quad Core 2GB</span></td>
                                        <td class="amount">$299.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Desktop PC</a><span class="small">Quad Core 3.2MHz, 8GB RAM, 1TB Hard Disk</span></td>
                                        <td class="amount">$1499.00</td>
                                </tr>
                        </tbody>
                        </table>
        </form>
</div>


<%@include file = "layout2.jsp"%>