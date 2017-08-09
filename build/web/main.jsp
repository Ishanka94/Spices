<%@include file="common/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!--checked user logged in -->
<%
    if (session.getAttribute("userid") == null || session.getAttribute("userid") == "") {
%>
You are not logged in<br/>
<a href="index.jsp">Please login</a>


<div>
    <%} else {%>
    You are logged in as <span style="color: red;"> <%= session.getAttribute("userid")%></span>

    <% }%> 
    <br/>
    <h3>Available spices</h3>
</div>

<!-- database connection using jstl -->

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost/spice"
                   user="root" password=""/>

<!-- display details of spices here -->
<div class="col-md-12">
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">Chillie powder</a></li>
        <li><a data-toggle="tab" href="#menu1">Turmeric powder</a></li>
        <li><a data-toggle="tab" href="#menu2">Pepper</a></li>
        <li><a data-toggle="tab" href="#menu3">Curry powder</a></li>
    </ul>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <sql:query dataSource="${snapshot}" var="result">
                select * from chillie;
            </sql:query>
                <table class="table table-striped" id="chilTable">
                <thead>
                    <tr>
                        <th>Size</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Last updated</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items = "${result.rows}">
                        <tr>                           
                            <td><c:out value="${row.size}" /></td>
                            <td><c:out value="${row.qty}" /></td>
                            <td><c:out value="${row.price}" /></td>
                            <td><c:out value="${row.addedOn}" /></td>
                            <td><button class="btn btn-info btn-sm" data-toggle="modal" data-target='#<c:out value="${row.id + 10}" />'>Edit</button></td>
                               
                            
                    <div id='<c:out value="${row.id + 10}" />' class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Modal Header</h4>
                                </div>
                                <div class="modal-body">
                                    <c:out value="${row.size}" /><br/>
                                    <input type="hidden" name="chilId" id='<c:out value="${row.id}" />' value='<c:out value="${row.id}" />' />
                                    <label>Quantity:</label><input type="text" name="qty" id='<c:out value="${row.id + 50}" />' value="<c:out value="${row.qty}" />" /><br/>
                                    <label>Price</label><input type="text" name="price" id='<c:out value="${row.id + 100}" />' value="<c:out value="${row.price}" />"/>
                                    
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-default" id='<c:out value="${row.size}" />'>Save</button>
                                </div>
                            </div>

                        </div>
                    </div>
                 
                        </tr>
                      <script>
                        $(document).ready(function(){
                           $('#<c:out value="${row.size}" />').click(function(){
                               var MyRows = $('table#chilTable').find('tbody').find('tr');
                               //alert("check1");
                               var id = parseInt($('#<c:out value="${row.id}" />').val()) - 1;
                               //var size = $("#csize").val();
                               var qty = $('#<c:out value="${row.id + 50}" />').val();
                               var price = $('#<c:out value="${row.id + 100}" />').val();
                               var newId = id + 1;
                               //alert(id);
                               //$(MyRows[id]).find('td:eq(0)').html(size);
                               $(MyRows[id]).find('td:eq(1)').html(qty);
                               $(MyRows[id]).find('td:eq(2)').html(price);
                               
                               $.get('ChillieServlet',{
                                   quantity: qty, cprice: price, nId: newId}, function(res){
                                        $(MyRows[id]).find('td:eq(3)').html(res);
                                        alert("done");
                                   });
                               $('#<c:out value="${row.id + 10}" />').modal('hide');
                               
                               
                           }); 
                        });
                            
                        
                    </script>        
                    </c:forEach>
                </tbody>
            </table>
           
        </div>
                            <div id="menu1" class="tab-pane fade">
                                <h3>Menu 1</h3>
                                <p>Some content in menu 1.</p>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <h3>Menu 2</h3>
                                <p>Some content in menu 2.</p>
                            </div>
                        </div>
                    </div>

                    <%@include file="common/footer.jsp" %>
                    
                        