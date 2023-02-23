<%-- 
    Document   : update_company_successful
    Created on : Oct 5, 2019, 6:15:16 PM
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
        <title>Company Updated Successful</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
   
    <body>
        <div class="container">
            <div class="col m3"></div> 
            <div class="col m6">
                <div class="card blue lighten-5">
                    <div class="card-content blue-text">
                        <span class="card-title">Success</span>
                        <p><strong>Success!</strong> Company Updated Successfully</p>                             
                    </div>
                    <div class="card-action">                            
                        <a class="btn waves-effect waves-light btn-large blue accent-1"  href="/AdminController?admin_action=goToViewAllCompanies&sessionId=<%=sessionId%>"><< Back</a> 
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
