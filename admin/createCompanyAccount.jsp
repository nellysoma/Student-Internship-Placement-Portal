<%-- 
    Document   : createCompanyAccount
    Created on : Dec 19, 2018, 7:54:47 PM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Create Company Account</title>
        <jsp:include page="css.jsp"/>
    </head>
    <jsp:include page="navbar.jsp"/>
    <body>
        <div class="container">
            <div class="col m3"></div>   
            <div class="col m6">
                <jsp:include page="createCompanyAccountForm.jsp"/>
            </div>
            <div class="col m3"></div>           
        </div>
            
            
        <jsp:include page="footer.jsp"/> 
        <jsp:include page="js.jsp"/>
        <script>
            $(document).ready(function() {
                $('input#firstName,\n\
                   input#lastName,\n\
                   input#phone,\n\
                   input#email,\n\
                   input#password1,\n\
                   input#password2'
                ).characterCounter();
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
            });
            
            $(document).ready(function(){
                $('select').formSelect();
            });

        </script>
    </body>
</html>
