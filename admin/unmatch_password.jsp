<%-- 
    Document   : unmatch_password
    Created on : Dec 28, 2018, 9:50:23 AM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Unmatch Password</title>
        <jsp:include page="css.jsp"/>
    </head>
    <jsp:include page="navbar.jsp"/>
    <body>
        <div class="container">
            <div class="col m3"></div>
            <div class="col m6">
                <div class="card red lighten-5">
                    <div class="card-content red-text">
                        <span class="card-title">Error!</span>
                        <p>Password do not match</p>                             
                    </div>
                    <div class="card-action">                            
                        <a class="btn waves-effect waves-light btn-large red accent-4"  href="/ApplicantController?applicant_action=go_to_createApplicantAccountForm"><< Back</a> 
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
        <jsp:include page="footer.jsp"/> 
        <jsp:include page="js.jsp"/>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
            });

        </script>
    </body>
</html>
