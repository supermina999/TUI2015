<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% int minPermission = 8; 
   int tab = 0; 
   String s = request.getParameter("id");
   Organization[] organization = Organization.getAll(null);
   City[] city = City.getAll(null);
   Permission[] permission = Permission.getAll(null);
   Person person = new Person();
   if (s == null)
   {%>
        <script>
         window.location.href = "index.jsp";
        </script>
    <%} else {
        int i = Integer.parseInt(s);
        person = Person.getOne(i);
   }
%>
<%@include file = "layout1.jsp"%>

<br>
    <div class="form-block center-block">
        <center><h2 class="title">Измененить личную информацию</h2></center><br>
        <form class="form-horizontal" method="post" action="updateUserInfo.jsp?id=<%=Integer.parseInt(s)%>">
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Логин </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="login" required value="<%=person.getLogin()%>">
                                <i class="fa fa-user form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Старый пароль </label>
                        <div class="col-sm-8" id="divPassOld">
                                <input type="password" class="form-control" name="passwordOld" id="passwordOld" required>
                                <i class="fa fa-lock form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Новый пароль </label>
                        <div class="col-sm-8" id="divPass1">
                                <input type="password" class="form-control" name="password1" id="password1" required>
                                <i class="fa fa-lock form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Повторите пароль </label>
                        <div class="col-sm-8" id="divPass2">
                                <input type="password" class="form-control" name="password2" id="password2" required>
                                <i class="fa fa-lock form-control-feedback"></i>
                        </div>
                </div> <br>
                
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Организация</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;" name="organization_id">
                                <%for (int i = 0; i < organization.length; i++)
                                {%>
                                    <option value="<%=organization[i].getId()%>" <% if (person.getOrganizationId() == i+1) {%> selected <% } %>> <%=organization[i].getName()%></option>
                                <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Должность</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;" name="permission_id">
                                <%for (int i = 0; i < permission.length; i++)
                                {%>
                                    <option value="<%=permission[i].getId()%>" <% if (person.getPermissionId() == i+1) {%> selected <% } %>><%=permission[i].getName()%></option>
                                <%}%>
                        </select>
                    </div>
                </div>
                
                <br>
                
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Фамилия </label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" name="surname" required value="<%=person.getSurname()%>">
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Имя </label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" name="name" required value="<%=person.getName()%>">
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Отчество </label>
                        <div class="col-sm-8">
                                <input type="text" class="form-control" name="second_name" required value="<%=person.getSecondName()%>">
                                <i class="fa fa-pencil form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Город</label>
                    <div class="col-sm-8">
                        <select class="form-control" style="width: 100%;" name="city_id">
                                <%for (int i = 0; i < city.length; i++)
                                {%>
                                    <option value="<%=city[i].getId()%>" <% if (person.getCityId() == i+1) {%> selected <% } %>><%=city[i].getName()%></option>
                                <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label class="col-sm-3 control-label">Адрес</label>
                    <div class="col-sm-8">
                            <input type="text" class="form-control" required name="address" value="<%=person.getAddress()%>">
                            <i class="fa fa-map-marker form-control-feedback"></i>
                    </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Email </label>
                        <div class="col-sm-8">
                                <input type="email" class="form-control" name="email" required value="<%=person.getEmail()%>">
                                <i class="fa fa-envelope form-control-feedback"></i>
                        </div>
                </div>
                <div class="form-group has-feedback">
                        <label class="col-sm-3 control-label">Телефон </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="phone" required value="<%=person.getPhone()%>">
                                <i class="fa fa-phone form-control-feedback"></i>
                        </div>
                </div>
                
                <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-8">
                                <input class="btn btn-block btn-default" type="submit" name="submit" value="Готово">
                        </div>
                </div>
            
            </form>
        </div>
<script src="js/checker.js"></script>
<%@include file = "layout2.jsp"%>