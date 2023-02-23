<%-- 
    Document   : teacher_header
    Created on : Jan 4, 2019, 6:23:58 PM
    Author     : harmony
--%>

<%
            String sessionId = (String)request.getAttribute("sessionId");
            
            String sessionUserName = (String)request.getAttribute("sessionUserName");                                        
%>

<!--Fixed Navbar-->
<div class="navbar-fixed">
    <nav>
        <div class="nav-wrapper grey darken-3" role="navigation">
            <a href="index.jsp" class="brand-logo blue-text accent-1 center">SIWES</a>
            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i>Menu</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="#"><i class="material-icons blue-text accent-1">call</i></a></li>
                <li><a href="#"><i class="material-icons blue-text accent-1">help</i></a></li>
                <li><a href="/ApplicantController?applicant_action=logout&sessionId=<%=sessionId%>" id="download-button" class="btn-small waves-effect waves-light blue accent-1 pulse">Sign Out</a></li>
            </ul>
        </div>
    </nav>
</div>


<ul class="sidenav" id="mobile-demo">
    <li><a href="#"><i class="material-icons blue-text accent-1">email</i></a></li>
    <li><a href="#"><i class="material-icons blue-text accent-1">help</i></a></li>
</ul>