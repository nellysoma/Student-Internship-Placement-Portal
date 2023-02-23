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

            String[] studentDetails = (String[]) request.getAttribute("studentDetails");
        %>
        <div class="row">
            <jsp:include page="pageParts/admin_header.jsp"/>
        </div>
        <div class="row">

            <div class="col m12">

                <jsp:include page="pageParts/admin_left_menu.jsp" flush="false"/>

                <div class="col m9"> 

                    <div class="col m12">
                        <ul class="tabs">
                            <li class="tab col m3"><a class="active" href="#personal">Profile</a></li>                               
                        </ul>   
                    </div>
                    <form  class="col s12 m12" method="post" action="/AdminController?admin_action=updateStudentProfile">
                        <div id="personal" class="col s12" style="padding-top: 15px;">  
                            <div class="col m3">                       
                            </div>   
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td><label>Student ID</label></td>
                                            <td><%=studentDetails[0]%></td>

                                        </tr>
                                        <tr>
                                            <td><label>Student Name</label></td>
                                            <td><%=studentDetails[1]%></td>                                       
                                        </tr>
                                        <tr>
                                            <td><label>E-Mail</label></td>
                                            <td><%=studentDetails[2]%></td>                                        
                                        </tr> 
                                        <tr>
                                            <td><label>Jamb Exam Number</label></td>
                                            <td><%=studentDetails[3]%></td>                                        
                                        </tr> 
                                        <tr>
                                            <td><label>Jamb Exam Type</label></td>
                                            <td><%=studentDetails[4]%></td>                                        
                                        </tr> 
                                        <tr class="input-field">
                                            <td><label for="verificationStatus">Verification Status</label></td>
                                            <td>
                                                <select class="browser-default" name="verificationStatus">                                                    
                                                    <option value="<%=studentDetails[5]%>"><%=studentDetails[5]%></option>
                                                    <option value="VERIFIED">VERIFIED</option>
                                                    <option value="NOT_VERIFIED">NOT_VERIFIED</option>
                                                </select>

                                            </td>                                        
                                        </tr>
                                    </tbody>
                                </table>
                                                    <div class="row">
                                    <input type="hidden"  name="applicantId" value="<%=studentDetails[0]%>">
                                    <input type="hidden"  name="sessionId" value="<%=sessionId%>">
                                    <button class="btn waves-effect waves-light btn-small col offset-s3 offset-m4 blue accent-1" type="submit">Edit Profile
                                        <i class="material-icons right">send</i>
                                    </button>
                                </div>
                            </div>
                            <div class="col m3">                       
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
