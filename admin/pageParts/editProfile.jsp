<%-- 
    Document   : editProfile
    Created on : Jan 14, 2019, 12:57:53 PM
    Author     : harmony
--%>

<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="pageParts/meta.jsp"/>
        <title>Edit Profile</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
    <body>
        <%
            String sessionId = (String) request.getAttribute("sessionId");
            String sessionUserName = (String) request.getAttribute("sessionUserName");

            DbConnection dbobject = new DbConnection();
            DbConnection dbobject1 = new DbConnection();
            DbConnection dbobject2 = new DbConnection();

            getServletContext().setAttribute("applicantInfo", dbobject.viewApplicantInformation(sessionUserName));
            String[] applicantInfo = (String[]) application.getAttribute("applicantInfo");

            getServletContext().setAttribute("applicantAcademicInfo", dbobject1.viewApplicantAcademicInformation(sessionUserName));
            String[] applicantAcademicInfo = (String[]) application.getAttribute("applicantAcademicInfo");

            getServletContext().setAttribute("applicantCertificationInfo", dbobject2.viewApplicantCertification(sessionUserName));
            String[] applicantCertificationInfo = (String[]) application.getAttribute("applicantCertificationInfo");

            String first_name = applicantInfo[1];
            if (first_name == null) {
                first_name = "";
            }

            String last_name = applicantInfo[2];
            if (last_name == null) {
                last_name = "";
            }

            String dob = applicantInfo[3];
            if (dob == null) {
                dob = "";
            }

            String gender = applicantInfo[4];
            if (gender == null) {
                gender = "";
            }

            String address = applicantInfo[5];
            if (address == null) {
                address = "";
            }

            String city = applicantInfo[6];
            if (city == null) {
                city = "";
            }

            String state = applicantInfo[7];
            if (state == null) {
                state = "";
            }

            String phone = applicantInfo[8];
            if (phone == null) {
                phone = "";
            }

            String email = applicantInfo[9];
            if (email == null) {
                email = "";
            }

            String instituition_name = applicantAcademicInfo[0];
            if (instituition_name == null) {
                instituition_name = "";
            }

            String year_of_graduation = applicantAcademicInfo[1];
            if (year_of_graduation == null) {
                year_of_graduation = "";
            }

            String qualification = applicantAcademicInfo[2];
            if (qualification == null) {
                qualification = "";
            }

            String certificate = applicantAcademicInfo[3];
            if (certificate == null) {
                certificate = "";
            }

            String cert_name = applicantCertificationInfo[0];
            if (cert_name == null) {
                cert_name = "";
            }

            String cert_file = applicantCertificationInfo[1];
            if (cert_file == null) {
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
                            <li class="tab col m3"><a class="active" href="#personal">Personal</a></li>                               
                            <li class="tab col m3"><a href="#academic">Academic History</a></li>
                            <li class="tab col m3"><a href="#certifications">Certifications</a></li>
                            <li class="tab col m3"><a href="#passport">Passport</a></li>
                        </ul>   
                    </div>
                    <form enctype="multipart/form-data" class="col s12 m12" method="post" action="/ApplicantController?applicant_action=editProfile">
                        <div id="personal" class="col s12" style="padding-top: 15px;">                           
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td><label>Applicant ID</label></td>
                                            <td><%=applicantInfo[0]%></td>

                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="firstName">First Name</label></td>
                                            <td><input id="firstName" type="text" class="validate" name="firstName" required="true" data-length="20" value="<%=first_name%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="lastName">Last Name</label></td>
                                            <td><input id="lastName" type="text" class="validate" name="lastName" required="true" data-length="20" value="<%=last_name%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="dob">Date of Birth</label></td>
                                            <td><input type="text" class="datepicker" id="dob" name="dob"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="dob">Gender</label></td>
                                            <td>
                                                <select class="browser-default" name="gender">                                                    
                                                    <option value="<%=gender%>"><%=gender%></option>
                                                    <option value="Female">Female</option>
                                                    <option value="Male">Male</option>
                                                </select>

                                            </td>                                        
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr class="input-field">
                                            <td><label for="address">Address</label></td>
                                            <td><input id="address" type="text" class="validate" name="address" required="true" data-length="120" value="<%=address%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="city">City</label></td>
                                            <td><input id="city" type="text" class="validate" name="city" required="true" data-length="20" value="<%=city%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="state">State</label></td>
                                            <td><input id="state" type="text" class="validate" name="state" required="true" data-length="20" value="<%=state%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="phone">Phone</label></td>
                                            <td><input id="phone" type="text" class="validate" name="phone" required="true" data-length="20" value="<%=phone%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="email">Email</label></td>
                                            <td><input id="email" type="text" class="validate" name="email" required="true" data-length="20" value="<%=email%>"></td>                                        
                                        </tr>
                                    </tbody>
                                </table>                                
                            </div>   

                        </div>

                        <div id="academic" class="col s12">        
                            <div class="col m12">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr class="input-field">
                                            <td><label for="instituition_name">Institution Name</label></td>
                                            <td><input id="instituition_name" type="text" class="validate" name="instituition_name" required="true" data-length="120" value="<%=instituition_name%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="year_of_graduation">Year Of Graduation</label></td>
                                            <td><input id="year_of_graduation" type="text" class="validate" name="year_of_graduation" required="true" data-length="20" value="<%=year_of_graduation%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="qualification">Qualification</label></td>
                                            <td><input id="qualification" type="text" class="validate" name="qualification" required="true" data-length="20" value="<%=qualification%>"></td>                                        
                                        </tr>
                                        <tr class="file-field input-field">
                                            <td><label for="certificate">Upload Certificate</label></td>
                                            <td>
                                                <!--<input id="certificate" type="text" class="validate" name="certificate" required="true" data-length="20" value="<%=certificate%>">-->
                                                <input id="certificate" type="file" name="certificate">
                                                <div class="file-path-wrapper">
                                                    <input class="file-path validate" type="text" placeholder="Upload Certificate">
                                                </div>
                                            </td>                                        
                                        </tr>                                       
                                    </tbody>
                                </table>
                            </div>                           
                        </div>

                        <div id="certifications" class="col s12">        
                            <div class="col m12">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr class="input-field">
                                            <td><label for="cert_name">Certification Name</label></td>
                                            <td><input id="cert_name" type="text" class="validate" name="cert_name" required="true" data-length="20" value="<%=cert_name%>"></td>                                        
                                        </tr>
                                        <tr class="file-field input-field">
                                            <td><label for="cert_file">Upload Certificate</label></td>
                                            <td>
                                                <!--<input id="cert_file" type="text" class="validate" name="cert_file" required="true" data-length="20" value="<%=cert_file%>">-->
                                                <input id="cert_file" type="file" name="cert_file">
                                                <div class="file-path-wrapper">
                                                    <input class="file-path validate" type="text" placeholder="Upload Certificate">
                                                </div>
                                            </td>                                        
                                        </tr>                                     
                                    </tbody>
                                </table>
                            </div> 
                        </div>
                                        
                        <div id="passport" class="col s12">        
                            <div class="col m12">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr class="file-field input-field col s12 m12">
                                            <td><label for="passport">Upload Passport</label></td>
                                            <td>
                                                <input id="passport" type="file" name="passport">
                                                <div class="file-path-wrapper">
                                                    <input class="file-path validate" type="text" placeholder="Upload Passport">
                                                </div>
                                            </td>                                        
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <input type="hidden"  name="applicant_id" value="<%=applicantInfo[0]%>">
                                    <input type="hidden"  name="sessionId" value="<%=sessionId%>">
                                    <button class="btn waves-effect waves-light btn-small col offset-s3 offset-m4 blue accent-1" type="submit">Edit Profile
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>
                            </div> 
                        </div>                         
                    </form>  


                </div>

            </div>
        </div>
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

    <script>
        $(document).ready(function () {
            $('input#firstName,\n\
                   input#lastName,\n\
                   input#phone,\n\
                   input#email,\n\
                   input#password1,\n\
                   input#password2, \n\
                   input#address, \n\
                   input#city, \n\
                   input#state,\n\
                   input#instituition_name,\n\
                   input#year_of_graduation,\n\
                   input#qualification,\n\
                   input#cert_name'
                    ).characterCounter();
        });
    </script>

    <script>

        $(document).ready(function () {
            $('.datepicker').datepicker();
        });

        $(document).ready(function () {
            $('.timepicker').timepicker();
        });
    </script>
</html>
