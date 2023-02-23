<%-- 
    Document   : View All Vacancies
    Created on : Oct 7, 2019, 12:29:56 PM
    Author     : harmony
--%>

<%@page import="model.Applicant"%>
<%@page import="model.Vacancy"%>
<%@page import="model.Company"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Application</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
    <body>
        <%
            String sessionId = (String) request.getAttribute("sessionId");
            String sessionUserName = (String)request.getAttribute("sessionUserName");
            //String vaccancyId = (String)request.getAttribute("vaccancyId");
            
            DbConnection dbobject = new DbConnection();
            
            getServletContext().setAttribute("companyInfo", dbobject.viewCompanyInformation(sessionUserName));
            String[] companyInfo = (String[]) application.getAttribute("companyInfo");
            
            getServletContext().setAttribute("applicationList", dbobject.viewApplicationsByCompany(companyInfo[0]));
            List<Applicant> applicationList = (List<Applicant>) application.getAttribute("applicationList");
            Iterator<Applicant> iterator = applicationList.iterator();
        %>
        
        <div class="row">
            <!--<div class="col s3" style="margin-left: 100px;">->
                <jsp:include page="pageParts/company_header.jsp" flush="false"/>
            <!--</div>-->        
        </div>
            
        <div class="container">
            <div class="row">
                <div class="col s3">
                    <jsp:include page="pageParts/company_left_menu.jsp" flush="false"/>
                </div>                    
            </div>
            <div class="col s9" style="margin-left: 50px;">
               <!-- <form   action="/BoatFacility/AdministratorController?administrator_action=add_boat"  method="post">-->
                    <!--<div class="card">-->

                        <!--<div class="card-content">-->
                            
                            <!--<span class="card-title">Search Company</span>-->
                           <!-- <div class="row">
                                <form   action="/AdminController?admin_action=goToSearchCompany"  method="post">
                                <div class="input-field col s10">
                                    <i class="material-icons prefix">search</i>
                                    <input type="text" class="validate" name="keyword" >
                                    <label for="icon_prefix">Name of Company</label>
                                </div>
                                <div class="col s2">
                                    <input type="hidden" value="<%=sessionId%>" name="sessionId"/>
                                    <button class="btn-floating waves-effect waves-light red btn-large" type="submit"><i class="material-icons">search</i></button>
                                </div>
                            </form>
                            </div>-->
                            
                           <div class="row" style="padding-left: 100px;">
                                <table class="striped bordered highlight centered responsive-table">
                                    <thead>
                                        <tr>
                                            <%=sessionId%>
                                            <%=companyInfo[0]%>
                                            <th data-field="row_number">S/N</th>
                                            <th data-field="applicant_id">Applicant ID</th>
                                            <th data-field="applicant_name">Applicant Name</th>
                                            <!--<th data-field="gender">Gender</th>-->
                                            <th data-field="phone">phone</th>
                                            <th data-field="email">E-mail</th>
                                            <th data-field="invitation_status">Invitation Status</th>
                                            <th data-field="action">Invite</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <%
                                            while (iterator.hasNext()) {
                                                Applicant a = (Applicant) iterator.next();
                                        %>
                                        <tr>
                                            <td><%=a.getRowNumber()%> <%=a.getVacancyId()%></td>
                                            <td><%=a.getApplicantIdNumber()%></td>
                                            <td><%=a.getFirstName()%></td>
                                            <td><%=a.getGender()%></td>
                                            <td><%=a.getPhone()%></td>
                                            <td><%=a.getEmail()%></td>
                                            
                                            <td>
                                                <a class="btn-small waves-effect waves-light 
                                                        <%if (a.getInviteStatus().equals("NOT_INVITED")) {
                                                        %>
                                                        red 
                                                        <%} else {
                                                        %>
                                                        green tooltipped
                                                        <%
                                                            }
                                                        %>
                                                         "                    
                                                         > 
                                                    <%=a.getInviteStatus()%>
                                                </a>
                                                
                                            </td>
                                            <td>
                                                <form method="post" action="/CompanyController?company_action=invite&sessionId=<%=sessionId%>">                                                    
                                                     <input type="hidden" value="<%=a.getApplicantIdNumber()%>" name="applicant_id">  
                                                     <input type="hidden" value="<%=a.getVacancyId()%>" name="vaccancyId">
                                                    <button class="btn-small waves-effect waves-light green" type="submit" name="action">Invite</button>
                                                </form>
                                            </td>
                                            
                                            
                                            
                                            
                                        </tr>
                                    
                                        <%
                                        }
                                        %>
                                    </tbody>
                                    
                                </table>
                            </div>
                                                            
                        <!--</div>-->

                        <!--<div class="card-action"> 
                            <input type="hidden" value="<%=sessionId%>" name="sessionId"/>
                        </div>-->

                   <!-- </div>-->
                <!--</form>-->
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
            
            $(document).ready(function(){
                $('.tooltipped').tooltip();
            });
        </script>
    </body>
</html>
