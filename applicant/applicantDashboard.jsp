<%-- 
    Document   : teacherDashboard
    Created on : Jan 3, 2019, 5:09:36 PM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="pageParts/meta.jsp"/>
        <title>Dashboard</title>
        <jsp:include page="pageParts/css.jsp"/>
    </head>
    <body>
        <%
            String sessionId = (String)request.getAttribute("sessionId");
        %>
        <div class="row">
            <jsp:include page="pageParts/applicant_header.jsp"/>
        </div>
        <div class="row">
            <div class="container">
                <div class="col 12">
                    <div class="col m3">
                        <jsp:include page="pageParts/applicant_left_menu.jsp" flush="false"/>
                    </div>
                    <div class="col m9">
                        <!--<jsp:include page="latestnews.jsp" flush="false"/>-->
                    </div>
                </div>
            </div>
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
        <br/>
        <br/>
        <br/>
        <br/>
        
        <jsp:include page="pageParts/footer.jsp"/>
        
        
    </body>
</html>
