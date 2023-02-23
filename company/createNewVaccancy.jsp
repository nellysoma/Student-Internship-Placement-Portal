<%-- 
    Document   : Create New Vacancy
    Created on : Oct 6, 2019, 3:18:53 PM
    Author     : harmony
--%>

<%@page import="dao.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="pageParts/meta.jsp"/>
        <title>Create New Vacancy</title>
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

                    <form class="col s12 m12" method="post" action="/CompanyController?company_action=createNewVacancy">

                        <div class="row">
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">mode_edit</i>
                                <input id="jobTitle" type="text" class="validate" name="jobTitle" required="true" data-length="120">
                                <label for="jobTitle">Job Title</label>
                                <span class="helper-text" data-error="required" data-success="Good"></span>
                            </div>

                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">monetization_on</i>
                                <input id="salary" type="text" class="validate" name="salary" required="true" data-length="120">
                                <label for="salary">Salary</label>
                                <span class="helper-text" data-error="required" data-success="Good"></span>
                            </div>

                        </div>

                        <div class="row">
                            <div class="input-field col s12 m12">
                                <i class="material-icons prefix">mode_edit</i>
                                <textarea id="jobDescription" type="text" class="materialize-textarea validate" name="jobDescription" required="true" data-length="514"></textarea>
                                <label for="jobDescription">Job Description</label>
                                <span class="helper-text" data-error="required" data-success="Good"></span>
                            </div>
                        </div>


                        <div class="row">
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">location_on</i>
                                <select name="location">   
                                    <option value="Abia">Abia</option>
                                    <option value="Adamawa">Adamawa</option>
                                    <option value="Akwa-Ibom">Akwa-Ibom</option>
                                    <option value="Anambara">Anambara</option>
                                    <option value="Bauchi">Bauchi</option>
                                    <option value="Bayelsa">Bayelsa</option>
                                    <option value="Benue">Benue</option>
                                    <option value="Borno">Borno</option>
                                    <option value="Cross River">Cross River</option>
                                    <option value="Delta">Delta</option>
                                    <option value="Ebonyi">Ebonyi</option>
                                    <option value="Edo">Edo</option>
                                    <option value="Ekiti">Ekiti</option>
                                    <option value="Enugu">Enugu</option>
                                    <option value="Gombe">Gombe</option>
                                    <option value="Imo">Imo</option>
                                    <option value="jigawa">jigawa</option>
                                    <option value="Kaduna">Kaduna</option>
                                    <option value="Kano">Kano</option>
                                    <option value="Kastina">Kastina</option>
                                    <option value="Kebbi">Kebbi</option>
                                    <option value="Kwara">Kwara</option>
                                    <option value="Lagos">Lagos</option>
                                    <option value="Nasarawa">Nasarawa</option>
                                    <option value="Niger">Niger</option>
                                    <option value="Ogun">Ogun</option>
                                    <option value="Ondo">Ondo</option>
                                    <option value="Osun">Osun</option>
                                    <option value="Oyo">Oyo</option>
                                    <option value="Plateau">Plateau</option>
                                    <option value="Rivers">Rivers</option>
                                    <option value="Sokoto">Sokoto</option>
                                    <option value="Taraba">Taraba</option>
                                    <option value="Yobe">Yobe</option>
                                    <option value="Zamfara">Zamfara</option>
                                    <option value="FCT">FCT</option>
                                </select>
                                <label for="location">Location</label>
                                <span class="helper-text" data-error="required" data-success="Good"></span>
                            </div>

                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">mode_edit</i>
                                <select name="qualification">   
                                    <option value="Bsc">Bsc</option>
                                    <option value="Msc">Msc</option>
                                    <option value="Phd">Phd</option>                                   
                                </select>
                                <label for="qualification">Qualification</label>
                                <span class="helper-text" data-error="required" data-success="Good"></span>
                            </div>

                        </div>

                        <div class="row">
                            <input type="hidden"  name="companyId" value="<%=companyInfo[0]%>">
                            <input type="hidden"  name="companyName" value="<%=companyInfo[1]%>">
                            <input type="hidden"  name="sessionId" value="<%=sessionId%>">
                            <button class="btn waves-effect waves-light btn-large col offset-s3 offset-m4 blue accent-1" type="submit">Create Vacancy
                                <i class="material-icons right">send</i>
                            </button>
                        </div>


                    </form>

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
            $(document).ready(function() {
                $('input#jobTitle,\n\
                   input#salary,\n\
                   input#jobDescription,\n\
                   input#email,\n\
                   input#password1,\n\
                   input#password2'
                ).characterCounter();
            });
        </script>
    <script>
        $(document).ready(function () {
            $('.tabs').tabs();
        });
        $(document).ready(function(){
                $('select').formSelect();
        });
    </script>
</html>
