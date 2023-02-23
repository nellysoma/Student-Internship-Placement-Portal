<%-- 
    Document   : company_account_created_successful
    Created on : Dec 28, 2018, 2:11:16 PM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Company Account Created Successful</title>
        <jsp:include page="css.jsp"/>
    </head>
    <jsp:include page="navbar.jsp"/>
    <body>
        <div class="container">
            <div class="col m3"></div> 
            <div class="col m6">
                <div class="card blue lighten-5">
                    <div class="card-content blue-text">
                        <span class="card-title">Success</span>
                        <p><strong>Success!</strong> Company Account Created Successfully</p>                             
                    </div>
                    <div class="card-action">                            
                        <a class="btn waves-effect waves-light btn-large blue accent-1"  href="/signin.jsp">SIGN IN</a> 
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
