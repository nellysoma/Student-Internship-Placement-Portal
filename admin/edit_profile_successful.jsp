<%-- 
    Document   : profile_account_created_successful
    Created on : Dec 28, 2018, 2:11:16 PM
    Author     : harmony
--%>
<%
    String sessionId = (String) request.getAttribute("sessionId");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="pageParts/meta.jsp"/>
        <title>Profile Created Successful</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
   
    <body>
        <div class="container">
            <div class="col m3"></div> 
            <div class="col m6">
                <div class="card green lighten-5">
                    <div class="card-content green-text">
                        <span class="card-title">Success</span>
                        <p><strong>Success!</strong> Profile Created Successfully</p>                             
                    </div>
                    <div class="card-action">                            
                        <a class="btn waves-effect waves-light btn-large blue accent-1"  href="/ApplicantController?applicant_action=goToEditProfile&sessionId=<%=sessionId%>"><< Edit Profile</a> 
                    </div>
                </div>
            </div> 
            <div class="col m3"></div> 
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
        <jsp:include page="pageParts/footer.jsp"/> 
        <jsp:include page="pageParts/js.jsp"/>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
            });

        </script>
    </body>
</html>
