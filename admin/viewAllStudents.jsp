<%-- 
    Document   : view_all_boats
    Created on : Jun 27, 2019, 12:21:56 PM
    Author     : harmony
--%>

<%@page import="model.Applicant"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View All Students</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
    <body>
        <%
            String sessionId = (String) request.getAttribute("sessionId");
            DbConnection dbobject = new DbConnection();

            getServletContext().setAttribute("applicantList", dbobject.viewAllApplicants());
            List<Applicant> applicantList = (List<Applicant>) application.getAttribute("applicantList");
            Iterator<Applicant> iterator = applicantList.iterator();
        %>

        <div class="row">           
            <jsp:include page="pageParts/admin_header.jsp" flush="false"/>             
        </div>

        <div class="container">
            <div class="row">
                <div class="col s3">
                    <jsp:include page="pageParts/admin_left_menu.jsp" flush="false"/>
                </div>                    
            </div>
            <div class="col s9" style="margin-left: 100px;">               
                <span style="padding-left: 50px;">Search Student</span>
                <div class="row" style="padding-left: 50px;">
                    <form   action="/AdminController?admin_action=goToSearchCompany"  method="post">
                        <div class="input-field col s10">
                            <i class="material-icons prefix">search</i>
                            <input type="text" class="validate" name="keyword" >
                            <label for="icon_prefix">Name of Student</label>
                        </div>
                        <div class="col s2">
                            <input type="hidden" value="<%=sessionId%>" name="sessionId"/>
                            <button class="btn-floating waves-effect waves-light red btn-large" type="submit"><i class="material-icons">search</i></button>
                        </div>
                    </form>
                </div>

                <div class="row" style="padding-left: 50px;">
                    <table class="striped bordered highlight centered responsive-table">
                        <thead>
                            <tr>
                                <th data-field="row_number">S/N</th>
                                <th data-field="student_id">ID</th>
                                <th data-field="student_name">Name</th>
                                <th data-field="email">E-Mail</th>
                                <th data-field="reg_number">Reg Number</th>
                                <th data-field="exam_type">Exam Type</th>
                                <th data-field="status">Status</th>
                                <th data-field="action">Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                while (iterator.hasNext()) {
                                    Applicant a = (Applicant) iterator.next();
                            %>
                            <tr>
                                <td><%=a.getRowNumber()%></td>
                                <td><%=a.getApplicantId()%></td>
                                <td><%=a.getStudentName()%></td>
                                <td><%=a.getEmail()%></td>
                                <td><%=a.getJambExamNumber()%></td>
                                <td><%=a.getJambExamType()%></td>
                                
                                <td>
                                    <a class="btn-small waves-effect waves-light 
                                       <%if (a.getVerificationStatus().equals("VERIFIED")) {
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
                                       <%if (a.getVerificationStatus().equals("VERIFIED")) {
                                       %>
                                       #
                                       <%} else {
                                       %>
                                       http://jamb.org.ng/efacility/checkmatriculationlist
                                       <%
                                           }
                                       %>                                                        
                                       " 
                                       target="_blank"
                                       data-tooltip="Click to Verify"> 
                                        <%=a.getVerificationStatus()%>
                                    </a>

                                </td>
                                <td>
                                    <form method="post" action="/AdminController?admin_action=viewStudentToUpdate&sessionId=<%=sessionId%>">
                                        <input type="hidden" value="<%=a.getApplicantId()%>" name="applicantId">
                                        <input type="hidden" value="<%=a.getStudentName()%>" name="applicantName">
                                        <input type="hidden" value="<%=a.getEmail()%>" name="email">
                                        <input type="hidden" value="<%=a.getJambExamNumber()%>" name="jamb_exam_number">                                                                                                                                            
                                        <input type="hidden" value="<%=a.getJambExamType()%>" name="jamb_exam_type">
                                        <input type="hidden" value="<%=a.getVerificationStatus()%>" name="verificationStatus">
                                        <center><button class="btn-small waves-effect waves-light green">Edit</button></center>
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

        </div>
        <jsp:include page="pageParts/js.jsp" flush="false"/>
        <script>
            $(document).ready(function () {
                $('.collapsible').collapsible();
            });

            $(document).ready(function () {
                $('.sidenav').sidenav();
            });

            $(document).ready(function () {
                $('#action_button').dropdown({hover: true});
            });

            $('.dropdown-trigger').dropdown({hover: true});

            $(document).ready(function () {
                $('.tooltipped').tooltip();
            });
        </script>
    </body>
</html>
