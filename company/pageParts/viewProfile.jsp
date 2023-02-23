<%-- 
    Document   : viewProfile
    Created on : Oct 5, 2019, 6:52:53 PM
    Author     : harmony
--%>

<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="pageParts/meta.jsp"/>
        <title>My Profile</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
    <body>
        <%
            String sessionId = (String)request.getAttribute("sessionId");           
            String sessionUserName = (String)request.getAttribute("sessionUserName");
            
            DbConnection dbobject = new DbConnection();            
            
            getServletContext().setAttribute("companyInfo", dbobject.viewCompanyInformation(sessionUserName));
            String[] companyInfo = (String[]) application.getAttribute("companyInfo");
            
        %>
        <div class="row">
            <jsp:include page="pageParts/company_header.jsp"/>
        </div>
        <div class="row">

            <div class="col m12">

                <jsp:include page="pageParts/company_left_menu.jsp" flush="false"/>

                <div class="col m9"> 

                    <div class="col m12">
                        <ul class="tabs">
                            <li class="tab col m3"><a class="active" href="#personal">Profile/Contact</a></li>                                                          
                        </ul>   
                    </div>

                    <div id="personal" class="col s12" style="padding-top: 15px;">                           
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td>Company ID</td>
                                            <td><%=companyInfo[0]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Company Name</td>
                                            <td><%=companyInfo[1]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>RC Number</td>
                                            <td><%=companyInfo[2]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Address</td>
                                            <td><%=companyInfo[3]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Industry</td>
                                            <td><%=companyInfo[4]%></td>                                        
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td>Phone</td>
                                            <td><%=companyInfo[5]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Verification Status</td>
                                            <td><%=companyInfo[6]%></td>                                        
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>                       
                    </div>
                </div>

            </div>
        </div>
        <br/>
        <br/>
        <br/>
        <jsp:include page="pageParts/footer.jsp"/>
    </body>
    <jsp:include page="pageParts/js.jsp"/>
    <script>
        $(document).ready(function () {
            $('.tabs').tabs();
        });
    </script>
</html>
