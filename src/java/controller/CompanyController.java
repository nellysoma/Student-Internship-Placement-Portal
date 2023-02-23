
package controller;

import dao.DbConnection;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author harmony
 */
public class CompanyController extends HttpServlet {
    
    private java.util.Map<String, String[]> sessionMap = new HashMap<String, String[]>();// create HashMap

    public void createCompanyAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, FileNotFoundException, SQLException{
        
        String companyName = request.getParameter("companyName");
        String rcNumber = request.getParameter("rcNumber");
        String address = request.getParameter("address");
        String industry = request.getParameter("industry");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String role = request.getParameter("role");
        
        if (!password2.equals(password1)) {

            RequestDispatcher rd = request.getRequestDispatcher("/unmatch_password.jsp");

            rd.forward(request, response);
        } else {
                        
            DbConnection createCompanyAccount = new DbConnection();
            
            // Hash User Data	        
            String hPassword = BCrypt.hashpw(password1.trim(), BCrypt.gensalt(15));
            
            createCompanyAccount.createCompanyAccount(companyName, rcNumber, address, industry, email, phone, hPassword, role);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/company_account_created_successful.jsp");
            rd.forward(request, response);
        }
    }
   
    public void companyLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
        
        String[] companySessionData = (String[])request.getAttribute("companySessionData");
        
        HttpSession session = request.getSession(true);
        
        String sessionId = session.getId();

        sessionMap.put(sessionId, companySessionData);
        
        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionCompanyName = sessionMapValues[1];
        String sessionRcNumber = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionCompanyName", sessionCompanyName);
        request.setAttribute("sessionRcNumber", sessionRcNumber);
        request.setAttribute("sessionUserName", sessionUserName);
        
        RequestDispatcher rd = request.getRequestDispatcher("/company/companyDashboard.jsp");

