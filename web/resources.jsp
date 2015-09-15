<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 3; %>
<%@include file = "layout1.jsp"%>
    <center>
        <br><h1>Ресурсы</h1>
        
        <h2>Ресурсы в наличии</h2>
        <div class="form-group has-feedback" style="width: 60%;">
            <div class="gray-bg">
                <br>
                <div class="col-md-4">
                    <input type="text" class="form-control" placeholder="Название" style="width: 105%;">
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 105%;">
                            <option>Выберите город</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 100%;">
                            <option>Выберите склад</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                    </select>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 25%;">Название</th>
                        <th style="width: 25%;">Город</th>
                        <th style="width: 25%;">Склад</th>
                        <th style="width: 25%;">Количество</th>
                    </tr>
                </thead>
                <tbody>
                                <tr>
                                        <td class="quantity">2 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.4 Smartphone</a><span class="small">4.7" Dual Core 1GB</span></td>
                                        <td class="amount">$199.00</td>
                                        <td class="amount">$199.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.2 Tablet</a><span class="small">7.3" Quad Core 2GB</span></td>
                                        <td class="amount">$299.00</td>
                                        <td class="amount">$199.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Desktop PC</a><span class="small">Quad Core 3.2MHz, 8GB RAM, 1TB Hard Disk</span></td>
                                        <td class="amount">$1499.00</td>
                                        <td class="amount">$199.00</td>
                                </tr>
                </tbody>
            </table>
        </div>
        <h2>Требующиеся ресурсы</h2>
        <div class="form-group has-feedback" style="width: 60%;">
            <div class="gray-bg">
                <br>
                <div class="col-md-4">
                    <input type="text" class="form-control" placeholder="Название" style="width: 105%;">
                    <i class="fa fa-search form-control-feedback"></i>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 105%;">
                            <option>Выберите город</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <select class="form-control" style="width: 100%;">
                            <option>Выберите пункт выдачи</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                    </select>
                </div>
                <br><br><br>
            </div> <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 25%;">Название</th>
                        <th style="width: 25%;">Город</th>
                        <th style="width: 25%;">Пункт выдачи</th>
                        <th style="width: 25%;">Количество</th>
                    </tr>
                </thead>
                <tbody>
                                <tr>
                                        <td class="quantity">2 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.4 Smartphone</a><span class="small">4.7" Dual Core 1GB</span></td>
                                        <td class="amount">$199.00</td>
                                        <td class="amount">$199.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Android 4.2 Tablet</a><span class="small">7.3" Quad Core 2GB</span></td>
                                        <td class="amount">$299.00</td>
                                        <td class="amount">$199.00</td>
                                </tr>
                                <tr>
                                        <td class="quantity">3 x</td>
                                        <td class="product"><a href="shop-product.html">Desktop PC</a><span class="small">Quad Core 3.2MHz, 8GB RAM, 1TB Hard Disk</span></td>
                                        <td class="amount">$1499.00</td>
                                        <td class="amount">$199.00</td>
                                </tr>
                </tbody>
            </table>
        <a href="addResource.jsp" class="btn btn-default btn-lg">Добавить ресурс </a>
        <a href="transitResource.jsp" class="btn btn-default btn-lg">Перевезти ресурс</a>
        <a href="addNeededResource.jsp" class="btn btn-default btn-lg">Добавить требующийся ресурс</a>
            
        </div>
    </center>
    
<%@include file = "layout2.jsp"%>
