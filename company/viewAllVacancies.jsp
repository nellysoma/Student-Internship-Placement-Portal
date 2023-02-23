<%-- 
    Document   : View All Vacancies
    Created on : Oct 7, 2019, 12:29:56 PM
    Author     : harmony
--%>

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
        <title>View All Vacancies</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
    <body>
        <%
            String sessionId = (String) request.getAttribute("sessionId");
            String sessionUserName = (String)request.getAttribute("sessionUserName");
            
            DbConnection dbobject = new DbConnection();
            
            getServletContext().setAttribute("companyInfo", dbobject.viewCompanyInformation(sessionUserName));
            String[] companyInfo = (String[]) application.getAttribute("companyInfo");
            
            getServletContext().setAttribute("vacancyList", dbobject.viewAllVacancyByCompany(companyInfo[0]));
            List<Vacancy> vacancyList = (List<Vacancy>) application.getAttribute("vacancyList");
            Iterator<Vacancy> iterator = vacancyList.iterator();
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
            <div class="col s9" style="margin-left: 100px;">
               <!-- <form   action="/BoatFacility/AdministratorController?administrator_action=add_boat"  method="post">-->
                    <div class="card">

                        <div class="card-content">
                            
                            <span class="card-title">Search Company</span>
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
                            
                            <div class="row">
                                <table class="striped bordered highlight centered responsive-table">
                                    <thead>
                                        <tr>
                                            <th data-field="row_number">S/N</th> 
                                            <th data-field="vacancy_id">Vacancy ID</th>
                                            <th data-field="job_title">Job Title</th>
                                            <th data-field="job_description">Job Description</th>
                                            <th data-field="salary">Salary</th>
                                            <th data-field="action">View Applicants</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <%
                                            while (iterator.hasNext()) {
                                                Vacancy v = (Vacancy) iterator.next();
                                        %>
                                        <tr>
                                            <td><%=v.getRowNumber()%></td>
                                            <td><%=v.getVaccancyId()%></td>                                            
                                            <td><%=v.getJobTitle()%></td>
                                            <td><%=v.getJobDescription()%></td>
                                            <td><%=v.getSalary()%></td>
                                            
                                            <td>
                                                <form method="post" action="/CompanyController?company_action=goToViewApplicationsByCompany&sessionId=<%=sessionId%>">                                                    
                                                    <input type="hidden" value="<%=v.getVaccancyId()%>" name="vaccancyId">                                                   
                                                    <button class="btn-small waves-effect waves-light blue" type="submit" name="action">View</button>
                                                </form>
                                            </td>
                                            
                                            
                                            
                                        </tr>
                                    
                                        <%
                                        }
                                        %>
                                    </tbody>
                                    
                                </table>
                            </div>
                                                            
                        </div>

                        <!--<div class="card-action"> 
                            <input type="hidden" value="<%=sessionId%>" name="sessionId"/>
                        </div>-->

                    </div>
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
