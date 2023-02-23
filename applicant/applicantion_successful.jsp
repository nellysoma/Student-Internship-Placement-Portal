<%-- 
    Document   : applicantion_successful
    Created on : Oct 7, 2019, 2:11:16 PM
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
        <title>Application Successful</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
   
    <body>
        <div class="container">
            <div class="col m3"></div> 
            <div class="col m6">
                <div class="card blue lighten-5">
                    <div class="card-content blue-text">
                        <span class="card-title">Success</span>
                        <p><strong>Success!</strong> Application Successfully</p>                             
                    </div>
                    <div class="card-action">                            
                        <a class="btn waves-effect waves-light btn-large blue accent-1"  href="/ApplicantController?applicant_action=goToViewAllVaccancies&sessionId=<%=sessionId%>"><< Back</a> 
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
