<%-- 
    Document   : createCompanyAccountForm
    Created on : Dec 22, 2018, 12:17:49 PM
    Author     : harmony
--%>

<form class="col s12 m12" method="post" action="/CompanyController?company_action=createCompanyAccount">
    
    <div class="row">
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">account_circle</i>
            <input id="firstName" type="text" class="validate" name="companyName" required="true" data-length="120">
            <label for="companyName">Company Name</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">account_circle</i>
            <input id="lastName" type="text" class="validate" name="rcNumber" required="true" data-length="20">
            <label for="rcNumber">RC Number</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
    </div>
    
    <div class="row">
        
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">phone</i>
            <input id="phone" type="tel" class="validate" name="phone" required="true" data-length="14">
            <label for="phone">Phone</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">email</i>
            <input id="email" type="email" class="validate" name="email" required="true" data-length="50">
            <label for="email">E-Mail</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
    </div>
    
    
    <div class="row">
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">location_on</i>
            <input id="address" type="text" class="validate" name="address" required="true" data-length="140">
            <label for="address">Address</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">business</i>
            <select name="industry">   
                <option value="ICT">ICT</option>
                <option value="Advertising">Advertising</option>
                <option value="Agriculture">Agriculture</option>
                <option value="Art">Art</option>
                <option value="Automotive">Automotive</option>
                <option value="Aviation">Aviation</option>
                <option value="Banking">Banking</option>
                <option value="Construction">Construction</option>
                <option value="Design">Design</option>
                <option value="Education">Education</option>
                <option value="Energy">Energy</option>
                <option value="Entertainment">Entertainment</option>
                <option value="Event">Event</option>
                <option value="Fashion">Fashion</option>
                <option value="Government">Government</option>
                <option value="Health Care">Health Care</option>
                <option value="Hospitality">Hospitality</option>
                <option value="Insurance">Insurance</option>
                <option value="Telecommunication">Telecommunication</option>
                <option value="Law">Law</option>
                <option value="Logistics and Transportation">Logistics and Transportation</option>
                <option value="Law">Security</option>
                <option value="Manufacturing">Manufacturing</option>
                <option value="Mining">Mining</option>
                <option value="Marketing">Marketing</option>
                <option value="NGO">NGO</option>
                <option value="Real Estate">Real Estate</option>
                <option value="Recruitment">Recruitment</option>
                <option value="Retail">Retail</option>
                <option value="Technology">Technology</option>
                <option value="Tourism">Tourism</option>
            </select>
            <label for="industry">Industry</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
    </div>
    
    
     <div class="row">
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">security</i>
            <input id="password1" type="password" class="validate" name="password1" required="true" data-length="100">
            <label for="password1">Password</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
        <div class="input-field col s12 m6">
            <i class="material-icons prefix">security</i>
            <input id="password2" type="password" class="validate" name="password2" required="true" data-length="100">
            <label for="password2">Re-type Password</label>
            <span class="helper-text" data-error="required" data-success="Good"></span>
        </div>
        
    </div>
    
    <div class="row">
        <input type="hidden"  name="role" value="company">
        <button class="btn waves-effect waves-light btn-large col offset-s3 offset-m4 blue accent-1" type="submit">Create Account
            <i class="material-icons right">send</i>
        </button>
    </div>
    
    
</form>
    
    

