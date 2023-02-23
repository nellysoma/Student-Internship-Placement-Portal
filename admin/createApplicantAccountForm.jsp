<%-- 
    Document   : createAccountForm
    Created on : Dec 22, 2018, 12:17:49 PM
    Author     : harmony
--%>

<form class="col s12 m12" method="post" action="/ApplicantController?applicant_action=createApplicantAccount">
    
    <div class="row">
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">account_circle</i>
            <input id="firstName" type="text" class="validate" name="firstName" required="true" data-length="20">
            <label for="firstName">First Name</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">account_circle</i>
            <input id="lastName" type="text" class="validate" name="lastName" required="true" data-length="20">
            <label for="lastName">Last Name</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">phone</i>
            <input id="phone" type="tel" class="validate" name="phone" required="true" data-length="14">
            <label for="phone">Phone</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">email</i>
            <input id="email" type="email" class="validate" name="email" required="true" data-length="50">
            <label for="email">E-Mail</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
    </div>
    
    <div class="row">
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">edit</i>
            <input id="matNo" type="text" class="validate" name="matNo" required="true" data-length="20">
            <label for="matNo">Matriculation Number</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">edit</i>
            <input id="institute" type="text" class="validate" name="institute" required="true" data-length="20">
            <label for="institute">Name of Institution</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">edit</i>
            <input id="faculty" type="text" class="validate" name="faculty" required="true" data-length="20">
            <label for="faculty">Faculty</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">edit</i>
            <input id="department" type="text" class="validate" name="department" required="true" data-length="20">
            <label for="department">Department</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
    </div>
    
     <div class="row">
         
         <div class="input-field col s12 m3">
            <i class="material-icons prefix">edit</i>
            <select name="examType">   
                <option value="2019 Unified Tertiary Matriculation (UTME)">2019 Unified Tertiary Matriculation (UTME)</option>
                <option value="2018 Unified Tertiary Matriculation (UTME)">2018 Unified Tertiary Matriculation (UTME)</option>
                <option value="2017 Unified Tertiary Matriculation (UTME)">2017 Unified Tertiary Matriculation (UTME)</option>
                <option value="2016 Unified Tertiary Matriculation (UTME)">2016 Unified Tertiary Matriculation (UTME)</option>
                <option value="2015 Unified Tertiary Matriculation (UTME)">2015 Unified Tertiary Matriculation (UTME)</option>
                <option value="2014 Unified Tertiary Matriculation (UTME)">2014 Unified Tertiary Matriculation (UTME)</option>
                <option value="2013 Unified Tertiary Matriculation (UTME)">2013 Unified Tertiary Matriculation (UTME)</option>
                <option value="2012 Unified Tertiary Matriculation (UTME)">2012 Unified Tertiary Matriculation (UTME)</option>
                <option value="2011 Unified Tertiary Matriculation (UTME)">2011 Unified Tertiary Matriculation (UTME)</option>
                <option value="2010 Unified Tertiary Matriculation (UTME)">2010 Unified Tertiary Matriculation (UTME)</option>
                <option value="2009 University  Matriculation (UME)">2009 Unified  Matriculation (UME)</option>
                <option value="2009 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)">2009 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)</option>
                <option value="2008 University  Matriculation (UME)">2008 Unified  Matriculation (UME)</option>
                <option value="2008 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)">2008 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)</option>
                <option value="2007 University  Matriculation (UME)">2007 Unified  Matriculation (UME)</option>
                <option value="2007 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)">2007 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)</option>
                <option value="2006 University  Matriculation (UME)">2006 Unified  Matriculation (UME)</option>
                <option value="2006 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)">2006 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)</option>
                <option value="2005 University  Matriculation (UME)">2005 Unified  Matriculation (UME)</option>
                <option value="2005 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)">2005 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)</option>
                <option value="2004 University  Matriculation (UME)">2004 Unified  Matriculation (UME)</option>
                <option value="2004 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)">2004 Monotechnic, Polytechnic and Colleges of Education Examination (MPCE)</option>
                <option value="2002 University  Matriculation (UME)">2002 Unified  Matriculation (UME)</option>
                <option value="2001 University  Matriculation (UME)">2001 Unified  Matriculation (UME)</option>
                <option value="2000 University  Matriculation (UME)">2000 Unified  Matriculation (UME)</option>
                <option value="1999 University  Matriculation (UME)">1999 Unified  Matriculation (UME)</option>
                <option value="1998 University  Matriculation (UME)">1998 Unified  Matriculation (UME)</option>
                <option value="1996 University  Matriculation (UME)">1996 Unified  Matriculation (UME)</option>
                <option value="1995 University  Matriculation (UME)">1995 Unified  Matriculation (UME)</option>           
            </select>
            <label for="examType">Jamb Exam Type</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
         
         <div class="input-field col s12 m3">
            <i class="material-icons prefix">edit</i>
            <input id="examNumber" type="text" class="validate" name="examNumber" required="true" data-length="100">
            <label for="examNumber">Jamb Exam Number</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
         
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">security</i>
            <input id="password1" type="password" class="validate" name="password1" required="true" data-length="100">
            <label for="password1">Password</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m3">
            <i class="material-icons prefix">security</i>
            <input id="password2" type="password" class="validate" name="password2" required="true" data-length="100">
            <label for="password2">Re-type Password</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
    </div>
    
    <div class="row">
        <input type="hidden"  name="role" value="applicant">
        <button class="btn waves-effect waves-light btn-large col offset-s3 offset-m4 blue accent-1" type="submit">Create Account
            <i class="material-icons right">send</i>
        </button>
    </div>
    
    
</form>
    
    

