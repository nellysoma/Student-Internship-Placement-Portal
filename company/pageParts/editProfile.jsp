<%-- 
    Document   : editProfile
    Created on : Oct 5, 2019, 7:23:53 PM
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
                            <li class="tab col m3"><a class="active" href="#personal">Profile</a></li>                                                          
                        </ul>   
                    </div>
                    <form class="col s12 m12" method="post" action="/CompanyController?company_action=editProfile">
                        <div id="personal" class="col s12" style="padding-top: 15px;">                           
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr>
                                            <td><label>Company ID</label></td>
                                            <td><%=companyInfo[0]%></td>
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="companyName">Company Name</label></td>
                                            <td><input id="companyName" type="text" class="validate" name="companyName" required="true" data-length="120" value="<%=companyInfo[1]%>"></td>                                       
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="rcNumber">RC Number</label></td>
                                            <td><input id="rcNumber" type="text" class="validate" name="rcNumber" required="true" data-length="120" value="<%=companyInfo[2]%>"></td>                                        
                                        </tr>  
                                        <tr>
                                            <td><label for="verificationStatus">Verification Status</label></td>
                                            <td><%=companyInfo[6]%></td>                                        
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col m6">
                                <table class="striped bordered highlight centered responsive-table">                                
                                    <tbody>
                                        <tr class="input-field">
                                            <td><label for="address">Address</label></td>
                                            <td><input id="address" type="text" class="validate" name="address" required="true" data-length="120" value="<%=companyInfo[3]%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="email">Email</label></td>
                                            <td><input id="email" type="text" class="validate" name="email" required="true" data-length="120" value="<%=companyInfo[7]%>"></td>                                        
                                        </tr>
                                        <tr class="input-field">
                                            <td><label for="phone">Phone</label></td>
                                            <td><input id="phone" type="text" class="validate" name="phone" required="true" data-length="120" value="<%=companyInfo[5]%>"></td>                                        
                                        </tr>                      
                                        <tr class="input-field">
                                            <td><label for="industry">Industry</label></td>
                                            <td>
                                                <select class="browser-default" name="industry">                                                    
                                                    <option value="<%=companyInfo[4]%>"><%=companyInfo[4]%></option>
                                                    <option value="ICT">ICT</option>
                                                    <option value="Advertising">Advertising</option>
                                                    <option value="Agriculture">Agriculture</option>
                                                    <option value="Art">Art</option>
                                                    <option value="Automotive">Automotive</option>
                                                    <option value="Aviation">Aviation</option>
                                                    <option value="Banking">Banking</option>
                                                    <option value="Construction">Construction</option>
                                                    <option value="Design">Design</option>
                                                    <option value="Education">Education</option>
                                                    <option value="Energy">Energy</option>
                                                    <option value="Entertainment">Entertainment</option>
                                                    <option value="Event">Event</option>
                                                    <option value="Fashion">Fashion</option>
                                                    <option value="Government">Government</option>
                                                    <option value="Health Care">Health Care</option>
                                                    <option value="Hospitality">Hospitality</option>
                                                    <option value="Insurance">Insurance</option>
                                                    <option value="Telecommunication">Telecommunication</option>
                                                    <option value="Law">Law</option>
                                                    <option value="Logistics and Transportation">Logistics and Transportation</option>
                                                    <option value="Law">Security</option>
                                                    <option value="Manufacturing">Manufacturing</option>
                                                    <option value="Mining">Mining</option>
                                                    <option value="Marketing">Marketing</option>
                                                    <option value="NGO">NGO</option>
                                                    <option value="Real Estate">Real Estate</option>
                                                    <option value="Recruitment">Recruitment</option>
                                                    <option value="Retail">Retail</option>
                                                    <option value="Technology">Technology</option>
                                                    <option value="Tourism">Tourism</option>
                                                </select>

                                            </td>                                        
                                        </tr>
                                    </tbody>
                                </table> 
                                <div class="row">
                                    <input type="hidden"  name="companyId" value="<%=companyInfo[0]%>">
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
            $('input#companyName,\n\
                   input#rcNumber,\n\
                   input#address,\n\
                   input#email,\n\
                   input#password1,\n\
                   input#password2, \n\
                   input#address, \n\
                   input#phone, \n\
                   input#industry,\n\
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