        rd.forward(request, response);
    }
    
    public void goToViewProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionCompanyName = sessionMapValues[1];
        String sessionRcNumber = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionCompanyName", sessionCompanyName);
        request.setAttribute("sessionRcNumber", sessionRcNumber);
        request.setAttribute("sessionUserName", sessionUserName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/viewProfile.jsp");

        rd.forward(request, response);
    }
    
    public void goToEditProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionCompanyName = sessionMapValues[1];
        String sessionRcNumber = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionCompanyName", sessionCompanyName);
        request.setAttribute("sessionRcNumber", sessionRcNumber);
        request.setAttribute("sessionUserName", sessionUserName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/editProfile.jsp");

        rd.forward(request, response);
    }
    
    public void editProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
         
         String companyId = request.getParameter("companyId");  
         String companyName = request.getParameter("companyName");
         String rcNumber = request.getParameter("rcNumber");              
         String address = request.getParameter("address");
         String email = request.getParameter("email");
         String phone = request.getParameter("phone");
         String industry = request.getParameter("industry");
         
         String sessionId = request.getParameter("sessionId");
         
         String[] sessionMapValues = sessionMap.get(sessionId);

         DbConnection dbobject = new DbConnection();
         
         dbobject.editCompanyProfile(companyId,companyName,rcNumber,address,industry,phone, email);
         String sessionCompanyName = sessionMapValues[1];
         String sessionRcNumber = sessionMapValues[2];
         String sessionUserName = sessionMapValues[0];
         
         request.setAttribute("sessionId", sessionId);
         request.setAttribute("sessionCompanyName", sessionCompanyName);
         request.setAttribute("sessionRcNumber", sessionRcNumber);
         request.setAttribute("sessionUserName", sessionUserName);
         
         RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/update_company_successful.jsp");

         rd.forward(request, response);
     }
    
    public void goToCreateNewVaccancy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionCompanyName = sessionMapValues[1];
        String sessionRcNumber = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionCompanyName", sessionCompanyName);
        request.setAttribute("sessionRcNumber", sessionRcNumber);
        request.setAttribute("sessionUserName", sessionUserName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/createNewVaccancy.jsp");

        rd.forward(request, response);
    }
    
    public void createNewVacancy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, FileNotFoundException, SQLException{
        
        String jobTitle = request.getParameter("jobTitle");
        String salary = request.getParameter("salary");
        String jobDescription = request.getParameter("jobDescription");
        String location = request.getParameter("location");
        String qualification = request.getParameter("qualification");
        String companyId = request.getParameter("companyId");       
        String companyName = request.getParameter("companyName");  
        String sessionId = request.getParameter("sessionId");
                        
            DbConnection createNewVaccancy = new DbConnection();
            
            createNewVaccancy.createNewVacancy(companyId,  companyName,  location,jobTitle,  jobDescription,  salary,  qualification);
            
            String[] sessionMapValues = sessionMap.get(sessionId);

            //String sessionCompanyName = sessionMapValues[1];
            //String sessionRcNumber = sessionMapValues[2];
            //String sessionUserName = sessionMapValues[0];

            request.setAttribute("sessionId", sessionId);
            //request.setAttribute("sessionCompanyName", sessionCompanyName);
            //request.setAttribute("sessionRcNumber", sessionRcNumber);
            //request.setAttribute("sessionUserName", sessionUserName);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/vacancy_created_successful.jsp");
            rd.forward(request, response);
        
    }
    
    public void goToViewAllVaccancies(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionCompanyName = sessionMapValues[1];
        String sessionRcNumber = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionCompanyName", sessionCompanyName);
        request.setAttribute("sessionRcNumber", sessionRcNumber);
        request.setAttribute("sessionUserName", sessionUserName);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/viewAllVacancies.jsp");

        rd.forward(request, response);
    }
    
    public void goToViewApplicationsByCompany(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");
        String vaccancyId = request.getParameter("vaccancyId");

        String[] sessionMapValues = sessionMap.get(sessionId);
        
        String sessionCompanyName = sessionMapValues[1];
        String sessionRcNumber = sessionMapValues[2];
        String sessionUserName = sessionMapValues[0];
        
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("sessionCompanyName", sessionCompanyName);
        request.setAttribute("sessionRcNumber", sessionRcNumber);
        request.setAttribute("sessionUserName", sessionUserName);
        request.setAttribute("vaccancyId", vaccancyId);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/viewApplications.jsp");

        rd.forward(request, response);
    }
    
    public void invite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, FileNotFoundException, SQLException{
        
        String vaccancyId = request.getParameter("vaccancyId");
        String applicantId = request.getParameter("applicant_id");
        String sessionId = request.getParameter("sessionId");
                
            DbConnection invite = new DbConnection();
            
            invite.invite(vaccancyId,applicantId);     
            
            String[] sessionMapValues = sessionMap.get(sessionId);
            
            String sessionCompanyName = sessionMapValues[1];
            String sessionRcNumber = sessionMapValues[2];
            String sessionUserName = sessionMapValues[0];
            
            
            request.setAttribute("sessionId", sessionId);
            request.setAttribute("sessionCompanyName", sessionCompanyName);
            request.setAttribute("sessionRcNumber", sessionRcNumber);
            request.setAttribute("sessionUserName", sessionUserName);
            request.setAttribute("vaccancyId", vaccancyId);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/company/viewApplications.jsp");
            rd.forward(request, response);
        
    }
        
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String sessionId = request.getParameter("sessionId");
                
        sessionMap.remove(sessionId);

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/signin.jsp");
        rd.forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
             
             String company_action = request.getParameter("company_action");
             
             switch (company_action) {
                 
                 case "createCompanyAccount":
                    createCompanyAccount(request, response);
                    break;
                 case "companyLogin":
                    companyLogin(request, response);
                    break;
                 case "goToViewProfile":
                    goToViewProfile(request, response);
                    break;
                 case "goToEditProfile":
                    goToEditProfile(request, response);
                    break;
                 case "editProfile":
                    editProfile(request, response);
                    break;
                 case "goToCreateNewVaccancy":
                    goToCreateNewVaccancy(request, response);
                    break;
                 case "createNewVacancy":
                    createNewVacancy(request, response);
                    break;
                 case "goToViewAllVaccancies":
                    goToViewAllVaccancies(request, response);
                    break;
                 case "goToViewApplicationsByCompany":
                    goToViewApplicationsByCompany(request, response);
                    break;
                 case "invite":
                    invite(request, response);
                    break;
                 case "logout":
                    logout(request, response);
                    break;
             }
             
         }catch(Exception error){
             
             error.printStackTrace();
         }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
