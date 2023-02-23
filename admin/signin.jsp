<%-- 
    Document   : signin
    Created on : Jan 2, 2019, 9:15:17 AM
    Author     : harmony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="meta.jsp"/>
        <title>Sign In</title>
        <jsp:include page="css.jsp"/>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>

        <div class="section grey darken-3">
            <div class="container">
                <div class="row">
                    <div class="col m3"></div>
                    <div class="col m6">
                        <div class="card">
                            <div class="card-content">
                                <span class="card-title"><h5>Sign In</h5></span>
                                <form   action="/LoginRouterController?login_action=loginRouter"  method="post">
                                    <div class="row">
                                        <div class="input-field col m12">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="username" type="email" class="validate" name="username" required="true">
                                            <label for="username">E-Mail</label>
                                            <span class="helper-text" data-error="required" data-success="Good"></span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12 m12">
                                            <i class="material-icons prefix">security</i>
                                            <input id="password" type="password" class="validate" name="password" required="true">
                                            <label for="password">Password</label>
                                            <span class="helper-text" data-error="required" data-success="Good"></span>
                                        </div>
                                    </div>
                                    <div class="row center">
                                        <div class="switch">
                                            <label>
                                                Don't
                                                <input type="checkbox">
                                                <span class="lever"></span>
                                                Remember me
                                            </label>
                                        </div>
                                    </div>

                                    <div class="row center">

                                        <button class="waves-effect waves-light btn-large blue accent-1" type="submit">Sign In</button>
                                    </div>
                                </form>
                                <a href="#"><p class="center blue-text accent-4">Forgot Password</p></a>
                                <a href="home.jsp"><p class="center blue-text accent-4">Sign Up</p></a>
                            </div>
                        </div>
                    </div>
                    <div class="col m3"></div>
                </div>

            </div>
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
