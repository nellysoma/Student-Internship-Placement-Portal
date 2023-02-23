<%-- 
    Document   : home
    Created on : Dec 18, 2018, 12:56:21 AM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <jsp:include page="meta.jsp"/>
        <title>Home</title>
        <jsp:include page="css.jsp"/>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="section grey darken-3">
            <div class="container">
                <h1><p class="center-align blue-text accent-1">SIWES</p></h1>  
                <!--<h5><p class="center-align white-text"><i class="material-icons" style="color: #00C853;">hdr_strong</i> Find a teacher  <i class="material-icons" style="color: #00C853;">hdr_strong</i> Get a job</p></h5>-->
                <div class="row">
                    <a href="createApplicantAccount.jsp" id="download-button" class="btn-large waves-effect waves-light blue accent-1 pulse col s12 m5">Student</a>
                    <!--<hr class="col s12 m6 offset-m3">-->
                    <div class="col m2"></div>
                    <a href="createCompanyAccount.jsp" id="download-button" class="btn-large waves-effect waves-light blue accent-1 pulse col s12 m5">Employer</a>
                </div>
                <div class="row center">
                    <a href="signin.jsp" id="download-button" class="btn-large waves-effect waves-light blue accent-1 pulse">Sign In</a>
                </div>
            </div>
            <br/>
            <br/>
            <br/>
        </div>
        
        <jsp:include page="footer.jsp"/>
        <jsp:include page="js.jsp"/>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
            });
        </script>
    </body>
</html>
