<%-- 
    Document   : search_boat_result
    Created on : Jul 4, 2019, 1:10:48 PM
    Author     : harmony
--%>

<%@page import="model.Company"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Boat Result</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
    <body>
        <%
            String sessionId = (String) request.getAttribute("sessionId");
            
            List<Company> companySearchList = (List<Company>) request.getAttribute("companySearchList");
            Iterator<Company> iterator = companySearchList.iterator();
        %>
        
        <div class="row">
            <div class="col s3" style="margin-left: 100px;">
                <jsp:include page="pageParts/admin_header.jsp" flush="false"/>
            </div>        
        </div>  
            
            <div class="container">
                <div class="row">
                    <div class="col s3">
                        <jsp:include page="pageParts/admin_left_menu.jsp" flush="false"/>
                    </div>                    
                </div>
                    
                    <div class="col s9" style="margin-left: 100px;">
                        <div class="card">
                            <div class="card-content">
                                <span class="card-title">Search Company</span>
                                <div class="row">
                                    <form   action="/AdminController?admin_action=goToSearchCompany"  method="post">
                                        <div class="input-field col s10">
                                            <i class="material-icons prefix">search</i>
                                            <input type="text" class="validate" name="keyword" >
                                            <label for="icon_prefix">Name of Company</label>
                                        </div>
                                        <div class="col s2">
                                            <button class="btn-floating waves-effect waves-light red btn-large" type="submit"><i class="material-icons">search</i></button>
                                        </div>
                                    </form>
                                </div>
                                
                                <div class="row">
                                    <table class="striped bordered highlight centered responsive-table">
                                        <thead>
                                            <tr>
                                                <th data-field="row_number">S/N</th>
                                                <th data-field="company_id">Company ID</th>
                                                <th data-field="company_name">Company Name</th>
                                                <th data-field="rc_number">RC Number</th>
                                                <th data-field="verification_status">Verification Status</th>
                                                <th data-field="action">Action</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                        <%
                                            while (iterator.hasNext()) {
                                                Company c = (Company) iterator.next();
                                        %>
                                        <tr>
                                            <td><%=c.getRowNumber()%></td>
                                            <td><%=c.getCompanyId()%></td>
                                            <td><%=c.getCompanyName()%></td>
                                            <td><%=c.getRcNumber()%></td>
                                            <td>
                                                <a class="btn-small waves-effect waves-light 
                                                        <%if (c.getVerificationStatus().equals("VERIFIED")) {
                                                        %>
                                                        green
                                                        <%} else {
                                                        %>
                                                        red tooltipped
                                                        <%
                                                            }
                                                        %>
                                                         "                                  
                                                         href="
                                                         <%if (c.getVerificationStatus().equals("VERIFIED")) {
                                                         %>
                                                         #
                                                         <%} else {
                                                         %>
                                                         http://www.publicsearch.cac.gov.ng/ComSearch/index.php
                                                         <%
                                                             }
                                                         %>                                                        
                                                         " 
                                                         target="_blank"
                                                         data-tooltip="Click to Verify"> 
                                                    <%=c.getVerificationStatus()%>
                                                </a>
                                                
                                            </td>
                                            <td>
                                                <button id="action_button" class="btn-floating btn-small waves-effect waves-light red dropdown-trigger" data-target="12"><i class="material-icons">menu</i></button> 
                                                <ul id="12" class="dropdown-content">
                                                    <li>
                                                    <center><button class="btn-small waves-effect waves-light green"><i class="material-icons">view_agenda</i> View</button></center>
                                                    </li>
                                                    <li>
                                                        <form method="post" action="/AdminController?admin_action=viewCompanyToUpdate&sessionId=<%=sessionId%>">
                                                            <input type="hidden" value="<%=c.getCompanyId()%>" name="companyId">
                                                            <input type="hidden" value="<%=c.getCompanyName()%>" name="companyName">
                                                            <input type="hidden" value="<%=c.getRcNumber()%>" name="rcNumber">
                                                            <input type="hidden" value="<%=c.getAddress()%>" name="address">                                                                                                                                           <input type="hidden" value="<%=c.getAddress()%>" name="address">
                                                            <input type="hidden" value="<%=c.getEmail()%>" name="email">
                                                            <input type="hidden" value="<%=c.getPhone()%>" name="phone">
                                                            <input type="hidden" value="<%=c.getIndustry()%>" name="industry">
                                                            <input type="hidden" value="<%=c.getVerificationStatus()%>" name="verificationStatus">
                                                            <center><button class="btn-small waves-effect waves-light green"><i class="material-icons">edit</i> Edit</button></center>
                                                        </form>
                                                    </li>
                                                    <li>
                                                    <center><button class="btn-small waves-effect waves-light red"><i class="material-icons">delete</i>Delete</button></center>
                                                    </li>
                                                </ul>
                                            </td>
                                        </tr>
                                    
                                        <%
                                        }
                                        %>
                                    </tbody>
                                        
                                    </table>
                                </div>
                                
                            </div>
                        </div>
                    </div>    
            </div>
            
            
        <jsp:include page="pageParts/js.jsp" flush="false"/>    
        <script>
            $(document).ready(function () {
                $('.collapsible').collapsible();
            });

            $(document).ready(function () {
                $('.sidenav').sidenav();
            });
            
            $(document).ready(function(){
                $('#action_button').dropdown({hover: true});
            });
            
            $('.dropdown-trigger').dropdown({hover: true});
        </script>
    </body>
</html>
