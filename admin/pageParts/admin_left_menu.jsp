<%-- 
    Document   : teacher_left_menu
    Created on : Jan 4, 2019, 6:46:42 PM
    Author     : harmony
--%>

<%
    String sessionId = (String) request.getAttribute("sessionId");
    String sessionAdminName = (String) request.getAttribute("sessionAdminName");
    String sessionUserName = (String) request.getAttribute("sessionUserName");
%>

<div class="col s3 m3">
    <ul id="slide-out" class="sidenav sidenav-fixed grey darken-3">
        <li>
            <div class="user-view">
                <div class="background grey darken-3">
                    <!--<img src="images/mum.jpg">-->
                    <p class="center"><span class="blue-text accent-1">SIWES</span></p>
                </div>
                <a href="#user"><img class="circle" src="images/mum.jpg"></a>
                <!--<img src="/applicant/applicant_image.jsp?imgid=<%=sessionUserName%>" alt="applicant_image"class="circle">-->
                <!--<a href="#name"><span class="red-text accent-4">0 Coins Left</span></a>-->
                <a href="#name"><span class="white-text name"><%=sessionAdminName%>  </span></a>
                <a href="#email"><span class="white-text email"><%=sessionUserName%></span></a>


            </div>
        </li>
        <div class="collection">
            <!--<a href="#!" class="collection-item grey darken-3"><h6 class="green-text accent-4"><strong>Notification</strong></h6></a>-->

            <li class="collection-item grey darken-3">
                <ul class="collapsible popout grey darken-3" >
                    <li>
                        <div class="collapsible-header grey darken-3"><h6 class="blue-text accent-1"><strong>Manage Company</strong></h6></div>
                        <div class="collapsible-body">
                            <div class="collection">
                                <a href="/AdminController?admin_action=goToViewAllCompanies&sessionId=<%=sessionId%>" class="collection-item blue-text accent-1">View All Companies</a>                             
                            </div>
                        </div>
                    </li>


                </ul>
            </li>
            
            <li class="collection-item grey darken-3">
                <ul class="collapsible popout grey darken-3" >
                    <li>
                        <div class="collapsible-header grey darken-3"><h6 class="blue-text accent-1"><strong>Manage Student</strong></h6></div>
                        <div class="collapsible-body">
                            <div class="collection">
                                <a href="/AdminController?admin_action=goToViewAllStudents&sessionId=<%=sessionId%>" class="collection-item blue-text accent-1">View All Students</a>                             
                            </div>
                        </div>
                    </li>


                </ul>
            </li>

            <li class="collection-item grey darken-3">
                <ul class="collapsible popout grey darken-3" >
                    <li>
                        <div class="collapsible-header grey darken-3"><h6 class="blue-text accent-1"><strong>Report</strong></h6></div>
                        <div class="collapsible-body">
                            <div class="collection">
                                <a href="/nddg/AdministratorController?administrator_action=go_to_create_new_user&sessionId=<%=sessionId%>" class="collection-item blue-text accent-1"><i class="material-icons dp48">create</i>View Report</a>                    
                            </div>
                        </div>
                    </li>
                </ul> 
            </li> 

           <!-- <li class="collection-item grey darken-3">
                <ul class="collapsible popout grey darken-3" >
                    <li>
                        <div class="collapsible-header grey darken-3"><h6 class="green-text accent-4"><strong>Buy Coins</strong></h6></div>
                        <div class="collapsible-body">
                            <div class="collection">
                                <a href="/nddg/AdministratorController?administrator_action=go_to_create_new_user&sessionId=<%=sessionId%>" class="collection-item"><i class="material-icons dp48">create</i>Create User</a>                    
                            </div>
                        </div>
                    </li>
                </ul> 
            </li>-->

            <!--<li class="collection-item grey darken-3">
                <ul class="collapsible popout grey darken-3" >
                    <li>
                        <div class="collapsible-header grey darken-3"><h6 class="green-text accent-4"><strong>Invite Friends</strong></h6></div>
                        <div class="collapsible-body">
                            <div class="collection">
                                <a href="/nddg/AdministratorController?administrator_action=go_to_create_new_user&sessionId=<%=sessionId%>" class="collection-item"><i class="material-icons dp48">create</i>Create User</a>                    
                            </div>
                        </div>
                    </li>
                </ul> 
            </li>-->

            <!--<li class="collection-item grey darken-3">
                <ul class="collapsible popout grey darken-3" >
                    <li>
                        <div class="collapsible-header grey darken-3"><h6 class="green-text accent-4"><strong>Suggestions</strong></h6></div>
                        <div class="collapsible-body">
                            <div class="collection">
                                <a href="/nddg/AdministratorController?administrator_action=go_to_create_new_user&sessionId=<%=sessionId%>" class="collection-item"><i class="material-icons dp48">create</i>Create User</a>                    
                            </div>
                        </div>
                    </li>
                </ul> 
            </li>-->

        </div>


    </ul>

    <a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>
</div>

<jsp:include page="js.jsp"/>
<script>
    $(document).ready(function () {
        $('.collapsible').collapsible();
    });

    $(document).ready(function () {
        $('.sidenav').sidenav();
    });
</script>                            
