<%-- 
    Document   : viewProfile
    Created on : Jan 14, 2019, 12:57:53 PM
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
            DbConnection dbobject1 = new DbConnection();
            DbConnection dbobject2 = new DbConnection();
            
            getServletContext().setAttribute("applicantInfo", dbobject.viewApplicantInformation(sessionUserName));
            String[] applicantInfo = (String[]) application.getAttribute("applicantInfo");
            
            getServletContext().setAttribute("applicantAcademicInfo", dbobject1.viewApplicantAcademicInformation(sessionUserName));
            String[] applicantAcademicInfo = (String[]) application.getAttribute("applicantAcademicInfo");
            
            getServletContext().setAttribute("applicantCertificationInfo", dbobject1.viewApplicantCertification(sessionUserName));
            String[] applicantCertificationInfo = (String[]) application.getAttribute("applicantCertificationInfo");
            
            String dob = applicantInfo[3];
            if(dob == null){
                dob = "";
            }
            
            String gender = applicantInfo[4];
            if(gender == null){
                gender = "";
            }
            
            String address = applicantInfo[5];
            if(address == null){
                address = "";
            }
            
            String city = applicantInfo[6];
            if(city == null){
                city = "";
            }
            
            String state = applicantInfo[7];
            if(state == null){
                state = "";
            }
            
            String phone = applicantInfo[8];
            if(phone == null){
                phone = "";
            }
            
            String email = applicantInfo[9];
            if(email == null){
                email = "";
            }
            
            String instituition_name = applicantAcademicInfo[0];
            if(instituition_name == null){
                instituition_name = "";
            }
            
            String year_of_graduation = applicantAcademicInfo[1];
            if(year_of_graduation == null){
                year_of_graduation = "";
            }
            
            String qualification = applicantAcademicInfo[2];
            if(qualification == null){
                qualification = "";
            }
            
            String certificate = applicantAcademicInfo[3];
            if(certificate == null){
                certificate = "";
            }
            
            String cert_name = applicantCertificationInfo[0];
            if(cert_name == null){
                cert_name = "";
            }
            
            String cert_file = applicantCertificationInfo[1];
            if(cert_file == null){
                cert_file = "";
            }
        %>
        <div class="row">
            <jsp:include page="pageParts/applicant_header.jsp"/>
        </div>
        <div class="row">

            <div class="col m12">

                <jsp:include page="pageParts/applicant_left_menu.jsp" flush="false"/>

                <div class="col m9"> 

                    <div class="col m12">
                        <ul class="tabs">
                            <li class="tab col m3"><a class="active" href="#personal">Personal/Contact</a></li>                               
                            <li class="tab col m3"><a href="#academic">Academic History</a></li>
                            <li class="tab col m3"><a href="#certifications">Certifications</a></li>
                        </ul>   
                    </div>

                    <div id="personal" class="col s12" style="padding-top: 15px;">                           
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td>Applicant ID</td>
                                            <td><%=applicantInfo[0]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>First Name</td>
                                            <td><%=applicantInfo[1]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Last Name</td>
                                            <td><%=applicantInfo[2]%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Date of Birth</td>
                                            <td><%=dob%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td><%=gender%></td>                                        
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td>Address</td>
                                            <td><%=address%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>City</td>
                                            <td><%=city%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>State</td>
                                            <td><%=state%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Phone</td>
                                            <td><%=phone%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><%=email%></td>                                        
                                        </tr>
                                    </tbody>
                                </table>
                            </div>                       
                    </div>

                    <div id="academic" class="col s12">        
                        <div class="col m12">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td>Institution Name</td>
                                            <td><%=instituition_name%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Year Of Graduation</td>
                                            <td><%=year_of_graduation%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Qualification</td>
                                            <td><%=qualification%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Certificate</td>
                                            <td></td>                                        
                                        </tr>                                       
                                    </tbody>
                                </table>
                            </div>                           
                    </div>

                    <div id="certifications" class="col s12">        
                        <div class="col m12">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td>Certification Name</td>
                                            <td><%=cert_name%></td>                                        
                                        </tr>
                                        <tr>
                                            <td>Certification Certification</td>
                                            <td></td>                                        
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
