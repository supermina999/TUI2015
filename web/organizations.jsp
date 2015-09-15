<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minpermission = 8; 
   int tab = 2; %>
<%@include file = "layout1.jsp"%>
        <center>
            <br><h1>Организации</h1><br>
                <div class="form-group has-feedback" style="width: 50%;">
                        <input type="text" class="form-control" placeholder="Название">
                        <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                        </select>
                        <i class="fa fa-search form-control-feedback"></i>
                        <br>
                        <table class="table table-striped table-bordered">
                        <thead>
                                <tr>
                                    <th style="width: 25%;">Название</th>
                                        <th class="product">Местоположение</th>
                                        <th style="width: 25%;">Вебсайт</th>
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
        </center>
<%@include file = "layout2.jsp"%>
