<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minpermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
    <center>
        <br><h1>Ресурсы</h1><br>
        <br><h2>Ресурсы в наличии</h2><br>
        <div style="width: 50%;">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Название</th>
                        <th>Город</th>
                        <th>Склад</th>
                        <th>Количество</th>
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
                                <tr>
                                        <td class="total-quantity" colspan="2">Total 8 Items</td>
                                        <td class="total-amount">$1997.00</td>
                                </tr>
                </tbody>>
            </table>
        </div>
        <br><h2>Нужные ресурсы</h2><br>
        <div style="width: 50%;">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Название</th>
                        <th>Город</th>
                        <th>Склад</th>
                        <th>Количество</th>
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
                                <tr>
                                        <td class="total-quantity" colspan="2">Total 8 Items</td>
                                        <td class="total-amount">$1997.00</td>
                                </tr>
                </tbody>
            </table>
        </div>
        <a href="addResource.jsp" class="btn btn-default btn-lg">Добавить ресурс</a>
        <a href="transitResource.jsp" class="btn btn-default btn-lg">Перевезти ресурс</a>
        <a href="addNeededResource.jsp" class="btn btn-default btn-lg">Добавить нужный ресурс</a>
    </center>
    
<%@include file = "layout2.jsp"%>
