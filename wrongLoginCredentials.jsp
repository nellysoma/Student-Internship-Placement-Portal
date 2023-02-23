<%-- 
    Document   : wrongLoginCredentials
    Created on : Jan 3, 2019, 5:39:24 PM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Invalid Login Credentials</title>
        <jsp:include page="css.jsp"/>
    </head>
    <jsp:include page="navbar.jsp"/>
    <body class="grey darken-3">
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col m2"></div>
                    <div class="col m8">
                        <div class="card red lighten-5">
                            <div class="card-content red-text">
                                <span class="card-title"><h4><strong>Oh snap!</strong> Something went wrong</h4></span>
                                <p><ol>
                                    <li>You might have entered the wrong username</li>
                                    <li>You might have entered the wrong password</li>                                   
                                </ol></p>                             
                            </div>
                            <div class="card-action">                            
                                <a class="btn waves-effect waves-light btn-large red accent-4"  href="/signin.jsp"><< Back</a> 
                            </div>
                        </div>
                    </div>
                    <div class="col m2"></div>
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
        <jsp:include page="footer.jsp"/>
        <jsp:include page="js.jsp"/>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
            });
        </script>
    </body>
</html>
